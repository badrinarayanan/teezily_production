$(document).ready(function(){


    var campaign = {

        result: function(response){

            $("#submit_campaign").button("reset");


            if(response.status == "01"){

               $("#create_campaign").trigger("reset");
                alert("Your campaign has been Queued");
            }else{

                alert("Error !!!");
            }


        }
    };


  $(".submenu > a").click(function(e) {
    e.preventDefault();
    var $li = $(this).parent("li");
    var $ul = $(this).next("ul");

    if($li.hasClass("open")) {
      $ul.slideUp(350);
      $li.removeClass("open");
    } else {
      $(".nav > li > ul").slideUp(350);
      $(".nav > li").removeClass("open");
      $ul.slideDown(350);
      $li.addClass("open");
    }
  });


  $(document.body).on("change","#select-id",function(){

      id = $(this).val();

      $("#select-color").find("option").addClass("hide");
      $("#select-color").find("option[data-id='"+id+"']").removeClass("hide");

  });

  $(document.body).on("click","#submit_campaign",function(){

      var is_valid = 1;
      var $this = $(this);

      $("*[data-element='element']").each(function(){



          if($(this).val() == "" && $(this).attr("type") != undefined ) {

              is_valid = 0;

          }


      });

      if(is_valid == 1){

          $this.button('loading');
          formobject = new FormData();

          formobject.append("details",$("#create_campaign").serialize());

          ajaxRequest("/uploadcampaign",formobject,campaign.result);


      }else{
            console.log(is_valid);
          alert("All fields are required");
      }



  });



  
});