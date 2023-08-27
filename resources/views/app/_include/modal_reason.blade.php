<!-- Basic modal -->
<div class="modal fade" id="modal_reason">
    <div class="modal-dialog" role="document">
        <div class="modal-content modal-content-demo">
            <div class="modal-header">
                <h6 class="modal-title">Reason</h6><button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body">
                <form name="frm-reason" id="frm-reason" method="POST">
                    {{-- please dont delete these default Field --}}
                    @CSRF
                    <div class="row">
                        <div class="col-xs-12 col-sm-12 col-lg-12 form-group">
                            <label class="frm-label" for="tnote">Note<span
                                    class="text-danger">*</span></label>
                            <input class="form-control input-sm" type="text" name="tnote" id="tnote"/>
                            <span id="tnote-error" class="error invalid-feedback">Please enter your reason.</span>

                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button id="reason-submit" class="btn ripple btn-primary formactionbutton" type="button">Confirm</button>
                <button class="btn ripple btn-secondary" data-bs-dismiss="modal" type="button">Cancel</button>
            </div>
        </div>
    </div>
</div>
<!-- End Basic modal -->


<div class="modal fade" id="modal_confirm">
    <div class="modal-dialog" role="document">
        <div class="modal-content tx-size-sm">
            <div class="modal-header">
                <button aria-label="Close" class="btn-close" data-bs-dismiss="modal" type="button"><span aria-hidden="true">&times;</span></button>
            </div>
            <div class="modal-body tx-center pd-y-20 pd-x-20">
                {{-- <i class="icon icon ion-ios-close-circle-outline tx-100 tx-danger lh-1 mg-t-20 d-inline-block"></i> --}}
                <i class="far fa-question-circle tx-50 tx-danger"></i>
                <h5 class="tx-danger mg-b-20">Are you sure?</h5>
                <input type="hidden" id="url-modal-confirm">
                {{-- <p class="mg-b-20 mg-x-20">it will be deleted permanently. You can not undo this action</p> --}}
                <button id="btn-modal-confirm" aria-label="Close" class="btn ripple btn-danger pd-x-25" data-bs-dismiss="modal" type="button">Confirm</button>
            </div>
        </div>
    </div>
</div>