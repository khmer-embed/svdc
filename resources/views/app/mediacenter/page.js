$('#f_media').ace_file_input({
    style: 'well',
    btn_choose: 'Drop files here or click to choose',
    btn_change: null,
    no_icon: 'fas fa-upload',
    droppable: true,
    thumbnail: 'small' //small | large | fit
        //,icon_remove:null//set null, to hide remove/reset button
        /**,before_change:function(files, dropped) {
            //Check an example below
            //or examples/file-upload.html
            return true;
        }*/
        /**,before_remove : function() {
            return true;
        }*/
        ,
    preview_error: function(filename, error_code) {
        //name of the file that failed
        //error_code values
        //1 = 'FILE_LOAD_FAILED',
        //2 = 'IMAGE_LOAD_FAILED',
        //3 = 'THUMBNAIL_FAILED'
        //alert(error_code);
    }

}).on('change', function() {
    //console.log($(this).data('ace_input_files'));
    //console.log($(this).data('ace_input_method'));
});

/*
         * Take phote with Webcamjs
         */
$(document).ready(function() {
    $("#btnopencamera").on('click', function() {
        openWebcam();
        $(this).parent().hide();
    });
});

function openWebcam(webcamId = 'cameralive') {
    let webcamw = 279,
        webcamh = 266;
    if (/Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent)) {
        webcamw = 320;
        webcamh = 240;
    }
    Webcam.set({
        width: webcamw,
        height: webcamh,
        dest_width: 1280,
        dest_height: 720,
        image_format: 'jpeg',
        jpeg_quality: 90
    });
    Webcam.attach('#' + webcamId);
    $("#takestopbtncontrol").show();
}

function takeSnapshot() {
    // var baseUrl = "https://www.soundjay.com/mechanical/";
    // new Audio(baseUrl + 'sounds/camera-shutter-click-03.mp3').play();
    Webcam.snap(function(data_uri) {
        var raw_image_data = data_uri.replace(/^data\:image\/\w+\;base64\,/, '');
        document.getElementById('webcam').value = raw_image_data;
    });
    Webcam.freeze();
    $("#resumebtncontrol").show();
    $("#takestopbtncontrol").hide();
}

function resumeSnapshot() {
    //  var baseUrl = "https://www.soundjay.com/button/";
    // new Audio(baseUrl + 'sounds/button-20.mp3').play();
    Webcam.unfreeze();
    document.getElementById('webcam').value = '';
    $("#resumebtncontrol").hide();
    $("#takestopbtncontrol").show();
}

function closeSnapshot() {
    Webcam.reset();
    document.getElementById('cameralive').style = '';
    document.getElementById('webcam').value = '';
    $("#webcam-open-box").show();
    $("#takestopbtncontrol").hide();
    $("#resumebtncontrol").hide();
}