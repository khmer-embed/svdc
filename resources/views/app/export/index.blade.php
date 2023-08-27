@php
//dd(request()->session()->all());
@endphp
@extends('layouts.app')
@section('blade_css')
    <link href="{{ asset('public/assets/css/ace.min.css') }}" rel="stylesheet">
@endsection
@section('blade_scripts')
    <!--Internal Fancy uploader js-->
    <script src="{{ asset('public/assets/js/ace.min.js') }}"></script>
    <script src="{{ asset('public/assets/js/ace-elements.min.js') }}"></script>
    <script>
        $(document).ready(function() {

            /*Please dont delete this code*/
            @if(null !==session('status') && session('status')==false)
                helper.errorAlert("{{session('message')}}");
			@endif

			@if (null !==session('status') && session('status')==true)
                helper.successAlert("{{session('message')}}");
			@endif
            /*please dont delete this above code*/

            $('#file-import').ace_file_input({
                no_file: '{{ __('dev.nofile') }}',
                btn_choose: '{{ __('dev.choose') }}',
                btn_change: '{{ __('dev.change') }}',
                droppable: false,
                onchange: null,
                thumbnail: false, //| true | large
                //whitelist:'xls|xlsx'
                //blacklist:'exe|php'
                //onchange:''
                //allowExt: ["xls", "xlsx"],
                //allowMime: ["application/vnd.ms-excel"],
            }).on('change', function() {
                // let route_import = "{{ $route['importloaddata'] }}";
                // let extraFrm = {};
                // let setting = {};
                // let popModal = {
                //     show: false,
                //     size: 'modal-lg'
                // };

                // let loading_indicator = '';
                // helper.silentHandler(route_import, 'frmimport-{{ $obj_info['name'] }}', extraFrm, setting, popModal, "importinfo-{{ $obj_info['name'] }}",
                // loading_indicator);

                const route = "{{$route['importloaddata']}}"
                const formname = "#frmimport-{{ $obj_info['name'] }}";
    
                form = $(formname);
                form.attr("action", route);
                form.submit();

            });

            $('.ace-file-input a.remove').on('click', function() {
                $("#importinfo-{{ $obj_info['name'] }}").html('');
            });
            

            $(".btnsaveimport_{{ $obj_info['name'] }}").click(function(e) {
                e.preventDefault();
                let route_submit = "{{ $route['importstore'] }}";
                let extraFrm = {}; //{jscallback:'test'};
                let setting = {};//{fnSuccess:foo};
                let popModal = {
                    show: false,
                    size: 'modal-lg'
                    //modal-sm, modal-lg, modal-xl
                };
                let container = '';
                let loading_indicator = '';
                
                helper.silentHandler(route_submit, "frmimport-{{ $obj_info['name'] }}", extraFrm, setting,
                    popModal, container,
                    loading_indicator);

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
                    
                </div>
            </div>
        </div>
    </section>
    {{-- end header --}}

    <div class="container-fluid">
        {{-- Start Form --}}
        <form name="frmimport-{{ $obj_info['name'] }}" id="frmimport-{{ $obj_info['name'] }}" method="POST"
            action="{{ $route['submit'] ?? '' }}" enctype="multipart/form-data">
            {{-- please dont delete these default Field --}}
            @CSRF

            <input type="hidden" name="jscallback" value="{{ $jscallback ?? (request()->get('jscallback') ?? '') }}">
            {{--  --}}
            <div class="card card-default color-palette-box">
                <div class="card-body">


                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-lg-12">
                            

                            <div class="form-group">
                                <label for="tablename">File<span class="text-danger">*</span></label>
                                <label class="ace-file-input">
                                    <input type="file" id="file-import" name="file_import" class="form-control"
                                        accept=".csv,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-excel.sheet.macroenabled.12" />
                                    </label>
                            </div>
                        </div> <!-- /.col -->

                    </div>

                </div>
                <!-- /.card-body -->
            </div>




        </form>
        {{-- End From --}}
    </div>
    
@endsection
