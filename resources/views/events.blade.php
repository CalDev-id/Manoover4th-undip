<!DOCTYPE html>
<html lang="en" class="bg-body">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    @vite('resources/css/app.css')
    <title>Event</title>
</head>
<body class="bg-body">
    @include('components.navbar')
    <div style="background-image: url('/images/Project.jpg'); background-position: center; background-size: cover" class="hero h-full py-10 md:py-0 md:h-[300px] mt-20">
        <div id="hero" class="container text-center">
            <div>
                <p class="text-secondary text-xl">what is</p>
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
    <section class="container">
            <h1 class="font-bold text-5xl text-white mb-3 text-center py-20">Manoover Competition</h1>
            <div class="flex flex-wrap justify-between sm:mb-5">
                <div>
                    <img src="images/game1.png" alt="">
                    <p class="text-white font-semibold my-2">PUBG MOBILE</p>
                </div>
                <div>
                    <img src="images/game2.png" alt="">
                    <p class="text-white font-semibold my-2">MOBILE LEGENDS</p>
                </div>
                <div>
                    <img src="images/game3.png" alt="">
                    <p class="text-white font-semibold my-2">VALORANT</p>
                </div>
            </div>
            <div class="flex flex-wrap justify-evenly">
                <div>
                    <img src="images/game4.png" alt="">
                    <p class="text-white font-semibold my-2">FUTSAL</p>
                </div>
                <div>
                    <img src="images/game5.png" alt="">
                    <p class="text-white font-semibold my-2">BAND COMPETITION</p>
                </div>
            </div>
    </section>
    <div class="py-10">
        @include('components.timeline')
    </div>

    @include('components.footer')
    <script src="js/script.js"></script>
</body>
</html>