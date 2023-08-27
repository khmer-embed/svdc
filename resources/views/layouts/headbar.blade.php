@php
//if(!isset($args)) $args=[];

$branchall = $branchlisting;
$warehouseall = $warehouselisting;
@endphp
<div>
    <!-- main-header -->
    <div class="main-header side-header sticky nav nav-item" style="height: auto !important; padding-left: 10px !important;">
        <div class=" main-container container-fluid">
            <div style="display: flex; align-items: center;">
                
                <div class="mx-2" style="padding: 3px">
                    <div class="btn-group">
                        <div class="dropdown">
                            <button aria-expanded="false" aria-haspopup="true" class="btn ripple btn-outline-primary" data-bs-toggle="dropdown" id="dropdownMenuButton8" type="button" style="border: none">
                                <i class="fe fe-menu "></i>
                
                            </button>
                            <div  class="dropdown-menu tx-13">
                                <a class="dropdown-item" href="javascript:void(0);">Action</a>
                                <a class="dropdown-item" href="javascript:void(0);">Another action</a>
                                <a class="dropdown-item" href="javascript:void(0);">Something else here</a>
                            </div>
                        </div>
                      </div>
                </div>
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
                        <ul class="nav nav-item header-icons navbar-nav-right ms-auto">

                            <li class="dropdown nav-item">
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
                                        <path d="M5 5h5V3H3v7h2zm5 14H5v-5H3v7h7zm11-5h-2v5h-5v2h7zm-2-4h2V3h-7v2h5z" />
                                    </svg></a>
                            </li>

                            {{--  --}}
                            <li class="dropdown nav-item main-header-notification d-flex">
                                <a class="new nav-link" data-bs-toggle="dropdown" href="javascript:void(0);">
                                    
                                    @if ($userinfo->branch_id == 0)
                                        <i class="fas fa-sitemap text-danger"></i>
                                    @else
                                    <i class="fas fa-sitemap text-success"></i>
                                    @endif
                                    {{-- <span class="badge bg-warning header-badge">Branch-Project</span> --}}
                                </a>
                                <div class="dropdown-menu">
                                    <div class="text-start border-bottom">
                                        <div class="d-flex">
                                            @if ($userinfo->branch_id == 0)
                                                <span class="text-danger"><i class="fas fa-check-circle"></i>{{ __('dev.everybranch') }}</span>
                                            @else
                                                
                                                <span class="text-success"><i class="fas fa-check-circle"></i>{{ $branchall[$userinfo->branch_id] }}</span>
                                                
                                            @endif
                                        </div>
                                    </div>

                                    @if (count($branchall) > 0 && $userinfo->permission_id == 1)
                                        <div class="main-cart-list cart-scroll">
                                            @php
                                                $branchall = array_except($branchall, [$userinfo->branch_id]);
                                                $branchall = (object) $branchall;
                                            @endphp
                                            @foreach ($branchall as $ind => $r)
                                                <div class="d-flex border-bottom main-cart-item">
                                                    <a class="d-flex pd-10 wd-100p" href="{{ url_builder('admin.controller',['branch', 'change',$ind]) }}">
                                                        <h5 class="mb-1 text-info tx-13">{{ $r }}
                                                        </h5>
                                                    </a>
                                                </div>
                                            @endforeach
                                            {{--  --}}
                                            @if ($userinfo->branch_id != 0)
                                                <div class="d-flex border-bottom main-cart-item">
                                                    <a class="d-flex pd-10 wd-100p" href="{{ url_builder('admin.controller',['branch', 'change',0]) }}">
                                                        <h5 class="mb-1 text-danger tx-13">
                                                            {{ __('dev.everybranch') }}</h5>
                                                    </a>
                                                </div>
                                            @endif
                                            {{--  --}}
                                        </div>
                                    @endif

                                </div>
                            </li>
                            {{--  --}}

                            {{-- warehouse  --}}
                            <li class="dropdown nav-item main-header-notification d-flex">
                                <a class="new nav-link" data-bs-toggle="dropdown" href="javascript:void(0);">
                                    
                                    @if ($userinfo->warehouse_id == 0)
                                        <i class="fas fa-warehouse text-danger"></i>
                                    @else
                                    <i class="fas fa-warehouse text-success"></i>
                                    @endif
                                    {{-- <span class="badge bg-warning header-badge">Branch-Project</span> --}}
                                </a>
                                <div class="dropdown-menu">
                                    <div class="text-start border-bottom">
                                        <div class="d-flex">
                                            @if ($userinfo->warehouse_id == 0)
                                                <span class="text-danger"><i class="fas fa-check-circle"></i>{{ __('dev.everywarehouse') }}</span>
                                            @else
                                                
                                                <span class="text-success"><i class="fas fa-check-circle"></i>{{ $warehouseall[$userinfo->warehouse_id] }}</span>
                                                
                                            @endif
                                        </div>
                                    </div>

                                    @if (count($warehouseall) > 0 && $userinfo->permission_id == 1)
                                        <div class="main-cart-list cart-scroll">
                                            @php
                                                $warehouseall = array_except($warehouseall, [$userinfo->warehouse_id]);
                                                $warehouseall = (object) $warehouseall;
                                            @endphp
                                            @foreach ($warehouseall as $ind => $r)
                                                <div class="d-flex border-bottom main-cart-item">
                                                    <a class="d-flex pd-10 wd-100p" href="{{ url_builder('admin.controller',['warehouse', 'change',$ind]) }}">
                                                        <h5 class="mb-1 text-info tx-13">{{ $r }}
                                                        </h5>
                                                    </a>
                                                </div>
                                            @endforeach
                                            {{--  --}}
                                            @if ($userinfo->warehouse_id != 0)
                                                <div class="d-flex border-bottom main-cart-item">
                                                    <a class="d-flex pd-10 wd-100p" href="{{ url_builder('admin.controller',['warehouse', 'change',0]) }}">
                                                        <h5 class="mb-1 text-danger tx-13">
                                                            {{ __('dev.everywarehouse') }}</h5>
                                                    </a>
                                                </div>
                                            @endif
                                            {{--  --}}
                                        </div>
                                    @endif

                                </div>
                            </li>
                            {{--  --}}

                            
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /main-header -->

</div>
