// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function () {
    var faye = new Faye.Client('http://localhost:9292/faye');

    faye.subscribe('/messages/new', function (data) {
        console.log(data);
        if (data.object.type == 'pirate') {
            $("#chat").append('<div class="alert alert-success" role="alert"> <span class="pirate"></span>' +
            data.object.time + ": " + data.object.author + " > " + '<p>' + data.object.message +'</p>' + '</div>')
        } else if (data.object.type == 'yoda') {
            $("#chat").append('<div class="alert alert-success" role="alert"> <span class="yoda"></span>' +
            data.object.time + ": " + data.object.author + " > " + '<p>' + data.object.message +'</p>' + '</div>')
        } else if (data.object.type == 'binary') {
            $("#chat").append('<div class="alert alert-success" role="alert"><span class="binary"></span>' +
            data.object.time + ": " + data.object.author + " > " +'<p>' + data.object.message +'</p>' + '</div>')
        } else if (data.object.type == 'valley') {
            $("#chat").append('<div class="alert alert-success" role="alert"><span class="valley"></span>' +
            data.object.time + ": " + data.object.author + " > "+ '<p>' + data.object.message +'</p>' + '</div>')
        }

    });
});