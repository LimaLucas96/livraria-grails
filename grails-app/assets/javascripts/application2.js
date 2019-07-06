// This is a manifest file that'll be compiled into application.js.
//
// Any JavaScript file within this directory can be referenced here using a relative path.
//
// You're free to add application-wide JavaScript to this file, but it's generally better 
// to create separate JavaScript files as needed.
//
//= require jquery/dist/jquery.min
//= require bootstrap/dist/js/bootstrap.min

//= require fastclick/lib/fastclick
//= require dist/js/adminlte.min
//= require bower_components/chart.js/Chart
//= require dist/js/demo
//= require jquery-sparkline/dist/jquery.sparkline.min
//= require plugins/jvectormap/jquery-jvectormap-1.2.2.min
//= require plugins/jvectormap/jquery-jvectormap-world-mill-en
//= require jquery-slimscroll/jquery.slimscroll.min
//= require datatables.net/js/jquery.dataTables.min
//= require datatables.net-bs/js/dataTables.bootstrap.min


if (typeof jQuery !== 'undefined') {
	(function($) {
		$(document).ajaxStart(function(){
			$('#spinner').fadeIn();
		}).ajaxStop(function(){
			$('#spinner').fadeOut();
		});
	})(jQuery);
}
