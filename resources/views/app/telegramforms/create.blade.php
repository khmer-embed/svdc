@php
    $extends = 'app';
    $action_btn = ['saveoption' => ['new' => true, 'edit' => true], 'save' => false, 'cancel' => true];
    
    $forms_list = [];
    dd($xlsform);
    foreach ($xlsform as $frm) {
        $forms_list[$frm->id] = $frm->title;
    }
    
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['saveoption' => false, 'save' => true, 'cancel' => false];
    @endphp
@endif

@extends('layouts.' . $extends)



@section('blade_scripts')
    <!-- Internal Select2.min js -->
    {{-- <script src="{{ asset('public/assets/plugins/select2/js/select2.min.js') }}"></script> --}}
    {{-- <script src="{{ asset('resources/views/app/mediacenter/medialistener.js') }}"></script> --}}
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
                };
                let container = '';
                let loading_indicator = '';
                let setting = {};
                const savetype = $(this).data('savetype');
                const formname = "#frm-{{ $obj_info['name'] }}";
                $(formname + " .error").html('').hide();
                extraFrm = {
                    isupdate: "{{ $isupdate ?? false }}",
                    savetype: savetype,
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
            // 




            //$(document).on("click", "#btnAdd", function() {
            $("#btnAdd").click(function() {
                //const table = $("table-form-{{ $obj_info['name'] }}");
                add_item();
            });
            //
            $(document).on("click", ".btn_remove", function() {
                ///
                var $row = $(this).parents('.table_row');
                var punt_ele = $row.children().find(".punt_id");
                var punt_val = punt_ele.val();
                if (punt_val > 0) {
                    punt_ele.val(punt_val * -1);
                    $row.hide();
                } else {
                    $row.remove();
                }

                ///
            });
            //


            $('.form-select2:visible').select2({
                placeholder: 'Choose one',
                searchInputPlaceholder: 'Search'
            });

        });


        function add_item() {
            var template = $('#record_template');
            var clone = template
                .clone()
                .removeClass('hide')
                .removeAttr('id')
                .insertBefore("#table-form-{{ $obj_info['name'] }} tr:last");
            const form_select2 = clone.find(".form-select2");
            form_select2.select2({
                placeholder: 'Choose one',
                searchInputPlaceholder: 'Search'
            });

            var numItems = $("#table-form-{{ $obj_info['name'] }} tr").length;
            let ch = clone.find("#title-{{ config('dev.app.multilang')[0][0] }}-n-error");
            ch.attr('id', "title-{{ config('dev.app.multilang')[0][0] }}-" + (numItems - 3) + "-error");

        }

        ///
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
            <input type="hidden" name="{{ $fprimarykey }}" value="{{ $input[$fprimarykey] ?? '' }}">
            <input type="hidden" name="jscallback" value="{{ $jscallback ?? (request()->get('jscallback') ?? '') }}">
            {{--  --}}
            <div class="card card-default color-palette-box">
                <div class="card-body">

                    {{-- Title Barcode --}}
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                            <label class="frm-label" for="dashboardform">Kobo Form</label>

                            <select class="form-control form-select input-sm" name="dashboardform" id="dashboardform">
                                <option value="">-- {{ __('dev.noneselected') }} --</option>
                                {!! cmb_listing($forms_list, [$dashboardform ?? ''], '', '') !!}
                            </select>

                        </div>

                    </div>

                    <div class="table-responsive">
                        <table id="table-form-{{ $obj_info['name'] }}" class="table table-striped mg-b-0 text-md-nowrap">
                            <thead>
                                <tr>
                                    <th style="min-width: 400px">Title<span class="text-danger">*</span></th>
                                    {{-- <th style="min-width: 200px">Parent</th>
                                    <th style="min-width: 150px">Display</th> --}}
                                    <th>Kobo Field</th>
                                    <th style="width: 40px; text-align: center"><i class="fa fa-ellipsis-h"></i></th>
                                </tr>
                            </thead>
                            <tbody>

                                @php
                                    $istemplate = false;
                                    $row_index = '0';
                                    $btn_remove = false;
                                    
                                @endphp

                                @include('app.' . $obj_info['name'] . '.template', [
                                    $istemplate,
                                    $row_index,
                                    $btn_remove,
                                    $input ?? null,
                                ])


                                {{--  --}}
                                @if (!$isupdate)
                                    <tr>
                                        <td colspan="11" style="text-align: left">
                                            <button type="button" id="btnAdd"
                                                class="btn btn-outline-primary btn-sm button-icon">
                                                <i class="fe fe-plus"></i>
                                            </button>
                                        </td>
                                    </tr>
                                @endif
                                {{--  --}}
                            </tbody>
                        </table>
                    </div>

                </div>
                <!-- /.card-body -->
            </div>




        </form>
        {{-- End From --}}
    </div>

    {{-- template is always last --}}
    @php
        $istemplate = true;
        $row_index = 'n';
        $btn_remove = true;
    @endphp
    @include('app.' . $obj_info['name'] . '.template', [$istemplate, $row_index, $btn_remove])
@endsection
