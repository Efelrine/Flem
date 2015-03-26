$ ->
	$('#owners_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [ 1, 2, 3 ] }]
	} )
	$('#users_linked_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [ 2] }]
	} )
	$('#items_list_owner').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [1, 3, 4, 8, 9] }]
	} )