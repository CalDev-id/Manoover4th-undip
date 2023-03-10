<?php

namespace App\Http\Controllers;

use App\Models\Participant;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;

class DashboardParticipant extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $changeFilter = "All";
        if ($request->status != null) {
            $changeFilter = Str::ucfirst($request->status);
        }

        $req = ['status'];
        return view('dashboard.participants.index', [
            'filter' => $changeFilter,
            'participants' => Participant::filter(request($req))->paginate(2)->withQueryString()
        ]);
    }

    public function ajax_filter(Request $request)
    {
        // dd($request);
        $data_send = [
            'filter' => "All",
            'participants' => Participant::filter(request([]))->paginate(2)->withQueryString(),
        ];

        if ($request->status != null) {
            $changeFilter = Str::ucfirst($request->status);
            $req = ['status'];
            $data_send['filter'] = $changeFilter;
            $data_send['participants'] = Participant::filter(request($req))->get();
        }
        return view('dashboard.participants.participants-table', $data_send);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Participant  $participant
     * @return \Illuminate\Http\Response
     */
    public function show(Participant $participant)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Participant  $participant
     * @return \Illuminate\Http\Response
     */
    public function edit(Participant $participant)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Participant  $participant
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Participant $participant)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Participant  $participant
     * @return \Illuminate\Http\Response
     */
    public function destroy(Participant $participant)
    {
        //
    }

    // static private function smtp_email(Participant $participant)
    // {
    //     $mailTo = new MailController();
    //     $mailTo->index($participant);
    //     $updatedData = [
    //         "bill_status" => "done"
    //     ];
    //     $participant->update($updatedData);
    // }

    // public function email(Participant $participant)
    // {
    //     // dd($participant);
    //     self::smtp_email($participant);
    //     Alert::success('Sukses Kirim Email', 'Tim ' . $participant->team_name . ' Berhasil diverifikasi');
    //     return redirect("/dashboard/participants");
    // }

    // public function getFiles(Participant $participant)
    // {
    //     $data = [
    //         "foto" => $participant->bukti_bayar,
    //         "team_name" => $participant->team_name,
    //         "bill_status" => $participant->bill_status
    //     ];
    //     return response()->json($data);
    // }

    // public function sendEmails(Request $request)
    // {
    //     $teams = $request->selected;
    //     // dd($teams);
    //     if ($teams) {
    //         foreach ($teams as $team) {
    //             $participant = Participant::where('team_name', $team)->first();
    //             self::smtp_email($participant);
    //         }
    //         Alert::success('Sukses Kirim Email', count($teams) . ' Tim Berhasil Diverifikasi');
    //         return redirect("/dashboard/participants");
    //     } else {
    //         Alert::error('No one team selected', 'You must be at least choose one');
    //         return redirect("/dashboard/participants");
    //     }
    // }
}
