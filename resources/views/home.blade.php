<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    @vite('resources/css/app.css')
    <title>Manoover</title>
</head>

<body class="bg-body">
    @include('components.navbar')
    @include('components.hero')
    <section class=" h-full w-full py-44 justify-center">
        <div class="container flex flex-wrap">
            <div class="xl:w-1/2">
                <div class="flex justify-center">
                    <img class="sm:mr-5 mt-10 mr-2 w-28 sm:w-32" src="images/image1.png" alt="">
                    <img class="mb-10 w-28 sm:w-32" src="images/image6.png" alt="">
                    <img class="sm:ml-5 mt-10 ml-2 w-28 sm:w-32" src="images/image5.png" alt="">
                </div>
            </div>
            <div class="xl:w-1/2 flex justify-center self-center mt-10 xl:mt-0">
                <div>
                    <p class="text-secondary text-xl mb-2">what is</p>
                    <h1 class="font-bold text-5xl text-white mb-3">Manoover?</h1>
                    <p class="text-slate-300">The 3rd Manoover is a work program of the Project Division Management
                        Student Association Faculty of
                        Economics and Business, Diponegoro University (MSA FEB UNDIP) where there are two series of
                        events,
                        namely the Manoover Competition which facilitates student’s interests and talents in sports and
                        arts
                        that uphold sportsmanship and creativity, and the Manoover Closing Ceremony which is the
                        culmination
                        of the Manoover series with performances from the Featuring Band, Guest Star,Special
                        Performance,
                        and Band Performance</p>
                </div>
            </div>
        </div>
    </section>

    <section style="background-image: url('/images/laser.jpg'); background-position: center; background-size: cover"
        class="hero h-full xl:h-screen py-20 xl:py-0">
        <div id="hero" class="container">
            <h1 class="text-4xl font-bold text-white mb-10">FEEL THE RHYTHM <br>
                OF THE ENDLESS NIGHT!</h1>
            <div class="flex md:justify-between justify-center flex-wrap mx-auto">
                <div class="w-[300px] mb-5">
                    <img src="images/conser1.png" alt="">
                    <h1 class="text-white font-semibold my-2">NIGHT CONCERT</h1>
                    <p class="text-slate-300 mb-5">The 3rd Manoover is a work program of the Project Division Management
                        Student Association</p>
                    <a class="border-2 py-2 px-5 text-white" href="#">DETAILS</a>
                </div>
                <div class="w-[300px] mb-5">
                    <img src="images/conser2.png" alt="">
                    <h1 class="text-white font-semibold my-2">NIGHT CONCERT</h1>
                    <p class="text-slate-300 mb-5">The 3rd Manoover is a work program of the Project Division Management
                        Student Association</p>
                    <a class="border-2 py-2 px-5 text-white" href="#">DETAILS</a>
                </div>
                <div class="w-[300px]">
                    <img src="images/conser3.png" alt="">
                    <h1 class="text-white font-semibold my-2">NIGHT CONCERT</h1>
                    <p class="text-slate-300 mb-5">The 3rd Manoover is a work program of the Project Division Management
                        Student Association</p>
                    <a class="border-2 py-2 px-5 text-white" href="#">DETAILS</a>
                </div>
            </div>
        </div>
    </section>
    <section class="pb-52 pt-32 text-center container">
        <h1 class="font-bold text-2xl text-white pb-5">OUR SPONSOR</h1>
        <img src="/images/sponsor/1.svg" alt="" class="grayscale duration-500 opacity-60 transition hover:grayscale-0 hover:opacity-100 mx-auto mb-5">
        <div class="flex self-center justify-center flex-wrap">
            <img src="/images/sponsor/2.svg" alt="" class="grayscale duration-500 opacity-60 transition hover:grayscale-0 hover:opacity-100">
            <img src="/images/sponsor/3.svg" alt="" class="grayscale duration-500 opacity-60 transition hover:grayscale-0 hover:opacity-100">
            <img src="/images/sponsor/4.svg" alt="" class="grayscale duration-500 opacity-60 transition hover:grayscale-0 hover:opacity-100">
            <img src="/images/sponsor/5.svg" alt="" class="grayscale duration-500 opacity-60 transition hover:grayscale-0 hover:opacity-100">
        </div>
    </section>
    <footer style="background-image: url('/images/footer.jpg'); background-position: center; background-size: cover"
        class="md:hero md:h-[374px]">
        <div id="hero" class="container flex justify-between flex-col md:flex-row py-20 md:py-0">
            <div class="text-center w-fit">
                <img src="/images/logo.svg" class="mx-auto" alt="">
                <h1 class="text-white font-semibold text-2xl">The 4th Manoover</h1>
                <p class="text-white">Harmony of the sea</p>
            </div>
            <div>
                <p class="text-white text-xl mb-3">Menu</p>
                <ul class="text-slate-300">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">About us</a></li>
                    <li><a href="#">Event</a></li>
                    <li><a href="#">Timeline</a></li>
                    <li><a href="#">Sponsor</a></li>
                </ul>
            </div>
            <div>
                <p class="text-white text-xl mb-3">Contact us</p>
                <ul class="text-slate-300">
                    <li><i class='bx bxl-instagram'></i><a class="ml-3" href="#">@manoover.undip</a></li>
                    <li><i class='bx bxl-google' ></i><a class="ml-3" href="#">manooverundip@gmail.com</a></li>
                    <li><i class='bx bxl-whatsapp' ></i><a class="ml-3" href="#">081297317866 : Ken Arsyi N.R.K.</a></li>
                    <li><i class='bx bxl-whatsapp' ></i><a class="ml-3" href="#">08112728570 : Amanda Aprilya Liza</a></li>
                </ul>
            </div>
        </div>
    </footer>

    <script src="js/script.js"></script>
</body>

</html>
