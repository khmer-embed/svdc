@php
    $extends = 'app';
    $action_btn = ['saveoption' => ['new' => true, 'edit' => true], 'save' => false, 'cancel' => true];
    // dd($isupdate);
@endphp
@if (is_axios())
    @php
        $extends = 'axios';
        $action_btn = ['saveoption' => false, 'save' => true, 'cancel' => false];
    @endphp
@endif

@extends('layouts.' . $extends)



@section('blade_scripts')
    <script>
        $(document).ready(function() {
            let route_submit = "{{ $route['submit'] }}";
            let route_cancel = "{{ $route['cancel'] ?? '' }}";
            $(".btnsaveoption_{{ $obj_info['name'] }}").click(function(e) {
                e.preventDefault();
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
                let setting = {};
                const savetype = $(this).data('savetype');
                const formname = "#frm-{{ $obj_info['name'] }}";

                $(formname + " .error").html('').hide();
                $(formname).append('<input type="hidden" name="savetype" value="' + savetype + '" /> ');
                extraFrm = {
                    formname: formname,
                    isupdate: "{{ $isupdate ?? false }}"
                };
                helper.silentHandler(
                    "{{ url_builder('admin.controller', [$obj_info['name'], 'validation', ''], []) }}",
                    "frm-{{ $obj_info['name'] }}", extraFrm, setting,
                    popModal, container,
                    loading_indicator);

            });
            $(".btnsave_{{ $obj_info['name'] }}").click(function(e) {
                e.preventDefault();
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
                let setting = {};
                $("#frm-{{ $obj_info['name'] }} .error").html('').hide();
                helper.silentHandler(route_submit, "frm-{{ $obj_info['name'] }}", extraFrm, setting,
                    popModal, container,
                    loading_indicator);

            });

            $(".btncancel_{{ $obj_info['name'] }}").click(function(e) {
                //window.location.replace(route_cancel);
                window.location = route_cancel;
            });

            $('.togglepassword').on('click', function() {
                helper.togglePassword($(this));
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

        $(document).on("click", ".userphoto .mediaitem", function() {
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
                                <label for="name">Full Name</label>
                                <input type="text" class="form-control" name="fullname" id="fullname"
                                    placeholder="Enter fullname" value="{{ $input['fullname'] ?? '' }}">
                                <span id="fullname-error" class="error invalid-feedback" style="display: none"></span>
                            </div>
                            <div class="form-group">
                                <label for="name">User Name</label>
                                <input type="text" class="form-control" name="name" id="name"
                                    placeholder="Enter name" value="{{ $input['name'] ?? '' }}">
                                <span id="name-error" class="error invalid-feedback" style="display: none"></span>
                            </div>

                            <div class="form-group">
                                <label for="email">Email address</label>
                                <input type="email" class="form-control" name="email" id="email"
                                    placeholder="Enter email" value="{{ $input['email'] ?? '' }}">
                                <span id="email-error" class="error invalid-feedback" style="display: none"></span>
                            </div>

                            <div class="form-group">
                                <label for="email">Phone Number</label>
                                <input type="phonenumber" class="form-control" name="phonenumber" id="phonenumber"
                                    placeholder="Enter phone number" value="{{ $input['phonenumber'] ?? '' }}">
                                <span id="phonenumber-error" class="error invalid-feedback" style="display: none"></span>
                            </div>

                            <div class="form-group">
                                <label for="permission_id">Province</label>
                                
                                <select class="form-control form-select input-sm province_id" name="province_id"
                                    id="province_id">
                                    <option value="">-- {{ __('dev.noneselected') }}--</option>
                                    {!! cmb_listing($default['provinces'], [$input['province_id'] ?? ''], '', '') !!}
                                </select>
                                
                                
                            </div>


                            @php
                                if(is_topadmin($input['blongto']??-1, $input['permission_id']??-1) && $isupdate){
                                    $default['permission'] = [];
                                }
                                $default['permission'][1] = 'Top Admin';
                            @endphp
                            <div class="form-group">
                                <label for="permission_id">Permission</label>
                                
                                <select class="form-control form-select input-sm permission_id" name="permission_id"
                                    id="permission_id">
                                    <option value="">-- {{ __('dev.noneselected') }}--</option>
                                    {!! cmb_listing($default['permission'], [$input['permission_id'] ?? ''], '', '') !!}
                                </select>
                                <span id="permission_id-error" class="error invalid-feedback" style="display: none"></span>
                                
                            </div>

                           

                            @if (!$isupdate)
                                <div class="form-group">
                                    <label for="password">Password</label>
                                    <div class="pos-relative">
                                        <input type="password" class="form-control" name="password" id="password"
                                            placeholder="Enter password" autocomplete="off">
                                        <span class="form-control-feedback togglepassword"><i
                                                class="fas fa-eye"></i></span>
                                    </div>
                                    <span id="password-error" class="error invalid-feedback"
                                        style="display: none"></span>
                                </div>

                                <div class="form-group">
                                    <label for="password_confirmation">Conifirmed Password</label>
                                    <div class="pos-relative">
                                        <input type="password" class="form-control" name="password_confirmation"
                                            id="password_confirmation" placeholder="Enter cofirm password"
                                            autocomplete="off">
                                        <span class="form-control-feedback togglepassword"><i
                                                class="fas fa-eye"></i></span>
                                    </div>
                                    <span id="password_confirmation-error" class="error invalid-feedback"
                                        style="display: none"></span>
                                </div>
                            @endif

                            @if(!is_topadmin($input['blongto']??-1, $input['permission_id']??-1))
                            
                            <div class="form-group">
                                <label for="password_confirmation">Status</label>
                                <br>
                                {!! check_select('userstatus', ['Enable' => 'yes', 'Disable' => 'no'], $input['userstatus'] ?? '', '') !!}
                            </div>
                            @endif

                        </div>
                        <!-- /.card-body -->
                    </div>
                    {{--  --}}
                </div>
            </div>




        </form>
        {{-- End From --}}
    </div>
@endsection
