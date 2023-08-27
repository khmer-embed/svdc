@php
//dd(request()->session()->all());
$btn_action =false;
if(is_admin($userinfo->blongto??$userinfo['blongto'], $userinfo->permission_id??$userinfo['permission_id'])){
    $btn_action =true;
}
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

            $(".btnexport_{{ $obj_info['name'] }}").click(function(e) {
                const route = "{{ url_builder('admin.controller', ['dynamicform', 'export', ''], []) }}"
                const formname = ".frmsearch-{{ $obj_info['name'] }}";
                const exportType = $(this).data('export-type');
                form = $(formname);
                form.append('<input type="hidden" name="exporttype" value="'+exportType+'" />');
                form.attr("action", route);
                form.submit();

            });

            $(".btn_remove").click(function(e) {
                $("#modal_confirm").find("#url-modal-confirm").val($(this).data('action'));
                $("#modal_confirm").modal('show');
                
            });

            $("#btn-modal-confirm").click(function(e) {
                const route_url = $("#modal_confirm").find("#url-modal-confirm").val();
                window.location = route_url;

            });


        });

        function reloadpage(jsondata) {
            location.reload();
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
                    <a href="{{ url_builder('admin.controller', ['dynamicreport'], ['index', 'koboformid'=>$koboformid]) }}"
                            class="formactionbutton btn btn-outline-primary button-icon">
                            <i
                            class="fas fa-chart-line me-2"></i>
                            Report
                    </a>

                    {{--  --}}
                    <div class="btn-group ms-2 mt-2 mb-2">
                        <div class="dropdown">
                            <button aria-expanded="false" aria-haspopup="true" class="btn ripple btn-outline-success" data-bs-toggle="dropdown" id="dropdownMenuButton10" type="button">Export <i class="fas fa-caret-down ms-1"></i></button>
                            <div class="dropdown-menu tx-13" style="">
                                <a class="btnexport_{{ $obj_info['name'] }} dropdown-item" href="javascript:void(0);" data-export-type="thispage">This Page</a>
                                <a class="btnexport_{{ $obj_info['name'] }} dropdown-item" href="javascript:void(0);" data-export-type="aos">All of Search</a>
                                <a class="btnexport_{{ $obj_info['name'] }} dropdown-item" href="javascript:void(0);" data-export-type="aod">All of Data</a>
                            </div>
                        </div>
                    </div>
                    {{--  --}}

                    
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
                            <label for="txt">@lang('dev.search')</label>
                            <input type="text" class="form-control input-sm" name="txt" id="txt"
                                value="{{ request()->get('txt') ?? '' }}">
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
                            
                            <th style="width: 40px; text-align: center"><i class="fa fa-ellipsis-h"></i></th>
                            @foreach ($tablecolumns as $column)
                                @if('_' !=substr($column, 0, 1))
                                <th>
                                    @php
                                        $field_at_q = array_last(explode('/', $column));
                                    @endphp
                                    {{strip_tags($questions[$field_at_q]->label_0??$field_at_q)}}
                                </th>
                                @endif
                            @endforeach
                           
                        </tr>
                        </thead>
                        <tbody>
                            
                            @foreach ($results as $row)
                                <tr>
                                    <td>
                                        @if($btn_action)
                                            @include('app._include.btn_record', [
                                                'rowid' => $row->_id,
                                                'edit' => true,
                                                'remove' => true,
                                                // 'delete' => true,
                                                // 'restore' => true,
                                            ])
                                        @endif
                                    </td>

                                    @foreach ($tablecolumns as $column)
                                    @if('_' !=substr($column, 0, 1))
                                    @php
                                        $field_at_q = array_last(explode('/', $column));
                                    @endphp
                                    <td>

                                        @if(isset($questions[$field_at_q]) && !empty($questions[$field_at_q]->select_from_list_name))
                                            @php
                                                $role = $questions[$field_at_q]->select_from_list_name.'_'.$row->$column;
                                            @endphp
                                            {{$choices[$role]->label_0??''}}
                                        @else
                                            {{$row->$column??''}}
                                        @endif
                                        
                                    </td>
                                    @endif
                                    @endforeach
                                    
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

    @include('app._include.modal_reason')
@endsection
