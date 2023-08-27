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

            



            // let foo = (bar)=>{
            //     console.log('foo-bar');
            // };

            $("#btnnew_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['create'] }}";
                // let extraFrm = {}; //{jscallback:'test'};
                // let setting = {};//{fnSuccess:foo};
                // let popModal = {
                //     show: true,
                //     size: 'modal-lg'
                //     //modal-sm, modal-lg, modal-xl
                // };

                // let loading_indicator = '';
                // helper.silentHandler(route_create, null, extraFrm, setting, popModal, 'air_windows',
                // loading_indicator);

                //window.location.replace(route_create);
                window.location = route_create;

            });

            $("#btntrash_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['trash'] ?? '' }}";
                window.location = route_create;

            });

            $("#btnactive_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['active'] ?? '' }}";
                window.location = route_create;

            });

            $("#btnimport_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['import'] }}";
                let extraFrm = {}; //{jscallback:'test'};
                let setting = {};//{fnSuccess:foo};
                let popModal = {
                    show: true,
                    size: 'modal-lg'
                    //modal-sm, modal-lg, modal-xl
                };

                let loading_indicator = '';
                helper.silentHandler(route_create, null, extraFrm, setting, popModal, 'air_windows',
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
                    @include('app._include.btn_index', ['new' => true, 'trash' => true, 'active' => true])
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
                <table class="table  table-striped table-hover text-nowrap table-bordered">
                    @if (isset($istrash) && $istrash)
                        <thead style="color: var(--warning)">
                        @else
                            <thead style="color: var(--info)">
                    @endif

                    <tr>
                        <th style="width: 10px">
                            {!!
                                orderMenu(
                                [	'caption'=>__('dev.id'),
                                    'sort'=>'id', 
                                    'current_sort'=>$sort, 
                                    'mdefault'=>'asc', 
                                    'method'=>$order, 
                                    'act'=>$act
                                ],
                                $querystr,
                                $perpage_query, 
                                $obj_info)
                            !!}	
                        </th>
                        <th>
                            {!!
                                orderMenu(
                                [	'caption'=>__('dev.title'),
                                    'sort'=>'title', 
                                    'current_sort'=>$sort, 
                                    'mdefault'=>'asc', 
                                    'method'=>$order, 
                                    'act'=>$act
                                ],
                                $querystr,
                                $perpage_query, 
                                $obj_info)
                            !!}
                        </th>
                        
                        

                        <th style="width: 40px; text-align: center"><i class="fa fa-ellipsis-h"></i></th>
                    </tr>
                    </thead>
                    <tbody>

                        @foreach ($results as $row)
                            <tr>
                                <td>
                                    {{ $row->id }}
                                </td>
                                <td>
                                    <a  class="btn-link" href="{{url_builder(
                                        $obj_info['routing'],
                                        [$obj_info['name'],'edit',$row->id],
                                        []
                                    )}}">
                                    {!! $row->title !!}
                                    </a>
                                </td>
                                
                                <td>
                                    @include('app._include.btn_record', [
                                        'rowid' => $row->id,
                                        'edit' => true,
                                        'clone' => true,
                                        'trash' => true,
                                        'delete' => true,
                                        'restore' => true,
                                    ])
                                </td>
                            </tr>
                        @endforeach
                        {{-- endforeach --}}
                    </tbody>
                </table>
            </div>
                @if($results->isEmpty())
                    @include('app._include.norecordfound')
                @endif

                <!-- Pagination and Record info -->
                @include('app._include.pagination', [ 
                    'container_style'   => 'padding:15px 5px 5px 5px',
                    'pagination_style'  => 'justify-content: flex-end',
                    'perpage'           => true])

                <!-- /. end -->
            
        </div>

    </div>

    {{--  --}}
    </div>
    
@endsection
