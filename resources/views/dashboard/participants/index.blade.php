@extends('dashboard.layouts.main')

@section('container')
<div id="container">
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="btn-group">
      <h1 class="h2">Daftar Tim {{ $page_name }}</h1>
    </div>
    {{-- <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
        {{ $filter }}
      </button>
    <ul class="dropdown-menu">
      @if ($filter == "Done")
        <li><a href="/dashboard/participants-{{ $slug }}" class="dropdown-item">2</a></li>
        <li><a href="/dashboard/teams?status=pending&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">5</a></li>
      @elseif($filter == "Pending")
        <li><a href="/dashboard/participants-{{ $slug }}" class="dropdown-item">2</a></li>
        <li><a href="/dashboard/teams?status=done&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">10</a></li>
      @else
        <li><a href="/dashboard/teams?status=pending&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">5</a></li>
        <li><a href="/dashboard/teams?status=done&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">10</a></li>
      @endif
    </ul> --}}
    <!-- Example single danger button -->
    @if (isset($participants))
      <div class="btn-group">
        <button class="btn btn-warning" id="send-email">Kirim Email</button>
        <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
          {{ $filter }}
        </button>
        <ul class="dropdown-menu">
          @if ($filter == "Done")
            <li><a href="/dashboard/participants-{{ $slug }}" class="dropdown-item">All</a></li>
            <li><a href="/dashboard/teams-ajax?status=pending&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">Pending</a></li>
          @elseif($filter == "Pending")
            <li><a href="/dashboard/participants-{{ $slug }}" class="dropdown-item">All</a></li>
            <li><a href="/dashboard/teams-ajax?status=done&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">Done</a></li>
          @else
            <li><a href="/dashboard/teams-ajax?status=pending&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">Pending</a></li>
            <li><a href="/dashboard/teams-ajax?status=done&id_lomba={{ $competition }}&slug={{ $slug }}" class="dropdown-item">Done</a></li>
          @endif
          {{-- @if ($filter == "Done")
            <li><button class="dropdown-item" data-competition="{{ $competition }}" data-abbreviation="{{ $slug }}">All</button></li>
            <li><button class="dropdown-item" data-competition="{{ $competition }}" data-abbreviation="{{ $slug }}">Pending</button></li>
          @elseif($filter == "Pending")
            <li><button class="dropdown-item" data-competition="{{ $competition }}" data-abbreviation="{{ $slug }}">All</button></li>
            <li><button class="dropdown-item" data-competition="{{ $competition }}" data-abbreviation="{{ $slug }}">Done</button></li>
          @else
            <li><button class="dropdown-item" data-competition="{{ $competition }}" data-abbreviation="{{ $slug }}">Pending</button></li>
            <li><button class="dropdown-item" data-competition="{{ $competition }}" data-abbreviation="{{ $slug }}">Done</button></li>
          @endif --}}
        </ul>
      </div>
    @endif
  </div>

  @if (isset($participants))
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
          @if (session()->has('success'))
            <div class="alert alert-success alert-dismissible fade show" role="alert">
              <span class="fw-bold">{{ session('success') }}</span>
              <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          @endif
        </div>
      </div>
      <div class="row">
        <div class="col-lg">
          <div class="table-responsive fs-6">
            @if ($participants->count())
              <table class="table table-striped">
                <thead>
                  <tr class="text-center">
                    <th scope="col">#</th>
                    <th scope="col">Team Name</th>
                    <th scope="col">Head Team</th>
                    <th scope="col">Email Team</th>
                    <th scope="col">Time Registration</th>
                    <th scope="col">Status Tim</th>
                    <th scope="col">Action</th>
                    <th scope="col"><input type="checkbox" id="select-all"></th>
                  </tr>
                </thead>
                <tbody class="data-participants">
                    <form action="/dashboard/email" method="post" id="checkParticipant">
                        @csrf
                        {{-- <input type="hidden" name="competition" value="{{ $competition }}"> --}}
                        <input type="hidden" name="slug" value="{{ $slug }}">
                        {{-- <input type="hidden" name="page_name" value="{{ $page_name }}"> --}}
                        @foreach ($participants as $participant)
                        <tr>
                          @if (request('page'))
                            <td class="text-center">{{ $loop->index + ((request('page') * $paginate) - ($paginate - 1))  }}</td>
                          @else
                            <td class="text-center">{{ $loop->iteration }}</td>
                          @endif
                          <td><a href="/dashboard/teams/{{ $participant->nama_tim }}" class="text-black">{{ $participant->nama_tim }}</a></td>
                          <td>{{ $participant->user->name }}</td>
                          <td style="width:300px;">{{ $participant->user->email }}</td>
                          <td class="text-center">{{ $participant->created_at->locale('id')->diffForHumans() }}</td>
                          @if ($participant->verifikasi_status == "done")
                            <td class="text-center"><span class="badge bg-success">{{ $participant->verifikasi_status }}</span></td>
                          @elseif($participant->verifikasi_status == "pending")
                            <td class="text-center"><span class="badge bg-warning">{{ $participant->verifikasi_status }}</span></td>
                          @else
                            <td class="text-center"><span class="badge bg-danger">{{ $participant->verifikasi_status }}</span></td>
                          @endif
                          <td class="action-button text-center d-flex flex-wrap justify-content-evenly align-items-start" style="height:100px;">
                            <button type="button" class="badge bg-secondary border-0 btn-modal" data-bs-toggle="modal" data-bs-target="#exampleModal" data-team-id="{{ $participant->id }}">
                              <i class="bi bi-file fs-6 btn-identitas-tim" data-team-name="{{ $participant->nama_tim }}"></i>
                            </button>
                            <button type="button" class="badge bg-primary border-0 btn-modal" data-bs-toggle="modal" data-bs-target="#exampleModal" data-team-id="{{ $participant->id }}">
                              <i class="bi bi-file-earmark fs-6 btn-bukti-bayar" data-team-name="{{ $participant->nama_tim }}"></i>
                            </button>
                            @if ($participant->verifikasi_status == "pending")
                              <a href="/dashboard/email/{{$participant->nama_tim}}" class="badge bg-danger"><i class="bi bi-send-dash fs-6"></i></a>    
                            @endif
                            @if ($participant->verifikasi_status != "done")
                              <a href="/dashboard/done/{{$participant->nama_tim}}" class="badge bg-success"><i class="bi bi-send-check fs-6"></i></a>      
                            @endif
                            {{-- <form action="/dashboard/teams/{{ $participant->nama_tim }}" method="post" id="showDelete">
                              @csrf
                              @method('delete')  
                              @if ($test != '')
                              @endif
                              <input type="hidden" name="slug" value="{{ $slug }}">
                              <button type="submit" class="badge bg-success border-0 btn-hapus">
                                <i class="bi bi-trash fs-6 btn-hapus"></i>
                              </button>
                            </form> --}}
                          </td>
                          @if ($participant->verifikasi_status == "pending")
                          <td class="text-center"><input type="checkbox" name="selected[]" class="chk-participant" value="{{ $participant->nama_tim }}"></td>
                          @endif
                        </tr>
                        @endforeach
                    </form>
                </tbody>
              </table>
            @else
              <p class="text-center fs-4">No participants found.</p>
            @endif
          </div>
        </div>
      </div>

      {{-- Pagination --}}
      <div class="container my-4 d-flex justify-content-start pagination">
        <div class="row">
          {{ $participants->links() }}
        </div>
      </div>
      {{-- Close Pagination --}}
    
      {{-- Modal Button --}}
      <!-- Modal -->
      @if ($participants)
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
            <div class="modal-content">
              <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                {{-- <img src="" alt="" class="w-100" id="bukti-bayar"> --}}
              </div>
              <div class="modal-footer"></div>
            </div>
          </div>
        </div>
      @endif
      
    </div>
  @else
    <p class="text-center fs-4">No participants found.</p>  
  @endif
</div>
@endsection