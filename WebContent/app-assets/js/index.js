function initFunctionlity() {
	$('#filter_btn').click(function(){
		$('#filter_btn i').toggleClass('filter_toggle_btn');
		$('#layers').toggleClass('hide_layers');
		
	});
	$('#filter_img').click(function(){
		$('#filter_img i').toggleClass('filter_toggle_btn');
		$('#map_images').toggleClass('hide_img');
	});
	$('canvas').bind('click', function (event) {
		misPageX = event.pageX;
		misPageY = event.pageY
	});
	$('a#close_btn').click(function(){
		$('#infoSchool').hide();
	});
	//Load District
//	getDistrict();
//	getIcdArea();
	
}
function getDistrict() {
	$.getJSON( ctrUrl + "lookup/district", function(districtData) {
		$('#districtFilter').html('')
		var fsDistrict = $('#districtFilter');
		fsDistrict.append($('<option value=""> -- Select Area -- </option>'));
		if(districtData.length > 0) {
			$.each(districtData, function(index, value) {
				fsDistrict.append($('<option value="' + value[0] + '">' + value[1] + '</option>'));
			});
		}
		getSchoolCategory();
	});
}




function getconvertUTMtoLatLon() {
	$.getJSON( ctrUrl + "lookup/getconvertUTMtoLatLon");
}




function getIcdArea() {
	$.getJSON( ctrUrl + "lookup/icdarea", function(districtData) {
		$('#districtFilter').html('')
		var fsDistrict = $('#districtFilter');
		fsDistrict.append($('<option value=""> -- Select Area -- </option>'));
		if(districtData.length > 0) {
			$.each(districtData, function(index, value) {
				fsDistrict.append($('<option value="' + value[0] + '">' + value[1] + '</option>'));
			});
		}
//		getSchoolCategory();
	});
}

function getTalukaByDistrict(district) {
	$.getJSON( ctrUrl + "lookup/taluka/" + district.value, function(talukaData) {
		$('#villageFilter').html('');
		var fsVillage = $('#villageFilter');
		fsVillage.append($('<option value=""> -- Select Village -- </option>'));
		$('#talukaFilter').html('')
		var fsTaluka = $('#talukaFilter');
		fsTaluka.append($('<option value=""> -- Select Taluka -- </option>'));
		if(talukaData.length > 0) {
			$.each(talukaData, function(index, value) {
				fsTaluka.append($('<option value="' + value[0] + '">' + value[1] + '</option>'));
			});
		}
	});
}

function getVillageByTaluka(taluka) {
	$.getJSON( ctrUrl + "lookup/village/" + taluka.value, function(villageData) {
		$('#villageFilter').html('');
		var fsVillage = $('#villageFilter');
		fsVillage.append($('<option value=""> -- Select Village -- </option>'));
		if(villageData.length > 0) {
			$.each(villageData, function(index, value) {
				fsVillage.append($('<option value="' + value[0] + '">' + value[1] + '</option>'));
			});
		}
		
	});
}

function getSchoolInfo(data) {
	window.open('schoolInfo/' + $(data).find('span').html(), '_blank');
}

function getSchoolCategory() {
	$.getJSON( ctrUrl + "lookup/school/ctg", function(result) {
		$('#categoryFilter').html('');
		var fsCategoty = $('#categoryFilter');
		fsCategoty.append($('<option value=""> -- Select Category -- </option>'));
		if(result.length > 0) {
			$.each(result, function(index, value) {
				fsCategoty.append($('<option value="' + value + '">' + value + '</option>'));
			});
		}
		getSchoolType();
	});
}

function getSchoolType() {
	$.getJSON( ctrUrl + "lookup/school/ty", function(result) {
		$('#typeFilter').html('');
		var fsType = $('#typeFilter');
		fsType.append($('<option value=""> -- Select Type -- </option>'));
		if(result.length > 0) {
			$.each(result, function(index, value) {
				fsType.append($('<option value="' + value + '">' + value + '</option>'));
			});
		}
		getSchoolArea();
	});
}

function getSchoolArea() {
	$.getJSON( ctrUrl + "lookup/school/ar", function(result) {
		$('#areaFilter').html('');
		var fsArea = $('#areaFilter');
		fsArea.append($('<option value=""> -- Select Area -- </option>'));
		if(result.length > 0) {
			$.each(result, function(index, value) {
				fsArea.append($('<option value="' + value + '">' + value + '</option>'));
			});
		}
		getSchoolMedium();
	});
}

function getSchoolMedium() {
	$.getJSON( ctrUrl + "lookup/school/mdm", function(result) {
		$('#mediumFilter').html('');
		var fsMedium = $('#mediumFilter');
		fsMedium.append($('<option value=""> -- Select Medium -- </option>'));
		if(result.length > 0) {
			$.each(result, function(index, value) {
				fsMedium.append($('<option value="' + value + '">' + value + '</option>'));
			});
		}
		getManagmentType();
	});
}

function getManagmentType() {
	$.getJSON( ctrUrl + "lookup/school/managementTy", function(result) {
		$('#managementTyFilter').html('');
		var fsManagementType = $('#managementTyFilter');
		fsManagementType.append($('<option value=""> -- Select Management Type -- </option>'));
		if(result.length > 0) {
			$.each(result, function(index, value) {
				fsManagementType.append($('<option value="' + value + '">' + value + '</option>'));
			});
		}
	});
}


function getCommonMethodDataOfContainerId(containerId)
{
//	$('#tbodyContainerlist').empty();
	$('#c_ocr_id').empty();
	$('#c_container_size_id').empty();
	$('#c_area_block_id').empty();
	$('#c_lid_id').empty();
	$('#c_stack_id').empty();
	$('#c_in_time_id').empty();
	$('#c_company_id').empty();
	$('#c_condition_id').empty();
	$('#c_con_type_id').empty();
	$('#c_areatypename').empty();
	$('#c_subareatypename').empty();
	$('#c_Row_column_id').empty();
	$('#c_tr_type_id').empty();
	$('#c_transport_id').empty();
	$('#c_lat_long_id').empty();
	$('#c_con_condition_id').empty();
	var data1={"containerid":containerId};
	$.ajax({ 
		    url: "../lookup/getDataOfContainerId",
		    data: data1,
		    type: "POST",
		    async:false,
		    success : function(resdata, status, xhr) {
		    	
		    	var result = JSON.parse(resdata);
				
		    	var date; 
				var dateStr;
				
				if(result.in_time != null && result.in_time != ' ')
				{
					date = new Date(result.in_time);
					dateStr =("00" + date.getDate()).slice(-2) + "/" +
					  ("00" + (date.getMonth() + 1)).slice(-2) + "/" +
					  date.getFullYear() + " " +
					  ("00" + date.getHours()).slice(-2) + ":" +
					  ("00" + date.getMinutes()).slice(-2) + ":" +
					  ("00" + date.getSeconds()).slice(-2);
				}else
					{
					dateStr = '-';
					}
				
				$("#c_containerIdList").show();
				$("#c_containerDtls").html("Container ID : "+containerId);
				$('#c_ocr_id').append(result.ocr_id);
				$('#c_container_size_id').append(result.container_size);
				$('#c_stack_id').append(result.stack);
				$('#c_areatypename').append(result.areatypename);
				$('#c_subareatypename').append(result.subareatypename);
				$('#c_lid_id').append(result.lid);
				$('#c_in_time_id').append(dateStr);
				$('#c_company_id').append(result.manufacture_company);
				$('#c_con_condition_id').append(result.con_condition);
				$('#c_con_type_id').append(result.con_type);
				$('#c_tr_type_id').append(result.transaction_type);
				$('#c_transport_id').append(result.byTransport);
				$('#c_lat_long_id').append(result.lat_cent+","+result.long_cent);	
		    }
			});
}

function getCommonMethodDataOfHistoryContainerId(containerId,rfid,locationid,date)
{
	if(containerId != null && containerId != '' &&
	   rfid != null && rfid != '' && 
	   locationid != null && locationid != '')
	{
//		$('#tbodyContainerlist').empty();
		$('#c_ocr_id').empty();
		$('#c_container_size_id').empty();
		$('#c_area_block_id').empty();
		$('#c_lid_id').empty();
		$('#c_stack_id').empty();
		$('#c_in_time_id').empty();
		$('#c_company_id').empty();
		$('#c_condition_id').empty();
		$('#c_con_type_id').empty();
		$('#c_areatypename').empty();
		$('#c_subareatypename').empty();
		$('#c_Row_column_id').empty();
		$('#c_tr_type_id').empty();
		$('#c_transport_id').empty();
		$('#c_lat_long_id').empty();
		$('#c_con_condition_id').empty();
		var data1={"containerid":containerId,
				"rfid":rfid,
				"lid":locationid,
				"actdate":date};
		$.ajax({ 
			    url: "../lookup/getHistoryContainerId",
			    data: data1,
			    type: "POST",
			    //async:false,
			    success : function(resdata, status, xhr) {
					var result = JSON.parse(resdata);
					
					var date; 
					var dateStr;
					
					if(result.in_time != null && result.in_time != ' ')
					{
						date = new Date(result.in_time);
						dateStr =("00" + date.getDate()).slice(-2) + "/" +
						  ("00" + (date.getMonth() + 1)).slice(-2) + "/" +
						  date.getFullYear() + " " +
						  ("00" + date.getHours()).slice(-2) + ":" +
						  ("00" + date.getMinutes()).slice(-2) + ":" +
						  ("00" + date.getSeconds()).slice(-2);
					}else
						{
						dateStr = '-';
						}
					
					$("#c_containerIdList").show();
					$("#c_containerDtls").html("Container ID : "+containerId);
					$('#c_ocr_id').append(result.ocr_id);
					$('#c_container_size_id').append(result.container_size);
					$('#c_stack_id').append(result.stack);
					$('#c_areatypename').append(result.areatypename);
					$('#c_subareatypename').append(result.subareatypename);
					$('#c_lid_id').append(result.lid);
					$('#c_in_time_id').append(dateStr);
					$('#c_company_id').append(result.manufacture_company);
					$('#c_con_condition_id').append(result.con_condition);
					$('#c_con_type_id').append(result.con_type);
					$('#c_tr_type_id').append(result.transaction_type);
					$('#c_transport_id').append(result.byTransport);
					$('#c_lat_long_id').append(result.lat_cent+","+result.long_cent);	
			    }
			});
	}

}

function hidecontainerIdListCommonMethod()
{
	$('#c_containerIdList').hide();
}




function getContainerDetailsDataOfContainerId(containerId,detailsId)
{
	$('#cd_ocr_id').empty();
	$('#cd_con_size_id').empty();
	$('#cd_con_type').empty();
	$('#cd_trn_type').empty();
	$('#cd_in_date').empty();
	$('#cd_manufac_com').empty();
	$('#cd_rail_wagon_no').empty();
	$('#cd_rail_wagon_from').empty();
	$('#cd_rail_wagon_to').empty();
	$('#cd_cont_cond').empty();
	$('#cd_doc_no').empty();
	$('#cd_line_no').empty();
	$('#cd_port_load').empty();
	$('#cd_con_term').empty();
	$('#cd_bill_load').empty();
	$('#cd_do_val_date').empty();
	$('#cd_reval_date').empty();
	$('#cd_ship_line_no').empty();
	$('#cd_ship_line_name').empty();
	$('#cd_tran_type').empty();
	$('#cd_export_name').empty();
	$('#cd_export_no').empty();
	$('#cd_cha_name').empty();
	$('#cd_cha_no').empty();
	$('#cd_import_name').empty();
	$('#cd_import_no').empty();
	var data1={"containerid":containerId,"detailsId":detailsId};
	$.ajax({ 
		    url: "../lookup/getContainerDetailsDataOfContainerId",
		    data: data1,
		    type: "POST",
		    async:false,
		    success : function(resdata, status, xhr) {
		    	
		    	var result = JSON.parse(resdata);
				
		    	var date,doval_date,doreval_date; 
				var dateStr,dateStr_doval,dateStr_doreval_date;
				
				if(result.in_date != null && result.in_date != ' ')
				{
					date = new Date(result.in_date);
					dateStr =("00" + date.getDate()).slice(-2) + "/" +
					  ("00" + (date.getMonth() + 1)).slice(-2) + "/" +
					  date.getFullYear() + " " +
					  ("00" + date.getHours()).slice(-2) + ":" +
					  ("00" + date.getMinutes()).slice(-2) + ":" +
					  ("00" + date.getSeconds()).slice(-2);
				}else
					{
					dateStr = '-';
					}
				
				if(result.do_val_date != null && result.do_val_date != ' ')
				{
					doval_date = new Date(result.do_val_date);
					dateStr_doval =("00" + doval_date.getDate()).slice(-2) + "/" +
					  ("00" + (doval_date.getMonth() + 1)).slice(-2) + "/" +
					  doval_date.getFullYear() + " " +
					  ("00" + doval_date.getHours()).slice(-2) + ":" +
					  ("00" + doval_date.getMinutes()).slice(-2) + ":" +
					  ("00" + doval_date.getSeconds()).slice(-2);
				}else
					{
					dateStr_doval = '-';
					}
				
				if(result.reval_date != null && result.reval_date != ' ')
				{
					doreval_date = new Date(result.reval_date);
					dateStr_doreval_date =("00" + doreval_date.getDate()).slice(-2) + "/" +
					  ("00" + (doreval_date.getMonth() + 1)).slice(-2) + "/" +
					  doreval_date.getFullYear() + " " +
					  ("00" + doreval_date.getHours()).slice(-2) + ":" +
					  ("00" + doreval_date.getMinutes()).slice(-2) + ":" +
					  ("00" + doreval_date.getSeconds()).slice(-2);
				}else
					{
					dateStr_doreval_date = '-';
					}
				
				$("#cd_containerIdList").show();
				$("#cd_containerDtls").html("Container ID : "+containerId);
				$('#cd_ocr_id').append(result.ocr_id);
				$('#cd_con_size_id').append(result.container_size);
				$('#cd_con_type').append(result.container_type);
				$('#cd_by_transport').append(result.by_transport);
				$('#cd_in_date').append(dateStr);
				$('#cd_manufac_com').append(result.manufac_com);
				$('#cd_rail_wagon_no').append(result.rail_wagon_no);
				$('#cd_rail_wagon_from').append(result.rail_wagon_from);
				$('#cd_rail_wagon_to').append(result.rail_wagon_to);
				$('#cd_cont_cond').append(result.container_con);
				$('#cd_doc_no').append(result.doc_no);
				$('#cd_line_no').append(result.line_no);
				$('#cd_port_load').append(result.port_load);	
				$('#cd_con_term').append(result.con_term);
				$('#cd_bill_load').append(result.bill_load);
				$('#cd_do_val_date').append(dateStr_doval);
				$('#cd_reval_date').append(dateStr_doreval_date);	
				$('#cd_ship_line_no').append(result.ship_line_no);
				$('#cd_ship_line_name').append(result.ship_line_name);	
				$('#cd_tran_type').append(result.tran_type);
				$('#cd_export_name').append(result.export_name);
				$('#cd_export_no').append(result.export_no);	
				$('#cd_cha_name').append(result.cha_name);
				$('#cd_cha_no').append(result.cha_no);	
				$('#cd_import_name').append(result.import_name);
				$('#cd_import_no').append(result.import_no);	
				
		    }
			});
}

function hidecontainerIdListContainerDetails()
{
	$('#cd_containerIdList').hide();
}





function getOutContainerDetailsDataOfContainerId(containerId,detailsId)
{
	$('#cd_ocr_id').empty();
	$('#cd_con_size_id').empty();
	$('#cd_con_type').empty();
	$('#cd_trn_type').empty();
	$('#cd_in_date').empty();
	$('#cd_manufac_com').empty();
	$('#cd_rail_wagon_no').empty();
	$('#cd_rail_wagon_from').empty();
	$('#cd_rail_wagon_to').empty();
	$('#cd_cont_cond').empty();
	$('#cd_doc_no').empty();
	$('#cd_line_no').empty();
	$('#cd_port_load').empty();
	$('#cd_con_term').empty();
	$('#cd_bill_load').empty();
	$('#cd_do_val_date').empty();
	$('#cd_reval_date').empty();
	$('#cd_ship_line_no').empty();
	$('#cd_ship_line_name').empty();
	$('#cd_tran_type').empty();
	$('#cd_export_name').empty();
	$('#cd_export_no').empty();
	$('#cd_cha_name').empty();
	$('#cd_cha_no').empty();
	$('#cd_import_name').empty();
	$('#cd_import_no').empty();
	var data1={"containerid":containerId,"detailsId":detailsId};
	$.ajax({ 
		    url: "../lookup/getOutContainerDetailsDataOfContainerId",
		    data: data1,
		    type: "POST",
		    async:false,
		    success : function(resdata, status, xhr) {
		    	
		    	var result = JSON.parse(resdata);
				
		    	var date,doval_date,do_date; 
				var dateStr,dateStr_doval,dateStr_do_date;
				
				if(result.in_date != null && result.in_date != ' ')
				{
					date = new Date(result.in_date);
					dateStr =("00" + date.getDate()).slice(-2) + "/" +
					  ("00" + (date.getMonth() + 1)).slice(-2) + "/" +
					  date.getFullYear() + " " +
					  ("00" + date.getHours()).slice(-2) + ":" +
					  ("00" + date.getMinutes()).slice(-2) + ":" +
					  ("00" + date.getSeconds()).slice(-2);
				}else
					{
					dateStr = '-';
					}
				
				if(result.do_date != null && result.do_date != ' ')
				{
					do_date = new Date(result.do_date);
					dateStr_do_date =("00" + do_date.getDate()).slice(-2) + "/" +
					  ("00" + (do_date.getMonth() + 1)).slice(-2) + "/" +
					  do_date.getFullYear() + " " +
					  ("00" + do_date.getHours()).slice(-2) + ":" +
					  ("00" + do_date.getMinutes()).slice(-2) + ":" +
					  ("00" + do_date.getSeconds()).slice(-2);
				}else
					{
					dateStr_do_date = '-';
					}
				
				if(result.do_val_date != null && result.do_val_date != ' ')
				{
					doval_date = new Date(result.do_val_date);
					dateStr_doval =("00" + doval_date.getDate()).slice(-2) + "/" +
					  ("00" + (doval_date.getMonth() + 1)).slice(-2) + "/" +
					  doval_date.getFullYear() + " " +
					  ("00" + doval_date.getHours()).slice(-2) + ":" +
					  ("00" + doval_date.getMinutes()).slice(-2) + ":" +
					  ("00" + doval_date.getSeconds()).slice(-2);
				}else
					{
					dateStr_doval = '-';
					}
				
				
				
				$("#cd_containerIdList").show();
				$("#cd_containerDtls").html("Container ID : "+containerId);
				$('#cd_ocr_id').append(result.ocr_id);
				$('#cd_con_size_id').append(result.container_size);
				$('#cd_tran_type').append(result.tran_type);
				$('#cd_by_transport').append(result.by_transport);
				$('#cd_con_type').append(result.container_type);
				$('#cd_rail_consignee').append(result.rail_consignee); 
				$('#cd_rail_wagon_from').append(result.rail_wagon_from);
				$('#cd_rail_wagon_to').append(result.rail_wagon_to);
				$('#cd_doc_no').append(result.doc_no);
				$('#cd_line_no').append(result.line_no);
				$('#cd_customer_no').append(result.customer_no);   
				$('#cd_con_term').append(result.con_term);
				$('#cd_port_load').append(result.port_load);	
				$('#cd_bill_load').append(result.bill_load);
				$('#cd_do_no').append(result.do_no);  
				$('#cd_do_date').append(dateStr_do_date);  
				$('#cd_do_val_date').append(dateStr_doval);
				$('#cd_ship_bill_no').append(result.ship_bill_no);  
				$('#cd_ship_line_no').append(result.ship_line_no);
				$('#cd_ship_line_name').append(result.ship_line_name);	
				$('#cd_in_date').append(dateStr);  // container In date
				$('#cd_export_name').append(result.export_name);
				$('#cd_export_no').append(result.export_no);	
				$('#cd_cha_name').append(result.cha_name);
				$('#cd_cha_no').append(result.cha_no);	
				$('#cd_import_name').append(result.import_name);
				$('#cd_import_no').append(result.import_no);	
				$('#cd_load_cancel').append(result.load_cancel);    
				$('#cd_offload_create').append(result.offload_create);	
				
				
		    }
			});
}

function hidecontainerIdListContainerDetails()
{
	$('#cd_containerIdList').hide();
}
