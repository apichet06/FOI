<!-- Modal -->
<div class="modal fade" id="livestream_scanner" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">สแกนบาร์โค้ด</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div id="interactive" class="viewport"></div>
                <div class="error"></div>
            </div>
            <div class="modal-footer">
               <label class="btn btn-default pull-left " > 
                    <i class="fa fa-camera"></i> Use camera app
                    <input type="file" accept="image/*;capture=camera" capture="camera" class="hidden" />
                </label>  
                <button type="button" class="btn btn-primary" data-dismiss="modal">ปิด</button>
            </div>
        </div>
    </div>
</div>