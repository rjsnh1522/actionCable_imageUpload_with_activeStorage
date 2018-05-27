// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require toastr
//= require parsley
//= require_tree .





$(document).ready(function(){
		$(document).on('focusout','#user_email',function(){
			var email = $(this).val();
			var email_valid = validateEmail(email);
			if(email_valid){
				console.log('ss')
				$.ajax({
					url:'/homes/check_user_email',
					method: "POST",
					data:{email:email},
					success:function(data){
						if(data['data'] === true){
							$('.email_error').html("Email is already taken");
							$(".submitReg").attr("disabled",true);
						}else{
							$('.email_error').html("");
							$(".submitReg").attr("disabled",false)
						}
					},
					error:function(){

					}
				})


			}
		});

		function validateEmail(email) {
    var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
    return re.test(String(email).toLowerCase());
		}



var currentTime = new Date();
var utcOffset   = currentTime.getTimezoneOffset();
document.cookie = 'time_zone_offset='+utcOffset+';';


})