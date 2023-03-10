  <!-- NAVBAR -->
  <header class="bg-transparent absolute top-0 left-0 w-full flex items-center z-10 mb-5">
    <div class="md:container w-full md:px-0">
        <div class="flex items-center justify-center relative self-center">
          <div class="flex items-center px-4 self-center">
              <button id="hamburger" class="block absolute z-50 right-4 lg:hidden mt-20">
                  <span class="hamburger-line transition duration-300 ease-in-out origin-top-left"></span>
                  <span class="hamburger-line transition duration-300 ease-in-out"></span>
                  <span class="hamburger-line transition duration-300 ease-in-out origin-bottom-left"></span>
              </button>
              <nav id="nav-menu"
                  class="hidden absolute lg:py-5 py-10 bg-body w-full right-0 top-full lg:block lg:static lg:bg-transparent lg:max-w-full ">
                  <ul class="block h-[100vh] lg:flex lg:h-full">
                      <li class="group self-center">
                          <a href="index.php"
                              class="font-semibold text-white py-10 mx-8 flex md:py-2 self-center">Home</a>
                      </li>
                      <li class="group">
                          <a href="#about"
                              class="text-base text-white py-10 mx-8 flex font-semibold group-hover:text-primary md:py-2">About us</a>
                      </li>
                      <li class="group">
                          <a href="/events"
                              class="text-base text-white py-10 mx-8 flex font-semibold group-hover:text-primary md:py-2">Events</a>
                      </li>
                      <li class="group">
                          <a href="#timeline"
                              class="text-base text-white py-10 mx-8 flex font-semibold group-hover:text-primary md:py-2">Timeline</a>
                      </li>
                      <li class="group">
                          <a href="#sponsors"
                              class="text-base text-white py-10 mx-8 flex font-semibold group-hover:text-primary md:py-2">Sponsors</a>
                      </li>
                      {{-- @auth
                          <li class="text-black py-10 mx-8 flex group-hover:text-primary md:py-2">
                              <form action="/logout" method="POST">
                                  @csrf
                                  <button type="submit">
                                      Logout
                                  </button>
                              </form>
                          </li>
                      @else
                          <li
                              class="text-red-600 mx-8 flex group-hover:text-primary md:py-2 py-2 px-4 bg-black rounded-3xl group-hover:bg-white group-hover:shadow-lg justify-center">
                              <a href="/login">Login</a></li>
                      @endauth --}}

                  </ul>
              </nav>
          </div>

        </div>
    </div>
</header>
