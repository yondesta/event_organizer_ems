//= require ems/jquery
//= require ems/bootstrap
//= require ems/metisMenu
//= require ems/sb-admin-2
//= require datatables/jquery.dataTables
//= require datatables-integration/dataTables.bootstrap.js

if (typeof jQuery !== 'undefined') {
    (function($) {
        $(document).ajaxStart(function(){
            $('#spinner').fadeIn();
        }).ajaxStop(function(){
            $('#spinner').fadeOut();
        });
    })(jQuery);
}