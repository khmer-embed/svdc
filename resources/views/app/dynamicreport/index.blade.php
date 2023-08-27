@php
//dd(request()->session()->all());
@endphp
@extends('layouts.app')
@section('blade_css')
@endsection
@section('blade_scripts')
    <script>
        function windowfun() {
            console.log('window fun');
        }
        $(document).ready(function() {

            /*Please dont delete this code*/
            @if (null !== session('status') && session('status') == false)
                helper.errorAlert("{{ session('message') }}");
            @endif

            @if (null !== session('status') && session('status') == true)
                helper.successAlert("{{ session('message') }}");
            @endif
            /*please dont delete this above code*/



            // let foo = (bar)=>{
            //     console.log('foo-bar');
            // };

            $("#btnnew_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['create'] }}";
                let extraFrm = {
                    jscallback: 'reloadpage'
                };
                let setting = {}; //{fnSuccess:foo};
                let popModal = {
                    show: false,
                };

                let loading_indicator = '';
                helper.silentHandler(route_create, null, extraFrm, setting, popModal, '',
                    loading_indicator);

            });

            $(".btnsync_{{ $obj_info['name'] }}").click(function(e) {
                let kobo_id = $(this).data("kobo_id");
                let route_sync = "{{ $route['sync'] }}";
                let extraFrm = {kobo_id:kobo_id,  jscallback: 'setInfoByEle'};
                let setting = {};//{fnSuccess:foo};
                let popModal = {
                    show: false,
                };
                
                let loading_indicator = '';
                helper.silentHandler(route_sync, null, extraFrm, setting, popModal, '',
                loading_indicator);

            });

            $("#province").change(function(e) {
                // alert(1);

                let parentId = $(this).val();
                let extraFrm = {
                    jscallback: 'updateDistrict',
                    'parent_id': parentId,
                    'lookingfor': 'cDistrict',
                };
                let setting = {}; //{fnSuccess:foo};

                helper.silentHandler(
                    "{{ url_builder('admin.controller', ['dynamicreport', 'byparent']) }}",
                    "",
                    extraFrm,
                    setting, {
                        show: false
                    },
                    '',
                    '');
            });


        });

        function reloadpage(jsondata) {
            location.reload();
        }

        function updateDistrict(jsondata) {

        let dropdown = $('#district');
        let data = jsondata.data;
        helper.makeDropdownByJson(dropdown, data, -1, 'please select');
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
        {{--  --}}
        <div class="card">
            <div class="card-header">
                {{--  --}}
                <form class="frmsearch-{{ $obj_info['name'] }}">

                    <div class="form-row" style="font-size: 11px">
                        <div class="form-group col-md-4">
                            <label for="province">Province</label>
                            <select class="form-control form-select input-sm" name="province" id="province">
                                <option value="">-- {{ __('dev.noneselected') }} --</option>
                                {!! cmb_listing($provinces, [request()->get('province') ?? ''], '', '') !!}
                            </select>
                        </div>

                        <div class="form-group col-md-2">
                            <label for="district">District</label>
                            <select class="form-control form-select input-sm" name="district" id="district">
                                <option value="">-- {{ __('dev.noneselected') }} --</option>
                                {!! cmb_listing($districts, [request()->get('district') ?? ''], '', '') !!}
                            </select>
                        </div>


                        <div class="form-group col-md-1">
                            <label>&nbsp;</label>
                            <button type="submit" value="filter"
                                class="btn btn-outline-primary btn-block formactionbutton"><i
                                    class="fa fa-search"></i></button>
                        </div>
                        <div class="form-group col-md-1">
                            <label>&nbsp;</label>
                            <button type="button" class="btn btn-outline-light btn-block formactionbutton"
                                onclick="location.href='{{ url()->current() }}'">@lang('dev.reset')</button>
                        </div>
                    </div>
                </form>
                {{--  --}}
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table class="table  table-striped text-nowrap table-bordered">
                        @if (isset($istrash) && $istrash)
                            <thead style="color: var(--warning)">
                            @else
                                <thead style="color: var(--info)">
                        @endif

                        <tr>
                            
                            
                            <th>
                               Province
                            </th>

                            <th>
                                District
                             </th>

                             <th>
                                Commune
                             </th>

                             <th>
                                Number
                             </th>
                           
                        </tr>
                        </thead>
                        <tbody>
                            
                            @foreach ($results as $row)
                                <tr>
                                    
                                    <td>
                                        {{$provinces[$row->province]??''}}
                                    </td>

                                    <td>
                                        {{$districts[$row->district]??''}}
                                    </td>

                                    <td>
                                        {{$communes[$row->commune]??''}}
                                    </td>

                                    <td>
                                        {{$row->count_cm??''}}
                                    </td>
                                    
                                </tr>
                            @endforeach
                            
                        </tbody>
                    </table>
                </div>
                @if ($results->isEmpty())
                    @include('app._include.norecordfound')
                @endif

                <!-- Pagination and Record info -->
                @include('app._include.pagination', [
                    'container_style' => 'padding:15px 5px 5px 5px',
                    'pagination_style' => 'justify-content: flex-end',
                    'perpage' => true,
                ])

                <!-- /. end -->

            </div>

        </div>

        {{--  --}}
    </div>
@endsection
