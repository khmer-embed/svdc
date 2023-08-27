<?php

namespace App\Setinfo;

abstract class Field
{
    protected $value;
    // public function __construct(protected $value)
    // {

    // }

    abstract public function execute();

    public function setvalue($value){
        $this->value = $value;
        return $this;
    }
     
    public static function new(){
        return new static;
    }
}
