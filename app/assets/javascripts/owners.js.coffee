$ ->
	$('#owners_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [1, 2, 3] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )
	$('#users_linked_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [2] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )