<nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
  <div class="position-sticky pt-3 sidebar-sticky">
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard') ? 'active' : '' }}" aria-current="page" href="/dashboard">
          <span data-feather="home" class="align-text-bottom"></span>
          Dashboard
        </a>
      </li>
      {{-- <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/posts*') ? 'active' : '' }}" href="/dashboard/posts">
          <span data-feather="file-text" class="align-text-bottom"></span>
          My Posts
        </a>
      </li> --}}
      @can('is_participant')
        <h6 class="sidebar-heading text-muted d-flex flex-col justify-content-between align-items-center px-3 mt-4 fs-6 fw-bold">
          Ticketing
        </h6>
          <li class="nav-item">
            <a class="nav-link {{ Request::is('dashboard/ticket-cpt*') ? 'active' : '' }}" href="/dashboard/ticket-cpt">
              <span data-feather="file-text" class="align-text-bottom"></span>
              Competition
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link {{ Request::is('dashboard/ticket-cet*') ? 'active' : '' }}" href="/dashboard/ticket-cet">
              <span data-feather="file-text" class="align-text-bottom"></span>
              Concert
            </a>
          </li>
      @endcan
    </ul>

    @can('is_admin')
    <h6 class="sidebar-heading text-muted d-flex flex-col justify-content-between align-items-center px-3 mt-4 fs-6 fw-bold">
      Administrator
    </h6>
    {{-- <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/categories*') ? 'active' : '' }}" href="/dashboard/categories">
          <span data-feather="list" class="align-text-bottom"></span>
          Post Categories
        </a>
      </li>
    </ul> --}}
    {{-- <h6 class="sidebar-heading text-muted d-flex flex-col justify-content-between align-items-center px-3 mt-4 fs-6 fw-bold">
      See Participant
    </h6> --}}
    <ul class="nav flex-column">
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/participants-pubgm*') ? 'active' : '' }}" href="/dashboard/participants-pubgm">
          <span data-feather="list" class="align-text-bottom"></span>
          PUBG
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/participants-mlbb*') ? 'active' : '' }}" href="/dashboard/participants-mlbb">
          <span data-feather="list" class="align-text-bottom"></span>
          Mobile Legends
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/participants-valo*') ? 'active' : '' }}" href="/dashboard/participants-valo">
          <span data-feather="list" class="align-text-bottom"></span>
          Valorant
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/participants-futsal*') ? 'active' : '' }}" href="/dashboard/participants-futsal">
          <span data-feather="list" class="align-text-bottom"></span>
          Futsal
        </a>
      </li>
      <li class="nav-item">
        <a class="nav-link {{ Request::is('dashboard/participants-band*') ? 'active' : '' }}" href="/dashboard/participants-band">
          <span data-feather="list" class="align-text-bottom"></span>
          Band
        </a>
      </li>
    </ul>
    @endcan
    
  </div>
</nav>