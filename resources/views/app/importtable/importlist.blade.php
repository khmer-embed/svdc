<table id="dynamic-table" class="table table-striped table-bordered table-hover">
    <thead>
        <tr>
            <th width="55">
                @lang('dev.id')
            </th>
            <th>
                @lang('dev.title')<span class="red">*</span>
            </th>

        </tr>
    </thead>

    <tbody>
        @if ($results->count() > 0)
            @foreach ($results as $row)
                <tr>
                    <td>
                        {{ $row['A'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['B'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['C'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['D'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['E'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['F'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['G'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['H'] ?? '' }}
                    </td>
                    <td>
                        {{ $row['I'] ?? '' }}
                    </td>

                </tr>
            @endforeach
        @else
            <tr>
                <td colspan="3" class="red"><strong>@lang('dev.norecord')</strong></td>
            </tr>
        @endif
    </tbody>
</table>
