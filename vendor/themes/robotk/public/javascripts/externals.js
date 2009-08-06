$(document).ready(function() {
  $('#external li a[rel*=external]').click(function() {
    var clicked = $(this);
    if ($(this).hasClass('active')) {
      $(this).removeClass('active');
      close_sidebar('easeOutBounce');
    } else {
      if ((l = parseInt($('#container').css('left'))) > 0) {
        $('#external li a').removeClass('active');
        close_sidebar('easeOutCubic', function() {
          $(clicked).click();
        });
      } else {
        if ($('#external .loading').length == 0) {
          $('#external').append('<div class="loading" style="display: none;"></div>');
        }
        $('#external .loading').css({ top:$(this).position().top + 'px', height:$(this).height() + 'px' }).fadeIn();
        $(this).addClass('active');
        $('body').animate({ backgroundPosition:'(-704px 0px)' }, 500, 'easeOutBounce');
        $('#container').animate({ left:'320px' }, 500, 'easeOutBounce', function() {
          
        });
      }
    }
    return false;
  });
  
  $('#external a.twitter[rel*=external]').click(function() { display_feed_summary('twitter', '/feeds/twitter'); });
  $('#external a.last-fm[rel*=external]').click(function() { display_feed_summary('last-fm', '/feeds/last-fm'); });
  $('#external a.stfu[rel*=external]').click(function() { display_feed_summary('stfu', '/feeds/stfu'); });
  $('#external a.github[rel*=external]').click(function() {
  	$.getJSON('http://github.com/api/v2/json/repos/show/fauxparse?callback=?', function(json, status){
      $('#external .loading').fadeOut();
  		show_github_repositories(json.repositories.reverse());
  	});
  });
  $('#blurb a[rel*=about]').click(function() {
    $('#external a[rel*=external]').removeClass('active');
    $('#external .feed').fadeOut('fast', function() { $(this).remove() });
    if ($('#bio:visible').length == 0) {
      $('#bio').fadeIn();
      $('body').animate({ backgroundPosition:'(-384px 0px)' }, 500, 'easeOutBounce');
      $('#container').animate({ left:'640px' }, 500, 'easeOutBounce', function() {
        
      });
    } else {
      close_sidebar();
    }
    return false;
  });
  $('#bio').hide();
});

function close_sidebar(easing, callback) {
  $('#bio').fadeOut(500);
  $('#external .feed').fadeOut('fast', function() { $(this).remove() });
  if (typeof(easing) == 'undefined') easing = 'easeOutBounce';
  $('body').animate({ backgroundPosition:'(-1024px 0px)' }, 500, easing);
  $('#container').animate({ left:'0px' }, 500, easing, callback);
  $('#external .feed').fadeOut(function() { $(this).remove(); });
  $('#external li a[rel*=external]').removeClass('active');
}

function display_feed_summary(feed_name, feed_uri) {
  if ($('#external #' + feed_name + '-feed').length == 0) {
    $('#external').append('<div class="feed" id="' + feed_name + '-feed" style="display: none;"></div>');
  }
  $.ajax({
    url:feed_uri,
    type:'get',
    dataType:'json',
    success:function(data) {
      var content = '<ol>';
      for (i in data) {
        if (i > 4) break;
        var title = feed_name == 'twitter' ? data[i].title.replace(/^.[^\:]+\:/, '') : data[i].title;
        content += '<li><a class="title" href="' + data[i].link + '">' + title + '</a>';
        content += '<span class="description">' + data[i].description + '</span>';
        content += '<span class="date">' + data[i].date + '</span></li>';
      }
      content += '</ol>';
      content += '<a class="close" href="#" onclick="close_sidebar(); return false;">Close</a>';
      content += '<a class="more" target="_blank" href="' + $('a.' + feed_name + '[rel*=external]').attr('href') + '">More</a>';
      $('#external .loading').fadeOut();
      $('#' + feed_name + '-feed').html(content).fadeIn();
    }
  });
  return true;
}

function show_github_repositories(json) {
  if ($('#external #github-feed').length == 0) {
    $('#external').append('<div class="feed" id="github-feed" style="display: none;"></div>');
  }
	var content = '<ol>';
	var n = 0;
	$.each(json, function(i) {
	  if (n < 5 && !this.fork) {
  	  content += '<li><a class="title" href="' + this.url + '">' + this.name + '</a>';
  		content += '<span class="description">' + this.description + '</span></li>';
  		n++;
  	}
	});
	content += '</ol>';
	content += '<a class="close" href="#" onclick="close_sidebar(); return false;">Close</a>';
	content += '<a class="more" target="_blank" href="http://github.com/fauxparse">More</a>';
	$('#external #github-feed').html(content).fadeIn();
};
