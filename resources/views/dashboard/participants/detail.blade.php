@extends('dashboard.layouts.main')

@section('container')
<div id="container">
  <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
    <div class="btn-group">
      <h1 class="h2">Detail Pendaftar, Tim {{ $team_name }}</h1>
    </div>
    <a href="/dashboard/participants-{{ $slug }}" class="btn btn-primary">Back</a>
  </div>

  @if (isset($participants))
    <div class="container">
      <div class="row">
        <div class="col-lg-6">
        </div>
      </div>
      <div class="row">
        <div class="col-lg">
          <table class="table table-borderless">
            <tbody>
              <tr class="fs-5">
                <td><span class="fw-semibold">Nama Tim</span></td>
                <td>:</td>
                <td>{{ $team_name }}</td>
              </tr>
              <tr class="fs-5">
                <td><span class="fw-semibold">Email Tim</span></td>
                <td>:</td>
                <td>{{ $email_tim }}</td>
              </tr>
              <tr class="fs-5">
                <td><span class="fw-semibold">Kontak Tim</span></td>
                <td>:</td>
                <td>{{ $contact_team }}</td>
              </tr>
              <tr class="fs-5">
                <td><span class="fw-semibold">Ketua Tim</span></td>
                <td>:</td>
                <td>
                  @if ($ketua->count())
                    {{ $ketua[0]->participant_name }}</td>
                  @else
                    <span>Belum ada ketuanya</span>
                  @endif
              </tr>
              <tr class="fs-5">
                <td><span class="fw-semibold">Nama Anggota</span></td>
                <td>:</td>
                <td>
                  <span class="fw-semibold mb-3 d-block">Pemain Inti</span>
                  <ul>
                    @foreach ($participants as $participant)
                      <li>{{ $participant->participant_name }}</li>
                    @endforeach
                  </ul>
                  {{-- <table>
                  </table> --}}
                  <span class="fw-semibold mb-3 d-block">Pemain Cadangan</span>
                  @if ($cadangan->count() > 0)
                    <ul>
                      @foreach ($cadangan as $cda)
                        <li>{{ $cda->participant_name }}</li>
                      @endforeach
                    </ul>
                  @else
                    <span class="fw-semibold text-danger">Tidak ada pemain cadangan</span>
                  @endif
              </tr>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  @else
    <p class="text-center fs-4">No participants found.</p>  
  @endif
</div>
@endsection