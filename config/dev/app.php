<?php
return [
  'backend' => '', 
  'js_env' => [
    'token' => ''
  ],
  'bankend_lang' => [
    'en' =>  ['en', 'English', 'English', 'en.png'],
    'km' => ['km', 'Khmer', 'ខ្មែរ', 'km.png']
  ],

  'project_lang' => [
    'en' =>  ['en', 'English', 'English', 'en.png'],
    'km' => ['km', 'Khmer', 'ខ្មែរ', 'km.png']
  ],

  'multilang' => [

    ['en', 'English', 'English', 'en.png'],
    ['km', 'Khmer', 'ខ្មែរ', 'km.png'],
    // ['cn', 'Chinese', 'Chinese', 'kh.gif'],
    // ['jp', 'Japanese', 'Japanese', 'kh.gif'],

  ],


  'protectme' => [
    'index' => ['cover' => ['index'], 'title' => 'Home'],
    'show' => ['cover' => ['show'], 'title' => 'Show Detail'],
    'create' => ['cover' => ['create', 'store', 'clone'], 'title' => 'Add New'],
    'edit' => ['cover' => ['edit', 'update'], 'title' => 'Edit'],
    'delete' => ['cover' => ['totrash'], 'title' => 'Delete'],
    'destroy' => ['cover' => ['delete'], 'title' => 'Destroy'],
    'restore' => ['cover' => ['restore'], 'title' => 'Restore']

  ],
  'rpp' => 15,

  'uploadable' => 'mimes:png,gif,jpg,jpeg,txt,pdf,doc,docx,xls,xlsx,zip,rar',
  'allowtags' => '<a><table><tr><td><th><img><embed><ul><ol><li><span><b><i><u><font><hr><strike><sub><sup><br><br/><strong><p><div>',

  'permission' => [
    '1' => 'Public',
    '2' => 'Private',
    '3' => 'Password'
  ],

  /*POS*/
  'discounttype' => [
    '1' => '%',
    '-1' => '$'
  ],

  'currency_format'=>[
    '-1'=>'None',
    '1'=>'Left',
    '2'=>'Right',
    '3'=>'Left with space',
    '4'=>'Right with space',
  ],

  /***
    | Accounting
    | Not change ID, Can change order for ordering
    *////
    'bs_rpt' => [
      ['id'=>1, 'title'=>'ASSETS', 'order'=>1],
      ['id'=>2, 'title'=>'LIABILITIES', 'order'=>2],
      ['id'=>3, 'title'=>'EQUITY', 'order'=>3],
      ['id'=>4, 'title'=>'N/A', 'order'=>4],
     ],
   
     'pl_rpt' => [
      ['id'=>1, 'title'=>'REVENUE', 'order'=>1],
      ['id'=>2, 'title'=>'EXPENSE', 'order'=>2],
      ['id'=>3, 'title'=>'N/A', 'order'=>3],
     ],
   
     'cf_rpt' => [
      ['id'=>1, 'title'=>'OPERATING ACTIVITIES', 'order'=>1],
      ['id'=>2, 'title'=>'INVESTING ACTIVITIES', 'order'=>2],
      ['id'=>3, 'title'=>'FINANCING ACTIVITIES', 'order'=>3],
      ['id'=>4, 'title'=>'CASH BEGINNING', 'order'=>4],
      ['id'=>5, 'title'=>'N/A', 'order'=>5],
     ],
     

];
