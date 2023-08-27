<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta name='viewport' content='width=device-width, initial-scale=1.0, user-scalable=0'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="Description" content="dcXKobo -  Way to syncronize your Kobo Collection to own Database">
    <meta name="Author" content="dcX">
    <meta name="Keywords"
        content="kobo, kobo collection, own kobo database, kobo forms" />

    <!-- Title -->
    <title>{{ config('sysprofile.latinname', 'dcX KoBo') }}</title>

    <!-- Favicon -->

    <link rel="icon" href="{{ asset('public/assets/img/brand/favicon.png') }}" type="image/x-icon" />

    <!-- Icons css -->
    <link href="{{ asset('public/assets/css/icons.css') }}" rel="stylesheet">


    <!--  bootstrap css-->
    <link href="{{ asset('public/assets/plugins/bootstrap/css/bootstrap.min.css') }}" rel="stylesheet">

    <!--- Style css --->
    <link href="{{ asset('public/assets/css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('public/assets/css/style-dark.css') }}" rel="stylesheet">
    <link href="{{ asset('public/assets/css/style-transparent.css') }}" rel="stylesheet">

    <!---Skinmodes css-->
    <link href="{{ asset('public/assets/css/skin-modes.css" rel="stylesheet') }}" rel="stylesheet">

    <!--- Animations css-->
    <link href="{{ asset('public/assets/css/animate.css') }}" rel="stylesheet">
    <link href="{{ asset('public/css/style.css') }}" rel="stylesheet">


</head>

<body class="ltr error-page1 bg-primary">

    <!-- Loader -->
    <div id="global-loader">
        <img src="{{ asset('public/assets/img/loader.svg') }}" class="loader-img" alt="Loader">
    </div>
    <!-- /Loader -->

    <div class="square-box">
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
        <div></div>
    </div>
    <div class="page">
        <div class="page-single">
            <div class="container">
                <div class="row">
                    <div
                        class="col-xl-5 col-lg-6 col-md-8 col-sm-8 col-xs-10 card-sigin-main mx-auto my-auto py-4 justify-content-center">
                        <div class="card-sigin">
                            <!-- Demo content-->
                            <div class="main-card-signin d-md-flex">
                                <div class="wd-100p">
                                    <div class="d-flex mb-4"><a href="#">
                                            @php
                                                $logo = asset('public/assets/img/brand/airlyo-logo.png');
                                                //asset('public/assets/img/brand/favicon.png')
                                                if (!empty(config('sysprofile.logo'))) {
                                                    $logo = filepath() . config('sysprofile.logo');
                                                }
                                            @endphp
                                            <img src="{{ $logo }}"
                                                class="sign-favicon ht-40" alt="logo"></a></div>
                                    <div class="">
                                        <div class="main-signup-header">
                                            <h2>Welcome back!</h2>
                                            <h6 class="font-weight-semibold mb-4">Please sign in to continue.</h6>
                                            <div class="panel panel-primary">

                                                <form method="POST" action="{{ route('login') }}">
                                                    @csrf
                                                    <div class="form-group">
                                                        <label>User</label>
                                                        <input id="username" type="text"
                                                            class="form-control @error('username') is-invalid @enderror"
                                                            name="username" value="{{ old('username') }}" required
                                                            autocomplete="off" autofocus>
                                                        @error('username')
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $message }}</strong>
                                                            </span>
                                                        @enderror
                                                    </div>
                                                    <div class="form-group">
                                                        <label>Password</label>
                                                        <div class="pos-relative">
                                                            <input id="password" type="password"
                                                                class="form-control @error('password') is-invalid @enderror"
                                                                name="password" required
                                                                autocomplete="current-password">
                                                            <span class="form-control-feedback togglepassword"><i
                                                                    class="fas fa-eye"></i></span>
                                                        </div>
                                                        @error('password')
                                                            <span class="invalid-feedback" role="alert">
                                                                <strong>{{ $message }}</strong>
                                                            </span>
                                                        @enderror
                                                    </div><button class="btn btn-primary btn-block">Sign In</button>

                                                </form>
                                            </div>

                                            {{-- <div class="main-signin-footer text-center mt-3">
													<p><a href="" class="mb-3">Forgot password?</a></p>
													<p>Don't have an account? <a href="signup.html">Create an Account</a></p>
												</div> --}}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- JQuery min js -->
    <script src="{{ asset('public/assets/plugins/jquery/jquery.min.js') }}"></script>

    <!-- Bootstrap js -->
    <script src="{{ asset('public/assets/plugins/bootstrap/js/popper.min.js') }}"></script>
    <script src="{{ asset('public/assets/plugins/bootstrap/js/bootstrap.min.js') }}"></script>

    <!-- Moment js -->
    <script src="{{ asset('public/assets/plugins/moment/moment.js') }}"></script>

    <!-- eva-icons js -->
    <script src="{{ asset('public/assets/js/eva-icons.min.js') }}"></script>

    <!-- generate-otp js -->
    <script src="{{ asset('public/assets/js/generate-otp.js') }}"></script>

    <!--Internal  Perfect-scrollbar js -->

    <script src="{{ asset('public/assets/plugins/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>

    <!-- Theme Color js -->
    <script src="{{ asset('public/assets/js/themecolor.js') }}"></script>

    <!-- custom js -->
    <script src="{{ asset('public/assets/js/custom.js') }}"></script>

    <script src="{{ asset('public/js/helper.js') }}" defer></script>
    <script>
        $(document).ready(function() {
            $('.togglepassword').on('click', function() {
                helper.togglePassword($(this));
            });
        });
    </script>
</body>

</html>
