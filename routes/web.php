<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\DashboardBand;
use App\Http\Controllers\DashboardMLBB;
use App\Http\Controllers\DashboardPUBGM;
use App\Http\Controllers\TeamController;
use App\Http\Controllers\DashboardFutsal;
use App\Http\Controllers\DashboardTicket;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\DashboardValorant;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\DashboardParticipant;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/', function () {
    return view('home');
});
// Route::get('/login', function () {
//     return view('login');
// });
Route::get('/register', function () {
    return view('register');
})->middleware('guest');
Route::get('/events', function () {
    return view('events');
});


// By Fares
// Login and Registration
Route::get('/login', [LoginController::class, 'index'])->name('login')->middleware('guest');
Route::post('/login', [LoginController::class, 'authenticate']);
Route::post('/logout', [LoginController::class, 'logout']);
Route::get('/register', [RegisterController::class, 'index'])->middleware('guest');
Route::post('/register', [RegisterController::class, 'store']);

Route::get('/auth/redirect', [LoginController::class, 'redirect'])->name('google.redirect');
Route::get('/google/redirect', [LoginController::class, 'googleCallback'])->name('google.callback');



// Dashboard Route
Route::get('/dashboard', function () {
    return view('dashboard.index');
})->middleware('auth');
// Tutup Dashboard Route

// Manage Ticket
Route::get('/dashboard/ticket-cpt', [DashboardTicket::class, 'get_ticket_cpt'])->middleware('auth');
Route::get('/dashboard/ticket-cet', [DashboardTicket::class, 'get_ticket_cet'])->middleware('auth');
// Tutup Manage Ticket

// Manage Participant
// Route::resource('/dashboard/participants', DashboardParticipant::class)->except(['show', 'store', 'edit', 'destroy', 'update']);
// Route::resource('/dashboard/participants-pubgm', DashboardPUBGM::class)->except(['edit', 'update']);
// Route::resource('/dashboard/participants-mlbb', DashboardMLBB::class)->except(['edit', 'update']);
// Route::resource('/dashboard/participants-valo', DashboardValorant::class)->except(['edit', 'update']);
// Route::resource('/dashboard/participants-futsal', DashboardFutsal::class)->except(['edit', 'update']);
// Route::resource('/dashboard/participants-band', DashboardBand::class)->except(['edit', 'update']);
Route::resource('/dashboard/participants', DashboardParticipant::class)->except(['show', 'store', 'edit', 'destroy', 'update'])->middleware(['auth', 'is_admin']);
Route::resource('/dashboard/participants-pubgm', DashboardPUBGM::class)->except(['edit', 'update'])->middleware(['auth', 'is_admin']);
Route::resource('/dashboard/participants-mlbb', DashboardMLBB::class)->except(['edit', 'update'])->middleware(['auth', 'is_admin']);
Route::resource('/dashboard/participants-valo', DashboardValorant::class)->except(['edit', 'update'])->middleware(['auth', 'is_admin']);
Route::resource('/dashboard/participants-futsal', DashboardFutsal::class)->except(['edit', 'update'])->middleware(['auth', 'is_admin']);
Route::resource('/dashboard/participants-band', DashboardBand::class)->except(['edit', 'update'])->middleware(['auth', 'is_admin']);
// TUTUP Manage Participant


// ====== EMAIL =====
// Ini ngirim email ke satu tim
// Route::get('/dashboard/email/{team:nama_tim}', [TeamController::class, 'email']);
// Ini ngirim email ke banyak tim
// Route::post('/dashboard/email', [TeamController::class, 'sendEmails']);
// Ini ngirim email ke satu tim
Route::get('/dashboard/email/{team:nama_tim}', [TeamController::class, 'email'])->middleware(['is_admin', 'auth']);
// Ini ngirim email ke banyak tim
Route::post('/dashboard/email', [TeamController::class, 'sendEmails'])->middleware(['is_admin', 'auth']);
// ====== TUTUP EMAIL =====


// Get File
Route::get('/dashboard/files/{team:nama_tim}', [TeamController::class, 'getFiles']);

// Done verification
Route::get('/dashboard/done/{team:nama_tim}', [TeamController::class, 'verifikasi_status']);

// Detail tim
Route::resource('/dashboard/teams', TeamController::class)->except(['edit', 'update']);
