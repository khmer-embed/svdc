<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use DB;

class MediaCenter extends Model
{
	protected $table = 'cms_filemanager';
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
