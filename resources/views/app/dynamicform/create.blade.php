@php
    $extends = 'app';
    $action_btn = ['saveoption' => ['new' => true, 'edit' => true], 'save' => false, 'cancel' => true];
    // dd($isupdate);
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['saveoption' => false, 'save' => true, 'cancel' => false];
    @endphp
@endif

@extends('layouts.' . $extends)



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
                $(formname).append('<input type="hidden" name="savetype" value="' + savetype + '" /> ');
                extraFrm = {
                    formname: formname,
                    isupdate: "{{ $isupdate ?? false }}"
                };
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
                $("#frm-{{ $obj_info['name'] }} .error").html('').hide();
                helper.silentHandler(route_submit, "frm-{{ $obj_info['name'] }}", extraFrm, setting,
                    popModal, container,
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
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">

                    <h5 class="mb-2">
                        {!! $obj_info['icon'] !!}
                        <a href="{{ url_builder($obj_info['routing'], [$obj_info['name']]) }}"
                            class="btn btn-link text-md pd-5">{{ $obj_info['title'] }}</a>
                        <small class="text-sm">
                            <i class="ace-icon fa fa-angle-double-right text-xs"></i>
                            {{ $caption ?? '' }}
                        </small>
                    </h5>



                </div>
                <div class="col-sm-6 text-right">
                    @include('app._include.btn_create', $action_btn)
                </div>
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
            <input type="hidden" name="{{ $fprimarykey }}" id="{{ $fprimarykey }}"
                value="{{ $input[$fprimarykey] ?? '' }}">
            <input type="hidden" name="jscallback" value="{{ $jscallback ?? (request()->get('jscallback') ?? '') }}">
            {{--  --}}
            <div class="row">
                <div class="col-sm-12">
                    <div class="card card-default color-palette-box">

                        <div class="card-body table-responsive">
                            <table class="table  table-striped">
                                <thead>
                                    <tr>
                                        <th>Question</th>
                                        <th style="width: 300px">response</th>
                                    </tr>
                                </thead>
                                {{--  --}}
                                <tbody>
                                    @foreach ($input as $column =>$value)
                                    @php
                                         $field_at_q = array_last(explode('/', $column));
                                    @endphp
                                        @if('uuid'!=$field_at_q && '_' !=substr($column, 0, 1) && !empty($questions[$field_at_q]->label_0??$field_at_q))
                                            <tr>
                                                
                                                <td>
                                                    {{strip_tags($questions[$field_at_q]->label_0??$field_at_q)}}
                                                    @if($questions[$field_at_q]->required??false)
                                                    <span class="text-danger">*</span>
                                                    @endif
                                                </td>
                                                <td class="form-group">
                                                    @if(isset($questions[$field_at_q]) && !empty($questions[$field_at_q]->select_from_list_name))
                                                        @php
                                                            $choice_name = $questions[$field_at_q]->select_from_list_name;
                                                            $choice_lists = getchoice($choice_name, $choices);
                                                            
                                                        @endphp
                                                        <select class="form-control form-select input-sm sumoselect" name="{{$column}}"
                                                            id="{{$column}}">
                                                            {!! cmb_listing($choice_lists, [$value??0], '', '') !!}
                                                        </select>
                                                    @else
                                
                                                    <input type="text" class="form-control" name="{{$column}}" id="{{$column}}"
                                                        placeholder="" value="{{ $value ?? '' }}">
                                                    
                                                    @endif
                                                    <span id="{{$field_at_q}}-error" class="error invalid-feedback" style="display: none"></span>
                                                </td>
                                            </tr>
                                        @endif
                                    @endforeach
                                </tbody>
                            </table>
        
        
                        </div>
                        <!-- /.card-body -->
                    </div>
                    {{--  --}}
                </div>
            </div>




        </form>
        {{-- End From --}}
    </div>
@endsection
