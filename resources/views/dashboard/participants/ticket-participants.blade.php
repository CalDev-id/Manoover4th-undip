@extends('dashboard.layouts.main')

@section('container')
<div id="container">
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="btn-group">
      <h1 class="h2">{{ $type }}, {{ $name }}</h1>
    </div>
    <!-- Example single danger button -->
    @if (isset($participants))
      <div class="btn-group">
        {{-- <button class="btn btn-warning" id="send-email">Kirim Email</button>
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
          @endif --}}
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

  @if (count($tickets) > 0)
    <div class="container">
      <div class="row">
        @foreach ($tickets as $ticket)
        <div class="col-md-3 mb-3">
            <div class="card" style="width: 18rem;">
              <div class="card-body">
                <h5 class="card-title">{{ $ticket->nama_tim }}</h5>
                <h6 class="card-subtitle mb-2 text-muted">{{ $ticket->lomba->nama_lomba }}</h6>
                <p class="card-text">{{ $ticket->created_at->toFormattedDateString() }}</p>
                <span class="mt-3 d-block fw-semibold">{{ $kode . "-" . str_pad($ticket->user_id, 4, "0", STR_PAD_LEFT) . str_pad($ticket->id, 4, "0", STR_PAD_LEFT) . str_pad($ticket->id_lomba, 4, "0", STR_PAD_LEFT) }}</span>
                <button  class="btn btn-primary mt-3 pay-button" data-token="{{ $ticket->token }}" >Bayar Sekarang</button>
              </div>
            </div>
          </div>
        @endforeach
      </div>
    </div>
  @else
    <p class="text-center fs-4">No tickets found.</p>  
  @endif
</div>


@endsection