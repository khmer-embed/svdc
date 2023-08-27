@if(isset($saveoption) && is_array($saveoption))
<div class="dropdown btn-group">
    <button type="button" class="btnsaveoption_{{$obj_info['name']}} formactionbutton btn btn-outline-primary" data-savetype="save">
        <i class="fe fe-save me-2"></i>@lang('dev.save')
    </button>
    <button type="button" class="btn btn-outline-primary dropdown-toggle split-dropdown" data-bs-toggle="dropdown" aria-expanded="false">
        <span class="caret"></span>
        <span class="sr-only">Toggle Dropdown</span>
    </button>
    <div class="dropdown-menu tx-13" style="">
        @if($saveoption['new']??false)
        <a class="btnsaveoption_{{$obj_info['name']}} dropdown-item" href="javascript:void(0);" data-savetype="new">@lang('dev.andnew')</a>
        @endif
        @if($saveoption['edit']??false)
        <a class="btnsaveoption_{{$obj_info['name']}} dropdown-item" href="javascript:void(0);" data-savetype="apply">@lang('dev.andedit')</a>
        @endif
    </div>
</div>
@elseif(isset($saveoption) && $saveoption)
    <button 
    type="button" 
    class="btnsaveoption_{{$obj_info['name']}} formactionbutton btn btn-outline-success mx-2 button-icon" data-savetype="save">
    <i class="fe fe-save me-2"></i>@lang('dev.save')
    </button>
@endif

@if(isset($save) && $save)
<button 
    type="button" 
    class="btnsave_{{$obj_info['name']}} formactionbutton btn btn-outline-success mx-2 button-icon" data-savetype="save">
    <i class="fe fe-save me-2"></i>@lang('dev.save')
</button>
@endif

@if(isset($saveimport) && $saveimport)
<button 
    type="button" 
    class="btnsaveimport_{{$obj_info['name']}} formactionbutton btn btn-outline-success mx-2 button-icon" data-savetype="save">
    <i class="fe fe-save me-2"></i>@lang('dev.save')
</button>
@endif

@if(isset($apply) && $apply)
<button type="button" class="btnsave_{{$obj_info['name']}} formactionbutton btn btn-outline-success btn-flat ct-btn-action" data-savetype="apply">
    <i class="fas fa-edit"></i><br>@lang('dev.apply')
</button>
@endif

@if(isset($preview) && $preview)

<button 
    type="button" 
    class="btnpreview_{{$obj_info['name']}} formactionbutton btn btn-outline-warning button-icon">
    <i class="fas fa-print me-2"></i>@lang('dev.preview')
</button>
@endif

@if(isset($print) && $print)
<button type="button" class="btnprint_{{$obj_info['name']}} formactionbutton btn btn-outline-info btn-flat ct-btn-action" data-savetype="print">
    <i class="fas fa-print"></i><br>@lang('dev.print')
</button>
@endif

@if(isset($cancel) && $cancel)

<button 
    type="button" 
    class="btncancel_{{$obj_info['name']}} formactionbutton btn btn-outline-info button-icon">
    <i class="fe fe-arrow-left me-2"></i>@lang('dev.back')
</button>
@endif


