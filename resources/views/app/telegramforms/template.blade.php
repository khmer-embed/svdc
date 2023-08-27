@if (isset($istemplate) && $istemplate)
    <table>
    <tr class='table_row hide' id='record_template'>
@else
    <tr class="table_row">
@endif


<th scope="row" style="vertical-align: top;">
    <input type="text" class="form-control input-sm" name="telegramtitle[]" placeholder="Title" value="{!!$input[$row_index]['c_name']??''!!}">
    <span id="telegramtitle-{{$row_index}}-error" class="error invalid-feedback" style="display: none"></span>
</th>



<td style="vertical-align: top;">
    <input type="number" class="form-control input-sm" name="kobofield[]" placeholder="Kobo Filed" value="{{$input[$row_index]['ordering']??''}}">
</td>


<td style="vertical-align: top;">
    @if (isset($btn_remove) && $btn_remove)
    <button type="button" class="btn_remove btn btn-outline-danger btn-sm button-icon">
        <i class="fe fe-minus"></i>
    </button>
    @endif
</td>
</tr>
@if (isset($istemplate) && $istemplate)
</table>
@endif