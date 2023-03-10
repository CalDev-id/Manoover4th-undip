<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  <h1 class="h2">Participants</h1>
  <!-- Example single danger button -->
  <div class="btn-group">
    <button class="btn btn-warning" id="send-email">Kirim Email</button>
    <button type="button" class="btn btn-secondary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      {{ $filter }}
    </button>
    <ul class="dropdown-menu">
      @if ($filter == "Done")
        <li><button class="dropdown-item">All</button></li>
        <li><button class="dropdown-item">Pending</button></li>
      @elseif($filter == "Pending")
        <li><button class="dropdown-item">All</button></li>
        <li><button class="dropdown-item">Done</button></li>
      @else
        <li><button class="dropdown-item">Pending</button></li>
        <li><button class="dropdown-item">Done</button></li>
      @endif
    </ul>
  </div>
</div>

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
    <div class="col-lg-11">
      <div class="table-responsive fs-6">
        {{-- @if ($participants->count()) --}}
        <table class="table table-striped">
          <thead>
            <tr class="text-center">
              <th scope="col">#</th>
              <th scope="col">Team Name</th>
              <th scope="col">Head Team</th>
              <th scope="col">Email Team</th>
              <th scope="col">Time Registration</th>
              <th scope="col">Action</th>
              <th scope="col"><input type="checkbox" id="select-all"></th>
            </tr>
          </thead>
            <tbody class="data-participants">
                <form action="/dashboard/email" method="post" id="checkParticipant">
                  @csrf
                    @foreach ($participants as $participant)
                    <tr>
                      @if (request('page'))
                        <td class="text-center">{{ $loop->index + (request('page') + (request('page') - 1)) }}</td>
                      @else
                        <td class="text-center">{{ $loop->iteration }}</td>
                      @endif
                      <td>{{ $participant->team_name }}</td>
                      <td>{{ $participant->user->name }}</td>
                      <td style="width:300px;">{{ $participant->user->email }}</td>
                      <td class="text-center">{{ $participant->created_at->diffForHumans() }}</td>
                      <td class="action-button text-center d-flex flex-wrap justify-content-evenly align-items-start" style="height:100px;">
                        @if ($participant->bill_status == "pending")
                        <a href="/dashboard/email/{{$participant->team_name}}" class="badge bg-primary"><i class="bi bi-send fs-6"></i></a>  
                        @endif
                        <button type="button" class="badge bg-danger border-0 btn-modal" data-bs-toggle="modal" data-bs-target="#exampleModal" data-team-id="{{ $participant->id }}">
                          <i class="bi bi-file-earmark fs-6" data-team-id="{{ $participant->id }}"></i>
                        </button>
                        <button type="button" class="badge bg-danger border-0 btn-modal" data-bs-toggle="modal" data-bs-target="#exampleModal" data-team-id="{{ $participant->id }}">
                          <i class="bi bi-file-earmark fs-6" data-team-id="{{ $participant->id }}"></i>
                        </button>
                      </td>
                      @if ($participant->bill_status == "pending")
                      <td class="text-center"><input type="checkbox" name="selected[]" class="chk-participant" value="{{ $participant->team_name }}"></td>
                      @endif
                    </tr>
                    @endforeach
                </form>
            </tbody>
          </table>
          {{-- @else
            <p class="text-center fs-4">No participants found.</p>
          @endif --}}
      </div>
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
            <img src="" alt="" class="w-100" id="bukti-bayar">
          </div>
          <div class="modal-footer">
            
          </div>
        </div>
      </div>
    </div>
  @endif