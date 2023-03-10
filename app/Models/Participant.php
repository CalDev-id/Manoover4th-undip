<?php

namespace App\Models;

use App\Models\Team;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Participant extends Model
{
    use HasFactory;

    // protected $with = ['user'];

    protected $guarded = ['id'];

    public function scopeFilter($query, array $filters)
    {
        // dd($filters['status']);
        $query->when($filters['status'] ?? false, function ($query, $status) {
            return $query->where('bill_status', $status);
        });
        // if ($filters) {
        // }
    }

    public function team()
    {
        return $this->belongsTo(Team::class, 'team_id');
    }

    // public function getRouteKeyName()
    // {
    //     return 'team_name';
    // }
}
