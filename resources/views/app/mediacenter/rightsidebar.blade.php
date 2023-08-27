<div class="sidebar sidebar-right sidebar-animate">
  <div class="panel panel-primary card mb-0 box-shadow">
      <div class="tab-menu-heading card-img-top-1 border-0 p-3">
          <div class="card-title mb-0">Upload</div>
          <div class="card-options ms-auto">
              <a href="javascript:void(0);" class="sidebar-remove"><i class="fe fe-x"></i></a>
          </div>
      </div>
      <div class="panel-body tabs-menu-body latest-tasks p-0 border-0">
        <form name="frm-{{ $obj_info['name'] }}" id="frm-{{ $obj_info['name'] }}" method="POST"
            action="{{ $route['submit'] }}" enctype="multipart/form-data">
            {{-- please dont delete these default Field --}}
            @CSRF
            <input type="hidden" name="{{$fprimarykey}}" id="{{$fprimarykey}}" value="{{ $input[$fprimarykey] ?? '' }}">	
            <input type="hidden" name="jscallback" value="{{$jscallback??request()->get('jscallback')??''}}">
            {{--  --}}
    
            <div style="display:flex; flex-direction:column;">
                {{-- Element --}}
                <div style="flex-grow: 0;">
                    <div class="tabs-menu ">
                        <!-- Tabs -->
                        <ul class="nav panel-tabs">
                            <li class=""><a href="#side1" class="active" data-bs-toggle="tab"><i class="fas fa-desktop mx-2"></i> Local</a></li>
                            <li class=""><a href="#side2" data-bs-toggle="tab"><i class="fas fa-cloud mx-2"></i> Cloud</a></li>
                            <li class=""><a href="#side3" data-bs-toggle="tab"><i class="fas fa-camera mx-2"></i> Camera</a></li>
                    </ul>
                    </div>
                    <div class="tab-content">
                        <div class="tab-pane active " id="side1">
                          <div class="container-fluid">
                            <input class="en label_b" type="file" name="f_media[]" id="f_media" multiple="multiple" />
                            <span id="f_media-error" class="error invalid-feedback" style="display: none"></span>
                          </div>
                        </div>
                        <div class="tab-pane  " id="side2">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                                        <label class="en label_b">
                                            URL
                                        </label>
                                        
                                        <input class="en label_b form-control" type="text" name="txt_media" id="txt_media" value="">
                                        <span id="txt_media-error" class="error invalid-feedback" style="display: none"></span>
                                    </div>
                                    
                                </div>
                                <div class="row">
                                    <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                        <label class="en label_b"> Width</label>
                                        <input class="en label_b form-control" type="text" name="mwidth" value="0" onkeypress="return  intOnly(this, event)" placeholder="0">
                                        <span id="mwidth-error" class="error invalid-feedback" style="display: none"></span>
                                    </div>

                                    <div class="col-xs-12 col-sm-6 col-lg-6 form-group">
                                        <label class="en label_b">Height</label>
                                        <input class="form-control" type="text" name="mheight" value="0" onkeypress="return  intOnly(this, event)" placeholder="0">
                                        <span id="mheight-error" class="error invalid-feedback" style="display: none"></span>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="tab-pane  " id="side3">
                            <div class="container-fluid">

                                <div id="webcam-control">
                                    <div id="cameralive" style="width: 100% !important"></div>
                                    <input type="hidden" id="webcam" name="webcam" value="">
                                    <div id="takestopbtncontrol" style="display:none;margin-top:15px;" class="text-center">
                                          {{--  --}}
                                          <button type="button" class="btn btn-info-light btn-sm mx-2 button-icon" onclick="takeSnapshot();">
                                                  <i class="fe fe-camera me-2"></i>Take
                                          </button>
                                          {{--  --}}

                                          {{--  --}}
                                          <button type="button" class="btn btn-info-light btn-sm mx-2 button-icon" onclick="closeSnapshot();">
                                              <i class="far fa-times-circle me-2"></i>Close
                                          </button>
                                          {{--  --}}
                                      </div>
                                      
                                      <div id="resumebtncontrol" style="display:none;margin-top:15px;" class="text-center">
                                          <button type="button" class="btn btn-info-light btn-sm mx-2 button-icon" onclick="resumeSnapshot();">
                                     
                                              <i class="fas fa-redo me-2"></i>
                                              Take Another                                              
                                          </button>  
                                          
                                          <button type="button" class="btn btn-info-light btn-sm mx-2 button-icon" onclick="closeSnapshot();">
                                              <i class="far fa-times-circle me-2"></i>Close
                                          </button>
                                          
                                      </div>
                                      <div id="webcam-open-box">
                                          <button type="button" class="btn btn-outline-light" id="btnopencamera"
                                          style="width:100%; min-height: 250px; margin-top:10px; border:1px dashed #ddd">
                                              <i class="fe fe-camera me-2"></i>
                                               Take a new photo
                                          </button>
                                      </div>
                                  </div>
                                {{-- +++ --}}
                                
                            </div>
                        </div>
                        {{--  --}}
                    </div>
                </div>
                {{-- Button Upload --}}
                <div style="flex: 0 0 50px;  text-align: center; padding-top:10px">
                    @include('app._include.btn_create', ['save' => true, 'cancel' => false])
                </div>
            </div>

        </form>

        
         
      </div>
  </div>
</div>
