<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


class Questionsinfo extends Model
{

    protected $table = 'questions_info';
    protected $guarded = ['id'];
    public $timestamps = false;
}
