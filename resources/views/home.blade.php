<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @vite('resources/css/app.css')
    <title>Manoover</title>
</head>

<body>
    @include('components.navbar')
    @include('components.hero')
    <section class="bg-body h-full w-full py-32 justify-center">
        <div class="container flex flex-wrap">
            <div class="xl:w-1/2">
                <div class="flex justify-center">
                    <img class="mr-5 mt-10" src="images/image1.png" alt="">
                    <img class="mb-10" src="images/image6.png" alt="">
                    <img class="ml-5 mt-10" src="images/image5.png" alt="">
                </div>
            </div>
            <div class="xl:w-1/2 flex justify-center self-center mt-10 xl:mt-0">
                <div>
                    <p class="text-secondary text-xl mb-2">what is</p>
                    <h1 class="font-bold text-5xl text-white mb-3">Manoover?</h1>
                    <p class="text-slate-300">The 3rd Manoover is a work program of the Project Division Management Student Association Faculty of
                        Economics and Business, Diponegoro University (MSA FEB UNDIP) where there are two series of events,
                        namely the Manoover Competition which facilitates student’s interests and talents in sports and arts
                        that uphold sportsmanship and creativity, and the Manoover Closing Ceremony which is the culmination
                        of the Manoover series with performances from the Featuring Band, Guest Star,Special Performance,
                        and Band Performance</p>
                </div>
            </div>
        </div>
    </section>

    <script src="resources/js/script.js"></script>
</body>

</html>
