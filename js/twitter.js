function generateFakeTweet(){
	return '<li class="list-group-item"><img src="http://goo.gl/15oUL3" alt="my tweet" class="img-rounded"><div class="div-text"><b class="fullname">Asta B  </b><span class="username">@astux7</span><br/>Apparently Wal-Mart filled two of our cars in a row with the wrong weight oil, or marked it wrong. Right weight is marked on the oil caps..</div></li>';
}

function startFakeGeneration(){
	var iter = 10;
	 while(iter--){
        document.write(generateFakeTweet());
    }
}

function deselect() {
    $(".pop").slideFadeToggle(function() { 
        $("#new_tweet").removeClass("selected");
    });    
}


$(function() {


	function addNewTweet(text){
		$('ul.list-group').prepend(
	       '<li class="list-group-item"><img src="http://goo.gl/dvL2I5" alt="my tweet" class="img-rounded"><div class="div-text"><b class="fullname">Asta B  </b><span class="username">@astux7</span><br/>'+text+'</div></li>');
	     $("#new_tweet_msg").val("");
		
	}

    $("#new_tweet").on('click', function() {
    	$("html, body").animate({ scrollTop: 0 }, 300);
        $('button.navbar-toggle').trigger("click"); 
        if($(this).hasClass("selected")) {
            deselect();               
        } else {
            $(this).addClass("selected");
            $(".pop").slideFadeToggle(function() { 
                $("#new_tweet_msg").focus();
            });
        }
        return false;
    });

    $(".close").on('click', function() {
        deselect();
        $("#new_tweet_msg").val("");
        return false;
    });

    $(".send").on('click', function() {
        deselect();
        var text_new = $("#new_tweet_msg").val();
        if(text_new){
        addNewTweet(text_new);
    }else {
    	alert("empty tweet!");
    }
        return false;
    });
    
     $("#web-send").on('click', function() {
     	var new_text = $("#new_treed_expland").val();
     	if(new_text){
        addNewTweet($("#new_treed_expland").val());
	    $('#web-form-tweet').hide();
	    $("#new_treed_expland").val("")
	    $("#fake-tweet").show();}
	    else{
	    	alert("Empty tweet!");
	    }
        return false;
    });

	$('#fake-tweet').on('click', function () {
	    $(this).hide();
	    $('#web-form-tweet').show();
        $("#new_treed_expland").focus(); 
	});


});

$.fn.slideFadeToggle = function(easing, callback) {
    return this.animate({ opacity: 'toggle', height: 'toggle' }, "fast", easing, callback);
};


function loadMoreContent(){
  	window.setTimeout(function () {
    	$('.list-group').append(make_fake_tweets());
	}, 200);
 
};

function make_fake_tweets () {
  var str = "";
  var i = 20;
  while (i--){
    str += generateFakeTweet();
  }
  return str;
}

$(window).scroll(function() {
  if ($(window).scrollTop() == $(document).height() - $(window).height()) {
   loadMoreContent();
  }
});


