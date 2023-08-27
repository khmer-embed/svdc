<?php

namespace App\Setinfo;

class StringField extends Field
{
   
    public function execute(){
        return $this->value;
    }
}
