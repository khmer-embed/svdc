@php
    $xs = 12;
    $sm = 2;
    $md = 2;
    $lg = 2;
    $xl = 2;

    $xs_2 = 12;
    $sm_2 = 10;
    $md_2 = 10;
    $lg_2 = 10;
    $xl_2 = 10;

    if (empty(config('sysconfig.partnerimage'))){
        $xs_2 = 12;
        $sm_2 = 12;
        $md_2 = 12;
        $lg_2 = 12;
        $xl_2 = 12;
        
    }
           
@endphp
@if (!empty(config('sysconfig.disclaimer')))

    <div class="row" style="padding:0px 20px;">
        @if (!empty(config('sysconfig.partnerimage')))
        <div class="col-xs-{{$xs}} col-sm-{{$sm}} col-md-{{$md}} col-lg-{{$lg}} col-xl-{{$xl}}">
            <div style="display: flex; justify-content:center">
                <div style="width:200px">
                    <img src="{{ filepath() . config('sysconfig.partnerimage') }}" class="mobile-logo dark-logo-1"
                        alt="logo">
                </div>
            </div>
        </div>
        @endif

        <div class="col-xs-{{$xs_2}} col-sm-{{$sm_2}} col-md-{{$md_2}} col-lg-{{$lg_2}} col-xl-{{$xl_2}}">
            <div style="display: flex; flex-direction:column; text-align: justify; padding:0 10px">
                <div>Disclaimer:</div>
                <div>{!! config('sysconfig.disclaimer') !!}</div>
            </div>
        </div>

    </div>
    
@endif
