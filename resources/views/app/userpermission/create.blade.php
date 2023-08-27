
@php
$extends = 'app';
$action_btn = ['saveoption' => ['new' => true, 'edit' => true], 'save' => false, 'cancel' => true];

foreach ($xlsform as $form) {
    $definelevel['kobo_'.$form->id] = [
        "name"=> 'kobo_'.$form->id,
        "routing" => "admin.controller",
        "title" => $form->title,
        "icon" => '<i class="fas fa-th-list"></i>',
        "protectme" => ["display" => "yes",
                        "group" => [],
                        "object" => ['kobo_'.$form->id],
                        "method" => ["index"=>["cover"=>"index", "title"=>"Home"]]
                        ]
      
        ];
    
}

// dd($definelevel);

@endphp
@if(is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['saveoption' => false, 'save' => true, 'cancel' => false];
    @endphp
@endif

@extends('layouts.'.$extends)



@section('blade_scripts')
    <script>
        $(document).ready(function() {
            let route_submit = "{{ $route['submit'] }}";
            let route_cancel = "{{ $route['cancel'] ?? '' }}";
            $(".btnsaveoption_{{ $obj_info['name'] }}").click(function(e) {
                e.preventDefault();
                let frm, extraFrm;
                let popModal = {
                    show: false,
                    size: 'modal-lg'
                    //modal-sm
                    //modal-lg
                    //modal-xl
                };
                let container = '';
                let loading_indicator = '';
                let setting = {};
                const savetype = $(this).data('savetype');
                const formname = "#frm-{{ $obj_info['name'] }}";

                $(formname + " .error").html('').hide();
                $(formname).append('<input type="hidden" name="savetype" value="'+savetype+'" /> ');
                extraFrm={formname:formname, isupdate:"{{$isupdate??false}}"};
                helper.silentHandler(
                    "{{ url_builder('admin.controller', [$obj_info['name'], 'validation', ''], []) }}", 
                    "frm-{{ $obj_info['name'] }}", extraFrm, setting,
                    popModal, container,
                    loading_indicator);

            });
            $(".btnsave_{{ $obj_info['name'] }}").click(function(e) {
                e.preventDefault();
                let frm, extraFrm;
                let popModal = {
                    show: false,
                    size: 'modal-lg'
                    //modal-sm
                    //modal-lg
                    //modal-xl
                };
                let container = '';
                let loading_indicator = '';
                let setting = {};
                $("#frm-{{$obj_info['name']}} .error").html('').hide();
                helper.silentHandler(route_submit, "frm-{{$obj_info['name']}}", extraFrm, setting, popModal, container,
                    loading_indicator);
               
            });

            $(".btncancel_{{ $obj_info['name'] }}").click(function(e) {
               //window.location.replace(route_cancel);
               window.location = route_cancel;
            });

        });
    </script>
@endsection

@section('content')
    {{-- Header --}}
    <section class="content-header sticky-top ct-bar-action ct-bar-action-shaddow">
        <div class="row mb-2">
            <div class="col-sm-6">

                <h5 class="mb-2">
                    {!! $obj_info['icon'] !!}
                    <a href="{{url_builder($obj_info['routing'],[$obj_info['name']])}}" 
                    class="btn btn-link text-md pd-5">{{ $obj_info['title'] }}</a>
                    <small class="text-sm">
                        <i class="ace-icon fa fa-angle-double-right text-xs"></i>
                        {{ $caption ?? '' }}
                    </small>
                </h5>



            </div>
            <div class="col-sm-6 text-right">
                @include('app._include.btn_create',$action_btn)
            </div>
        </div>
    </section>
    {{-- end header --}}

    <div class="container-fluid">
        {{-- Start Form --}}
            <form name="frm-{{ $obj_info['name'] }}" id="frm-{{ $obj_info['name'] }}" method="POST"
            action="{{ $route['submit'] }}">
            {{-- please dont delete these default Field --}}
            @CSRF
            <input type="hidden" name="{{$fprimarykey}}" id="{{$fprimarykey}}" value="{{ $input[$fprimarykey] ?? '' }}">	
            <input type="hidden" name="jscallback" value="{{$jscallback??request()->get('jscallback')??''}}">
            {{--  --}}
            <div class="card card-default color-palette-box">
                <div class="card-header">
                    <div class="input-group mb-3">
                        <div class="input-group-prepend">
                            <span class="input-group-text">
                                Permission Name<span
                                class="text-danger">*</span>
                            </span>
                            
                        </div>
                        <input type="text" name="title" class="form-control" value="{{ $input['title'] ?? '' }}">
                        
                    </div>
                    <span id="title-error" class="error invalid-feedback" style="display: none"></span>
                </div>
                <div class="card-body">
                       
                        @foreach ($definelevel as $item)
                            @php
                                //dd($item);
                                // if(isset($input)){
                                //     dd($item, $input);
                                // }
                            @endphp
                            {{--  --}}
                            <div class="panel-group1" id="accordion11" role="tablist">
                                <div class="card overflow-hidden">
                                    <a class="accordion-toggle panel-heading1 collapsed bg-gray-100" data-bs-toggle="collapse" data-bs-parent="#accordion11" href="#collapseFour{{$item['name']}}" aria-expanded="false">
                                        {!! $item['icon'] !!}
                                        {{ $item['title'] }}
                                        <div style="float: right; margin-right:50px;">
                                            @if(isset($active_permission) && isset($active_permission[$item['name']]))
                                            @foreach($active_permission[$item['name']] as $key => $val)
                                                <span class="badge bg-success">
                                                    {{$item['protectme']['method'][$val]['title']}}
                                                </span>
                                            @endforeach  
                                            @endif
                                        </div>
                                        
                                    </a>
                                    <div id="collapseFour{{$item['name']}}" class="panel-collapse collapse" role="tabpanel" aria-expanded="false">
                                        <div class="panel-body">
                                            <div class="form-group">
                                                @foreach ($item['protectme']['method'] as $method => $info)
                                                    @php
                                                        $check = '';
                                                        $checkbox_value = $item['name'] . '-' . $method;
                                                        if(isset($input['levelsetting']) && in_array($checkbox_value,$input['levelsetting']))
                                                        $check = 'checked';
        
                                                    @endphp
                                                    <div class="form-check">
                                                        <input class="form-check-input" type="checkbox" name="levelsetting[]"
                                                            value="{{ $checkbox_value }}" class="" {{$check}}>
                                                        <label class="form-check-label">{!! $info['title'] !!}</label>
                                                    </div>
                                                @endforeach
        
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                
                            </div>
                            {{--  --}}
                            
                        @endforeach

                    
                </div>
                <!-- /.card-body -->
            </div>
            {{--  --}}


        </form>
        {{-- End From --}}  
    </div>
    
@endsection
