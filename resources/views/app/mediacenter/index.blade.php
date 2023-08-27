<!-- row -->
<div class="row">
    <div class="col-lg-12 col-xl-12">
                <div class="row">
                    <div class="col-4">
                        <form id="formID" class="frmsearch-{{ $obj_info['name'] }}">
                            <div class="input-group input-sm mb-2">
                                <input type="hidden" name="formsearch" value="">
                                <input type="text" id="textsearch" name="textsearch" value="{{ request()->get('textsearch') ?? '' }}" class="form-control" placeholder="Search files....." oninvalid="this.setCustomValidity('Please Enter text search')"  oninput="setCustomValidity('')" required>
                                <span class="input-group-append">
                                    <button id="btnsearch" class="btn ripple btn-primary" type="button">Search</button>
                                    <button id="btnreset" class="btn ripple btn-light" type="button">Reset</button>
                                </span>
                                
                            </div>
                            
                        </form> 
                    </div>
                    <div class="col-8 col-auto">
                        <div class="mb-4">
                            @include('app._include.pagination', ['perpage' => false, 'pagination_style'  => 'justify-content: flex-end'])
                        </div>
                    
                    </div>
                </div>
           
            {{--  --}}
            <div class="row">
                @foreach ($results as $row)
               
                <div class="col-xl-2 col-md-4 col-sm-6">
                    <div class="card p-0 ">
                        <div class="d-flex align-items-center px-3 pt-3">
                            <label class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input" name="example-checkbox2" value="option2">
                                <span class="custom-control-label"></span>
                            </label>
                            <div class="float-end ms-auto">
                                <a href="javascript:void(0);" class="option-dots" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fe fe-more-vertical"></i></a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-edit me-2"></i> Edit</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-share me-2"></i> Share</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-download me-2"></i> Download</a>
                                    <a class="dropdown-item" href="javascript:void(0);"><i class="fe fe-trash me-2"></i> Delete</a>
                                </div>
                            </div>
                        </div>
                        <div class="card-body pt-0 text-center">
                            <div class="file-manger-icon">
                                <a 
                                href="javascript:void(0);" 
                                class="mc_content mediaitem"
                                data-filename="{{$row->media}}"
                                data-title="{{$row->filename}}"
                                data-filepath = "{{$file_path.$row->media}}"
                                >
                                    <img src="{{$file_path.$row->media}}" alt="img" class="br-7" style="object-fit: scale-down;">
                                </a>
                                
                            </div>
                            <h6 class="mb-1 font-weight-semibold" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">{{$row['filename']}}</h6>
                            <span class="text-muted">23kb</span>
                        </div>
                    </div>
                </div>
                @endforeach

                @if($results->isEmpty())
                <div class="col-xl-12">
                    @include('app._include.norecordfound')
                </div>
                @endempty
        </div>
        
        

    </div>
</div>
<!-- End Row -->