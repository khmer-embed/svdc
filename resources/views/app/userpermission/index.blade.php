@php
    //dd(request()->session()->all());
    foreach ($xlsform as $form) {
    $definelevel['kobo_'.$form->id] = [
        "name"=> 'kobo_'.$form->id,
        "routing" => "admin.controller",
        "title" => $form->title,
        "icon" => '<i class="fas fa-th-list"></i>',
        "protectme" => ["display" => "yes",
                        "group" => [],
                        "object" => ['kobo_'.$form->id],
                        "method" => ["index"=>["cover"=>"index", "title"=>"Home"]]
                        ]
      
        ];
    
}
@endphp
@extends('layouts.app')
@section('blade_css')
@endsection
@section('blade_scripts')
    <script>
        
        $(document).ready(function() {

            $("#btnnew_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['create'] }}";
                window.location = route_create;

            });

            $("#btntrash_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['trash']??'' }}";
                window.location = route_create;

            });

            $("#btnactive_{{ $obj_info['name'] }}").click(function(e) {
                let route_create = "{{ $route['active']??'' }}";
                window.location = route_create;

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
                    @include('app._include.btn_index', [
                        'new' => true,
                        'trash' => true,
                        'import' => false,
                        'active' => true,
                    ])
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
                        <div class="form-group col-md-8">
                            <label for="txt">@lang('dev.search')</label>
                            <input type="text" class="form-control input-sm" name="txt" id="txt"
                                value="{{ request()->get('txt') ?? '' }}">
                        </div>

                        <div class="form-group col-md-2">
                            <label>&nbsp;</label>
                            <button type="submit" value="filter"
                                class="btn btn-outline-primary btn-block formactionbutton"><i
                                    class="fa fa-search"></i></button>
                        </div>
                        <div class="form-group col-md-2">
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
                                {!! orderMenu(
                                    [
                                        'caption' => __('dev.id'),
                                        'sort' => 'id',
                                        'current_sort' => $sort,
                                        'mdefault' => 'asc',
                                        'method' => $order,
                                        'act' => $act,
                                    ],
                                    $querystr,
                                    $perpage_query,
                                    $obj_info,
                                ) !!}
                            </th>
                            <th>
                                {!! orderMenu(
                                    [
                                        'caption' => 'Title',
                                        'sort' => 'title',
                                        'current_sort' => $sort,
                                        'mdefault' => 'asc',
                                        'method' => $order,
                                        'act' => $act,
                                    ],
                                    $querystr,
                                    $perpage_query,
                                    $obj_info,
                                ) !!}
                            </th>

                            <th>Rule</th>
                            <th style="width: 40px">Status</th>
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
                                        {{-- start check lavel setting --}}
                                        @if (!empty($row->levelsetting))
                                            @php
                                                $objarr = [];
                                                $objmethod = '';
                                                $levelsetting = json_decode($row->levelsetting, true);
                                                foreach ($levelsetting as $setting) {
                                                    [$obj, $method] = explode('-', $setting);
                                                    //$method = ucfirst($method);
                                                    if (array_key_exists($obj, $objarr)) {
                                                        array_push($objarr[$obj], $method);
                                                    } else {
                                                        $objarr[$obj] = [$method];
                                                    }
                                                }
                                                
                                                $ind = 0;
                                                $styles = ['info', 'success'];
                                            @endphp
                                            {{-- start draw stting info --}}
                                            @if (!empty($objarr))
                                                @foreach ($objarr as $name => $action)
                                                    @if ($definelevel[$name]['protectme']['display'] == 'yes')
                                                        @php
                                                            $ind++;
                                                            $obj_title = $definelevel[$name]['title'];
                                                            $mod = $ind % 2;
                                                            $style = $styles[$mod];
                                                        @endphp
                                                        <div class="callout callout-{{ $style }}"
                                                            style="padding: 5px; margin-bottom:10px">
                                                            <div style="display: flex">
                                                                <div style="margin-right:5px;">
                                                                    <span class="badge bg-{{ $style }}"
                                                                        style="min-width:150px; padding:5px; text-align: left">{{ $obj_title }}
                                                                    </span>
                                                                </div>
                                                                <div>
                                                                    @foreach ($action as $val)
                                                                        <span class="badge bg-secondary">
                                                                            {{ $definelevel[$name]['protectme']['method'][strtolower($val)]['title']??'' }}
                                                                        </span>
                                                                    @endforeach
                                                                </div>
                                                            </div>
                                                        </div>
                                                    @endif
                                                @endforeach
                                            @endif
                                            {{-- end --}}
                                        @endif
                                        {{-- end lavel setting --}}
    
    
                                    </td>
                                    <td>
                                        @if ($row->level_status == 'yes')
                                                <span class="badge bg-success">
                                                    Enable
                                            @else
                                                <span class="badge bg-danger">
                                                   Disabled
                                        @endif
                                        </span>
                                    </td>
                                    <td>
                                        @include('app._include.btn_record', [
                                            'rowid' => $row->id,
                                            'edit' => true,
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
