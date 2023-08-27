<?php

namespace App\Helper;

use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class Setvalue
{
    protected $value;

    public function __construct($value=null)
    {
        $this->value = $value;
    }

    public static function new($value)
    {
        return new static($value);
    }


    public function set($value = null):Setvalue
    {
        $this->value = $value;
        return $this;
    }

    public function get()
    {
        return $this->value;
    }

    public function toString($df = ''): Setvalue
    {
        if (!$this->value) {
            return $this->set(strval($df));
        }

        return $this->set(strval($this->value));
    }

    public function toSilentPagination($container = '', $df = ''): Setvalue
    {
        if (!$this->value) {
            return $this->set($df);
        }

        $url = str_replace('page-link', 'page-link silentpagination', $this->value);
        $url = str_replace('href', 'data-container="' . $container . '" data-href', $url);
        $url = str_replace('store', '', $url);
        return $this->set($url);
    }

    public function toPassword($df = ''): Setvalue
    {
        if (!$this->value) {
            return $this->set($df);
        }
        return $this->set(Hash::make($this->value));
    }

    public function toInteger($df = 0): Setvalue
    {
        if (!$this->value || is_numeric($this->value) === false) {
            return $this->set($df);
        }
       
        return $this->set($this->value);
    }

    public function toDecimal($df = 0): Setvalue
    {
        if (!$this->value || is_numeric($this->value) === false) {
            return $this->set($df);
        }
        return $this->set($this->value);
    }

    public function toNow(): Setvalue
    {
        $date = new Carbon();
        $date->timezone('Asia/Phnom_Penh');
        $now =  $date->now()->format('Y-m-d H:m:s');
        return $this->set($now);
    }

    public function toDate(): Setvalue
    {
        $date = new Carbon();
        if (empty($this->value) || !$this->value) {
            return $this->toNow();
        }
        return $this->set(Carbon::parse($this->value)->toDateString());
    }

    public function toDatetime(): Setvalue
    {
        $date = new Carbon();
        if (empty($this->value) || !$this->value) {
            return $this->toNow();
        }
        return $this->set(Carbon::parse($this->value)->toDateTimeString());
    }

    public function toTimestamp(): Setvalue
    {
        $date = new Carbon();
        if (empty($this->value) || !$this->value) {
            $this->value = $this->toNow()->get();
        }
        // $date->timezone('Asia/Phnom_Penh');
        $value =  $date->parse($this->value);
        // $x = $date->parse(1654707600)->timezone('Asia/Phnom_Penh'); 
        // dd($x);
        return $this->set($value->toDateTimeString());
    }

    public function toBoolean(): Setvalue
    {
        if (is_bool($this->value) === true) {
            return $this;
        }
        return $this->set(in_array($this->value, ["true", 1, "1", "yes", "on"]));
    }

    public function toAmountIn($df = 0): Setvalue
    {
        /*លុយចូល បើ 150 ត្រូវយក ២០០*/
        if (!$this->value || is_numeric($this->value) === false) {
            return $this->set($df);
        }

        return $this->set(round($this->value, 0, PHP_ROUND_HALF_UP));
    }

    public function toAmountOut($df = 0): Setvalue
    {
        /*លុយចេញ បើ 150 អោយគេ ១០០*/
        if (!$this->value || is_numeric($this->value) === false) {
            return $this->set($df);
        }

        return $this->set(round($this->value, 0, PHP_ROUND_HALF_DOWN));
    }

    public function roundnumberup($num, $increment)
    {
        return ceil($num / $increment) * $increment;
    }

    public function roundnumberdown($num, $increment)
    {
        return floor($num / $increment) * $increment;
    }


    /////////
    public function toTranslate($request, String $field,  int $index = 0, bool $usedf=true): Setvalue
    {
        $array = [];
        $loop = 0;
        $df = "";
        foreach (config('dev.app.multilang') as $lang) {
            $data = '';
            if (is_array($request->input($field . '-' . $lang[0]))) {
                $data = $request->input($field . '-' . $lang[0])[$index];
            } else {
                $data = $request->input($field . '-' . $lang[0]);
            }
            if ($loop == 0) {
                $df = $data;
            }

            $array[$lang[0]] = empty($data) ? ($usedf?$df:$data) : $data;
            $loop++;
        } #./foreach#
        return $this->set($array);
    }
}
