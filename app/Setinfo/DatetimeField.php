<?php

namespace App\Setinfo;
use Carbon\Carbon;
class DatetimeField extends Field
{
   
    public function execute(){
        $now =  Carbon::now()->timezone('Asia/Phnom_Penh');//->timestamp;
        $x = Carbon::parse($now->timestamp);
        return $this->value . $now.'-'.$x;
    }
}
