$ ->
	$('#items_list').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [3,5] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )
	$('#items_list_user').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [3, 6] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )
	$('#items_list_owner').dataTable( {
		"aaSorting": [[0, "asc"]],
		"aoColumnDefs": [{ "bSortable": false, "aTargets": [2, 4, 5, 7] }],
		"oLanguage": {
			"sUrl": "/dataTables.fr.lang"
		}
	} )