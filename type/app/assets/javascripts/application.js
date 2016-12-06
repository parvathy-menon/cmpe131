// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

/*
 * Replace all SVG images with inline SVG
 */
function render_svg()
{
  jQuery('img.svg').each(function(){
      var $img = jQuery(this);
      var imgID = $img.attr('id');
      var imgClass = $img.attr('class');
      var imgURL = $img.attr('src');

      jQuery.get(imgURL, function(data) {
          // Get the SVG tag, ignore the rest
          var $svg = jQuery(data).find('svg');

          // Add replaced image's ID to the new SVG
          if(typeof imgID !== 'undefined') {
              $svg = $svg.attr('id', imgID);
          }
          // Add replaced image's classes to the new SVG
          if(typeof imgClass !== 'undefined') {
              $svg = $svg.attr('class', imgClass+' replaced-svg');
          }

          // Remove any invalid XML tags as per http://validator.w3.org
          $svg = $svg.removeAttr('xmlns:a');

          // Replace image with new SVG
          $img.replaceWith($svg);
      }, 'xml');
  });
}

function showSidebarMenu() {
  var sidebar = document.getElementById("sidebar-menu");
  if(sidebar.style.left == '-340px')
  {
      $("#sidebar-menu").animate({
          left: '0px',
      });
      $("#menu-button").animate({
          left: '300px',
      });
      $("#header-typeio-button-new").animate({
          left: '300px',
      });
  }
  else
  {
    $("#sidebar-menu").animate({
        left: '-340px',
    });
    $("#menu-button").animate({
        left: '0px',
    });
    $("#header-typeio-button-new").animate({
        left: '0px',
    });
  }
}
