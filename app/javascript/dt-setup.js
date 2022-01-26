//Set up the datatable(s) on the page. There will probably only be one, but 
//document.addEventListener("DOMContentLoaded", function () {
    //let tables = document.getElementsByClassName("dt-table");
    //for (i = 0; i < tables.length; i++) {
        //let table = new DataTable(tables[i]);
    //}
//})

//document.addEventListener('readystatechange', function(ev) {
    //console.log(document.readyState)
//});
$(document).ready(function() {
    $(".dt-table").DataTable();    
 });