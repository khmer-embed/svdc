@php
    $rest_commune = ($counter['count_commune'] - $counter['count_distinct']);
@endphp
@extends('layouts.app')
@section('blade_scripts')
    <!-- Internal Flot js -->
<script src="{{ asset('public/assets/plugins/jquery.flot/jquery.flot.js')}}"></script>
<script src="{{ asset('public/assets/plugins/jquery.flot/jquery.flot.pie.js')}}"></script>
<script src="{{ asset('public/assets/plugins/jquery.flot/jquery.flot.resize.js')}}"></script>

<!--Internal  Morris js -->
<script src="{{ asset('public/assets/plugins/raphael/raphael.min.js')}}"></script>
<script src="{{ asset('public/assets/plugins/morris.js/morris.min.js')}}"></script>

<!--Internal Chart Morris js -->
<script src="{{ asset('public/assets/js/chart.morris.js')}}"></script>

<script>
    var piedata = [{
		label: 'Active Communes',
		data: [
			[1, {{$counter['count_distinct']??0}}]
		],
		color: '#25d5b8'
	}, {
		label: 'Rest Communes',
		data: [
			[1, {{$rest_commune}}]
		],
		color: '#f75d7f'
	}];
    $.plot('#flotPie1', piedata, {
		series: {
			pie: {
				show: true,
				radius: 1,
				label: {
					show: true,
					radius: 2 / 3,
					formatter: labelFormatter,
					threshold: 0.1
				}
			}
		},
		
	});

    function labelFormatter(label, series) {
        const myArray = label.split("(");
        label = myArray[0];
		return '<div style="font-size:8pt; text-align:center; padding:2px; color:white;">' + label + '<br/>' + Math.round(series.percent) + '%</div>';
	}

    var morrisData = [{
		y: '2006',
		a: 100,
		b: 90
	}, {
		y: '2007',
		a: 75,
		b: 65
	}, {
		y: '2008',
		a: 50,
		b: 40
	}, {
		y: '2009',
		a: 75,
		b: 65
	}, {
		y: '2010',
		a: 50,
		b: 40
	}, {
		y: '2011',
		a: 80,
		b: 90
	}, {
		y: '2012',
		a: 75,
		b: 65
	}, {
		y: '2013',
		a: 50,
		b: 70
	}];

    new Morris.Bar({
		element: 'morrisBar3',
		data: morrisData,
		xkey: 'y',
		ykeys: ['a', 'b'],
		labels: ['Series A', 'Series B'],
		barColors: ['#38cab3', '#f74f75'],
		stacked: true,
		gridTextSize: 11,
		hideHover: 'auto',
		resize: true
	});
</script>
@endsection
@section('content')
{{-- <x-metabase dashboard="3"></x-metabase>
<x-metabase question="5"></x-metabase> --}}

@php
   
   $metabasedashboards = explode(',', config('sysconfig.metabasedashboard'));
   $metabasequestions = explode(',', config('sysconfig.metabasequestion'));
@endphp

@foreach($metabasedashboards as $metabasedashboard)
    @if(!empty($metabasedashboard))
    <x-metabase dashboard="{{$metabasedashboard}}"></x-metabase>
    @endif
@endforeach
@foreach($metabasequestions as $metabasequestion)
    @if(!empty($metabasequestion))
    <x-metabase question="{{$metabasequestion}}"></x-metabase>
    @endif
@endforeach

{{-- <div class="container-fluid">
    <div class="row">
        <div class="col-xl-6 col-lg-6 col-md-6 col-xs-12">
            <div class="card">
                <div class="card-header pb-1">
                    <h3 class="card-title mb-2">Summery Info</h3>
                </div>
                <div class="card-body">
                    
                    
                    <div class="row">
                        <div class="col-xl-4 col-lg-4 col-md-4 col-xs-12 text-info">
                            <div class="">
                                <h6 class="mb-2 tx-12">Records</h6>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <h4 class="tx-20 font-weight-semibold mb-2">
                                       {{$counter['count']??0}}
                                    </h4>
                                </div>
                               
                            </div>
                        </div>
                        <div class="col-xl-4 col-lg-4 col-md-4 col-xs-12 text-success">
                            <div class="">
                                <h6 class="mb-2 tx-12 ">Active Communes</h6>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <h4 class="tx-20 font-weight-semibold mb-2">
                                        {{$counter['count_distinct']??0}}
                                    </h4>
                                </div>
                                
                            </div>
                        </div>

                        <div class="col-xl-4 col-lg-4 col-md-4 col-xs-12 text-secondary">
                            <div class="">
                                <h6 class="mb-2 tx-12 ">All Communes</h6>
                            </div>
                            <div class="pb-0 mt-0">
                                <div class="d-flex">
                                    <h4 class="tx-20 font-weight-semibold mb-2">
                                        {{$counter['count_commune']??0}}
                                    </h4>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-xl-12 col-lg-12 col-md-12 col-xs-12">
                            <div class="ht-200 ht-sm-300" id="flotPie1"></div>
                        </div>
                    </div>


                </div>
            </div>
            

            
        </div>

       
        <div class="col-xl-6 col-lg-6 col-md-6 col-xs-12">
            <div class="card">
                <div class="card-header pb-1">
                    <h3 class="card-title mb-2">Chart</h3>
                </div>
                <div class="card-body">
                    
                    <div class="morris-wrapper-demo" id="morrisBar3"></div>
                </div>
            </div>
            
            
        </div>
    </div>
</div> --}}
@endsection
