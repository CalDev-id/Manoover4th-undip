<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;

class DashboardTicket extends Controller
{
    static private function generate_ticket_id(array $params)
    {
        $ticket_id = '';
        if ($params[0] == "CPT") {
            $ticket_id = "MNVCPT-";
            $ticket_id .= str_pad($params[1], 4, "0", STR_PAD_LEFT);
            $ticket_id .= str_pad($params[2], 4, "0", STR_PAD_LEFT);
            $ticket_id .= str_pad($params[3], 4, "0", STR_PAD_LEFT);
        } else {
            $ticket_id = "MNVCET";
        }

        return $ticket_id;
    }

    static private function payment(object $team, $kode)
    {
        /*Install Midtrans PHP Library (https://github.com/Midtrans/midtrans-php)
        composer require midtrans/midtrans-php
                                    
        Alternatively, if you are not using **Composer**, you can download midtrans-php library 
        (https://github.com/Midtrans/midtrans-php/archive/master.zip), and then require 
        the file manually.   

        require_once dirname(__FILE__) . '/pathofproject/Midtrans.php'; */

        //SAMPLE REQUEST START HERE

        // Set your Merchant Server Key
        \Midtrans\Config::$serverKey = config("midtrans.server_key");
        // Set to Development/Sandbox Environment (default). Set to true for Production Environment (accept real transaction).
        \Midtrans\Config::$isProduction = false;
        // Set sanitization on (default)
        \Midtrans\Config::$isSanitized = true;
        // Set 3DS transaction for credit card to true
        \Midtrans\Config::$is3ds = true;

        $params = array(
            'transaction_details' => array(
                'order_id' => rand() . "-" . str_pad($team->user_id, 4, "0", STR_PAD_LEFT) . str_pad($team->id, 4, "0", STR_PAD_LEFT) . str_pad($team->id_lomba, 4, "0", STR_PAD_LEFT),
                'gross_amount' => 1000 * ($team->id + $team->id_lomba + $team->user_id),
            ),
            'customer_details' => array(
                'first_name' => $team->user->name,
                'email' => $team->user->email,
                'phone' => $team->team_contact,
            ),
        );

        $snapToken = \Midtrans\Snap::getSnapToken($params);
        return $snapToken;
    }

    public function get_ticket_cpt()
    {
        $id_user = auth()->user()->id;
        $teams = Team::where('user_id', $id_user)->where('verifikasi_status', 'done')->get();
        // $data_token = [];
        $data_get = [
            "name" => auth()->user()->name,
            "type" => "Tiket Lomba",
            "tickets" => $teams,
            "kode" => "MNVCPT",
        ];
        $teams[0]['token'] = "1234";
        foreach ($teams as $team) {
            $team['token'] = self::payment($team, $data_get['kode']);
        }
        // dd($teams);


        return view('/dashboard/participants/ticket-participants', $data_get);
    }
    public function get_ticket_cet()
    {
        $id_user = auth()->user()->id;
        $data_get = [
            "name" => auth()->user()->name,
            "type" => "Tiket Konser",
            "tickets" => [],
            "kode" => "MNVCET",
        ];
        // $data_token = [];
        // foreach ($teams as $team) {
        //     $data_token = self::payment($team);
        // }
        return view('/dashboard/participants/ticket-participants', compact($data_get));
    }
}
