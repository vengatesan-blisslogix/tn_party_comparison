function ShowDialog(modal)
{
    document.getElementById('overlay').style.display = "block";
    document.getElementById('dialog').style.display = "block";
}

function HideDialog()
{
    document.getElementById('overlay').style.display = "none";
    document.getElementById('dialog').style.display = "none";
} 

function HideDialogAlergen(id)
{
	document.getElementById('overlay').style.display = "none";
    document.getElementById('dialog').style.display = "none";
   	jQuery("#"+id+":checked").prop("checked",false);
   	jQuery('body').css('overflow', '');
        jQuery("#recipe")[0].scrollIntoView(true);
   	//jQuery(".DTFC_LeftBodyLiner #"+id)[0].scrollIntoView(true);
} 

function create_modelbox(title,margin,style,close_fn)
{

	if(document.getElementById("dialog"))
	{
		document.body.removeChild(document.getElementById("dialog"))
		document.body.removeChild(document.getElementById("overlay"))
	}
	
	var model_overlay = document.createElement("div");
	model_overlay.setAttribute("class","web_dialog_overlay");
	model_overlay.setAttribute("id","overlay");
	document.body.appendChild(model_overlay);

	var modelbox = document.createElement("div");
	modelbox.setAttribute("class","web_dialog1");
	modelbox.setAttribute("id","dialog");
	modelbox.setAttribute("style",margin);
	document.body.appendChild(modelbox);

	var model_title_div = document.createElement("div");
	model_title_div.setAttribute("class","modelbox_title");
	modelbox.appendChild(model_title_div);

	var model_title = document.createElement("div");
	model_title.setAttribute("style","float:left;");
	model_title_div.appendChild(model_title);

	var model_title_text = document.createElement("div");
	model_title_text.setAttribute("style","margin-top:8px;margin-left:8px;");
	model_title_text.setAttribute("id","modal_box_title");
	model_title_text.innerHTML = title;
	model_title.appendChild(model_title_text);

	var model_close = document.createElement("div");
	model_close.setAttribute("class","close_modelbox");
	model_close.setAttribute("onclick",close_fn);
	model_title_div.appendChild(model_close);

	modelbox.innerHTML += "<br />"

	var model_content = document.createElement("div");
	model_content.setAttribute("id","dialog_content");
	model_content.setAttribute("style",style);
	modelbox.appendChild(model_content);


}

function load_page(url,title,margin,style,close_fn)
{

	create_modelbox(title,margin,style,close_fn);
	document.getElementById("dialog_content").innerHTML = '<img src="assets/loader.gif">';
	ShowDialog(true);
	var xmlhttp;
	
	if (window.XMLHttpRequest)
	{// code for IE7+, Firefox, Chrome, Opera, Safari
	    xmlhttp=new XMLHttpRequest();
	}
	else
	{// code for IE6, IE5
	    xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}

	xmlhttp.onreadystatechange=function()
	{
	    
	    if (xmlhttp.readyState==4 && xmlhttp.status==200)
	    {
	      document.getElementById("dialog_content").innerHTML=xmlhttp.responseText;

	      ShowDialog(true);
	    }

	}

	xmlhttp.open("POST",url,true);
	xmlhttp.send();
}