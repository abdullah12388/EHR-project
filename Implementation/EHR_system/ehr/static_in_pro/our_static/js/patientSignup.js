
var warn = $("#warn");
var submit = $("#id_signup_submit");
var email_ = $("#id_email");
var re_pass = $("#re_pass");

email_.keyup(function () {
   var email = $(this).val();
   $.ajax({
       url: "/ajax/validate_email/",
       data: {
           'email' : email
       },
       dataType: 'json',
       success: function (data) {
           if (data.is_taken) {
               //alert('This email is already used');
               console.log("found");
			    warn.addClass("show");
			    warn.removeClass("hide");
			    submit.attr("type", "button");
           } else {
			   console.log("not found");
			    warn.addClass("hide");
			    warn.removeClass("show");
			    submit.attr("type", "submit");
		   }
       }
   });
});

re_pass.keyup(function () {
   var email = email_.val();
   $.ajax({
       url: "/ajax/validate_email/",
       data: {
           'email' : email
       },
       dataType: 'json',
       success: function (data) {
           if (data.is_taken) {
               //alert('This email is already used');
               console.log("found");
			    warn.addClass("show");
			    warn.removeClass("hide");
			    submit.attr("type", "button");
           } else {
			   console.log("not found");
			    warn.addClass("hide");
			    warn.removeClass("show");
			    submit.attr("type", "submit");
		   }
       }
   });
});