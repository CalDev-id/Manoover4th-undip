@extends('dashboard.layouts.main')

@section('container')
<div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
  <h1 class="h2">Welcome back, "test"</h1>
</div>
<div class="row">
  <div class="col-lg-6">
    @if (session()->has('success'))
      <div class="alert alert-success alert-dismissible fade show" role="alert">
        <span class="fw-bold">{{ session('success') }}</span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    @elseif(session()->has('not_admin'))
      <div class="alert alert-danger alert-dismissible fade show" role="alert">
        <span class="fw-bold">{{ session('not_admin') }}</span>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
      </div>
    @endif
    {{-- <a href="{{ route('dashboard.email') }}" class="btn btn-primary">Send Email</a> --}}
    {{-- <a href="/dashboard/email" class="btn btn-primary">Send Email</a> --}}
  </div>
</div>


@endsection