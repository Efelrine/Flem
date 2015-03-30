$ ->
	$('#items_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [3,4] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )
	$('#items_list_user').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [3, 7] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )
	$('#items_list_owner').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [2, 4, 5, 9] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )