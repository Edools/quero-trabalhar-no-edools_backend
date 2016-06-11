// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//= require bootstrap-sprockets
//= require paloma

$(document).on('page:load', function() {
    Paloma.start();
});

Paloma.controller('Courses', {
    management: function() {

        //get the hidden that stores the ids of students
        var hidden = $("#students_ids");

        //get the value = "{:value=>[1, 2]}"
        var str = hidden.val();

        //extract only ids
        var ids = str.substring(str.lastIndexOf('[') + 1, str.lastIndexOf(']'));

        //remove spaces
        ids = ids.replace(" ", "");

        //set the hidden value
        hidden.val(ids);

        //convert string with ids to array
        ids = ids.split(",").filter(Boolean);

        //get the add/rmv student buttons
        var buttons = document.getElementsByClassName("add-student");

        for (var i = 0; i < buttons.length; i++){

          //get the data-student-id
          var id = $(buttons[i]).attr("data-student-id");

          //check if the id exists in the ids array
          var index = ids.indexOf(id);

          //if it does
          if (index != -1)
          {
            //change the icon
            var span = $(buttons[i]).find("span");
            $(span).removeClass("glyphicon-plus");
            $(span).addClass("glyphicon-remove");
          }
        }

        $(".add-student").on('click', function() {

            var span = $(this).find("span");

            //get the ids in the hidden and convert to array
            var ids = $("#students_ids").val().split(",").filter(Boolean);

            //get the id of selected student
            var id = $(this).attr("data-student-id");

            //check if the id exists in the ids array
            var index = ids.indexOf(id);

            //if it does
            if (index == -1) {
              //add the id
              ids.push(id);
              
              //change the button icon
              $(span).removeClass("glyphicon-plus");
              $(span).addClass("glyphicon-remove");
            }
            //otherwise
            else {
              //removes the id
              ids.splice(index, 1);

              //change the button icon
              $(span).removeClass("glyphicon-remove");
              $(span).addClass("glyphicon-plus");
            }

            //set the hidden value
            hidden.val(ids);
        });
    }
});
