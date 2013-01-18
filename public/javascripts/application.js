function notification(){
    var contenedor = $('.Account');
    //<section class="glow-box"></section>
    $('.glow-box').remove();
    $('#messanges').html('MESSAGES(0)');

    $.ajax({
        type: "GET",
        url: "/notification",
        //dataType: "json",
        success: function(data){
            if(data.length > 0){
                $('.Account').prepend('<section class="glow-box"></section>');
                $('#messanges').html('MESSAGES('+ data.length +')');
            }

        }
    });
}
$(function() {


    $('.button-invitation').click(function(){
        var email = $('#email').val();

        $.ajax({
            type: "GET",
            url: "/add_invitation/"+$('#stage_id').val()+"/"+email,
            //dataType: "json",
            success: function(data){
                $('.list_invitation ul').append('<li>' + email + '</li>');
                $('#email').val('');
            }
        });



    });


    var options = $('#stage_language_content').find('option');
    $('#stage_language_content').html('');
    options.each(function(k, v){
        if(k == 6){
            $('#stage_language_content').append('<optgroup label="----------------------"></optgroup>')
        }
        $('#stage_language_content').append(options[k]);
    });




    $('.slide-home').cycle('fade');
    $('.profile .preview').click(function(){
        window.location.href = '/accounts_settings#create_your_character';
        return false;
    });

    $("#slider").slider({
        value : 50,
        change: function(event, ui){
            //modvolumen
            var flashObj = $('#imgb');
            flashObj[0].modvolumen(parseInt(ui.value)/100);
            $('.ico-volumen').attr('rel', ui.value)
        }
    });

    $('.ico-volumen').click(function(){
        var clases = $('.ico-volumen').attr('class').split(' ');
        var flashObj = $('#imgb');
        if(clases.length == 1){
            $(this).addClass('mute');
            flashObj[0].modvolumen(0);
        }else{
            $(this).removeClass('mute');
            flashObj[0].modvolumen(parseInt($(this).attr('rel'))/100);
        }

    });
    $('.img-frame').hover(function(){
        $('.avatar-hover').css('visibility','visible');
        $('.back-avatar-hover').css('visibility','visible');

    }, function(){
        if($('.avatar-hover').is(':hover')){

        }else{
            $('.back-avatar-hover').css('visibility','hidden');
            $('.avatar-hover').css('visibility','hidden');
        }
    });

    $('.register-submit').click(function(){

        if($('.check-condition').attr('checked') != 'checked'){
            alert('Read the terms & conditions');
            return false;
        }

    });


    $('.perfomer').click(function(){
         var title  = $(this).attr('title');

         if(title == 'Follow performer'){
             $(this).attr('title', 'unFollow performer');
             $(this).html('unFollow performer');

             $.ajax({
                 type: "GET",
                 url: "/follow/" + $(this).attr('rel'),
                 dataType: "json"
             }).done(function( msg ) {
                 //alert( msg );
             });

         }else if(title == 'unFollow performer'){
             $(this).attr('title', 'Follow performer');
             $(this).html('Follow performer');

             $.ajax({
                 type: "GET",
                 url: "/unfollow/" + $(this).attr('rel'),
                 dataType: "json"
             }).done(function( msg ) {
                 //alert( msg );
             });
         }

        if($(this).html() == 'follow'){
            $(this).html('unfollow');
            $.ajax({
                type: "GET",
                url: "/follow/" + $(this).attr('title'),
                dataType: "json"
            }).done(function( msg ) {
                    //alert( msg );
                });
        }else if($(this).html() == 'unfollow'){
            $(this).html('follow');
            $.ajax({
                type: "GET",
                url: "/unfollow/" + $(this).attr('title'),
                dataType: "json"
            }).done(function( msg ) {
                    //alert( msg );
                });
        }

         return false;
    });

    setTimeout(function() {
        $('#user_information .warning').fadeOut();
    }, 4000);

    $('.thumb').css({ scale: [0.5] });
    $('.thumb').show();
    $('.img_sn').click(function(){
        window.location.href = $(this).prev().attr('href');
    });
    $('.thumb').hover(function(){
        $('.avatar-hover').css('visibility','visible');
        $('.back-avatar-hover').css('visibility','visible');
    },function(){
      //  $('.back-avatar-hover').css('visibility','hidden');
      //  $('.avatar-hover').css('visibility','hidden');
    });
    $('.avatar-hover').hover(function(){
        $('.back-avatar-hover').css('visibility','visible');
        $('.avatar-hover').css('visibility','visible');
    },function(){
        $('.back-avatar-hover').css('visibility','hidden');
        $('.avatar-hover').css('visibility','hidden');
    });


    var widthCostado = (($('body').width() - 1024)/2);
    $('.shadown-top').css('width','1024px' );
    $('.shadown-left').css('width', widthCostado+'px' );
    $('.shadown-right').css('width', widthCostado+'px' );
    $('.shadown-right').css('left', (widthCostado +  1024)+'px' );

    $(window).resize(function(){

        var wb = (($('body').width() - 1024)/2);
        $('.shadown-left').css('width', wb+'px' );
        $('.shadown-top').css('width', '1024px' );
        $('.shadown-right').css('width', wb+'px' );
        $('.shadown-right').css('left', (wb +  1024)+'px' );
    });


    $('.turn-light').click(function(){
        $('.shadown-top').css('visibility','visible' );
        $('.shadown-left').css('visibility','visible' );
        $('.shadown-right').css('visibility','visible' );
        $('.shadown-layer').css('visibility','visible' );
        $('.shadown-bottom').css('visibility','visible' );

        return false;
    });





	//$("a.watch").colorbox({close:'X',html: '<iframe src="http://player.vimeo.com/video/47028824" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>'});
    $("a.watch").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#heckle").colorbox({iframe:true, innerWidth:500, innerHeight:444,close:'X'});
    $("#tips").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#report").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#changeImage").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#messanges").colorbox({iframe:true, innerWidth:500, innerHeight:370,close:'X'});
    $("#share_url").colorbox({iframe:true, innerWidth:500, innerHeight:370,close:'X'});
    $("#configuration").colorbox({iframe:true, innerWidth:500, innerHeight:390,close:'X'});
    $("#tippers").colorbox({iframe:true, innerWidth:500, innerHeight:390,close:'X'});
    $(".cashout").colorbox({iframe:true, innerWidth:500, innerHeight:390,close:'X'});
    $(".modaltc").colorbox({iframe:true, innerWidth:500, innerHeight:390,close:'X'});


    $('#closeStage').click(function(){
        if(confirm('Are you sure you want to close your stage. There are '+ $('#countUser').html()+' online viewers in the audience.')){
            window.location.href = '/close/'+ $(this).attr('href').split('#')[1];
        }
        return false
    });

});

$(document).ready(function() {
    if(!FlashDetect.installed){
        $('.alerts').append('<div class="warning flash_error"><a class="close" href="#">X</a><p>Flash Player is required to enjoy this site. <a href="http://get.adobe.com/es/flashplayer/">Please install Flash Player</a></p></div>');
    }

    if(FlashDetect.majorAtLeast(12)){
        $('.alerts').append('<div class="warning flash_error"><a class="close" href="#">X</a><p>You are going to need the latest version of Flash for a better experience. You can download it <a href="http://get.adobe.com/es/flashplayer/">here</a></p></div>');
    }

    if (Modernizr.borderradius === false){
        $('.alerts').append('<div class="warning flash_error"><a class="close" href="#">X</a><p>The browser you are using is a bit old. For a better experience we recommend you download the latest version of <a href="http://www.google.com/intl/es/chrome/">Chrome</a> or <a href="http://www.mozilla.org/en-US/firefox/new/">Firefox</a>.</p></div>');
    }


    $("#makeStage").validate();
    var countHead = 45, countJacket = 33, countLegs = 22, countFeet = 3, countEyes = 11, countNose = 11, countMouth = 10 ;

    $('a.close').click(function(){
       $(this).parent().fadeOut();
        return false;
    });

    $('.slide1 .right').click(function(){
        var _d = $.trim($(this).parent().find('div').attr('class').replace('avatar','').replace('box-avatar','')).split('-');


        switch(_d[1]){
            case 'head':

                if(_d[2] < countHead){

                   if(_d[2] == 42 || _d[2] == 43 || _d[2] == 44){
                       $('.tabnav2 li').eq(1).hide();
                   }else{
                       $('.tabnav2 li').eq(1).show();
                   }

                   $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);

                }
                break;

            case 'jacket':
                if(_d[2] < countJacket){
                    $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
                }
                break
            case 'legs':
                if(_d[2] < countLegs){
                    $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
                }
                break
            case 'feet':
                if(_d[2] < countFeet){
                    $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
                }
                break
            case 'eyes':
                if(_d[2] < countEyes){
                    $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
                }
                break
            case 'nose':
                if(_d[2] < countNose){
                    $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
                }
                break
            case 'mouth':
                if(_d[2] < countMouth){
                    $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])+1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
                }
                break
        }


        return false;
    });

    $('.slide1 .left').click(function(){
        var _d = $.trim($(this).parent().find('div').attr('class').replace('avatar','').replace('box-avatar','')).split('-');

        if(_d[2] > 1){

            if( _d[2] == 44 || _d[2] == 45){
                $('.tabnav2 li').eq(1).hide();
            }else{
                $('.tabnav2 li').eq(1).show();
            }
            $('.'+_d[0]+'-'+_d[1]+'-'+_d[2]).addClass(_d[0]+'-'+_d[1]+'-'+(parseInt(_d[2])-1)).removeClass(_d[0]+'-'+_d[1]+'-'+_d[2]);
        }

        return false;
    });


    $('#stage_type_ticket').hide();
    $('#livebox').hide();
    $('#stage_ticket_price').hide();
    $('.shownow').click(function(){
       if($(this).val() == 'no'){
           $('#livebox').show();
       }else{
           $('#livebox').hide();
       }
    });
    $('#stage_type').change(function(){
        $('#stage_type_ticket').find('option:first').attr('selected','selected');
       if($(this).val() == 'private' || $(this).val() == 'invitation'){
           $('#stage_type_ticket').show();
       }else{
           $('#stage_type_ticket').hide();

       }
    });
    $('#stage_type_ticket').change(function(){
        if($(this).val() == 'paid'){
            $('#stage_ticket_price').show();
        }else{
            $('#stage_ticket_price').hide();

        }
    });

    $('#user_pic').hide();
    $('#user_pic_fake').click(function(){
        $('#user_pic').click();
    });
    $('#user_pic').change(function(){
        $('#user_pic_fake').val($('#user_pic').val());
    });

    $('#stage_performance_image').hide();
    $('#stage_performance_image_fake').click(function(){
        $('#stage_performance_image').click();
    });
    $('#stage_profile_image').hide();
    $('#stage_profile_image_fake').click(function(){
        $('#stage_profile_image').click();
    });
    $('#stage_performance_image').change(function(){
        $('#stage_performance_image_fake').val($('#stage_performance_image').val());
    });

    $(".tab-detail").hide(); //Hide all content
     if(window.location.hash.length == 0){
         $("ul.tab-menu li:first").addClass("active").show(); //Activate first tab
         $(".tab-detail:first").show(); //Show first tab content
     }else{
         $('a[href="'+window.location.hash+'"]').parent().addClass("active").show();
         $(window.location.hash).show();
     }


    //On Click Event
    $("ul.tab-menu li").click(function() {

        $("ul.tab-menu li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab-detail").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        //return false;
    });

    $(".tab-detail2").hide(); //Hide all content
    $("ul.tabnav2 li:first").addClass("active").show(); //Activate first tab
    $(".tab-detail2:first").show(); //Show first tab content

    $(".tab-detail3").hide(); //Hide all content
    $("ul.tabnav3 li:first").addClass("active").show(); //Activate first tab
    $(".tab-detail3:first").show(); //Show first tab content

    //On Click Event
    $("ul.tabnav2 li").click(function() {

        $("ul.tabnav2 li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab-detail2").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
    });
    $("ul.tabnav3 li").click(function() {

        $("ul.tabnav3 li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab-detail3").hide(); //Hide all tab content

        var activeTab = $(this).find("a").attr("href"); //Find the href attribute value to identify the active tab + content
        $(activeTab).fadeIn(); //Fade in the active ID content
        return false;
    });

    $('#save-avatar').click(function(){
       var _class = "";
       var _data = new Array();

        $('.box-avatar').each(function(f,v){
            _class = $(v).attr('class').replace('avatar','').replace('box-avatar', '');
            _data[f] = $.trim(_class);
       });
        var _dataTosend = {'data' : _data};
        $.ajax({
            type: "POST",
            url: "/savecharacter",
            //dataType: "json",
            data: _dataTosend,
            success: function(data){

                $('.notificacion').html('<div class="warning"><a class="close" href="#">X</a><p>Your changes have been save</p></div>');

                setTimeout(function() {
                    $('.notificacion').find('.warning').fadeOut().remove();
                }, 6000);
            }
        });

       return false;
    });

    $('#save-information').click(function(){
        var _class = "";

        var _dataTosend = {'data' : {'name': $('#user_name').val(), 'about' : $('#user_about').val()}};
        $.ajax({
            type: "POST",
            url: "/saveinformation",
            dataType: "json",
            data: _dataTosend
        }).done(function( msg ) {
            alert( msg );
        });

        return false;
    });

    $('.rate').raty({
        score: function() {
            return $(this).attr('data-rating');
        },
        starOn  : 'star-on.png',
        starOff : 'star-off.png',
        path: '/img/'
    });
    $('.buy_heckle').click(function(){
        if(confirm("Are you sure?")){
            var cp = $(this).attr('rel').split('-');
            $.ajax({
                type: "GET",
                url: "/buy/"+cp[0]+"/"+cp[1]+"/"+cp[2],
                success: function(data){
                    if(data == '300'){
                        alert('Sorry, but you have no tokens');
                    }else if(data == '500'){
                        alert('You are not authorized');
                    }else if(data == '200'){
                        alert('You now have new items to heckle');
                        $('.current_tokens').html(parseInt($('.current_tokens').html())-parseInt(cp[1]));

                    }

                }

            });
        }


        return false;
    });
    $('.buy_stage').click(function(){
        if(confirm("Are you sure?")){
        var elemento = $(this);
        var cp = $(this).attr('rel').split('-');
        $.ajax({
            type: "GET",
            url: "/buystage/"+cp[0]+"/"+cp[1]+"/"+cp[2],
            success: function(data){
                if(data == '300'){
                    alert('Sorry, but you have no tokens');
                }else if(data == '500'){
                    alert('You are not authorized');
                }else if(data == '200'){
                    alert('You now have new stage designs');
                    elemento.remove();
                    $('.current_tokens').html(parseInt($('.current_tokens').html())-parseInt(cp[1]));
                }

            }

        });
        }
        return false;
    });


});