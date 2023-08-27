<!-- row -->
<div class="row">
    <div class="col-lg-12 col-xl-12">
                
           
            {{--  --}}
            <div class="row">
                @foreach ($results as $row)
                <div class="col-xl-2 col-md-4 col-sm-6">
                    
                    <div class="card p-0 ">
                        <div 
                        class="card-body text-center btn-link {{ $obj_info['name'] }} {{ request()->get('itemclass') ?? '' }}" 
                        style="cursor: pointer"
                        data-id="{{$row['id']??''}}"
                        data-name="{!!$row['title']??''!!}"
                        data-titles='{{ $row['titles']??'' }}'
                        data-object="{{ $obj_info['name']??'' }}"
                        >
                            
                            <h6 class="mb-1 font-weight-semibold" style="overflow: hidden; text-overflow: ellipsis; white-space: nowrap;">
                                {!!$row['title']!!}
                            </h6>
                            
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

        <div class="row">
            <div class="col-12 col-auto">
                @include('app._include.pagination', ['perpage' => false, 'pagination_style'  => 'justify-content: flex-end', 'usesilent'=>true])
            </div>
        </div>
        
        

    </div>
</div>
<!-- End Row -->