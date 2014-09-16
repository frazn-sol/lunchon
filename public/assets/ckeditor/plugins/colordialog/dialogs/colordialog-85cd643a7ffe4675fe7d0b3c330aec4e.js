/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("colordialog",function(e){function t(){a.getById(y).removeStyle("background-color"),l.getContentElement("picker","selectedColor").setValue(""),h&&h.removeAttribute("aria-selected"),h=null}function n(e){var e=e.data.getTarget(),t;"td"==e.getName()&&(t=e.getChild(0).getHtml())&&(h=e,h.setAttribute("aria-selected",!0),l.getContentElement("picker","selectedColor").setValue(t))}function r(e){for(var e=e.replace(/^#/,""),t=0,n=[];2>=t;t++)n[t]=parseInt(e.substr(2*t,2),16);return"#"+(165<=.2126*n[0]+.7152*n[1]+.0722*n[2]?"000":"fff")}function i(e){!e.name&&(e=new CKEDITOR.event(e));var t=!/mouse/.test(e.name),n=e.data.getTarget(),i;"td"==n.getName()&&(i=n.getChild(0).getHtml())&&(s(e),t?p=n:d=n,t&&(n.setStyle("border-color",r(i)),n.setStyle("border-style","dotted")),a.getById(m).setStyle("background-color",i),a.getById(g).setHtml(i))}function s(e){if(e=!/mouse/.test(e.name)&&p){var t=e.getChild(0).getHtml();e.setStyle("border-color",t),e.setStyle("border-style","solid")}!p&&!d&&(a.getById(m).removeStyle("background-color"),a.getById(g).setHtml("&nbsp;"))}function o(t){var r=t.data,i=r.getTarget(),s=r.getKeystroke(),o="rtl"==e.lang.dir;switch(s){case 38:if(t=i.getParent().getPrevious())t=t.getChild([i.getIndex()]),t.focus();r.preventDefault();break;case 40:(t=i.getParent().getNext())&&(t=t.getChild([i.getIndex()]))&&1==t.type&&t.focus(),r.preventDefault();break;case 32:case 13:n(t),r.preventDefault();break;case o?37:39:(t=i.getNext())?1==t.type&&(t.focus(),r.preventDefault(!0)):(t=i.getParent().getNext())&&(t=t.getChild([0]))&&1==t.type&&(t.focus(),r.preventDefault(!0));break;case o?39:37:if(t=i.getPrevious())t.focus(),r.preventDefault(!0);else if(t=i.getParent().getPrevious())t=t.getLast(),t.focus(),r.preventDefault(!0)}}var u=CKEDITOR.dom.element,a=CKEDITOR.document,f=e.lang.colordialog,l,c={type:"html",html:"&nbsp;"},h,p,d,v=function(e){return CKEDITOR.tools.getNextId()+"_"+e},m=v("hicolor"),g=v("hicolortext"),y=v("selhicolor"),b;return function(){function e(e,n){for(var i=e;i<e+3;i++){var s=new u(b.$.insertRow(-1));s.setAttribute("role","row");for(var o=n;o<n+3;o++)for(var a=0;6>a;a++)t(s.$,"#"+r[o]+r[a]+r[i])}}function t(e,t){var r=new u(e.insertCell(-1));r.setAttribute("class","ColorCell"),r.setAttribute("tabIndex",-1),r.setAttribute("role","gridcell"),r.on("keydown",o),r.on("click",n),r.on("focus",i),r.on("blur",s),r.setStyle("background-color",t),r.setStyle("border","1px solid "+t),r.setStyle("width","14px"),r.setStyle("height","14px");var a=v("color_table_cell");r.setAttribute("aria-labelledby",a),r.append(CKEDITOR.dom.element.createFromHtml('<span id="'+a+'" class="cke_voice_label">'+t+"</span>",CKEDITOR.document))}b=CKEDITOR.dom.element.createFromHtml('<table tabIndex="-1" aria-label="'+f.options+'" role="grid" style="border-collapse:separate;" cellspacing="0"><caption class="cke_voice_label">'+f.options+'</caption><tbody role="presentation"></tbody></table>'),b.on("mouseover",i),b.on("mouseout",s);var r="00 33 66 99 cc ff".split(" ");e(0,0),e(3,0),e(0,3),e(3,3);var a=new u(b.$.insertRow(-1));a.setAttribute("role","row");for(var l=0;6>l;l++)t(a.$,"#"+r[l]+r[l]+r[l]);for(l=0;12>l;l++)t(a.$,"#000000")}(),{title:f.title,minWidth:360,minHeight:220,onLoad:function(){l=this},onHide:function(){t();var e=p.getChild(0).getHtml();p.setStyle("border-color",e),p.setStyle("border-style","solid"),a.getById(m).removeStyle("background-color"),a.getById(g).setHtml("&nbsp;"),p=null},contents:[{id:"picker",label:f.title,accessKey:"I",elements:[{type:"hbox",padding:0,widths:["70%","10%","30%"],children:[{type:"html",html:"<div></div>",onLoad:function(){CKEDITOR.document.getById(this.domId).append(b)},focus:function(){(p||this.getElement().getElementsByTag("td").getItem(0)).focus()}},c,{type:"vbox",padding:0,widths:["70%","5%","25%"],children:[{type:"html",html:"<span>"+f.highlight+'</span>												<div id="'+m+'" style="border: 1px solid; height: 74px; width: 74px;"></div>												<div id="'+g+'">&nbsp;</div><span>'+f.selected+'</span>												<div id="'+y+'" style="border: 1px solid; height: 20px; width: 74px;"></div>'},{type:"text",label:f.selected,labelStyle:"display:none",id:"selectedColor",style:"width: 74px",onChange:function(){try{a.getById(y).setStyle("background-color",this.getValue())}catch(e){t()}}},c,{type:"button",id:"clear",style:"margin-top: 5px",label:f.clear,onClick:t}]}]}]}]}});