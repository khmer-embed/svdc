<div class="modal fade" id="modal_windows" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 10px;">
                <h5 class="modal-title">
                    {{ config('sysprofile.latinname', 'dcX') }}
                    {{--  --}}
                    <small>
                        <div class="global_loading spinner-border text-info spinner-border-sm" role="status" style="display: none;">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </small>
                    
                    {{--  --}}
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="padding:0 !important">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-12">        
                        <span id="air_windows">
                          
                            
                        </span>
                    </div>
                    
                </div>
            </div>
            <div class="modal-footer justify-content-end" style="padding: 5px 10px;">
                {{-- <button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button> --}}
                <a href="javascript:void(0);" class="btn-link" data-bs-dismiss="modal">Close</a>
            </div>
        </div>

    </div>

</div>

{{--  --}}

<div class="modal fade" id="modal_media" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 10px;">
                <h5 class="modal-title">
                    {{ config('sysprofile.latinname', 'dcX') }}
                    {{--  --}}
                    <small>
                        <div class="global_loading spinner-border text-info spinner-border-sm" role="status" style="display: none;">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </small>
                    
                    {{--  --}}
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="padding:0 !important">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-12">        
                        <span id="air_media">
                          
                            
                        </span>
                    </div>
                    
                </div>
            </div>
            <div class="modal-footer justify-content-end" style="padding: 5px 10px;">
                {{-- <button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button> --}}
                <a href="javascript:void(0);" class="btn-link" data-bs-dismiss="modal">Close</a>
            </div>
        </div>

    </div>

</div>


{{--  --}}

<div class="modal fade h" id="modal_iframe" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content">
            <div class="modal-header" style="padding: 5px 10px;">
                <h5 class="modal-title">
                    {{ config('sysprofile.latinname', 'dcX') }}
                    {{--  --}}
                    <small>
                        <div class="global_loading spinner-border text-info spinner-border-sm" role="status" style="display: none;">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </small>
                    
                    {{--  --}}
                </h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body" style="padding:0 !important; ">
                <div class="row" id="printcontainer">
                    <div class="col-xs-12 col-sm-12 col-lg-12 text-center">  
                        <button type="button" class="btn btn-outline-warning button-icon mg-10" onclick="window.frames['air_iframe'].print()">
                            <i class="fas fa-print me-2"></i>
                            PRINT
                        </button>
                    </div>
                </div>
               
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-lg-12" style="height:70vh">        
                        <iframe name="air_iframe" id="air_iframe" style="width: 100%; height: 100%; margin:0px; padding:0px">
                          
                            
                        </iframe>
                    </div>
                    
                </div>
            </div>
            <div class="modal-footer justify-content-end" style="padding: 5px 10px;">
                {{-- <button type="button" class="btn btn-default" data-bs-dismiss="modal">Close</button> --}}
                <a href="javascript:void(0);" class="btn-link" data-bs-dismiss="modal">Close</a>
            </div>
        </div>

    </div>

</div>
