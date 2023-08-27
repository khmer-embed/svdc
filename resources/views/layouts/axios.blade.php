<!DOCTYPE html>
<html lang="en">
<head>
    @yield('blade_css')
    @stack('page_css')
</head>

<body>
    <div class="wrapper">
        <!-- Content Wrapper. Contains page content -->
        @yield('content')
    </div>
    {{-- yield use @saction --}}
    @yield('blade_scripts')
    {{-- stack use @push --}}
    @stack('page_scripts')
    @yield('vue_scripts')
</body>

</html>
