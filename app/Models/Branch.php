<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class Branch extends Model
{
	protected $table = 'pos_branch';
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
