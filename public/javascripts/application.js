// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//


$(function() {
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

         }else if(title = 'unFollow performer'){
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





	$("a.watch").colorbox({close:'X',html: '<iframe src="http://player.vimeo.com/video/47028824" width="500" height="281" frameborder="0" webkitAllowFullScreen mozallowfullscreen allowFullScreen></iframe>'});
    $("#heckle").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#tips").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#report").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#changeImage").colorbox({iframe:true, innerWidth:500, innerHeight:344,close:'X'});
    $("#messanges").colorbox({iframe:true, innerWidth:500, innerHeight:370,close:'X'});
    $("#share_url").colorbox({iframe:true, innerWidth:500, innerHeight:370,close:'X'});
    $("#configuration").colorbox({iframe:true, innerWidth:500, innerHeight:390,close:'X'});
    $("#tippers").colorbox({iframe:true, innerWidth:500, innerHeight:390,close:'X'});


    $('#closeStage').click(function(){
        if(confirm('Are you sure you want to close your stage. There are '+ $('#countUser').html()+' online viewers in the audience.')){
            window.location.href = '/close/'+ $(this).attr('href').split('#')[1];
        }
        return false
    });

});

$(document).ready(function() {


    $("#makeStage").validate();
    var countHead = 42, countJacket = 33, countLegs = 22, countFeet = 3, countEyes = 11, countNose = 11, countMouth = 10 ;

    $('a.close').click(function(){
       $(this).parent().fadeOut();
        return false;
    });

    $('.slide1 .right').click(function(){
        var _d = $.trim($(this).parent().find('div').attr('class').replace('avatar','').replace('box-avatar','')).split('-');


        switch(_d[1]){
            case 'head':

                if(_d[2] < countHead){
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

    //On Click Event
    $("ul.tabnav2 li").click(function() {

        $("ul.tabnav2 li").removeClass("active"); //Remove any "active" class
        $(this).addClass("active"); //Add "active" class to selected tab
        $(".tab-detail2").hide(); //Hide all tab content

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
});