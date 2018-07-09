// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).on('turbolinks:load', function(){
  $("table[role='datatable']").each(function(){
    $(this).DataTable({
      
    });
  });
});

// $('.datatable').DataTable({
//   dom: "<'row'<'span6'l><'span6'f>r>t<'row'<'span6'i><'span6'p>>",
//   pagingType: "bootstrap"
// });

// jQuery ->
//   $('#users').dataTable()