$(".tab-wizard").steps({headerTag:"h6",bodyTag:"section",transitionEffect:"none",titleTemplate:'<span class="step">#index#</span> #title#',labels:{finish:"Submit"},onFinished:function(b,a){swal("Your Form Submitted!","Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor.")}});var form=$(".validation-wizard").show();$(".validation-wizard").steps({headerTag:"h6",bodyTag:"section",transitionEffect:"none",titleTemplate:'<span class="step">#index#</span> #title#',labels:{finish:"Submit"},onStepChanging:function(b,a,c){return a>c||!(3===c&&Number($("#age-2").val())<18)&&(a<c&&(form.find(".body:eq("+c+") label.error").remove(),form.find(".body:eq("+c+") .error").removeClass("error")),form.validate().settings.ignore=":disabled,:hidden",form.valid())},onFinishing:function(b,a){return form.validate().settings.ignore=":disabled",form.valid()},onFinished:function(b,a){swal("Your Form Submitted!","Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor.")}}),$(".validation-wizard").validate({ignore:"input[type=hidden]",errorClass:"text-danger",successClass:"text-success",highlight:function(a,b){$(a).removeClass(b)},unhighlight:function(a,b){$(a).removeClass(b)},errorPlacement:function(b,a){b.insertAfter(a)},rules:{email:{email:!0}}});