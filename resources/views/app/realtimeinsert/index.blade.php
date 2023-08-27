@php
//dd(request()->session()->all());
$parse_url = parse_url(request()->url());
$url = $parse_url['scheme']."://". $parse_url['host'];
$isip = isip($url);
if($isip || str_contains($url, 'localhost')){
    $url .= '/dcxkobo';
}



@endphp
@extends('layouts.app')
@section('blade_css')
    <style>
        table tr td {
            flex-direction: row;
        }
    </style>
@endsection
@section('blade_scripts')
    <script>
        function windowfun() {
            console.log('window fun');
        }

        function copy(copyId) {
            var $inp = $("<input>");
            $("body").append($inp);
            $inp.val($("" + copyId).text().trim()).select();
            document.execCommand("copy");
            $inp.remove();
            $(".alert").fadeIn(500, function() {
                $(".alert").fadeOut();
            });
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
            $('.copy_url').on('click', function() {
                var eThis = $(this);
                var Parent = eThis.parents('tr');
                var ind = Parent.index() + 1;
                var $inp = $("<input>");
                $("body").append($inp);
                $inp.val($("" + 'tr:eq(' + ind + ') td:eq(2) .url').text().trim()).select();
                document.execCommand("copy");
                $inp.remove();
                helper.successAlert("copied..");

            });
            $('.copy_token').on('click', function() {
                var eThis = $(this);
                var Parent = eThis.parents('tr');
                var ind = Parent.index() + 1;
                var $inp = $("<input>");
                $("body").append($inp);
                $inp.val($("" + 'tr:eq(' + ind + ') td:eq(4) ._token').text().trim()).select();
                document.execCommand("copy");
                $inp.remove();
                helper.successAlert("copied..");
            })
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
        <div class="card">
            <div class="card-header">
                <h3 class="card-title"></h3>
                <div class="card-tools">
                    <div class="input-group input-group-sm" style="width: 150px;">
                        <div class="input-group-append">
                        </div>
                    </div>
                </div>
                <div class="card-body table-responsive p-0">
                    <table class="table  table-striped table-hover text-nowrap table-bordered">
                        @if (isset($istrash) && $istrash)
                            <thead style="color: var(--warning)">
                            @else
                                <thead style="color: var(--info)">
                        @endif
                        <tr>
                            <th style="width: 10px">ID</th>
                            <th>Table Name</th>
                            <th colspan="2">Url</th>
                            <th colspan="2">Token</th>
                           
                        </tr>
                        </thead>
                        <tbody>
                            @php
                                $api = company();
                            @endphp
                            @foreach ($results as $row)
                                <tr>
                                    <td>{{ $row->id }}</td>
                                    <td>{!! $row->table_name !!}</td>
                                    <td>
                                        <p class="url">
                                            {{ $url ."/api/". company() }}/realtimeinsert/api_store?kobo={{ $row->table_name }}
                                        </p>

                                    </td>
                                    <td>
                                        &nbsp;<span class="btn btn-sm btn-primary m-l-10 copy_url">copy url</span>
                                    </td>
                                    <td class="">
                                        <p class="_token">
                                            Bearer 1|4ddXojpcjWOY1a5jsCqyaP18vB7ABovg4mlo8UOQ
                                        </p>

                                    </td>
                                    <td>
                                        <span class="btn btn-sm btn-warning copy_token" style="float: left">copy
                                            token</span>
                                    </td>
                                    
                                </tr>
                            @endforeach
                            {{-- endforeach --}}
                        </tbody>
                    </table>
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
