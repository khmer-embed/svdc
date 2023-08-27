<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Systemsetting extends Model
{
	protected $table = 'system_setting';
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
