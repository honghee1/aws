jQuery(document).ready(function(a){var o=a(".cd-horizontal-timeline"),e=60;(o.length>0)&&g(o);function g(v){v.each(function(){var w=a(this),x={};x.timelineWrapper=w.find(".events-wrapper");x.eventsWrapper=x.timelineWrapper.children(".events");x.fillingLine=x.eventsWrapper.children(".filling-line");x.timelineEvents=x.eventsWrapper.find("a");x.timelineDates=j(x.timelineEvents);x.eventsMinLapse=h(x.timelineDates);x.timelineNavigation=w.find(".cd-timeline-navigation");x.eventsContent=w.children(".events-content");k(x,e);var y=l(x,e);w.addClass("loaded");x.timelineNavigation.on("click",".next",function(z){z.preventDefault();s(x,y,"next")});x.timelineNavigation.on("click",".prev",function(z){z.preventDefault();s(x,y,"prev")});x.eventsWrapper.on("click","a",function(z){z.preventDefault();x.timelineEvents.removeClass("selected");a(this).addClass("selected");r(a(this));q(a(this),x.fillingLine,y);u(a(this),x.eventsContent)});x.eventsContent.on("swipeleft",function(){var z=b();(z=="mobile")&&n(x,y,"next")});x.eventsContent.on("swiperight",function(){var z=b();(z=="mobile")&&n(x,y,"prev")});a(document).keyup(function(z){if(z.which=="37"&&d(w.get(0))){n(x,y,"prev")}else{if(z.which=="39"&&d(w.get(0))){n(x,y,"next")}}})})}function s(w,x,v){var y=f(w.eventsWrapper),z=Number(w.timelineWrapper.css("width").replace("px",""));(v=="next")?p(w,y-z+e,z-x):p(w,y+z-e)}function n(z,A,y){var B=z.eventsContent.find(".selected"),v=(y=="next")?B.next():B.prev();if(v.length>0){var x=z.eventsWrapper.find(".selected"),w=(y=="next")?x.parent("li").next("li").children("a"):x.parent("li").prev("li").children("a");q(w,z.fillingLine,A);u(w,z.eventsContent);w.addClass("selected");x.removeClass("selected");r(w);t(y,w,z)}}function t(y,v,z){var x=window.getComputedStyle(v.get(0),null),w=Number(x.getPropertyValue("left").replace("px","")),C=Number(z.timelineWrapper.css("width").replace("px","")),A=Number(z.eventsWrapper.css("width").replace("px",""));var B=f(z.eventsWrapper);if((y=="next"&&w>C-B)||(y=="prev"&&w<-B)){p(z,-w+C/2,C-A)}}function p(w,y,x){var v=w.eventsWrapper.get(0);y=(y>0)?0:y;y=(!(typeof x==="undefined")&&y<x)?x:y;m(v,"translateX",y+"px");(y==0)?w.timelineNavigation.find(".prev").addClass("inactive"):w.timelineNavigation.find(".prev").removeClass("inactive");(y==x)?w.timelineNavigation.find(".next").addClass("inactive"):w.timelineNavigation.find(".next").removeClass("inactive")}function q(A,y,B){var w=window.getComputedStyle(A.get(0),null),v=w.getPropertyValue("left"),x=w.getPropertyValue("width");v=Number(v.replace("px",""))+Number(x.replace("px",""))/2;var z=v/B;m(y.get(0),"scaleX",z)}function k(y,x){for(i=0;i<y.timelineDates.length;i++){var v=c(y.timelineDates[0],y.timelineDates[i]),w=Math.round(v/y.eventsMinLapse)+2;y.timelineEvents.eq(i).css("left",w*x+"px")}}function l(v,z){var w=c(v.timelineDates[0],v.timelineDates[v.timelineDates.length-1]),x=w/v.eventsMinLapse,x=Math.round(x)+4,y=x*z;v.eventsWrapper.css("width",y+"px");q(v.eventsWrapper.find("a.selected"),v.fillingLine,y);t("next",v.eventsWrapper.find("a.selected"),v);return y}function u(x,z){var y=x.data("date"),C=z.find(".selected"),A=z.find('[data-date="'+y+'"]'),B=A.height();if(A.index()>C.index()){var v="selected enter-right",w="leave-left"}else{var v="selected enter-left",w="leave-right"}A.attr("class",v);C.attr("class",w).one("webkitAnimationEnd oanimationend msAnimationEnd animationend",function(){C.removeClass("leave-right leave-left");A.removeClass("enter-left enter-right")});z.css("height",B+"px")}function r(v){v.parent("li").prevAll("li").children("a").addClass("older-event").end().end().nextAll("li").children("a").removeClass("older-event")}function f(v){var w=window.getComputedStyle(v.get(0),null),x=w.getPropertyValue("-webkit-transform")||w.getPropertyValue("-moz-transform")||w.getPropertyValue("-ms-transform")||w.getPropertyValue("-o-transform")||w.getPropertyValue("transform");if(x.indexOf("(")>=0){var x=x.split("(")[1];x=x.split(")")[0];x=x.split(",");var y=x[4]}else{var y=0}return Number(y)}function m(v,w,x){v.style["-webkit-transform"]=w+"("+x+")";v.style["-moz-transform"]=w+"("+x+")";v.style["-ms-transform"]=w+"("+x+")";v.style["-o-transform"]=w+"("+x+")";v.style.transform=w+"("+x+")"}function j(w){var v=[];w.each(function(){var A=a(this),x=A.data("date").split("T");if(x.length>1){var y=x[0].split("/"),B=x[1].split(":")}else{if(x[0].indexOf(":")>=0){var y=["2000","0","0"],B=x[0].split(":")}else{var y=x[0].split("/"),B=["0","0"]}}var z=new Date(y[2],y[1]-1,y[0],B[0],B[1]);v.push(z)});return v}function c(v,w){return Math.round((w-v))}function h(w){var v=[];for(i=1;i<w.length;i++){var x=c(w[i-1],w[i]);v.push(x)}return Math.min.apply(null,v)}function d(v){var y=v.offsetTop;var x=v.offsetLeft;var z=v.offsetWidth;var w=v.offsetHeight;while(v.offsetParent){v=v.offsetParent;y+=v.offsetTop;x+=v.offsetLeft}return(y<(window.pageYOffset+window.innerHeight)&&x<(window.pageXOffset+window.innerWidth)&&(y+w)>window.pageYOffset&&(x+z)>window.pageXOffset)}function b(){return window.getComputedStyle(document.querySelector(".cd-horizontal-timeline"),"::before").getPropertyValue("content").replace(/'/g,"").replace(/"/g,"")}});