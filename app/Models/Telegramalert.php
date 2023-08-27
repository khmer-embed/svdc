<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Telegramalert extends Model
{
    protected $table = 'telegramalert';
    protected $primaryKey = 'id';
    public $timestamps = false;
    /*protected $fillable = array(
        'name',
        'artist',
        'price'
    );*/

    public function scopeGettable()
    {
        return $this->table;
    }
}
