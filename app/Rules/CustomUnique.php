<?php

namespace App\Rules;

use Illuminate\Contracts\Validation\Rule;
use DB;
class CustomUnique implements Rule
{


    /**
     * Create a new rule instance.
     *
     * @return void
     */
    public function __construct(private String $table, private String $parterns, private array $data)
    {
        //
    }

    /**
     * Determine if the validation rule passes.
     *
     * @param  string  $attribute
     * @param  mixed  $value
     * @return bool
     */
    public function passes($attribute, $value)
    {
        //
        $return = false;
        $count = DB::table($this->table )
        ->selectRaw('count(*) as aggregate')
        ->whereRaw($this->parterns, $this->data)
        ->get();
        if(!$count->isEmpty()){
            $count = $count->first();
            if($count->aggregate<=0){
                $return = true;
            }
        }
        return $return;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return __('dev.fieldunique');
    }
}
