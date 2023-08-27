@if( ! empty($input))
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

$forms_list = [];
foreach($xlsform as $frm){
    $forms_list [$frm->id ] = $frm->title;
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
                                    <h5 class="card-title tx-dark tx-medium mg-b-10">Control Center</h5>

                                    {{-- Row --}}
                                    <div class="row">

                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="telegramtoken">Telegram Token</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="telegramtoken" id="telegramtoken" value="{{ $telegramtoken ?? '' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="telegramid">Telegram ID</label>
                                            <input class="form-control input-sm" type="text"
                                                name="telegramid" id="telegramid" value="{{ $telegramid ??  '' }}" />

                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row">

                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="phpmyadmin">PhpMyadmin</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="phpmyadmin" id="phpmyadmin" value="{{ $phpmyadmin ?? '' }}" />
                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row {{$codermode}}">

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="storagedisk">Storage Disk</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="storagedisk" id="storagedisk" value="{{ $storagedisk ?? 'public' }}" />
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="storagepath">Storage Path</label>
                                            <input class="form-control input-sm" type="text"
                                                name="storagepath" id="storagepath" value="{{ $storagepath ??  db() }}" />

                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row {{$codermode}}">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="dashboardform">Dashboard Form</label>

                                            <select class="form-control form-select input-sm" name="dashboardform" id="dashboardform">
                                                <option value="">-- {{ __('dev.noneselected') }} --</option>
                                                {!! cmb_listing($forms_list, [$dashboardform ?? ''], '', '') !!}
                                            </select>
                                            

                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row {{$codermode}}">
                                        <div class="col-xs-12 col-sm-4 col-lg-4 form-group">
                                            <label class="frm-label" for="provincefield">Province Field</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="provincefield" id="provincefield" value="{{ $provincefield ?? 'cProvince' }}" />

                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-4 col-lg-4 form-group">
                                            <label class="frm-label" for="districtfield">District Field</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="districtfield" id="districtfield" value="{{ $districtfield ?? 'cDistrict' }}" />

                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-4 col-lg-4 form-group">
                                            <label class="frm-label" for="communefield">Commune Field</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="communefield" id="communefield" value="{{ $communefield ?? 'cCommune' }}" />

                                        </div><!-- /.column -->
                                    </div>


                                     {{-- Row --}}
                                     <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="backgroundimage">Background Image</label>

                                            <div class="input-group">
                                                <input class="form-control input-sm mediastore"  name="backgroundimage" placeholder="Background Image" type="text" readonly value="{{ $backgroundimage ?? '' }}">
                                                <button class="btn btn-light br-ts-0 br-bs-0 mediabrowser" type="button"><i class="fa fa-image"></i></button>
                                                <button class="btn btn-light br-ts-0 br-bs-0 hide mediaremove" type="button"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div><!-- /.column -->

                                        <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                            <label class="frm-label" for="partnerimage">Partner Image</label>

                                            <div class="input-group">
                                                <input class="form-control input-sm mediastore"  name="partnerimage" placeholder="Partner Image" type="text" readonly value="{{ $partnerimage ?? '' }}">
                                                <button class="btn btn-light br-ts-0 br-bs-0 mediabrowser" type="button"><i class="fa fa-image"></i></button>
                                                <button class="btn btn-light br-ts-0 br-bs-0 hide mediaremove" type="button"><i class="fa fa-times"></i></button>
                                            </div>
                                        </div><!-- /.column -->
                                    </div>

                                    {{-- Row --}}
                                    <div class="row">

                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="disclaimer">Disclaimers</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="disclaimer" id="disclaimer" value="{{ $disclaimer ?? '' }}" />
                                        </div><!-- /.column -->
                                    </div>


                                    
                                    {{--  --}}
                                </div>
                            </div>


                            
                           

                        </div>
                        {{-- RIGHT --}}
                        <div class="col-xs-12 col-sm-6 col-lg-6">
                            <div class="card bg-gray-200 bd-0">
                                <div class="card-body">
                                    <h5 class="card-title tx-dark tx-medium mg-b-10">METABASE</h5>
                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="metabaseurl">URL</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="metabaseurl" id="metabaseurl" value="{{ $metabaseurl ?? '' }}" />
                                            

                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="metabasesecret">SECRET</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="metabasesecret" id="metabasesecret" value="{{ $metabasesecret ?? '' }}" />
                                            

                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="metabasedashboard">Dashboard</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="metabasedashboard" id="metabasedashboard" value="{{ $metabasedashboard ?? '' }}" />
                                            

                                        </div><!-- /.column -->

                                    </div>

                                    {{-- Row --}}
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                            <label class="frm-label" for="metabasequestion">Question</label>

                                            <br />
                                            <input class="form-control input-sm" type="text"
                                                name="metabasequestion" id="metabasequestion" value="{{ $metabasequestion ?? '' }}" />
                                            

                                        </div><!-- /.column -->

                                    </div>
            
                                     

                                    
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
