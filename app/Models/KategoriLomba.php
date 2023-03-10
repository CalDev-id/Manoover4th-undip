<?php

namespace App\Models;

use App\Models\Team;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class KategoriLomba extends Model
{
    use HasFactory;

    protected $guarded = ["id"];

    public function team()
    {
        return $this->hasMany(Team::class);
    }
}
