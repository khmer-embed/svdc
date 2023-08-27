@php
    $icon = asset('public/assets/img/brand/airlyo-icon.png');
    //asset('public/assets/img/brand/logo.png')
    if (!empty(config('sysprofile.icon'))) {
        $icon = filepath() . config('sysprofile.icon');
    }
    // dd($userinfo->blongto??$userinfo['blongto']);
@endphp
<!doctype html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="Description" content="dcXKobo -  Way to syncronize your Kobo Collection to own Database">
    <meta name="Author" content="dcX">
    <meta name="Keywords"
        content="kobo, kobo collection, own kobo database, kobo forms" />

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('sysprofile.latinname', 'dcX KoBo') }}</title>

    <!-- Fonts -->
    <link rel="dns-prefetch" href="//fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Nunito" rel="stylesheet">

    <!--  bootstrap css-->
    <link id="style" href="{{ asset('public/assets/plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet" />

    <!-- Styles -->
    <link rel="icon" href="{{ $icon }}" type="image/x-icon" />
    <link href="{{ asset('public/css/vendors_css.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/style.css') }}" rel="stylesheet">

    @yield('blade_css')
    @stack('page_css')
    <script src="https://unpkg.com/vue@3"></script>
</head>

<body class="ltr main-body app sidebar-mini" style="overflow-x: hidden;">

    <!-- Loader -->
    <div id="global-loader">
        <img src="{{ asset('public/assets/img/loader.svg') }}" class="loader-img" alt="Loader">
    </div>
    <!-- /Loader -->

    <!-- Page -->
    <div class="page" id="app">
        @if (!isset($nosidebar))
            @include('layouts.sidebar')
        @endif
        <!-- main-content -->
        <div class="main-content app-content">
            <!-- breadcrumb -->
            {{-- @yield('actionbar') --}}
            <!-- /breadcrumb -->
            <!-- container -->
            <div class="main-container">
                @yield('content')
            </div>
            <!-- /Container -->
            <div class="w-100">
                @include('layouts/disclaimer')
            </div>
            
        </div>
        <!-- /main-content -->

        <!-- Sidebar-right-->

        <!--/Sidebar-right-->

        <!-- Footer opened -->
        @if (!isset($nosidebar))
            
            <div class="main-footer">
            
                <div class="col-md-12 col-sm-12 text-center">
                    
                    <div class="container-fluid pt-0 ht-100p">
                        {{ date('Y') }} Powered by <a href="https://dcxsea.com" class="text-primary" target="_blank">dcX</a>.
                    </div>
                </div>

                

            </div>

        @endif
        <!-- Footer closed -->

        {{-- modal for support Air Window --}}
        @include('layouts.modal')


    </div>
    <!-- End Page -->



    <!-- Back-to-top -->
    <a href="#top" id="back-to-top"><i class="las la-arrow-up"></i></a>

    <!-- JQuery min js -->
    <script src="{{ asset('public/assets/plugins/jquery/jquery.min.js') }}"></script>

    <!-- Bootstrap js -->
    <script src="{{ asset('public/assets/plugins/bootstrap/js/popper.min.js') }}"></script>
    <script src="{{ asset('public/assets/plugins/bootstrap/js/bootstrap.min.js') }}"></script>

    <!-- Internal Chart.Bundle js-->
    <script src="{{ asset('public/assets/plugins/chart.js/Chart.bundle.min.js') }}"></script>

    <!-- Moment js -->
    <script src="{{ asset('public/assets/plugins/moment/moment.js') }}"></script>

    <!-- INTERNAL Apexchart js -->
    <script src="{{ asset('public/assets/js/apexcharts.js') }}"></script>

    <!--Internal Sparkline js -->
    <script src="{{ asset('public/assets/plugins/jquery-sparkline/jquery.sparkline.min.js') }}"></script>

    <!-- Moment js -->
    <script src="{{ asset('public/assets/plugins/raphael/raphael.min.js') }}"></script>

    <!--Internal  Perfect-scrollbar js -->
    <script src="{{ asset('public/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('public/assets/plugins/perfect-scrollbar/p-scroll.js') }}"></script>

    <!-- Eva-icons js -->
    <script src="{{ asset('public/assets/js/eva-icons.min.js') }}"></script>


    <!-- Sidebar js -->
    <script src="{{ asset('public/assets/plugins/side-menu/sidemenu.js') }}"></script>

    <!-- Sticky js -->
    <script src="{{ asset('public/assets/js/sticky.js') }}"></script>

    <!--Internal  index js -->
    <script src="{{ asset('public/assets/js/index.js') }}"></script>

    <!-- Chart-circle js -->
    <script src="{{ asset('public/assets/js/circle-progress.min.js') }}"></script>

    <!-- Internal Data tables -->
    <script src="{{ asset('public/assets/plugins/datatable/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('public/assets/plugins/datatable/js/dataTables.bootstrap5.js') }}"></script>
    <script src="{{ asset('public/assets/plugins/datatable/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('public/assets/plugins/datatable/responsive.bootstrap5.min.js') }}"></script>

    <!-- INTERNAL Select2 js -->
    <script src="{{ asset('public/assets/plugins/select2/js/select2.full.min.js') }}"></script>
    {{-- <script src="{{ asset('public/assets/js/select2.js') }}"></script> --}}
    <!--Internal Sumoselect js-->
    <script src="{{ asset('public/assets/plugins/sumoselect/jquery.sumoselect.js') }}"></script>

    

    <!--Internal  Notify js -->
    <script src="{{ asset('public/assets/plugins/notify/js/notifIt.js') }}"></script>

    <!-- custom js -->
    <script src="{{ asset('public/assets/js/custom.js') }}"></script>

    <script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
    <script src="{{ asset('public/js/app.js') }}" defer></script>
    <script src="{{ asset('public/js/helper.js') }}" defer></script>

    {{-- yield use @saction --}}
    @yield('blade_scripts')

    {{-- stack use @push --}}
    @stack('page_scripts')
    <script>
        const {
            createApp,
            reactive,
            ref
        } = Vue;
        var env = {!! json_encode(config('dev.app.js_env')) !!};
        env.token = "{{ csrf_token() }}";
        @isset($js_config)
            var jsconfig = {!! json_encode($js_config) !!};
        @endisset
        var currencyinfo = {!! json_encode(config('currencyinfo'), JSON_FORCE_OBJECT) !!};
        var sysconfig = {!! json_encode(config('sysconfig'), JSON_FORCE_OBJECT) !!};
        var devconfig = {!! json_encode(config('dev.app'), JSON_FORCE_OBJECT) !!};

        $(document).ready(function() {
            axios.defaults.headers.get['content-type'] = 'application/json;charset=UTF-8';
            axios.interceptors.request.use((config) => {
                helper.setLoading(true);
                return config;
            }, (error) => {
                return Promise.reject(error);
            });

            axios.interceptors.response.use((response) => {
                helper.setLoading(false);
                return response;
            }, (error) => {
                helper.setLoading(false);
                return Promise.reject(error);
            });


            $(document).on("click", "#resetpassword", function(ev) {

                let route_create =
                    "{{ url_builder('admin.controller', ['resetpassword', 'edit', ''], []) }}";
                let extraFrm = {
                    // jscallback: 'getnewcategory'
                };
                let setting = {}; //{fnSuccess:foo};
                let popModal = {
                    show: true,
                    size: 'modal-xl'
                    //modal-sm, modal-lg, modal-xl, modal-fullscreen
                };

                let loading_indicator = '';
                helper.silentHandler(route_create, null, extraFrm, setting, popModal, 'air_windows',
                    loading_indicator);

            });


            $(document).on("click", ".silentpagination", function() {
                helper.silentHandler(
                    $(this).data('href'),
                    null, {}, {}, {},
                    $(this).data('container'),
                    ''
                );

            });

            /*Please dont delete this code*/
            @if (null !== session('status') && session('status') == false)
                helper.errorAlert("{{ session('message') }}");
            @endif

            @if (null !== session('status') && session('status') == true)
                helper.successAlert("{{ session('message') }}");
            @endif
            /*please dont delete this above code*/

            /*write df data into local store rage*/
            axios
                .get("{{ url_builder('admin.controller', ['default'], []) }}")
                .then(response => {
                    // console.log(response.data.productsource);
                    localStorage.setItem('initdata', JSON.stringify(response.data));
                });

            //console.log(devconfig.discounttype);

        });





        document.addEventListener("DOMContentLoaded", function() {
            window.addEventListener('scroll', function() {
                if (window.scrollY > 65) {
                    $('.ct-bar-action').removeClass("z-index-10");
                    $('.ct-bar-action').addClass("z-index-1020");

                } else {
                    $('.ct-bar-action').removeClass("z-index-1020");
                    $('.ct-bar-action').addClass("z-index-10");


                }
            });
        });

        $('#modal_windows').on('hidden.bs.modal', function(e) {
            $("#air_windows").html('');
        });

        $('#modal_media').on('hidden.bs.modal', function(e) {
            //$( ".sidebar-remove" ).trigger( "click" );
            $("#air_media").html('');
        })
    </script>

    <!-- Theme Color js -->
    <script src="{{ asset('public/assets/js/themecolor.js') }}"></script>

    @yield('vue_scripts')

</body>

</html>
