<?php

namespace App\Models;

use App\Models\KategoriLomba;
use App\Models\User;
use App\Models\Participant;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Team extends Model
{
    use HasFactory;

    protected $guarded = ['id'];

    public function scopeFilter($query, array $filters)
    {
        // dd($filters['status']);
        $query->when($filters['status'] ?? false, function ($query, $status) {
            return $query->where('verifikasi_status', $status);
        });
        // if ($filters) {
        // }
    }

    public function lomba()
    {
        return $this->belongsTo(KategoriLomba::class, 'id_lomba');
    }

    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function participants()
    {
        return $this->hasMany(Participant::class);
    }

    public function getRouteKeyName()
    {
        return 'nama_tim';
    }
}
