//= require ems/jquery
//= require ems/bootstrap
//= require ems/metisMenu
//= require ems/sb-admin-2

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function(){
            $('#spinner').fadeIn();
        }).ajaxStop(function(){
            $('#spinner').fadeOut();
        });
    })(jQuery);
}