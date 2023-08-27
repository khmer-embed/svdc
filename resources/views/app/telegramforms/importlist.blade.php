<table id="dynamic-table" class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th width="55">
                No.
            </th>
            <th>
                @lang('dev.title')<span class="red">*</span>
            </th>

        </tr>
    </thead>

    <tbody>
        @if ($results->count() > 0)
            @php
                $rowcount=1;
            @endphp
            @foreach ($results as $row)

                <tr>
                    <td>
                        {{ $rowcount }}
                    </td>
                    <td>
                        {{ $row['C'] ?? '' }}
                    </td>

                </tr>
                @php
                    $rowcount++;
                @endphp
            @endforeach
        @else
            <tr>
                <td colspan="3" class="red"><strong>@lang('dev.norecord')</strong></td>
            </tr>
        @endif
    </tbody>
</table>
