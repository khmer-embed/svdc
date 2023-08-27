<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;


class Question extends Model
{

    protected $table = 'questions';
    protected $guarded = ['id'];
    protected $casts = [
        'media' => 'array',
        'csv_lookups' => 'array',
    ];

    public function teamXlsform(): BelongsTo
    {
        return $this->belongsTo(TeamXlsform::class);
    }
}
