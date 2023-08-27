<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;



class Userpermission extends Model
{
	protected $table = 'users_permission';
	protected $primaryKey = 'id';
    public $timestamps = false;
    /*protected $fillable = array(
        'name',
        'artist',
        'prices'
    );*/

    public function scopeGettable()
    {
        return $this->table;

    }

    public function scopeGetpermission($query, $level_id)
    {
        if(empty($level_id)) return [];
        $level = DB::table("users_permission")
        ->where('id', '=', $level_id)
        ->where('level_status', '=', 'yes')
        ->where('trash', '<>', 'yes')
         ->get();
         if($level->isEmpty()) return false;
         else return $level[0];

    }


}
