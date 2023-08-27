<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Endpoint extends Model
{
    protected $table = 'endpoint';
    protected $primaryKey = 'endpoint_id';
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
