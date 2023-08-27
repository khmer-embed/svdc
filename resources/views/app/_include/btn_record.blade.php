<!-- Basic dropdown -->
{{-- <button class="btn btn-sm dropdown-toggle" type="button" data-toggle="dropdown"
aria-haspopup="true" aria-expanded="false"><i class="fa fa-bars"></i>
</button> --}}

<button type="button" class="btn btn-sm btn-outline-primary dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true"
    aria-expanded="false">
    <i class="fa fa-bars"></i>
</button>
<ul class="dropdown-menu" style="">

    @if (isset($print) && $print)
        <li>
            <a class="dropdown-item preview_{{$obj_info['name']}}" data-id="{{ $rowid }}"
                href="#"><i class="fa fa-print me-2" style="color: var(--bs-blue)"></i> @lang('dev.print')</a>
        </li>
    @endif

    @if (isset($edit) && $edit)
        <li>
            <a class="dropdown-item"
                href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'edit', $rowid], []) }}"><i
                    class="fa fa-edit me-2" style="color: var(--bs-cyan)"></i> @lang('dev.edit')</a>
        </li>
    @endif

    @if (isset($clone) && $clone)
        <li>
            <a class="dropdown-item"
                href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'clone', $rowid], []) }}"><i
                    class="fa fa-copy me-2" style="color: var(--bs-teal)"></i> @lang('dev.clone')</a>
        </li>
    @endif

    @if (isset($toinvoice) && $toinvoice)
        <li>
            <a class="dropdown-item"
                href="{{ url_builder($obj_info['routing'], ['invoice', 'convert', $rowid], []) }}"><i
                    class="fas fa-file-invoice-dollar me-2" style="color: var(--bs-cyan)"></i> Create Invoice</a>
        </li>
    @endif

    @if (isset($topurchase) && $topurchase)
    <li>
        <a class="dropdown-item"
            href="{{ url_builder($obj_info['routing'], ['purchase', 'convert', $rowid], []) }}"><i
                class="fas fa-clipboard-check me-2" style="color: var(--bs-cyan)"></i> Create Purchase</a>
    </li>
@endif

@if (isset($toexpense) && $toexpense)
<li>
    <a class="dropdown-item"
        href="{{ url_builder($obj_info['routing'], ['expense', 'convert', $rowid], []) }}"><i
            class="fas fa-money-bill-alt me-2" style="color: var(--bs-cyan)"></i> Create Expense</a>
</li>
@endif

    @if (isset($receivepayment) && $receivepayment)
        <li>
            <a class="dropdown-item receivepayment" data-id="{{$rowid}}"
                href="#"><i
                    class="fas fa-money-check-alt me-2" style="color: var(--bs-green)"></i> Receive Payment</a>
        </li>
    @endif

    @if (isset($paypayment) && $paypayment)
        <li>
            <a class="dropdown-item paypayment" data-id="{{$rowid}}"
                href="#"><i
                    class="fas fa-money-bill-wave me-2" style="color: var(--bs-green)"></i> Pay Payment</a>
        </li>
    @endif

    

    @if (isset($pdf_download) && $pdf_download)
        <li>
            <a class="dropdown-item"
            target="popup"
                href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'preview', $rowid], ['previewtype'=>'pdf']) }}"><i
                    class="fa fa-file-pdf me-2" style="color: var(--bs-cyan)"></i> PDF</a>
        </li>
    @endif

    @if (isset($reject) && $reject)
    
    {{-- <li>
        <a class="btn_reject dropdown-item"
        target="popup"
            href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'reject', $rowid], []) }}"><i
                class="fa fa-thumbs-down me-2" style="color: var(--bs-black)"></i>  @lang('dev.reject')</a>
    </li> --}}

    <li>
        <a class="dropdown-item btn_reject" href="#" data-action="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'reject', $rowid], []) }}">

            <i class="fa fa-thumbs-down me-2" style="color: var(--bs-black)"></i>
            @lang('dev.reject')

        </a>
    </li>
    @endif

    @if (isset($istrash) && $istrash)

        @if (isset($restore) && $restore)
            <li>
                <a class="dropdown-item"
                    href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'restore', $rowid], []) }}">

                    <i class="fas fa-trash-restore me-2" style="color: var(--bs-success)"></i>
                    @lang('dev.restore')

                </a>
            </li>
        @endif

        @if (isset($delete) && $delete)
            <li>
                <a class="dropdown-item"
                    href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'delete', $rowid], []) }}">

                    <i class="fas fa-times-circle me-2" style="color: var(--bs-danger)"></i>
                    @lang('dev.delete')

                </a>
            </li>
        @endif
    @else
        {{-- For Actice Side --}}
        @if (isset($trash) && $trash)
            <li>
                <a class="dropdown-item"
                    href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'totrash', $rowid], []) }}">

                    <i class="fa fa-trash me-2" style="color: var(--bs-yellow)"></i>
                    @lang('dev.trash')

                </a>
            </li>
        @endif

        @if (isset($void) && $void)
            <li>
                <a class="dropdown-item btn_void" href="#" data-action="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'totrash', $rowid], []) }}">

                    <i class="fa fa-ban me-2" style="color: var(--bs-orange)"></i>
                    @lang('dev.void')

                </a>
            </li>
        @endif

        
        {{--  --}}
        @if (isset($remove) && $remove)
            <li>
                <a class="dropdown-item btn_remove" href="#" data-action="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'delete', $rowid], []) }}">
                    <i class="fa fa-times me-2" style="color: var(--bs-red)"></i>
                        @lang('dev.delete')
                </a>
            </li>
        @endif
        {{--  --}}
    @endif

</ul>

{{-- <li>
    <a class="dropdown-item"
        href="{{ url_builder($obj_info['routing'], [$obj_info['name'], 'delete', $rowid], []) }}">
        <i class="fa fa-trash me-2" style="color: var(--bs-red)"></i>
            Remove
    </a>
</li> --}}
