$ ->
	$('#items_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [3] }]
	} )
	$('#items_list_user').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [2, 6, 7] }]
	} )