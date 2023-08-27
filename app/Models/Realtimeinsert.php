<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Realtimeinsert extends Model
{

    protected $table = 'realtimeinsert';
    protected $primaryKey = 'id';
    protected $guarded = ['id'];
    public $timestamps = false;

    public function scopeGettable()
    {
        return $this->table;

    }

    

   


}
