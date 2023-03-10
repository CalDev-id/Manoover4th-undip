<?php

namespace App\Http\Controllers;

use App\Mail\sendEmail;
use App\Models\User;
use App\Models\Participant;
use App\Models\Team;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class MailController extends Controller
{
    public function index(Team $team)
    {
        Mail::to($team->user->email)->send(new sendEmail($team));
    }
}
