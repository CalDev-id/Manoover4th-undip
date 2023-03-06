  <!-- NAVBAR -->
  <header class="bg-transparent absolute top-0 left-0 w-full flex items-center z-10 mb-5">
      <div class="md:container w-full md:px-0">
          <div class="flex items-center justify-between relative self-center">
              <div class="px-4">
                  <a href="index.php" class="font-bold text-2xl block py-6 text-white">Manoover</a>
              </div>
              <div class="flex items-center px-4 self-center">
                  <button id="hamburger" class="block absolute right-4 lg:hidden">
                      <span class="hamburger-line transition duration-300 ease-in-out origin-top-left"></span>
                      <span class="hamburger-line transition duration-300 ease-in-out"></span>
                      <span class="hamburger-line transition duration-300 ease-in-out origin-bottom-left"></span>
                  </button>
                  <nav id="nav-menu"
                      class="hidden absolute lg:py-0 py-5 bg-body w-full right-0 top-full lg:block lg:static lg:bg-transparent lg:max-w-full ">
                      <ul class="block h-[100vh] lg:flex lg:h-full">
                          <li class="group self-center">
                              <a href="index.php"
                                  class="font-semibold text-primary py-10 mx-8 flex md:py-2 self-center">Beranda</a>
                          </li>
                          <li class="group">
                              <a href="artikel.php"
                                  class="text-base text-black py-10 mx-8 flex group-hover:text-primary md:py-2">Artikel</a>
                          </li>
                          <li class="group">
                              <a href="penjualan.php"
                                  class="text-base text-black py-10 mx-8 flex group-hover:text-primary md:py-2">Riwayat</a>
                          </li>
                          <li class="group">
                              <a href="editPage.php"
                                  class="text-base text-black py-10 mx-8 flex group-hover:text-primary md:py-2">Tambah
                                  Menu</a>
                          </li>
                          @auth
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
                          @endauth

                      </ul>
                  </nav>
              </div>
          </div>
      </div>
  </header>
