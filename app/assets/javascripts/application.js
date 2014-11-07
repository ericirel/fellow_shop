// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

// Font for sprockets-directives
// <script type="text/javascript">
//   WebFontConfig = {
//     google: { families: [ 'Rajdhani::latin' ] }
//   };
//   (function() {
//     var wf = document.createElement('script');
//     wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
//       '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
//     wf.type = 'text/javascript';
//     wf.async = 'true';
//     var s = document.getElementsByTagName('script')[0];
//     s.parentNode.insertBefore(wf, s);
//   })(); </script>


<script type="text/javascript">
  WebFontConfig = {
    google: { families: [ 'Julius+Sans+One::latin' ] }
  };
  (function() {
    var wf = document.createElement('script');
    wf.src = ('https:' == document.location.protocol ? 'https' : 'http') +
      '://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js';
    wf.type = 'text/javascript';
    wf.async = 'true';
    var s = document.getElementsByTagName('script')[0];
    s.parentNode.insertBefore(wf, s);
  })(); </script>

$(window).load(function() { 
   $("img").each(function(){ 
      var image = $(this); 
      if(image.context.naturalWidth == 0 || image.readyState == 'uninitialized'){  
         $(image).unbind("error").hide();
      } 
   }); 
});