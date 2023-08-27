<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Warehouse extends Model
{
	protected $table = 'pos_warehouse';
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
