$(document).ready(function() {
      $('#outputs').dataTable({
  "sDom": "<'row-fluid'<'span6'l><'span6'f>r>t<'row-fluid'<'span6'i><'span6'p>>",
  "sPaginationType": "bootstrap"
});
      $('.dropdown-toggle').dropdown();
      $("#updates").hide();
      });
