$ ->
	$('#owners_list').dataTable( {
		"aaSorting": [[1, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [ 0, 2, 3 ] }]
	} )
	$('#users_linked_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [ 2] }]
	} )
