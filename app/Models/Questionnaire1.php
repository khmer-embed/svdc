<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;



class Questionnaire1 extends Model
{
    protected $table = 'dcx_questionnaire1';
    protected $primaryKey = 'questionnaire1_id';
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
