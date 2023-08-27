@php
 
    $bankend_lang = config('dev.app.bankend_lang');
    $current_lang = current_lang();
    if (isset($current_lang[0])) {
        unset($bankend_lang[$current_lang[0]]);
    }
    // dd(config('sysprofile.logo'));

    $logo = asset('public/assets/img/brand/airlyo-logo.png');
    //asset('public/assets/img/brand/logo.png')
    if (!empty(config('sysprofile.logo'))) {
        $logo = filepath() . config('sysprofile.logo');
    }

    
@endphp

<div>
    <!-- main-header -->
    <div class="main-header side-header sticky nav nav-item">
        <div class=" main-container container-fluid">
            <div class="main-header-left ">
                <div class="responsive-logo">
                    <a href="#" class="header-logo">
                        <img src="{{ $logo }}" class="mobile-logo logo-1"
                        alt="logo" style="height:40px">
                    <img src="{{ $logo }}"
                        class="mobile-logo dark-logo-1" alt="logo" style="height:40px">
                    </a>
                </div>
                <div class="app-sidebar__toggle" data-bs-toggle="sidebar">
                    <a class="open-toggle" href="javascript:void(0);"><i class="header-icon fe fe-align-left"></i></a>
                    <a class="close-toggle" href="javascript:void(0);"><i class="header-icon fe fe-x"></i></a>
                </div>
                <div class="logo-horizontal">
                    <a href="#" class="header-logo">
                        <img src="{{ $logo }}" class="mobile-logo logo-1"
                            alt="logo">
                        <img src="{{ $logo }}" class="mobile-logo dark-logo-1"
                            alt="logo">
                    </a>
                </div>
                {{-- <div class="main-header-center ms-4 d-sm-none d-md-none d-lg-block form-group">
                  
                  <input class="form-control" placeholder="Search..." type="search">
                  <button class="btn"><i class="fas fa-search"></i></button>
              </div> --}}
                <div class="mx-2">
                    <small>
                        <div class="global_loading spinner-border text-info spinner-border-sm" role="status"
                            style="display: none;">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </small>
                </div>
            </div>
            <div class="main-header-right">

                <button class="navbar-toggler navresponsive-toggler d-lg-none ms-auto" type="button"
                    data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent-4"
                    aria-controls="navbarSupportedContent-4" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon fe fe-more-vertical "></span>
                </button>
                <div class="mb-0 navbar navbar-expand-lg navbar-nav-right responsive-navbar navbar-dark p-0">
                    <div class="collapse navbar-collapse" id="navbarSupportedContent-4">

                        <ul class="nav nav-item header-icons navbar-nav-right ms-auto" style="justify-content: end;">

                            {{-- language --}}

                            <li class="nav-item dropdown">
                                <div class="dropdown btn-group dropdownlang">
                                    <button type="button" class="btn btn-outline-light">
                                        <div class="rounded" style="float: left; width: 20px ; height:auto;">
                                            <img alt=""
                                                src="{{ asset('public/assets/img/lang/' . $current_lang[3]) }}"
                                                class="">
                                        </div>
                                    </button>
                                    <button type="button" class="btn btn-outline-light dropdown-toggle split-dropdown"
                                        data-bs-toggle="dropdown" aria-expanded="false">
                                        <span class="caret"></span>
                                        <span class="sr-only">Toggle Dropdown</span>
                                    </button>
                                    <div class="dropdown-menu tx-13" style="">

                                        @foreach ($bankend_lang as $lang)
                                            <a class="dropdown-item" href="{{ url_language($lang[0]) }}">
                                                <div class="d-flex align-items-center">
                                                    <div>
                                                        <div class="rounded"
                                                            style="float: left; width: 20px ; height:auto;">
                                                            <img alt=""
                                                                src="{{ asset('public/assets/img/lang/' . $lang[3]) }}"
                                                                class="">
                                                        </div>
                                                    </div>
                                                    <div class="px-2">
                                                        {!! $lang[2] !!}
                                                    </div>
                                                </div>

                                            </a>
                                        @endforeach

                                    </div>
                                </div>


                            </li>

                            <li class="nav-item">
                                <a class="new nav-link theme-layout nav-link-bg layout-setting">
                                    <span class="dark-layout"><svg xmlns="http://www.w3.org/2000/svg"
                                            class="header-icon-svgs" width="24" height="24" viewBox="0 0 24 24">
                                            <path
                                                d="M20.742 13.045a8.088 8.088 0 0 1-2.077.271c-2.135 0-4.14-.83-5.646-2.336a8.025 8.025 0 0 1-2.064-7.723A1 1 0 0 0 9.73 2.034a10.014 10.014 0 0 0-4.489 2.582c-3.898 3.898-3.898 10.243 0 14.143a9.937 9.937 0 0 0 7.072 2.93 9.93 9.93 0 0 0 7.07-2.929 10.007 10.007 0 0 0 2.583-4.491 1.001 1.001 0 0 0-1.224-1.224zm-2.772 4.301a7.947 7.947 0 0 1-5.656 2.343 7.953 7.953 0 0 1-5.658-2.344c-3.118-3.119-3.118-8.195 0-11.314a7.923 7.923 0 0 1 2.06-1.483 10.027 10.027 0 0 0 2.89 7.848 9.972 9.972 0 0 0 7.848 2.891 8.036 8.036 0 0 1-1.484 2.059z" />
                                        </svg></span>
                                    <span class="light-layout"><svg xmlns="http://www.w3.org/2000/svg"
                                            class="header-icon-svgs" width="24" height="24" viewBox="0 0 24 24">
                                            <path
                                                d="M6.993 12c0 2.761 2.246 5.007 5.007 5.007s5.007-2.246 5.007-5.007S14.761 6.993 12 6.993 6.993 9.239 6.993 12zM12 8.993c1.658 0 3.007 1.349 3.007 3.007S13.658 15.007 12 15.007 8.993 13.658 8.993 12 10.342 8.993 12 8.993zM10.998 19h2v3h-2zm0-17h2v3h-2zm-9 9h3v2h-3zm17 0h3v2h-3zM4.219 18.363l2.12-2.122 1.415 1.414-2.12 2.122zM16.24 6.344l2.122-2.122 1.414 1.414-2.122 2.122zM6.342 7.759 4.22 5.637l1.415-1.414 2.12 2.122zm13.434 10.605-1.414 1.414-2.122-2.122 1.414-1.414z" />
                                        </svg></span>
                                </a>
                            </li>



                            <li class="nav-item full-screen fullscreen-button">
                                <a class="new nav-link full-screen-link" href="javascript:void(0);"><svg
                                        xmlns="http://www.w3.org/2000/svg" class="header-icon-svgs" width="24"
                                        height="24" viewBox="0 0 24 24">
                                        <path
                                            d="M5 5h5V3H3v7h2zm5 14H5v-5H3v7h7zm11-5h-2v5h-5v2h7zm-2-4h2V3h-7v2h5z" />
                                    </svg></a>
                            </li>

                            

                            <li class="dropdown main-profile-menu nav nav-item nav-link ps-lg-2">
                                <a class="new nav-link profile-user d-flex" href=""
                                    data-bs-toggle="dropdown"><img alt=""
                                        src="{{ asset('public/assets/img/faces/user.png') }}" class=""></a>
                                <div class="dropdown-menu">
                                    <div class="menu-header-content p-3 border-bottom">
                                        <div class="d-flex wd-100p">
                                            <div class="main-img-user"><img alt=""
                                                    src="{{ asset('public/assets/img/faces/user.png') }}"
                                                    class="">
                                            </div>
                                            <div class="ms-3 my-auto">
                                                <h6 class="tx-15 font-weight-semibold mb-0">{!! $userinfo->fullname ?? '' !!}
                                                </h6>
                                                <span class="dropdown-title-text subtext op-6  tx-12">
                                                    {!! $userinfo->name ?? '' !!}
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    {{-- <a class="dropdown-item" href="#"><i
                                            class="far fa-user-circle"></i>Profile</a> --}}

                                    <a id="resetpassword" class="dropdown-item" href="#">
                                        <i class="fas fa-key"></i>
                                        @lang('dev.resetpwd')
                                    </a>
                                    <a class="dropdown-item"
                                        href="{{ url_builder('admin.controller', ['logout']) }}"><i
                                            class="far fa-arrow-alt-circle-left"></i> @lang('dev.logout')</a>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /main-header -->

    <!-- main-sidebar -->
    <div class="sticky">
        <aside class="app-sidebar">
            <div class="main-sidebar-header active">
                <a class="header-logo active" href="#">
                    <img src="{{ $logo }}" class="main-logo  desktop-logo"
                        alt="logo">

                        <img src="{{ $logo }}" class="main-logo  desktop-dark"
                        alt="logo">

                </a>
            </div>
            <div class="main-sidemenu">
                <div class="slide-left disabled" id="slide-left"><svg xmlns="http://www.w3.org/2000/svg"
                        fill="#7b8191" width="24" height="24" viewBox="0 0 24 24">
                        <path d="M13.293 6.293 7.586 12l5.707 5.707 1.414-1.414L10.414 12l4.293-4.293z" />
                    </svg></div>
                <ul class="side-menu">
                    <li class="side-item side-item-category">Main</li>
                    <li class="slide {{ nav_checkactive(['home'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['home'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['home']) }}">
                            <i class="fas fa-th pd-r-10"></i>
                            <span class="side-menu__label">Dashboard</span>
                        </a>
                    </li>
                    @if(is_topadmin($userinfo->blongto??$userinfo['blongto'], $userinfo->permission_id??$userinfo['permission_id']))
                    <li class="side-item side-item-category">KOBO</li>
                    <li class="slide {{ nav_checkactive(['koboxlsform'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['koboxlsform'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['koboxlsform']) }}">
                            <i class="far fa-list-alt pd-r-10"></i>
                            <span class="side-menu__label">Kobo Form</span>
                        </a>
                    </li>

                    {{-- <li class="slide {{ nav_checkactive(['kobosetting'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['kobosetting'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['kobosetting']) }}">
                            <i class="fas fa-cog pd-r-10"></i>
                            <span class="side-menu__label">Kobo Setting</span>
                        </a>
                    </li> --}}
                   


                    <li class="slide {{ nav_checkactive(['realtimeinsert'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['realtimeinsert'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['realtimeinsert'], ['index']) }}">
                            <i class="fas fa-cloud-download-alt pd-r-10"></i>
                            <span class="side-menu__label">Realtime Insert</span>
                        </a>
                    </li>

                    <li class="slide {{ nav_checkactive(['telegramforms'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['telegramforms'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['telegramforms'], ['index']) }}">
                            <i class="fas fa-paperclip pd-r-10"></i>
                            <span class="side-menu__label">Telegram Forms</span>
                        </a>
                    </li>
                    @endif


                    {{-- xlsform --}}
                    <li class="side-item side-item-category">FORMS</li>
                    @foreach($xlsform as $frm)
                    {{-- <li class="slide {{ nav_checkactive(['dynamicform'], $args, 'active') }}">
                        <a class="side-menu__item"
                            href="{{ url_builder('admin.controller', ['dynamicform'], ['index', 'koboformid'=>$frm->id]) }}">
                            <i class="fas fa-th-list pd-r-10"></i>
                            <span class="side-menu__label">{{$frm->title}}</span>
                        </a>
                    </li> --}}
                    {{--  --}}
                    <li class="slide">
                        <a class="side-menu__item"
                            data-bs-toggle="slide" href="javascript:void(0);" title="{{$frm->title}}">
                            <i class="fas fa-th-list pd-r-10"></i>
                           
                            <span class="side-menu__label" style="float: left; white-space: nowrap; text-overflow: ellipsis; overflow: hidden; display: inline-block;">
                                {{$frm->title}}
                            </span><i class="angle fe fe-chevron-right"></i>
                        </a>
                        <ul class="slide-menu">
                            <li class="side-menu__label1"><a href="javascript:void(0);">Menu-Levels</a></li>
                            <li>
                                <a class="slide-item"
                                    href="{{ url_builder('admin.controller', ['dynamicform'], ['index', 'koboformid'=>$frm->id]) }}">@lang('dev.view')</a>
                            </li>
                            {{-- <li>
                                <a class="slide-item"
                                    href="{{ url_builder('admin.controller', ['dynamicreport'], ['index', 'koboformid'=>$frm->id]) }}">Report</a>
                            </li> --}}

                        </ul>
                    </li>
                    {{--  --}}
                    @endforeach

                    @if(dbis('ecatch'))
                    <li class="side-item side-item-category">Export</li>
                    <li class="slide {{ nav_checkactive(['export'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['export'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['export']) }}">
                            <i class="far fa-list-alt pd-r-10"></i>
                            <span class="side-menu__label">Export Form</span>
                        </a>
                    </li>
                    @endif

                    <li class="side-item side-item-category">Third Parties</li>

                    @if(!empty(config('sysconfig.phpmyadmin')))
                    <li class="slide">
                        <a class="side-menu__item"
                            href="{{ config('sysconfig.phpmyadmin') }}" target="_blank">
                            <i class="fas fa-database pd-r-10"></i>
                            <span class="side-menu__label">PhpMyadmin</span>
                        </a>
                    </li>
                    @endif

                    @if(!empty(config('sysconfig.metabaseurl')))
                    <li class="slide">
                        <a class="side-menu__item"
                            href="{{ config('sysconfig.metabaseurl') }}" target="_blank">
                            <i class="fas fa-chart-line pd-r-10"></i>
                            <span class="side-menu__label">Metabase</span>
                        </a>
                    </li>
                    @endif


                    @if(is_topadmin($userinfo->blongto??$userinfo['blongto'], $userinfo->permission_id??$userinfo['permission_id']))
                    <li class="side-item side-item-category">IMPORT</li>
                    <li class="slide {{ nav_checkactive(['importtable'], $args, 'active') }}">
                        <a class="side-menu__item {{ nav_checkactive(['importtable'], $args, 'active') }}"
                            href="{{ url_builder('admin.controller', ['importtable']) }}">
                            <i class="fas fa-table pd-r-10"></i>
                            <span class="side-menu__label">Import Table</span>
                        </a>
                    </li>
                   

                    <li class="side-item side-item-category">SETTING/USER</li>
                    <li @php
$setting_active = ['branch', 'warehouse', 'mediacenter', 'quotationstatus', 'unit', 'size', 'color', 'customertype', 'tableroom', 'dishnote', 'currency', 'systemprofile', 'systemsetting']; @endphp
                        class="slide {{ nav_checkactive($setting_active, $args, 'is-expanded') }}">
                        <a class="side-menu__item {{ nav_checkactive($setting_active, $args, 'active is-expanded') }}"
                            data-bs-toggle="slide" href="javascript:void(0);"><i class="fas fa-cog pd-r-10"></i><span
                                class="side-menu__label">Setting</span><i class="angle fe fe-chevron-right"></i></a>


                        <ul class="slide-menu">
                            <li class="side-menu__label1"><a href="javascript:void(0);">Menu-Levels</a></li>

                            {{-- media center --}}
                            <li>
                                <a class="slide-item {{ nav_checkactive(['mediacenter'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['mediacenter']) }}">Media Center</a>
                            </li>

                           

                            {{-- system --}}
                            <li>
                                <a class="slide-item {{ nav_checkactive(['systemprofile'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['systemprofile']) }}">Profile</a>
                            </li>

                            {{-- system --}}
                            <li>
                                <a class="slide-item {{ nav_checkactive(['systemsetting'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['systemsetting']) }}">System</a>
                            </li>

                        </ul>
                    </li>

                    <li class="slide {{ nav_checkactive(['user'], $args, 'is-expanded') }}">
                        <a class="side-menu__item {{ nav_checkactive(['user'], $args, 'active is-expanded') }}"
                            data-bs-toggle="slide" href="javascript:void(0);">
                            <i class="fas fa-users pd-r-10"></i>
                            <span class="side-menu__label">Users</span><i class="angle fe fe-chevron-right"></i>
                        </a>
                        <ul class="slide-menu">
                            <li class="side-menu__label1"><a href="javascript:void(0);">Menu-Levels</a></li>
                            <li>
                                <a class="slide-item {{ nav_checkactive(['user-index'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['user']) }}">@lang('dev.view')</a>
                            </li>
                            <li>
                                <a class="slide-item {{ nav_checkactive(['user-create'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['user', 'create']) }}">@lang('dev.new')</a>
                            </li>

                        </ul>
                    </li>

                    <li class="slide {{ nav_checkactive(['userpermission'], $args, 'is-expanded') }}">
                        <a class="side-menu__item {{ nav_checkactive(['userpermission'], $args, 'active is-expanded') }}"
                            data-bs-toggle="slide" href="javascript:void(0);">
                            <i class="fas fa-user-shield pd-r-10"></i>
                            <span class="side-menu__label">User Permission</span><i
                                class="angle fe fe-chevron-right"></i>
                        </a>
                        <ul class="slide-menu">
                            <li class="side-menu__label1"><a href="javascript:void(0);">Menu-Levels</a></li>
                            <li>
                                <a class="slide-item {{ nav_checkactive(['userpermission-index'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['userpermission']) }}">@lang('dev.view')</a>
                            </li>
                            <li>
                                <a class="slide-item {{ nav_checkactive(['userpermission-create'], $args) }}"
                                    href="{{ url_builder('admin.controller', ['userpermission', 'create']) }}">@lang('dev.new')</a>
                            </li>

                        </ul>
                    </li>
                    @endif


                </ul>
                <div class="slide-right" id="slide-right"><svg xmlns="http://www.w3.org/2000/svg" fill="#7b8191"
                        width="24" height="24" viewBox="0 0 24 24">
                        <path d="M10.707 17.707 16.414 12l-5.707-5.707-1.414 1.414L13.586 12l-4.293 4.293z" />
                    </svg></div>
            </div>
        </aside>
    </div>
    <!-- main-sidebar -->
</div>
