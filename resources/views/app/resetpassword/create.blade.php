@php
    $extends = 'app';
    $action_btn = ['saveoption' => ['new' => true, 'edit' => true], 'save' => false, 'cancel' => true];
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

            $('.togglepassword').on('click', function() {
                helper.togglePassword($(this));
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
                <div class="col-sm-6 offset-sm-3">
                    <div class="card card-default color-palette-box">

                        <div class="card-body">
                            <div class="form-group">
                                <label for="name">Full Name</label>
                                <input type="text" class="form-control disabled" id="fullname" disabled
                                    value="{{ $input['fullname'] ?? '' }}">

                            </div>

                            <div class="form-group has-feedback">
                                <label for="password">Current Password</label>
                                <div class="pos-relative">
                                    <input type="password" class="form-control" name="password" id="password"
                                        placeholder="Enter password" autocomplete="off">
                                    <span class="form-control-feedback togglepassword"><i
                                            class="fas fa-eye"></i></span>
                                </div>
                                <span id="password-error" class="error invalid-feedback" style="display: none"></span>
                            </div>

                            <div class="form-group">
                                <label for="newpassword">New Password</label>
                                <div class="pos-relative">
                                    <input type="password" class="form-control" name="newpassword" id="newpassword"
                                    placeholder="Enter newpassword" autocomplete="off">
                                    <span class="form-control-feedback togglepassword"><i
                                        class="fas fa-eye"></i></span>
                                </div>
                                <span id="newpassword-error" class="error invalid-feedback" style="display: none"></span>
                            </div>

                            <div class="form-group">
                                <label for="password_confirmation">Conifirmed New Password</label>
                                <div class="pos-relative">
                                    <input type="password" class="form-control" name="password_confirmation"
                                        id="password_confirmation" placeholder="Enter cofirm password" autocomplete="off">
                                    <span class="form-control-feedback togglepassword"><i
                                        class="fas fa-eye"></i></span>
                                </div>
                                <span id="password_confirmation-error" class="error invalid-feedback"
                                    style="display: none"></span>
                            </div>


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
