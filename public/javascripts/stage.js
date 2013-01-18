$(document).ready(function(){

    soundManager.useFlashBlock = false;
    soundManager.bgColor = '#ffffff';
    soundManager.debugMode = false;
    soundManager.url = '/swf/';
    soundManager.wmode = 'transparent'; // hide initial flash of white on everything except firefox/win32
    soundManager.allowScriptAccess = 'always';
    soundManager.useFastPolling = true;
    soundManager.flashVersion = 9;
    soundManager.flashLoadTimeout = 3000;
    soundManager.useHTML5Audio = true;
    soundManager.onready(function() {

        // -- shoot
        soundManager.createSound({
            id: 'shoot',
            url: 'http://beta.theopenhat.com/through.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'splat',
            url: 'http://beta.theopenhat.com/splat.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'chicken',
            url: 'http://beta.theopenhat.com/chicken.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'flower',
            url: 'http://beta.theopenhat.com/flower.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'pants',
            url: 'http://beta.theopenhat.com/pants.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'tip1',
            url: 'http://beta.theopenhat.com/tip1.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'tip2',
            url: 'http://beta.theopenhat.com/tip2.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'tip3',
            url: 'http://beta.theopenhat.com/tip3.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });
        soundManager.createSound({
            id: 'tip4',
            url: 'http://beta.theopenhat.com/tip4.mp3',
            autoLoad: true,
            autoPlay: false,
            multiShot: false,
            volume: 50
        });

    });

    $('#footer-bot').append('<section class="chat-messanger" id="chat-general" style="left:0px;" ><a href="#" title="close" class="close global">X</a><h4>Global Chat</h4><section class="scroll"></section><section class="clear"></section><form action="#"><textarea name="textarea" cols="4" rows="5" class="textarea2" placeholder="Write a message and press enter" ></textarea></form></section>').find('#chat-general').hide();


});