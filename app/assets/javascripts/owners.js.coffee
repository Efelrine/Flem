$ ->
	$('#owners_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [1, 2, 3] }]
	} )
	$('#users_linked_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [2] }]
	} )