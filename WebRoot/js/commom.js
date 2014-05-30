
function newTabs(obj){
	var name = obj.text;
	var location = obj.text+".jsp";
	var contents = '<iframe scrolling="no" frameborder="0"  src="'+location+'" style="width:100%;height:100%;"></iframe>';  
	 if ($('#tabs').tabs('exists', name)){
	        $('#tabs').tabs('select', name);
	 } else if(location!=''&&name!='demo'&&name!='权限管理'){
		 $('#tabs').tabs('add',{
		        title: name,
		        content: contents,
		        closable: true
		    });
	 }
}

function tabsMenus(){
		$("#tabs").tabs({
		  onContextMenu:function(e,title){
		    e.preventDefault();
		    $('#tabsMenu').menu('show', {  
		      left: e.pageX,  
		      top: e.pageY  
		    }).data("tabTitle",title);
		  }
		}); 
		$("#tabsMenu").menu({
			onClick : function (item) {
				CloseTab(this, item.name);
			}
		});
 }
function CloseTab(menu, type) {
	var curTabTitle = $(menu).data("tabTitle");
	var tabs = $("#tabs");
	
	if (type === "close") {
		tabs.tabs("close", curTabTitle);
		return;
	}
	
	var allTabs = tabs.tabs("tabs");
	var closeTabsTitle = [];
	
	$.each(allTabs, function () {
		var opt = $(this).panel("options");
		if (opt.closable && opt.title != curTabTitle && type === "Other") {
			closeTabsTitle.push(opt.title);
		} else if (opt.closable && type === "All") {
			closeTabsTitle.push(opt.title);
		}
	});
	
	for (var i = 0; i < closeTabsTitle.length; i++) {
		tabs.tabs("close", closeTabsTitle[i]);
	}
} 