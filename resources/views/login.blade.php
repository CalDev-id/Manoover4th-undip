<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    @vite('resources/css/app.css')
    <title>Manoover</title>

    <style>
        #email {
            background-image: url("/images/email.png");
            background-repeat: no-repeat;
            background-position: left center;
            background-position: 3% 50%;
        }

        #Password {
            background-image: url("/images/pass.png");
            background-repeat: no-repeat;
            background-position: left center;
            background-position: 3% 50%;
        }
    </style>
</head>

<body>
    <div class="bg-slate-900 bg-opacity-70 relative flex md:h-screen text-white md:bg-transparent md:text-black">
        <div class="hidden md:block w-1/2 xl:w-2/3 bg-[#181a20]">
            <img class="h-full w-full" src="/images/banner_login.jpg" alt="" />
        </div>

        <div class="md:w-1/2 xl:w-1/3 md:flex md:justify-center md:pt-20 mx-auto bg-[#010028]">
            <div class="pt-5 mx-5 md:w-96 pb-10">
                <img src="/images/logo.svg" alt="" class="rounded-full w-24 mx-auto mb-5" />
                <h1 class="font-bold text-2xl text-center mb-5 text-white">
                    Login To Your Account
                </h1>
                <form action="" class="w-full justify-center mb-2">
                    <input type="email" name="email" id="email" placeholder="Email"
                        class="rounded-2xl py-3 px-10 w-full border-none text-black bg-slate-100 mb-5 focus:outline-green-500" />

                    <input type="Password" name="Password" id="Password" placeholder="Password"
                        class="rounded-2xl py-3 px-10 w-full text-black border-none bg-slate-100 focus:outline-green-500" />
                    <div class="flex mt-5 mb-5">
                        <input type="checkbox" name="" id=""
                            class="border-green-600 self-center mr-5 rounded-sm focus:outline-none" />
                        <p class="self-center text-white">Remember Me</p>
                    </div>
                    <button
                        class="bg-gradient-to-r from-[#4C6BFF] to-[#8D47FE] text-white w-full py-2 rounded-full font-semibold">
                        Sign in
                    </button>
                </form>
                <button class="bg-transparent text-white w-full py-2 rounded-full font-semibold mb-2">
                    Forgot Password
                </button>

                <div class="flex justify-center mb-5">
                    <p class="border-b-[1px] px-10 border-slate-200 self-center"></p>
                    <p class="text-center font-semibold mx-2 text-white">
                        or continue with
                    </p>
                    <p class="border-b-[1px] px-10 border-slate-200 self-center"></p>
                </div>

                <section class="flex justify-evenly">
                    <div class="px-6 py-3 border rounded-xl">
                        <img src="/images/facebooklogo.svg" alt="" class="w-7" />
                    </div>
                    <div class="px-6 py-3 border rounded-xl">
                        <img src="/images/GoogleLogo.svg" alt="" class="w-7" />
                    </div>
                    <div class="px-6 py-3 border rounded-xl">
                        <img src="/images/appleLogo.png" alt="" class="w-7" />
                    </div>
                </section>

                <p class="text-slate-500 text-center mt-5">
                    Don't have an account?

                    <a href="/register" class="text-[#8D47FE] px-2">
                        Sign up
                    </a>

                </p>
            </div>
        </div>
    </div>
</body>

</html>
