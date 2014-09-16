/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("cellProperties",function(e){var t=e.lang.table,n=t.cell,r=e.lang.common,i=CKEDITOR.dialog.validate,s=/^(\d+(?:\.\d+)?)(px|%)$/,o={type:"html",html:"&nbsp;"},u="rtl"==e.lang.dir,a=e.plugins.colordialog;return{title:n.title,minWidth:CKEDITOR.env.ie&&CKEDITOR.env.quirks?450:410,minHeight:CKEDITOR.env.ie&&(CKEDITOR.env.ie7Compat||CKEDITOR.env.quirks)?230:220,contents:[{id:"info",label:n.title,accessKey:"I",elements:[{type:"hbox",widths:["40%","5%","40%"],children:[{type:"vbox",padding:0,children:[{type:"hbox",widths:["70%","30%"],children:[{type:"text",id:"width",width:"100px",label:r.width,validate:i.number(n.invalidWidth),onLoad:function(){var e=this.getDialog().getContentElement("info","widthType").getElement(),t=this.getInputElement(),n=t.getAttribute("aria-labelledby");t.setAttribute("aria-labelledby",[n,e.$.id].join(" "))},setup:function(e){var t=parseInt(e.getAttribute("width"),10),e=parseInt(e.getStyle("width"),10);!isNaN(t)&&this.setValue(t),!isNaN(e)&&this.setValue(e)},commit:function(e){var t=parseInt(this.getValue(),10),n=this.getDialog().getValueOf("info","widthType");isNaN(t)?e.removeStyle("width"):e.setStyle("width",t+n),e.removeAttribute("width")},"default":""},{type:"select",id:"widthType",label:e.lang.table.widthUnit,labelStyle:"visibility:hidden","default":"px",items:[[t.widthPx,"px"],[t.widthPc,"%"]],setup:function(e){(e=s.exec(e.getStyle("width")||e.getAttribute("width")))&&this.setValue(e[2])}}]},{type:"hbox",widths:["70%","30%"],children:[{type:"text",id:"height",label:r.height,width:"100px","default":"",validate:i.number(n.invalidHeight),onLoad:function(){var e=this.getDialog().getContentElement("info","htmlHeightType").getElement(),t=this.getInputElement(),n=t.getAttribute("aria-labelledby");t.setAttribute("aria-labelledby",[n,e.$.id].join(" "))},setup:function(e){var t=parseInt(e.getAttribute("height"),10),e=parseInt(e.getStyle("height"),10);!isNaN(t)&&this.setValue(t),!isNaN(e)&&this.setValue(e)},commit:function(e){var t=parseInt(this.getValue(),10);isNaN(t)?e.removeStyle("height"):e.setStyle("height",CKEDITOR.tools.cssLength(t)),e.removeAttribute("height")}},{id:"htmlHeightType",type:"html",html:"<br />"+t.widthPx}]},o,{type:"select",id:"wordWrap",label:n.wordWrap,"default":"yes",items:[[n.yes,"yes"],[n.no,"no"]],setup:function(e){var t=e.getAttribute("noWrap");("nowrap"==e.getStyle("white-space")||t)&&this.setValue("no")},commit:function(e){"no"==this.getValue()?e.setStyle("white-space","nowrap"):e.removeStyle("white-space"),e.removeAttribute("noWrap")}},o,{type:"select",id:"hAlign",label:n.hAlign,"default":"",items:[[r.notSet,""],[r.alignLeft,"left"],[r.alignCenter,"center"],[r.alignRight,"right"]],setup:function(e){var t=e.getAttribute("align");this.setValue(e.getStyle("text-align")||t||"")},commit:function(e){var t=this.getValue();t?e.setStyle("text-align",t):e.removeStyle("text-align"),e.removeAttribute("align")}},{type:"select",id:"vAlign",label:n.vAlign,"default":"",items:[[r.notSet,""],[r.alignTop,"top"],[r.alignMiddle,"middle"],[r.alignBottom,"bottom"],[n.alignBaseline,"baseline"]],setup:function(e){var t=e.getAttribute("vAlign"),e=e.getStyle("vertical-align");switch(e){case"top":case"middle":case"bottom":case"baseline":break;default:e=""}this.setValue(e||t||"")},commit:function(e){var t=this.getValue();t?e.setStyle("vertical-align",t):e.removeStyle("vertical-align"),e.removeAttribute("vAlign")}}]},o,{type:"vbox",padding:0,children:[{type:"select",id:"cellType",label:n.cellType,"default":"td",items:[[n.data,"td"],[n.header,"th"]],setup:function(e){this.setValue(e.getName())},commit:function(e){e.renameNode(this.getValue())}},o,{type:"text",id:"rowSpan",label:n.rowSpan,"default":"",validate:i.integer(n.invalidRowSpan),setup:function(e){(e=parseInt(e.getAttribute("rowSpan"),10))&&1!=e&&this.setValue(e)},commit:function(e){var t=parseInt(this.getValue(),10);t&&1!=t?e.setAttribute("rowSpan",this.getValue()):e.removeAttribute("rowSpan")}},{type:"text",id:"colSpan",label:n.colSpan,"default":"",validate:i.integer(n.invalidColSpan),setup:function(e){(e=parseInt(e.getAttribute("colSpan"),10))&&1!=e&&this.setValue(e)},commit:function(e){var t=parseInt(this.getValue(),10);t&&1!=t?e.setAttribute("colSpan",this.getValue()):e.removeAttribute("colSpan")}},o,{type:"hbox",padding:0,widths:["60%","40%"],children:[{type:"text",id:"bgColor",label:n.bgColor,"default":"",setup:function(e){var t=e.getAttribute("bgColor");this.setValue(e.getStyle("background-color")||t)},commit:function(e){this.getValue()?e.setStyle("background-color",this.getValue()):e.removeStyle("background-color"),e.removeAttribute("bgColor")}},a?{type:"button",id:"bgColorChoose","class":"colorChooser",label:n.chooseColor,onLoad:function(){this.getElement().getParent().setStyle("vertical-align","bottom")},onClick:function(){e.getColorFromDialog(function(e){e&&this.getDialog().getContentElement("info","bgColor").setValue(e),this.focus()},this)}}:o]},o,{type:"hbox",padding:0,widths:["60%","40%"],children:[{type:"text",id:"borderColor",label:n.borderColor,"default":"",setup:function(e){var t=e.getAttribute("borderColor");this.setValue(e.getStyle("border-color")||t)},commit:function(e){this.getValue()?e.setStyle("border-color",this.getValue()):e.removeStyle("border-color"),e.removeAttribute("borderColor")}},a?{type:"button",id:"borderColorChoose","class":"colorChooser",label:n.chooseColor,style:(u?"margin-right":"margin-left")+": 10px",onLoad:function(){this.getElement().getParent().setStyle("vertical-align","bottom")},onClick:function(){e.getColorFromDialog(function(e){e&&this.getDialog().getContentElement("info","borderColor").setValue(e),this.focus()},this)}}:o]}]}]}]}],onShow:function(){this.cells=CKEDITOR.plugins.tabletools.getSelectedCells(this._.editor.getSelection()),this.setupContent(this.cells[0])},onOk:function(){for(var e=this._.editor.getSelection(),t=e.createBookmarks(),n=this.cells,r=0;r<n.length;r++)this.commitContent(n[r]);this._.editor.forceNextSelectionCheck(),e.selectBookmarks(t),this._.editor.selectionChange()}}});