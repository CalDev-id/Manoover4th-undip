<?php

namespace App\Http\Controllers;

use App\Models\Participant;
use App\Models\Team;
use Illuminate\Support\Str;
use Illuminate\Http\Request;
use RealRashid\SweetAlert\Facades\Alert;

class TeamController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
     * @param  \App\Models\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function show(Team $team)
    {
        // dd($team);
        $id_team = $team->id;
        // dd($id_team);
        $data = [
            "participants" => Participant::where('team_id', $id_team)->get(),
            "team_name" => $team->nama_tim,
            "contact_team" => $team->team_contact,
            "email_tim" => $team->user->email,
            "slug" => $team->lomba->slug,
            "cadangan" => Participant::where('team_id', $id_team)->where('status_partisipan', 'cadangan')->get(),
            "ketua" => Participant::where('team_id', $id_team)->where('status_partisipan', 'ketua')->get(),
            "cadangan" => Participant::where('team_id', $id_team)->where('status_partisipan', 'cadangan')->get(),
        ];

        // $ketua = Participant::where('team_id', $id_team)->where('status_partisipan', 'ketua')->get();
        // $cadangan = Participant::where('team_id', $id_team)->where('status_partisipan', 'cadangan')->get();
        // if ($ketua->count() > 0) {
        //     $data['ketua'] = $ketua;
        // }

        // if ($cadangan->count() > 0) {
        //     $data['cadangan'] = $cadangan;
        // }

        // dd($data['cadangan']);

        return view("dashboard.participants.detail", $data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function edit(Team $team)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Team $team)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Team  $team
     * @return \Illuminate\Http\Response
     */
    public function destroy(Team $team, Request $request)
    {
        Alert::success('Sukses Dihapus', 'Tim ' . $team->nama_tim . ' Berhasil dihapus');
        Team::destroy($team->id);
        $data = [
            "test" => ''
        ];
        return view("/dashboard/participants-" . $request->slug, $data);
    }

    static private function smtp_email(Team $team)
    {
        $mailTo = new MailController();
        $mailTo->index($team);
        $updatedData = [
            "verifikasi_status" => "rejected"
        ];
        $team->update($updatedData);
    }

    public function email(Team $team)
    {
        // dd($team);
        self::smtp_email($team);

        Alert::error('Pendaftaran Tim Ditolak', 'Tim ' . $team->nama_tim . ' Telah Ditolak');
        return redirect("/dashboard/participants-" . $team->lomba->slug);
    }

    public function sendEmails(Request $request)
    {
        $teams = $request->selected;
        $data = [
            // 'competition' => $request->id_lomba,
            'slug' => $request->slug,
            // 'page_name' => $request->page_name
        ];
        // dd($teams);
        if ($teams) {
            foreach ($teams as $team) {
                $team = Team::where('nama_tim', $team)->first();
                self::smtp_email($team);
            }
            Alert::success('Sukses Kirim Email', count($teams) . ' Tim Berhasil Diverifikasi');
            return redirect("/dashboard/participants-" . $request->slug);
        } else {
            Alert::error('No one team selected', 'You must be at least choose one');
            return redirect("/dashboard/participants-" . $request->slug);
        }
    }

    public function getFiles(Team $team, Request $request)
    {
        $data = [
            "file" => $team->bukti_bayar,
            "nama_tim" => $team->nama_tim,
            "verifikasi_status" => $team->verifikasi_status
        ];

        if ($request->type != "jpg") {
            $data['file'] = $team->gambar_identitas_tim;
        }

        return response()->json($data);
    }

    public function ajax_filter(Request $request)
    {
        // dd($request);
        $req = ['status'];
        $data_send = [
            'filter' => Str::ucfirst($request->status),
            'page_name' => Team::where('id_lomba', $request->id_lomba)->first()->lomba->nama_lomba,
            'participants' => Team::where('id_lomba', $request->id_lomba)->filter(request($req))->paginate(parent::$paginate)->withQueryString(),
            'competition' => $request->id_lomba,
            'slug' => Team::where('id_lomba', $request->id_lomba)->first()->lomba->slug,
            'paginate' => parent::$paginate
        ];

        return view('dashboard.participants.index', $data_send);
    }

    public function verifikasi_status(Team $team)
    {
        $updatedData = [
            "verifikasi_status" => "done"
        ];
        $team->update($updatedData);
        Alert::success('Sukses diverifikasi', 'Tim ' . $team->nama_tim . ' berhasil verifikasi');
        return redirect("/dashboard/participants-" . $team->lomba->slug);
    }
}
