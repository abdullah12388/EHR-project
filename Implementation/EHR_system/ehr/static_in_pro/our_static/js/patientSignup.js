
var warn = $("#warn");
// var warn = document.getElementById('warn');
var warn2 = $("#warn2");
var submit = $("#id_signup_submit");
var email_ = $("#id_email");
var pass = $("#pass");
var re_pass = $("#re_pass");
var signPassword, signEmail = false;

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
			    // submit.attr("type", "button");
			    signEmail = false;
                    if (signEmail === true || signPassword === false) {
			            submit.attr("type", "button");
                    } else if (signEmail === false || signPassword === true) {
                        submit.attr("type", "button");
                    } else if (signEmail === false || signPassword === false) {
                        submit.attr("type", "button");
                    } else {
                        submit.attr("type", "button");
                    }
           } else {
			   console.log("not found");
			   warn.addClass("hide");
			   warn.removeClass("show");
			   signEmail = true;
			   if (signEmail === true && signPassword === true) {
			       console.log("true");
			       submit.attr("type", "submit");
			   }
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
			    // submit.attr("type", "button");
			    signEmail = false;
                    if (signEmail === true || signPassword === false) {
			            submit.attr("type", "button");
                    } else if (signEmail === false || signPassword === true) {
                        submit.attr("type", "button");
                    } else if (signEmail === false || signPassword === false) {
                        submit.attr("type", "button");
                    } else {
                        submit.attr("type", "button");
                    }
           } else {
			   console.log("not found");
			   warn.addClass("hide");
			   warn.removeClass("show");
			   signEmail = true;
			   if (signEmail === true && signPassword === true) {
			       console.log("true");
			       submit.attr("type", "submit");
			   }
           }
       }
   });
});

re_pass.keyup(function () {
   var email = email_.val();
});

pass.keyup(function () {
    if (re_pass.val() !== "") {
        if (re_pass.val() === pass.val()) {
            warn2.addClass("hide");
            warn2.removeClass("show");
            signPassword = true;
            if (signEmail === true && signPassword === true) {
                console.log("true");
			    submit.attr("type", "submit");
            }
        } else {
            warn2.addClass("show");
            warn2.removeClass("hide");
            signPassword = false;
            if (signEmail === true || signPassword === false) {
			    submit.attr("type", "button");
            } else if (signEmail === false || signPassword === true) {
			    submit.attr("type", "button");
            } else if (signEmail === false || signPassword === false) {
			    submit.attr("type", "button");
            } else {
			    submit.attr("type", "button");
            }
        }
    }
});
// Password
re_pass.keyup(function () {
    if (re_pass.val() === pass.val()) {
        warn2.addClass("hide");
        warn2.removeClass("show");
        signPassword = true;
        if (signEmail === true && signPassword === true) {
            console.log("true");
            submit.attr("type", "submit");
        }
    } else {
        warn2.addClass("show");
        warn2.removeClass("hide");
        signPassword = false;
        if (signEmail === true || signPassword === false) {
            submit.attr("type", "button");
        } else if (signEmail === false || signPassword === true) {
            submit.attr("type", "button");
        } else if (signEmail === false || signPassword === false) {
            submit.attr("type", "button");
        } else {
            submit.attr("type", "button");
        }
    }
});