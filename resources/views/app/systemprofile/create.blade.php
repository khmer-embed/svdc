@if (!empty($input))
    @foreach ($input as $key => $val)
        @php ${$key}=$val; @endphp
    @endforeach
@endif
@php
$extends = 'app';
$action_btn = ['save' => true, 'cancel' => true];

foreach (config('dev.app.multilang') as $lang) {
    $langcode[] = $lang[0];
}
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['save' => true, 'cancel' => false];
    @endphp
@endif

@extends('layouts.' . $extends)

@section('blade_css')
    <!--autocomplet-->
    <link rel="stylesheet" href="{{ asset('public/assets/jqueryautocomplete/style.css') }}" />
@endsection


@section('blade_scripts')
    <!--autocomplet-->
    <script src="{{ asset('public/assets/jqueryautocomplete/jquery-autocomplete/dist/jquery.autocomplete.min.js') }}">
    </script>
    <script>
        $(document).ready(function() {

            let route_cancel = "{{ $route['cancel'] ?? '' }}";
            $(".btnsave_{{ $obj_info['name'] }}").click(function(e) {
                e.preventDefault();
                const formname = "#frm-{{ $obj_info['name'] }}";
                $(formname).submit();

            });

            $(".btncancel_{{ $obj_info['name'] }}").click(function(e) {
                //window.location.replace(route_cancel);
                window.location = route_cancel;
            });

            // 
            $('.sumoselect').SumoSelect();

            /* filter customer*/
            $('#customerfilter').devbridgeAutocomplete({
                serviceUrl: "{{ url_builder('admin.controller', ['customer', 'autocomplet', ''], []) }}",
                type: 'POST',
                dataType: 'json',
                secureuri: false,
                async: false,
                cache: false,
                processData: false,
                contentType: false,
                minChars: 3,
                noCache: true,
                transformResult: function(response) {
                    return {
                        suggestions: $.map(response, function(dataItem) {
                            return {
                                value: dataItem.value,
                                data: dataItem.data,
                                ct_id: dataItem.ct_id
                            };
                        })
                    };
                },
                params: {
                    _token: env.token,
                    ajaxpath: 'ajax_obj',
                    objpath: '',
                    ajaxobj: 'customer',
                    'withbrahch': 'no',
                    ajaxact: 'autocomplet'
                },
                triggerSelectOnValidInput: false,
                onSelect: function(suggestion) {
                    //alert('You selected: ' + suggestion.value + ', ' + suggestion.data);
                    $('#cm_id').val(suggestion.data);
                    $('#customer').val(suggestion.value);
                    $('#ct_id').val(suggestion.ct_id);
                    $(this).val('');
                },

                onSearchStart: function(query) {

                },
                onSearchComplete: function(query, suggestions) {

                }
            });

            $(document).on('click', '#removecustomer', function() {
                $('#customer').val("{{ __('dev.retailer') }}");
                $('#cm_id').val("0");
                $('#ct_id').val("0");
            });


            //////////////////
        });
    </script>
    <script type="module">
        import {MediaForTextboxController} from "{{ asset('resources/views/app/mediacenter/medialistener.js') }}";
        var sysSettingMediaApp = new MediaForTextboxController(
                "{{ url_builder('admin.controller', ['mediacenter', 'index', ''], []) }}", "syssetting");
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
            @php
                $extra = json_decode($input['extra'] ?? '', true);
            @endphp
            {{-- please dont delete these default Field --}}
            @CSRF

            <input type="hidden" name="jscallback" value="{{ $jscallback ?? (request()->get('jscallback') ?? '') }}">
            <input type="hidden" name="{{ $fprimarykey }}" value="{{ $input[$fprimarykey] ?? '' }}">
            {{--  --}}
            <div class="card card-default color-palette-box">
                <div class="card-body">
                    <div class="row">
                        <div class="col-xs-12 col-sm-6 col-lg-6">
                            <div class="card bg-gray-200 bd-0">
                                <div class="card-body">
                                    <h5 class="card-title tx-dark tx-medium mg-b-10">General</h5>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="latinname">Latin Name</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="latinname"
                                                id="latinname" value="{{ $latinname ?? 'i-POS' }}" />

                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="nativename">Native Name</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="nativename"
                                                id="nativename" value="{{ $nativename ?? 'អាយភីអូអេស' }}" />

                                        </div><!-- /.column -->


                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="logo">Logo</label>

                                            <div class="input-group">
                                                <input class="form-control input-sm mediastore" name="logo"
                                                     type="text" readonly value="{{$logo??''}}">
                                                <button class="btn btn-light br-ts-0 br-bs-0 mediabrowser" type="button"><i
                                                        class="fa fa-image"></i></button>
                                                <button class="btn btn-light br-ts-0 br-bs-0 hide mediaremove"
                                                    type="button"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="icon">Icon</label>

                                            <div class="input-group">
                                                <input class="form-control input-sm mediastore" name="icon"
                                                     type="text" readonly value="{{$icon??''}}">
                                                <button class="btn btn-light br-ts-0 br-bs-0 mediabrowser" type="button"><i
                                                        class="fa fa-image"></i></button>
                                                <button class="btn btn-light br-ts-0 br-bs-0 hide mediaremove"
                                                    type="button"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="companyid">ID</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="companyid"
                                                id="companyid" value="{{ $companyid ?? '' }}" />

                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="vatnumber">VAT Number</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="vatnumber"
                                                id="vatnumber" value="{{ $vatnumber ?? '' }}" />

                                        </div><!-- /.column -->


                                    </div>

                                    {{--  --}}
                                </div>
                            </div>
                            {{--  --}}

                            <div class="card bg-gray-200 bd-0">
                                <div class="card-body">
                                    <h5 class="card-title tx-dark tx-medium mg-b-10">Contact</h5>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="receiveremail">Receiver Email (separate by comma)</label>
                                            <br />
                                            <input class="form-control input-sm" type="text" name="receiveremail"
                                                id="receiveremail" value="{{ $receiveremail ?? '' }}" />

                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="address">Address</label>
                                            <br />
                                            <input class="form-control input-sm" type="text" name="address"
                                                id="address" value="{{ $address ?? '' }}" />

                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="phone">Phone</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="phone"
                                                id="phone" value="{{ $phone ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="otherphone">Other Phone</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="otherphone"
                                                id="otherphone" value="{{ $otherphone ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="saleemail">Sale Email</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="saleemail"
                                                id="saleemail" value="{{ $saleemail ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="supportemail">Support Email</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="supportemail"
                                                id="supportemail" value="{{ $supportemail ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="website">Website</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="website"
                                                id="website" value="{{ $website ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="map">Map</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="map"
                                                id="map" value="{{ $map ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{--  --}}
                                </div>
                            </div>
                            {{--  --}}

                            

                            
                            {{-- end card --}}

                        </div>
                        {{-- RIGHT --}}
                        <div class="col-xs-12 col-sm-6 col-lg-6">
                            <div class="card bg-gray-200 bd-0">
                                <div class="card-body">
                                    <h5 class="card-title tx-dark tx-medium mg-b-10">Social Media</h5>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="facebook">Facebook</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="facebook"
                                                id="facebook" value="{{ $facebook ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="youtube">Youtube</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="youtube"
                                                id="youtube" value="{{ $youtube ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="twitter">Twitter</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="twitter"
                                                id="twitter" value="{{ $twitter ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="linkedin">Linkedin</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="linkedin"
                                                id="linkedin" value="{{ $linkedin ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="line">Line</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="line"
                                                id="line" value="{{ $line ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="telegram">Telegram</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="telegram"
                                                id="telegram" value="{{ $telegram ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>


                                    {{--  --}}
                                </div>
                            </div>
                            {{-- end card --}}



                            <div class="card bg-gray-200 bd-0">
                                <div class="card-body">
                                    <h5 class="card-title tx-dark tx-medium mg-b-10">Mail Server</h5>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="maildriver">MAIL DRIVER</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="maildriver"
                                                id="maildriver" value="{{ $maildriver ?? 'SMTP' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="encryption">Encryption</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="encryption"
                                                id="encryption" value="{{ $encryption ?? '' }}" />
                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="host">Host</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="host"
                                                id="host" value="{{ $host ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="mailport">Port</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="mailport"
                                                id="mailport" value="{{ $mailport ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="mailuser">User</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="mailuser"
                                                id="mailuser" value="{{ $mailuser ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="mailpassword">Password</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="mailpassword"
                                                id="mailpassword" value="{{ $mailpassword ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="fromemail">From Email</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="fromemail"
                                                id="fromemail" value="{{ $fromemail ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="fromname">From Name</label>

                                            <br />
                                            <input class="form-control input-sm" type="text" name="fromname"
                                                id="fromname" value="{{ $fromname ?? '' }}" />
                                        </div><!-- /.column -->

                                    </div>

                                    {{--  --}}
                                </div>
                            </div>
                            {{-- end card --}}
                        </div>
                    </div>

                </div>
                <!-- /.card-body -->
            </div>




        </form>
        {{-- End From --}}
    </div>
@endsection
