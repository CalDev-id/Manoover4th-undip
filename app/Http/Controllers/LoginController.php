<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Laravel\Socialite\Facades\Socialite;

class LoginController extends Controller
{
    public function index()
    {
        $data = [
            "title" => "Login",
            "active" => "Login"
        ];
        return view('login', $data);
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect('/');
    }

    public function authenticate(Request $request)
    {
        $credentials = $request->validate([
            "email" => "required|email",
            "password" => "required"
        ]);

        if (Auth::attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->intended('/dashboard');
        }

        return back()->with('loginError', 'Login Failed!');
    }

    public function redirect(Request $request)
    {
        // dd($request->all());
        return Socialite::driver('google')->redirect();
    }

    public function googleCallback(Request $request)
    {
        $user = Socialite::driver('google')->user();
        dd($user);
        $user = User::updateOrCreate([
            'email' => $user->email,
        ]);

        Auth::login($user);

        return redirect('/dashboard');
    }
}
