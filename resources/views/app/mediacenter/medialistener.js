export class MediaForListingModel {
    constructor() {
        this.items = [];
    }
}

export class MediaForListingView {
    constructor() {
        this.container = '';
    }

    clearList = () => {
        $("#" + this.container).html('');
    }
    // 
    render = (model) => {
        this.clearList();
        if (model.items.length != 0) {
            let list = $("#" + this.container);

            //for (var i = model.items.length - 1; i >= 0; i--) {
            for (var i = 0; i < model.items.length; i++) {
                // console.log(model.items[i].text)
                // let item = `<div class='mediacenter_object'>
                //             <h1>${model.items[i].text} - ${i}</h1>
                //             <button type='button' id='${i}' class='delete'>Delete</button>
                //             </div>`;
                if(model.items[i].id>-1){
                    let border= '';
                    if(model.items[i].as_cover==true){
                        border = 'border:2px solid green;';
                    }

                    let item = ` <div class="file-image-1 mediacenter_object" style="margin:10px; ${border}">
                                    <div class="product-image">
                                        <a href="file-details.html">
                                            <img src="${model.items[i].filepath}" class="br-5" alt="" style="object-fit: scale-down;">
                                        </a>
                                        <ul class="icons">
                                            <li><a href="javascript:void(0);" class="btn bg-danger delete" id='${i}'><i class="fe fe-trash"></i></a></li>
                                        </ul>
                                    </div>
                                
                                </div>`;
                                // <li><a href="javascript:void(0);" class="btn bg-secondary"><i class="fe fe-download"></i></a></li>
                                // <li><a href="javascript:void(0);" class="btn bg-primary"><i class="fe fe-eye"></i></a></li>
                    list.append(item);
                }
            }
        }
    }
    // 

    bindDeleteItem(handler) {
        // this.todoList.addEventListener('click', event => {
        // if (event.target.className === 'delete') {
        //     const id = parseInt(event.target.parentElement.id)

        //     handler(id)
        // }
        // })

        $(document).on("click", ".mediacenter_object .delete", function () {
            handler($(this).attr('id'));
        });
    }
    // 
}

export class MediaForListingController {
    constructor(model, view) {
        this.model = model
        this.view = view
        this.view.bindDeleteItem(this.deleteItem)
    }

    init = (container) => {
        this.view.container = container;
        this.view.render(this.model)
    }
    // 
    addItem = (item) => {
        let $as_cover = false;
        if(this.model.items.length==0){
            $as_cover = true;
        }
        let list_item = {
            id: 0,
            // obj_id: 0,
            filecategory_id:0,
            file_name: item.data('filename'),
            filepath: item.data('filepath'),
            f_type:'',
            fwidth:0,
            fheight:0,
            scr_name:'',
            as_cover: $as_cover,
            as_bg:false,
            title:'',
            ordering:0,
            piccolor:'',
            tag:'',
            blongto:0
           
            
        }
        this.model.items.push(list_item)
        //console.log(list_item)
        //document.getElementById("add-item").value = ""
        this.view.render(this.model)
    }
    // 

    deleteItem = (item_index) => {
        const firstToCover = this.model.items[item_index]['as_cover'];
        const id = this.model.items[item_index].id;
        if(id>0){
            this.model.items[item_index].id = id * -1;
        }
        else{
            this.model.items.splice(item_index, 1);
        }
       
        if(firstToCover==true && this.model.items.length>1){
            this.model.items[item_index].as_cover = false;
            for (var i = 0; i < this.model.items.length; i++) {
                if(this.model.items[i].id>-1){
                    this.model.items[i].as_cover = true;
                    break;
                }
            }
        }
        
        this.view.render(this.model)
    }
    //
    getDataAsString = () => {
        return helper.sanitizeHTML(JSON.stringify(this.model.items)); 
    }
    //

}
/////
export class MediaForTextboxController {
    constructor(mediaRoute, container) {
        this.mediaRoute = mediaRoute;
        this.container = container;
        this.browser = ".mediabrowser";
        this.textbox = ".mediastore";

        this.textboxController = null;
        this.browserController = null;

        this.init();
    }

    init = () => {
        let that = this;
        $(document).ready(function () {
            $(that.textbox).each(function (index, obj) {
                const browser = $(this).next(that.browser);
                if ($(this).val().length > 0) {
                    browser.addClass('hide');
                    browser.next(".mediaremove").removeClass('hide');
                }
            });
        });
        $(document).on("click", this.browser, function () {
            that.browserController = $(this);
            that.textboxController = $(this).prev(that.textbox);
            helper.silentHandler(
                that.mediaRoute,
                null, {
                onclicklistener: that.container
            }, {}, {
                modal: 'modal_media',
                show: true,
                size: 'modal-xl'
            },
                'air_media',
                ''
            );
        });

        $(document).on("click", "." + this.container + " .mediaitem", function () {
            that.browserController.addClass('hide');
            that.browserController.next(".mediaremove").removeClass('hide');
            that.textboxController.val($(this).data('filename'));
        });

        $(document).on("click", ".mediaremove", function () {
            $(this).addClass('hide');
            const browser = $(this).prev(that.browser);
            browser.removeClass('hide');
            browser.prev(that.textbox).val('');
            //that.textboxController.val('');
        });

    }
}