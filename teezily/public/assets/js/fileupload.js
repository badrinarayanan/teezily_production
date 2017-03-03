
var fileupload = {

    uploadcomplete : function(response){

        $("#submit_image").button("reset");


        if(response.status == "01"){

            $("#image_name").val('');
            $("#upload_image").val('');
            alert("Image uploaded successfully");
        }else{

            alert("Error !!!");
        }



    }

};





$(document.body).on("click","#submit_image",function(){

    if($("#image_name").val() != "" && $("#upload_image").val() != ""){

        imageFile = $("#upload_image")[0].files[0];
        var $this = $(this);
        $this.button('loading');
        formobject = new FormData();
        formobject.append("imagefile",imageFile);
        formobject.append("filename",$("#image_name").val());
        ajaxRequest('/postimage',formobject,fileupload.uploadcomplete)

    }



});