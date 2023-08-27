@php
    $extends = 'app';
    $action_btn = ['save' => true, 'cancel' => true];
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['save' => true, 'cancel' => false];
    @endphp
@endif

@extends('layouts.' . $extends)



@section('blade_scripts')
    <script>
        $(document).ready(function() {
            let route_submit = "{{ $route['submit'] }}";
            let route_cancel = "{{ $route['cancel'] ?? '' }}";
            let frm, extraFrm;
            let popModal = {
                show: false,
                size: 'modal-lg'
                //modal-sm
                //modal-lg
                //modal-xl
            };
            let container = '';
            let loading_indicator = '';
            let setting = {
                mode: "{{ $extends }}"
            };
            let aftersave = (data) => {
                // $('.kobo_endpoint').removeClass('hide');
                // let token = "{{ $token }}";
                // let endpoint = "https://dcx1.dcxresearch.com/api/dcx1/endpoint/api_store";
                // let tbl = $('#table_name').val();
                // let textarea = $('#kobo_endpoint');
                // let input_token = $('#token').val("Bearer" + " " + token);
                // let val = endpoint + "?kobo=" + tbl;
                // textarea.text(val);
                setTimeout(() => {

                    window.location = route_cancel;
                }, 1000);
            };
            $(".btnsave_{{ $obj_info['name'] }}").click(function(e) {
                let setting = {
                    mode: "",
                    // or use jscallback = formreset
                    fnSuccess: aftersave,
                };
                e.preventDefault();

                $("#frm-{{ $obj_info['name'] }} .error").html('').hide();
                helper.silentHandler(route_submit, "frm-{{ $obj_info['name'] }}", extraFrm, setting,
                    popModal, container,
                    loading_indicator);

            });

            $(".btncancel_{{ $obj_info['name'] }}").click(function(e) {
                //window.location.replace(route_cancel);
                window.location = route_cancel;
            });


            $("#email").click(function(e) {

                helper.silentHandler(
                    "{{ url_builder('admin.controller', ['mediacenter', 'index', ''], []) }}",
                    null, {
                        onclicklistener: "userphoto"
                    }, {}, {
                        modal: 'modal_media',
                        show: true,
                        size: 'modal-xl'
                    },
                    'air_media',
                    ''
                );

                $('.modal-dialog,.modal-content').css("min-height", "90vh");
            });
        });
    </script>
    <script>
        model = {
            items: []
        }

        view = {
            container: "",
            clearList: function() {
                $("#" + this.container).html('');
            },

            render: function() {

                this.clearList();

                if (model.items.length != 0) {
                    list = $("#" + this.container);

                    //for (var i = model.items.length - 1; i >= 0; i--) {
                    for (var i = 0; i < model.items.length; i++) {
                        console.log(model.items[i].text)
                        let item = `<div onclick="controller.deleteItem(${i})">
                                    <h1>${model.items[i].text}</h1>
                                    </div>`;
                        list.append(item);
                    }
                }
            },

            addItem: function(item) {
                //alert('start');
                controller.addItem(item);
                return true;
            },
        }

        controller = {
            init: function(container) {
                view.container = container;
                view.render()
            },

            addItem: function(item) {
                list_item = {
                    text: item,
                    completed: false
                }
                model.items.push(list_item)
                //console.log(list_item)
                //document.getElementById("add-item").value = ""
                view.render()
            },

            completeItem: function(item_index) {
                model.items[item_index].completed = !model.items[item_index].completed
                console.log(model.items[item_index].completed)
                view.render()
            },

            deleteItem: function(item_index) {
                model.items.splice(item_index, 1)
                view.render()
            }
        }



        //controller.init("mediaapp")
        // $(document).on("click", ".userphoto", function() {
        //     //alert($(this).html());
        //     var status = view.addItem($(this).data('filename'));
        // });

        //clss

        class Model {
            constructor() {
                this.items = [];
            }
        }

        class View {
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
                        console.log(model.items[i].text)
                        let item = `<div class='mediacenter_object'>
                                    <h1>${model.items[i].text} - ${i}</h1>
                                    <button type='button' id='${i}' class='delete'>Delete</button>
                                    </div>`;
                        list.append(item);
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

                $(document).on("click", ".mediacenter_object > .delete", function() {
                    alert($(this).attr('id'));
                    handler($(this).attr('id'));
                });
            }
            // 
        }

        class Controller {
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
                let list_item = {
                    text: item,
                    completed: false
                }
                this.model.items.push(list_item)
                //console.log(list_item)
                //document.getElementById("add-item").value = ""
                this.view.render(this.model)
            }
            // 

            deleteItem = (item_index) => {
                this.model.items.splice(item_index, 1)
                this.view.render(this.model)
            }
            //

        }

        const app = new Controller(new Model(), new View())
        app.init("mediaapp");

        $(document).on("click", ".userphoto", function() {
            app.addItem($(this).data('filename'));
        });
    </script>
@endsection

@section('content')
    {{-- Header --}}
    <section class="content-header sticky-top ct-bar-action ct-bar-action-shaddow">
        <div class="container-fluid">
            <div class="row mb-2">
                <div class="col-sm-6">

                    <h5 class="mb-2">
                        {!! $obj_info['icon'] !!}
                        <a href="{{ url_builder($obj_info['routing'], [$obj_info['name']]) }}"
                            class="btn btn-link text-md pd-5">{{ $obj_info['title'] }}</a>
                        <small class="text-sm">
                            <i class="ace-icon fa fa-angle-double-right text-xs"></i>
                            {{ $caption ?? '' }}
                        </small>
                    </h5>



                </div>
                <div class="col-sm-6 text-right">
                    @include('app._include.btn_create', $action_btn)
                </div>
            </div>
        </div>
    </section>
    {{-- end header --}}
    <div class="container-fluid">
        {{-- Start Form --}}
        <form name="frm-{{ $obj_info['name'] }}" id="frm-{{ $obj_info['name'] }}" method="POST"
            action="{{ $route['submit'] }}">
            {{-- please dont delete these default Field --}}
            @CSRF
            <input type="hidden" name="{{ $fprimarykey }}" id="{{ $fprimarykey }}"
                value="{{ $input[$fprimarykey] ?? '' }}">
            <input type="hidden" name="jscallback" value="{{ $jscallback ?? (request()->get('jscallback') ?? '') }}">
            {{--  --}}
            <div class="row">
                <div class="col-sm-6 offset-sm-3">
                    <div class="card card-default color-palette-box">

                        <div class="card-body">
                            <div class="form-group">
                                <label for="name">Table Name</label>
                                <input type="text" class="form-control" name="table_name" id="table_name"
                                    placeholder="Enter Table Name" value="{{ $input['table_name'] ?? '' }}">
                                <span id="fullname-error" class="error invalid-feedback" style="display: none"></span>
                            </div>
                            <div class="form-group hide kobo_endpoint">
                                <label for="name">Kobo endpoint</label>
                                <textarea name="" id="kobo_endpoint" cols="10" rows="2" class="form-control">

                               </textarea>

                            </div>
                            <div class="form-group hide kobo_endpoint">
                                <label for="name">Token</label>
                                <input type="text" name="" id="token" class="form-control">
                            </div>



                        </div>
                        <!-- /.card-body -->
                    </div>
                    {{--  --}}
                </div>
            </div>




        </form>
        {{-- End From --}}
    </div>

    <div id="mediaapp" style="float: left; width:100%; border:1px solid rgb(255, 255, 255)">

    </div>
@endsection
