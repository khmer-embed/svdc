@php
$extends = 'app';
$action_btn = ['save' => false, 'cancel' => true];
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['save' => false, 'cancel' => false];
    @endphp

    @push('page_css')
        <style>
            .sidebar-right {
                right: -150px !important;
            }

            #webcam-open-box {
                display: flex;
                min-height: 266px;
            }
        </style>
    @endpush
@endif

@extends('layouts.' . $extends)

@section('blade_css')
    <link href="{{ asset('public/assets/css/ace.min.css') }}" rel="stylesheet">
@endsection
@section('blade_scripts')
        <!-- right-sidebar js -->
        <script src="{{ asset('public/assets/plugins/sidebar/sidebar.js') }}"></script>
        <script src="{{ asset('public/assets/plugins/sidebar/sidebar-custom.js') }}"></script>
        
    <!--Internal Fancy uploader js-->
    <script src="{{ asset('public/assets/js/ace.min.js') }}"></script>
    <script src="{{ asset('public/assets/js/ace-elements.min.js') }}"></script>

    <script src="{{ asset('public/assets/js/webcam.min.js') }}"></script>
    {{-- page js --}}
    <script src="{{ asset('resources/views/app/mediacenter/page.js') }}"></script>
    <script>
        /** initalize ***/
        //var bunny = {{ Js::from(['aa' => 'bb']) }};
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
                let container = "{{ $obj_info['name'] }}-create-app";
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


            $(document).on("click", "#btnsearch", function() {
                ///
                let form = $(".frmsearch-{{ $obj_info['name'] }}")
                var isvalidate = form[0].checkValidity();
                if (isvalidate) {
                    event.preventDefault();
                    helper.silentHandler(
                        "{{ url_builder($obj_info['routing'], [$obj_info['name']]) }}",
                        ".frmsearch-{{ $obj_info['name'] }}", {}, {}, {},
                        "{{ $obj_info['name'] }}-create-app",
                        ''
                    );

                } else {
                    form[0].reportValidity()
                }
                ///
            });

            $(document).on("click", "#btnreset", function() {
                helper.silentHandler(
                    "{{ url_builder($obj_info['routing'], [$obj_info['name']]) }}",
                    null, {
                        formsearch: ""
                    }, {}, {},
                    "{{ $obj_info['name'] }}-create-app",
                    ''
                );

            });

            $(document).on("click", ".mc_content", function() {
                $('<div style="position: absolute; top:40%; left:40%; font-size:25px; color:green"><i class="fas fa-check" style="text-shadow: 2px 2px 4px #fff;"></i></div>')
                    .appendTo($(this).parent())
                    .fadeOut(2000, function() {
                        $(this).remove();
                    });
                //
            });



        });

        function aftersaved(jsondata) {
            var form = $("#frm-{{ $obj_info['name'] }}");
            form[0].reset();
            form.find('input[type=file]').ace_file_input('reset_input_ui');
        }

        function add_success(container) {
            $('<div style="position: absolute; top:40%; left:40%; font-size:25px; color:green"><i class="fas fa-check"></i></div>')
                .appendTo(container.parent())
                .fadeOut(2000, function() {
                    $(this).remove();
                })
        }
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

                    </h5>



                </div>
                <div class="col-sm-6 text-right">

                    <button type="button" class="formactionbutton btn btn-outline-success mx-2 button-icon"
                        data-bs-toggle="sidebar-right" data-bs-target=".sidebar-right">
                        <i class="fe fe-upload me-2"></i>Upload
                    </button>
                    @include('app._include.btn_create', $action_btn)
                </div>
            </div>
            <input type="hidden" id="mediacenteroption" value="{{ request()->get('mediacenteroption') ?? '' }}">
            <input type="hidden" id="tocontainer" value="{{ request()->get('tocontainer') ?? '' }}">
        </div>
    </section>
    {{-- end header --}}
    <div class="container-fluid {{ request()->get('onclicklistener') ?? 'mediacenter_listener' }}"
        id="{{ $obj_info['name'] }}-create-app">
        {{-- Start Form --}}
        {!! $page !!}
        {{-- End From --}}
    </div>

    @include('app.mediacenter.rightsidebar')
@endsection