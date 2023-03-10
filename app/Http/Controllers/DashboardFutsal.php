<?php

namespace App\Http\Controllers;

use App\Models\Team;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use RealRashid\SweetAlert\Facades\Alert;

class DashboardFutsal extends Controller
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
        $data = [
            'filter' => $changeFilter,
            'page_name' => "Futsal",
            'participants' => null,
            'test' => ''
        ];

        $participants = Team::where('id_lomba', 4)->filter(request($req))->paginate(parent::$paginate)->withQueryString();

        if ($participants->count() > 0) {
            $data['participants'] = $participants;
            $data['competition'] = Team::where('id_lomba', 4)->first()->id_lomba;
            $data['slug'] = Team::where('id_lomba', 4)->first()->lomba->slug;
            $data['paginate'] = parent::$paginate;
        }

        return view('dashboard.participants.index', $data);
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
        //
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
    public function destroy(Team $team)
    {
        //
    }
}
