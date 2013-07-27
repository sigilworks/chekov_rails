// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


// CLIENT-SIDE NOTIFICATIONS AND MESSAGING
function flash(type, message) {
	$("<div />", { 'class': 'flash', id: type, html: message })
		.append($("<span />", { 'class': 'X', html: 'X' }))
		.insertBefore($("#app-wrapper"));
}

function noticeMessage(text) { flash('notice', text); }
function alertMessage(text) { flash('alert', text); }
function errorMessage(text) { flash('error', text); }
function successMessage(text) { flash('success', text); }
function infoMessage(text) { flash('info', text); }

// clear all (or those in `sel`) flash messages
function clearMessages(sel) {
	var $sel = sel || $(".flash")
	$sel.slideUp(500, function() { $sel.remove(); });
}