function tabview_aux(TabViewId, id)
{
  var TabView = document.getElementById(TabViewId);

  var Tabs = TabView.firstChild;
  while (Tabs.className != "Tabs" ) Tabs = Tabs.nextSibling;

  var Tab = Tabs.firstChild;
  var i   = 0;
  do
  {
    if (Tab.tagName == "A")
    {
      i++;
      Tab.href      = "javascript:tabview_switch('"+TabViewId+"', "+i+");";
      Tab.className = (i == id) ? "Active" : "";
      Tab.blur();
    }
  }
  while (Tab = Tab.nextSibling);

  var Pages = TabView.firstChild;
  while (Pages.className != 'Pages') Pages = Pages.nextSibling;

  var Page = Pages.firstChild;
  var i    = 0;

  do
  {
    if (Page.className == 'Page')
    {
      i++;
//      if (Pages.offsetHeight) Page.style.height = (Pages.offsetHeight-2)+"px";
		Page.style.overflow = "auto";
		Page.style.display  = (i == id) ? 'block' : 'none';
    }
  }
  while (Page = Page.nextSibling);
}
function tabview_switch(TabViewId, id)
{
	tabview_aux(TabViewId, id); 
}

function tabview_initialize(TabViewId) {tabview_aux(TabViewId,  1); }

function hideTab(TabViewId,id)
{
	  var TabView = document.getElementById(TabViewId);

	  var Tabs = TabView.firstChild;
	  while (Tabs.className != "Tabs" ) Tabs = Tabs.nextSibling;
	  
	  if(id==2)
		  Tabs.style.display="none";
	  var Tab = Tabs.firstChild;
	  var i   = 0;

	  do
	  {
	    if (Tab.tagName == "A")
	    {
	      i++;
	      if(i==id)
	      {
	    	  Tab.style.display = 'none';
	    	  break;
	      }
	    }
	  }
	  while (Tab = Tab.nextSibling);
}
function showTab(TabViewId,id)
{
	
	
	  var TabView = document.getElementById(TabViewId);

	  var Tabs = TabView.firstChild;
	  while (Tabs.className != "Tabs" ) Tabs = Tabs.nextSibling;

	  Tabs.style.display="";
	  var Tab = Tabs.firstChild;
	  var i   = 0;

	  do
	  {
	    if (Tab.tagName == "A")
	    {
	      i++;
	      if(i==id)
	      {
	    	  Tab.style.display = 'block';
	    	  break;
	      }
	    }
	  }
	  while (Tab = Tab.nextSibling);
}
var incError=0;
var commonErrTabIndex = 0;

function hideAndShowTable(divId)
{
	if(incError>0)
		document.getElementById(divId).style.display="";
	else
		document.getElementById(divId).style.display="none";
}
function isErrorInList(TabViewId,id)
{
	if(incError>0)
	{
		tabview_switch(TabViewId,id);
		return true;
	}
	else
	{
		return false;
	}
}
function getErrTabToggle(TabViewId,id)
{
	if(incError==0)
		hideTab(TabViewId,id);
	else
		showTab(TabViewId,id);
}
function setCommonErrTabIndex(val)
{
	commonErrTabIndex=val;
}