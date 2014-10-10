$ ->
	$('#items_list').dataTable( {
		"aaSorting": [[1, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [  3, 4] }]
	} )
