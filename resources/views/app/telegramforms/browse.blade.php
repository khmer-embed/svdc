@php
$extends = 'app';
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
    @endphp
@endif

@extends('layouts.' . $extends)

@section('blade_css')
@endsection
@section('blade_scripts')
    <script>
        /** initalize ***/
        //var bunny = {{ Js::from(['aa' => 'bb']) }};
    
        $(document).ready(function() {

            $(document).on("click", "#btnsearch-quotation", function() {
                ///
                let form = $(".frmsearch-{{ $obj_info['name'] }}")
                var isvalidate = form[0].checkValidity();
                if (isvalidate) {
                    event.preventDefault();
                    helper.silentHandler(
                        "{{ url_builder($obj_info['routing'], [$obj_info['name'], 'browse']) }}",
                        ".frmsearch-{{ $obj_info['name'] }}", {}, {}, {},
                        "{{ $obj_info['name'] }}-create-app",
                        ''
                    );

                } else {
                    form[0].reportValidity()
                }
                ///
            });

            $(document).on("click", "#btnreset-quotation", function() {
                $("#txt_quotation").val('');
                helper.silentHandler(
                    "{{ url_builder($obj_info['routing'], [$obj_info['name'], 'browse']) }}",
                    null, {
                        formsearch: ""
                    }, {}, {},
                    "{{ $obj_info['name'] }}-create-app",
                    ''
                );

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

                    </h5>
                </div>
                <div class="col-sm-6 text-right">

                    <form id="formID" class="frmsearch-{{ $obj_info['name'] }}">
                        <input type="hidden" name="formsearch" value="">
                        <div class="input-group input-sm mb-2">
                            
                            <input type="text" id="txt_quotation" name="txt_quotation" value="{{ request()->get('txt_quotation') ?? '' }}"
                                class="form-control" placeholder="Search ..."
                                oninvalid="this.setCustomValidity('Please Enter text search')"
                                oninput="setCustomValidity('')" required>
                            <span class="input-group-append">
                                <button id="btnsearch-quotation" class="btn ripple btn-primary"
                                    type="button">Search</button>
                                <button id="btnreset-quotation" class="btn ripple btn-light" type="button">Reset</button>
                            </span>
                            
                        </div>

                    </form>
                </div>
            </div>
            <input type="hidden" id="mediacenteroption" value="{{ request()->get('mediacenteroption') ?? '' }}">
            <input type="hidden" id="tocontainer" value="{{ request()->get('tocontainer') ?? '' }}">
        </div>
    </section>
    {{-- end header --}}
    <div class="container-fluid {{ request()->get('onclicklistener') ?? $obj_info['name'].'_listener' }}"
        id="{{ $obj_info['name'] }}-create-app">
        {{-- Start Form --}}
        {!! $page ?? '' !!}
        {{-- End From --}}
       
    </div>
@endsection

