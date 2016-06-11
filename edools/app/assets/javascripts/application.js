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

        var hidden = $("#students_ids");

        $(".add-student").on('click', function() {
            var ids = $("#students_ids").val().split(",").filter(Boolean);
            var id = $(this).attr("data-student-id");

            var index = ids.indexOf(id);

            if (index == -1) ids.push(id);
            else ids.splice(index, 1);

            hidden.val(ids);
        });
    }
});
