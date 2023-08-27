<div style="display: flex; {{$container_style??''}}">
	{{-- per page --}}
    @if(isset($perpage) && $perpage)
    <div style="display: flex; flex-grow: 1; align-items: baseline">
        {{-- num --}}
        <div style="width:210px">
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text bg-gray-100" style="color: #000">@lang('dev.display') #</span>
                </div>
                <input type="number" class="form-control" max="150" id="txtperpage_{{ $obj_info['name'] }}" value="{{$recordinfo['perpage']}}">
                <div class="input-group-append">
                    <button type="button" class="btn btn-light" onclick='helper.submitPerpage("{{$sort}}","{{$order}}",{{json_encode($querystr )}},"{{ $obj_info["name"] }}")'>
                        <i class="fa fa-search"></i>
                    </button>
				</div>
            </div>
        </div>
        {{-- info --}}
		<div style="padding: 0px 5px">
			{{$recordinfo['from']}} - {{$recordinfo['to']}} @lang('dev.of') {{$recordinfo['total']}}  @lang('dev.records')
		</div>
    </div>
    @endif

	{{-- pagination --}}
    <div style="display:flex; flex-grow:1; {{$pagination_style??''}}">
        @if(isset($usesilent) && $usesilent)
        {!! $paginationsilent !!}
        @else
        {!! $paginationlinks !!}
        @endif
        
    </div>
</div>
