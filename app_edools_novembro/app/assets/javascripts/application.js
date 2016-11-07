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
//= require maskedinput
//= require bootstrap-sprockets
//= require jquery_ujs
//= require_tree .

jQuery(function($){
   $("#cpf_aluno").mask("999.999.999-99");
   $("#telefone_aluno").mask("(99)9999-99999");
});
