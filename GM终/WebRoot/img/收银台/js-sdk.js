/*
 * uba-sdk v1.4.1, bundle: 2017-08-10 18:26
 * (c) 2017 gomeBigData
 */
!function(){function __decorate(e,t,n,o){var r,i=arguments.length,a=i<3?t:null===o?o=Object.getOwnPropertyDescriptor(t,n):o;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)a=Reflect.decorate(e,t,n,o);else for(var s=e.length-1;s>=0;s--)(r=e[s])&&(a=(i<3?r(a):i>3?r(t,n,a):r(t,n))||a);return i>3&&a&&Object.defineProperty(t,n,a),a}function isFunction$1(e){return"function"==typeof e}function compose(){for(var e=arguments,t=e.length;t--;)if(!isFunction(e[t]))throw new TypeError;return function(){for(var t=arguments,n=e.length;n--;)t=[e[n].apply(this,t)];return t[0]}}function permit(e){return function(t){t.enable=e}}function before(e){return function(t){t.load=e}}function stringifyPrimitive(e){return"string"==typeof e?e:"number"==typeof e&&isFinite(e)?""+e:"boolean"==typeof e?e?"true":"false":""}function stringify$1(e,t,n,o){t=t||"&",n=n||"=";var r=encodeURIComponent;if(null!==e&&"object"==typeof e){for(var i=Object.keys(e),a=i.length,s=a-1,u="",c=0;c<a;++c){var d=i[c],f=e[d],m=r(stringifyPrimitive(d))+n;if(Array.isArray(f)){for(var p=f.length,l=p-1,h=0;h<p;++h)u+=m+r(stringifyPrimitive(f[h])),h<l&&(u+=t);p&&c<s&&(u+=t)}else u+=m+r(stringifyPrimitive(f)),c<s&&(u+=t)}return u}return""}function charCodes(e){if(0===e.length)return[];if(1===e.length)return[e.charCodeAt(0)];for(var t=[],n=0;n<e.length;++n)t[t.length]=e.charCodeAt(n);return t}function parse$1(e,t,n,o){var r={};if("string"!=typeof e||0===e.length)return r;var i=t?charCodes(t+""):defSepCodes,a=n?charCodes(n+""):defEqCodes,s=i.length,u=a.length,c=1e3;o&&"number"==typeof o.maxKeys&&(c=o.maxKeys>0?o.maxKeys:-1);for(var d=[],f=0,m=0,p=0,l="",h="",g=0;g<e.length;++g){var v=e.charCodeAt(g);if(v===i[m]){if(++m===s){var y=g-m+1;if(p<u){if(!(f<y)){if(0==--c)return r;f=g+1,m=p=0;continue}l+=e.slice(f,y)}else f<y&&(h+=e.slice(f,y));if(-1===d.indexOf(l))r[l]=h,d[d.length]=l;else{var w=r[l];w.pop?w[w.length]=h:r[l]=[w,h]}if(0==--c)return r;l=h="",f=g+1,m=p=0}}else{if(m=0,p<u){if(v===a[p]){if(++p===u){var y=g-p+1;f<y&&(l+=e.slice(f,y)),f=g+1}continue}if(p=0,43===v){f<g&&(l+=e.slice(f,g)),l+=" ",f=g+1;continue}}43===v&&(f<g&&(h+=e.slice(f,g)),h+=" ",f=g+1)}}if(f<e.length)p<u?l+=e.slice(f):m<s&&(h+=e.slice(f));else if(0===p)return r;if(-1===d.indexOf(l))r[l]=h,d[d.length]=l;else{var w=r[l];w.pop?w[w.length]=h:r[l]=[w,h]}return r}function getSubDomain(e,t){var n=e.match(t);return n&&n[1]}function sha1(e){var t,n,o,r,i,a,s,u,c,d,f=function(e,t){return e<<t|e>>>32-t},m=function(e){var t,n,o="";for(t=7;t>=0;t--)n=e>>>4*t&15,o+=n.toString(16);return o},p=[],l=1732584193,h=4023233417,g=2562383102,v=271733878,y=3285377520,w=[];for(e=utf8_encode(e),d=e.length,n=0;n<d-3;n+=4)o=e.charCodeAt(n)<<24|e.charCodeAt(n+1)<<16|e.charCodeAt(n+2)<<8|e.charCodeAt(n+3),w.push(o);switch(3&d){case 0:n=2147483648;break;case 1:n=e.charCodeAt(d-1)<<24|8388608;break;case 2:n=e.charCodeAt(d-2)<<24|e.charCodeAt(d-1)<<16|32768;break;case 3:n=e.charCodeAt(d-3)<<24|e.charCodeAt(d-2)<<16|e.charCodeAt(d-1)<<8|128}for(w.push(n);14!=(15&w.length);)w.push(0);for(w.push(d>>>29),w.push(d<<3&4294967295),t=0;t<w.length;t+=16){for(n=0;n<16;n++)p[n]=w[t+n];for(n=16;n<=79;n++)p[n]=f(p[n-3]^p[n-8]^p[n-14]^p[n-16],1);for(r=l,i=h,a=g,s=v,u=y,n=0;n<=19;n++)c=f(r,5)+(i&a|~i&s)+u+p[n]+1518500249&4294967295,u=s,s=a,a=f(i,30),i=r,r=c;for(n=20;n<=39;n++)c=f(r,5)+(i^a^s)+u+p[n]+1859775393&4294967295,u=s,s=a,a=f(i,30),i=r,r=c;for(n=40;n<=59;n++)c=f(r,5)+(i&a|i&s|a&s)+u+p[n]+2400959708&4294967295,u=s,s=a,a=f(i,30),i=r,r=c;for(n=60;n<=79;n++)c=f(r,5)+(i^a^s)+u+p[n]+3395469782&4294967295,u=s,s=a,a=f(i,30),i=r,r=c;l=l+r&4294967295,h=h+i&4294967295,g=g+a&4294967295,v=v+s&4294967295,y=y+u&4294967295}return c=m(l)+m(h)+m(g)+m(v)+m(y),c.toLowerCase()}function utf8_encode(e){return unescape(encodeWrapper(e))}function save(){var e,t=[],n=!0;for(var o in STORAGE)STORAGE.hasOwnProperty(o)&&(n=!1,e=STORAGE[o]||"",t.push(encode(o)+EQ+encode(e)));win$1.name=n?ORIGIN_NAME:SCHEME+encode(ORIGIN_NAME)+Q+t.join(AND)}function addEventListener(e,t,n){e&&(e.addEventListener?e.addEventListener(t,n,!1):e.attachEvent&&e.attachEvent("on"+t,function(t){n.call(e,t)}))}function setData(e){bps=e,bplength=e.length}function fetchData(){var e=trimUrl(),t=dataUrl["dc-7"===tid?"pre":"pro"],n={pageUrl:e,platform:isMobile?"H5":"PC"};if(t){var o=urlParse(t);o.query=n,new Ajax(o.format(),{callback:function(e){if(e=JSON.parse(e),"200"===e.code&&"0"===e.iserror){var t=void 0;(t=e.data)&&(t=t.result)&&setData(t)}}}).send()}}function calcTagNum(e,t){for(var n=0,o=!1,r=e.children,i=0,a=r.length;i<a;i++){var s=r[i];if("a"===s.tagName.toLowerCase()){if(s===t){o=!0;break}n++}else if(!hasAttribute(s,MOD_META)){var u=calcTagNum(s,t);if(n+=u.count,u.found)return{count:n,found:!0}}}return{count:n,found:o}}function storeCmpid(e,t,n){var o=e.match(CMPID_REGEX);return cmpid=o&&o[2],cmpid&&(0!==cmpid.indexOf(CMPID_FLAG)&&(cmpid=CMPID_FLAG+cmpid),setCookie("cmpid",cmpid,n,t,6e4)),cmpid}function getCmpid(){return cmpid||storeCmpid(win.location.href,mainhost,30)||(cmpid=getCookie("cmpid"))}function getSEOInfo(e){var t=urlParse(e),n=t.hostname;if(n!==window.location.hostname){var o,r=t.query,i=!1;if(n)for(var a=0,s=SEOList;a<s.length;a++){var u=s[a],c=u.h,d=u.k;if("string"==typeof c){if(n===c){o=r[d],i=!0;break}}else if("function"==typeof c.test&&c.test(n)){o=r[d],i=!0;break}}return{keyword:o,refererHost:n,isSEOrefer:i}}}function getCmpid$1(e){var t=queryToJson(e),n=t.cmpid;return{cmpid:n,isSemCmpid:/^sem/i.test(n)}}function init(){function e(){bpOnce||(sendLogByPost(getPvData()),bpOnce=!0)}domReady(function(){readyTime=(new Date).valueOf(),setTimeout(e,0)})}function load(){for(var e=[],t=0,n=[Gm,UBA,Intcmp,Cmpid,DomSelector,Coordinate,Omnitrue,Pv,SendEvent];t<n.length;t++){var o=n[t];o.enable&&(o.load&&o.load(),e.push(o))}bindClickEvent(e)}function bindClickEvent(e){if(0!==e.length){var t=isMobile?"touchstart":"click",n=new Processor;addEvent(doc,t,function(t){var o=t.srcElement||t.target;for(n.init(e,new Store,t);o&&o.parentNode;)n.target=o,n.exec("process"),o=o.parentNode;n.exec("post")})}}var __assign=Object.assign||function(e){for(var t,n=1;n<arguments.length;n++){t=arguments[n];for(var o in t)Object.prototype.hasOwnProperty.call(t,o)&&(e[o]=t[o])}return e};Array.prototype.indexOf||(Array.prototype.indexOf=function(e){var t=this.length>>>0,n=Number(arguments[1])||0;for((n=n<0?Math.ceil(n):Math.floor(n))<0&&(n+=t);n<t;n++)if(n in this&&this[n]===e)return n;return-1}),Array.isArray||(Array.isArray=function(e){return"[object Array]"===Object.prototype.toString.call(e)}),Object.keys||(Object.keys=function(){"use strict";var e=Object.prototype.hasOwnProperty,t=!{toString:null}.propertyIsEnumerable("toString"),n=["toString","toLocaleString","valueOf","hasOwnProperty","isPrototypeOf","propertyIsEnumerable","constructor"],o=n.length;return function(r){if("function"!=typeof r&&("object"!=typeof r||null===r))throw new TypeError("Object.keys called on non-object");var i,a,s=[];for(i in r)e.call(r,i)&&s.push(i);if(t)for(a=0;a<o;a++)e.call(r,n[a])&&s.push(n[a]);return s}}()),"function"!=typeof Object.assign&&(Object.assign=__assign),Object.freeze=Object.freeze||function(e){return e},Date.now||(Date.now=function(){return+new Date}),window.JSON||(window.JSON={parse:function(sJSON){return eval("("+sJSON+")")},stringify:function(){var e=Object.prototype.toString,t=Array.isArray||function(t){return"[object Array]"===e.call(t)},n={'"':'\\"',"\\":"\\\\","\b":"\\b","\f":"\\f","\n":"\\n","\r":"\\r","\t":"\\t"},o=function(e){return n[e]||"\\u"+(e.charCodeAt(0)+65536).toString(16).substr(1)},r=/[\\"\u0000-\u001F\u2028\u2029]/g;return function i(n){if(null==n)return"null";if("number"==typeof n)return isFinite(n)?n.toString():"null";if("boolean"==typeof n)return n.toString();if("object"==typeof n){if("function"==typeof n.toJSON)return i(n.toJSON());if(t(n)){for(var a="[",s=0;s<n.length;s++)a+=(s?", ":"")+i(n[s]);return a+"]"}if("[object Object]"===e.call(n)){var u=[];for(var c in n)n.hasOwnProperty(c)&&u.push(i(c)+": "+i(n[c]));return"{"+u.join(", ")+"}"}}return'"'+n.toString().replace(r,o)+'"'}}()});var win="undefined"!=typeof window?window:self,doc=document,lessThanIE8=function(e){if(/MSIE (\d+\.\d+);/.test(e)&&Number(RegExp.$1)<8)return!0}(navigator.userAgent),isMobile=function(){try{return document.createEvent("TouchEvent"),!0}catch(e){return!1}}();win.BPConfig=win.BPConfig||{};var pageHost=win.location.host,PLUS_REGEX=/\.?(.+)\.gomeplus\.com/,GOME_REGEX=/^(.+\.)*gome\.com\.cn/,hostList=[{key:"dc-7",rule:/pre|dev|test|atg|uat/},{key:"dc-14",rule:/^(.+\.)*wap\.gomegj\.com/},{key:"dc-10",rule:/^(.+\.)*diy\.gome\.com\.cn/},{key:"dc-12",rule:/^(.+\.)*m\.gomehigo\.hk/},{key:"dc-2",rule:/^(.+\.)*(m\.gome\.com\.cn|m\.gomeplus\.com)/},{key:"dc-6",rule:/^(.+\.)*gomehigo\.hk/},{key:"dc-1",rule:GOME_REGEX},{key:"dc-13",rule:/^(.+\.)*gomegj\.com/},{key:"dc-16",rule:PLUS_REGEX}],tid=win.BPConfig.tid||function(){for(var e=0,t=hostList;e<t.length;e++){var n=t[e];if(n.rule.exec(pageHost))return win.BPConfig.tid=n.key}}()||"dc-1",isPreEnv="dc-7"===tid,isGomePlus=PLUS_REGEX.test(pageHost),PAGE_ID="page_id",dataUrl={pre:"//point-pre.gomeplus.com/bomber-api/sdk/point",pro:"//point.gomeplus.com/bomber-api/sdk/point"},scr=win.screen,nav=navigator,ua=nav.userAgent,prtl="https:"===win.location.protocol?"https://":"http://",beaconUrl=prtl+(isPreEnv?"test-gb.mobile.gomeplus.com/js_log/":"beacon.gomeplus.com/js_log/"),domainList=["gomegj.com","gome.com.cn","gomehigo.hk","gomeplus.com","atguat.com.cn"],mainhost=function(){for(var e=0,t=domainList;e<t.length;e++){var n=t[e];if(pageHost.indexOf(n)>-1)return n}return pageHost}(),index$2=isFunction$1,isFunction=index$2,index$1=compose,voidFunc=function(){},cached=function(e){var t={};return function(n){return t[n]||(t[n]=e(n))}},urlParse=function(){if("function"==typeof window.URL)return window.URL.prototype.format=function(){var e=stringify$1(this.query);return this.search=e&&"?"+e||"",window.URL.prototype.toString.call(this)},function(e){var t=new window.URL(e,window.location.href);return t.query=queryToJson(t.search.slice(1)),t};var e=document.createElement("a");return function(t){return e.href=t,{host:e.host,hostname:e.hostname,hash:e.hash,href:e.href,query:queryToJson(e.search.slice(1)),format:function(){e.href=this.href,e.hash=this.hash;var t=stringify$1(this.query);return e.search=t&&"?"+t||"",e.href.replace(/#$/,"")}}}}(),defSepCodes=[38],defEqCodes=[61],shallowClone=function(e){return __assign({},e)},queryToJson=index$1(shallowClone,cached(parse$1)),stringSplice=function(e,t,n,o){if(""===e)return"";o=""===o?"=":o,t+=o;var r=e.indexOf(t);if(r<0)return"";r+=t.length;var i=e.indexOf(n,r);return i<r&&(i=e.length),e.substring(r,i)},trimUrl=function(e,t,n){void 0===e&&(e=window.location.href),void 0===t&&(t=["intcmp","cmpid"]),void 0===n&&(n=!0);for(var o=urlParse(e),r=o.query,i=0,a=t;i<a.length;i++)delete r[a[i]];return n&&(o.hash=""),o.format()},parseCookie=function(e){return void 0===e&&(e=doc.cookie),parse$1(e.replace(/;\s*/g,";"),";","=")},getCookie=function(e){return undefined===e||""===e?"":stringSplice(doc.cookie,e,";","")},setCookie=function(e,t,n,o,r){if(void 0===r&&(r=864e5),null!=t){var i=e+"="+t+";path=/";if(n){var a=new Date,s=a.getTime();s+=r*n,a.setTime(s),i+=";expires="+a.toUTCString()}o&&(i+=";domain="+o),doc.cookie=i}},getRandom=function(){var e=new Date;return Math.ceil(1e12*Math.random())+"."+e.getTime()},querySelector=function(e){return(querySelector=document.querySelector?function(e){return document.querySelector(e)}:function(e){var t=document.documentElement.firstChild,n=document.createElement("STYLE");if(t)return t.appendChild(n),document.__qsResult=[],n.styleSheet.cssText=e+"{x:expression(document.__qsResult.push(this))}",window.scrollBy(0,0),t.removeChild(n),document.__qsResult[0]||null})(e)},isReady=!1,domReadyCbs=[],ready=function(){if(!isReady){isReady=!0;for(var e=0;e<domReadyCbs.length;e++)domReadyCbs[e]()}},domReady=function(e){if(domReadyCbs.push(e),"complete"===doc.readyState)setTimeout(ready,1);else if(doc.addEventListener)doc.addEventListener("DOMContentLoaded",ready,!1),win.addEventListener("load",ready,!1);else{doc.attachEvent("onreadystatechange",ready),win.attachEvent("onload",ready);var t=!1;try{t=null===window.frameElement&&document.documentElement}catch(n){}t&&t.doScroll&&function o(){if(!isReady){try{t.doScroll("left")}catch(n){return setTimeout(o,50)}ready()}}()}},addEvent=function(){return doc.attachEvent?function(e,t,n){e.attachEvent("on"+t,n)}:doc.addEventListener?function(e,t,n){e.addEventListener(t,n,!0)}:function(e,t,n){}}(),encodeWrapper=window.encodeURIComponent,unescape=window.unescape,xdr,getXHR=win.XMLHttpRequest?function(){return new win.XMLHttpRequest}:function(){return new win.ActiveXObject("Microsoft.XMLHTTP")},xhr2=""===getXHR().responseType,Ajax=function(){function e(e,t){this.headers={Accept:"*/*","Cache-Control":"","Content-Type":"text/plain"},this.callback=t.callback||function(e){return e},this.errHandler=t.errHandler||function(e){},this.url=e,this.options={async:t.async||!0,timeout:3e4,attempts:2},this.attempts=0,this.aborted=!1,this.timeoutid=null}return e.prototype.abort=function(){this.aborted||(this.xhr&&4!=this.xhr.readyState&&this.xhr.abort(),this.aborted=!0)},e.prototype.handleQueue=function(){var t=e.queue.length;if(t&&this.key)for(var n=0;n<t;n++)if(e.queue[n]===this.key){e.queue.splice(n,1);break}},e.prototype.handleResponse=function(e){if(void 0===e&&(e=this.xhr),this.handleQueue(),this.timeoutid&&clearTimeout(this.timeoutid),!this.aborted)try{if("status"in e&&!/^2|1223/.test(e.status))throw e.status+" ("+e.statusText+")";this.callback(e.response||e.responseText)}catch(t){this.handleError(t.message)}},e.prototype.handleTimeout=function(){this.aborted||(this.options.attempts&&++this.attempts==this.options.attempts?this.handleError("Timeout ("+this.url+")"):(this.xhr.abort(),this.send()))},e.prototype.handleError=function(e){void 0===e&&(e="Connection aborted"),this.handleQueue(),this.aborted||(this.abort(),this.errHandler(e,this.xhr))},e.prototype.send=function(t){var n=this,o=void 0===t?{}:t,r=o.method,i=void 0===r?"get":r,a=o.payload,s=void 0===a?null:a,u=o.key;if(u){if(e.queue.indexOf(u)>-1)return void this.abort();e.queue.push(u),this.key=u}var c=getXHR();if(win.XDomainRequest&&(c=new win.XDomainRequest,xdr=!0),xdr?c.open(i,this.url):c.open(i,this.url,this.options.async),this.xhr=c,!xdr)for(var d in this.headers)this.headers[d]&&c.setRequestHeader(d,this.headers[d]);xhr2||xdr?(c.onload=function(){n.handleResponse.apply(n)},c.onerror=function(){n.handleError.apply(n)},xdr&&(c.onprogress=function(){})):c.onreadystatechange=function(){4==c.readyState&&n.handleResponse.apply(n)},this.options.async?"timeout"in c?(c.timeout=this.options.timeout,c.ontimeout=function(){n.handleTimeout.apply(n)}):this.timeoutid=win.setTimeout(function(){return n.handleTimeout.apply(n)},this.options.timeout):xdr&&(c.ontimeout=function(){}),xdr?setTimeout(function(){return c.send(s)},0):c.send(s)},e.queue=[],e}(),win$1=window,SCHEME="nameStorage:",RE_PAIR=/^([^=]+)(?:=(.*))?$/,Q="?",EQ="=",AND="&",encode=encodeURIComponent,decode=decodeURIComponent,STORAGE={},ORIGIN_NAME,nameStorage={};!function(e){if(e&&0===e.indexOf(SCHEME)){var t=e.split(/[:?]/);t.shift(),ORIGIN_NAME=decode(t.shift())||"";for(var n,o,r,i=t.join(""),a=i.split(AND),s=0,u=a.length;s<u;s++)(n=a[s].match(RE_PAIR))&&n[1]&&(o=decode(n[1]),r=decode(n[2])||"",STORAGE[o]=r)}else ORIGIN_NAME=e||""}(win$1.name),nameStorage.setItem=function(e,t){e&&void 0!==t&&(STORAGE[e]=String(t),save())},nameStorage.getItem=function(e){return STORAGE.hasOwnProperty(e)?STORAGE[e]:null},nameStorage.removeItem=function(e){STORAGE.hasOwnProperty(e)&&(STORAGE[e]=null,delete STORAGE[e],save())},nameStorage.clear=function(){STORAGE={},save()},nameStorage.valueOf=function(){return STORAGE},nameStorage.toString=function(){var e=win$1.name;return 0===e.indexOf(SCHEME)?e:SCHEME+e},addEventListener(win$1,"beforeunload",function(){save()}),win$1.nameStorage=nameStorage;var index$4=nameStorage,frameName="coreframe",inputInstance,iframeInstance,getIframe=function(){if(!iframeInstance){var e=document.createElement("div"),t="(function(){var d=document;d.open();d.domain='"+document.domain+"';d.write('');d.close()})()";e.innerHTML='<iframe src="javascript:void('+(document.domain!==window.location.hostname?t:"0")+')" id="'+frameName+'" name="'+frameName+'" height="0" width="0" style="display: none;visibility: hidden;"></iframe>',iframeInstance=e.children[0],document.body.appendChild(iframeInstance)}return iframeInstance},getForm=function(){var e=document.createElement("form");return e.height="0",e.width="0",e.style.display="none",e.style.visibility="hidden",inputInstance=document.createElement("input"),inputInstance.name="data",e.appendChild(inputInstance),e.method="post",e.enctype="text/plain",e.encoding="text/plain",e.target=frameName,e},sendByIframe=function(e,t){getIframe();var n=getForm();return document.body.appendChild(n),inputInstance.value=t,n.action=e,n.submit(),document.body.removeChild(n),!0},cache=function(e,t,n){var o={url:t,type:e};n&&(o.data=n),index$4.setItem(Date.now(),JSON.stringify(o))},useBeaconAPI=!!window.navigator.sendBeacon,choosePostWay=function(e){return e?sendByIframe:function(e,t,n){return new Ajax(e,n).send({method:"post",payload:t,key:t}),!0}},sendBeacon=useBeaconAPI?function(e,t){return window.navigator.sendBeacon(e,t)}:choosePostWay(lessThanIE8),dropRequestRightNow=useBeaconAPI||lessThanIE8,clearRequestQueue=function(){var e=index$4.valueOf(),t=Object.keys(e);if(t.length)for(var n=0,o=t;n<o.length;n++){var r=o[n];!function(t){var n=JSON.parse(e[t]),o=n.url,r=n.type,i=n.data;"post"===r&&sendBeacon(o,i,{errHandler:function(e,n){n.readyState>1?index$4.removeItem(t):"string"==typeof e&&-1!==e.toLowerCase().indexOf("timeout")||(dropRequestRightNow=!0,sendBeacon=choosePostWay(!0))},callback:function(){index$4.removeItem(t)}})&&dropRequestRightNow&&index$4.removeItem(t)}(r)}},sendPostLog=function(e,t,n){void 0===n&&(n=!1),n&&!useBeaconAPI?(cache("post",e,t),setTimeout(clearRequestQueue,0)):sendBeacon(e,t,{errHandler:function(n,o){o.readyState>1||cache("post",e,t)}})||cache("post",e,t)},DOMNodePathStep=function(){function e(e){this.value=e}return e.prototype.toString=function(){return this.value},e}(),getNodeIdentifier=function(e,t){function n(e){var t=e.getAttribute("class");if(!t)return[];for(var n=t.split(/\s+/g),o=[],r=0,i=n;r<i.length;r++){var a=i[r];a&&-1===a.indexOf("active")&&o.push("$"+a)}return o}function o(e){if(s(e))return e;var t=/^(?:[0-9]|-[0-9-]?)/.test(e),n=e.length-1;return e.replace(/./g,function(e,o){return t&&0===o||!a(e)?r(e,o===n):e})}function r(e,t){return"\\"+i(e)+(t?"":" ")}function i(e){var t=e.charCodeAt(0).toString(16);return 1===t.length&&(t="0"+t),t}function a(e){return!!/[a-zA-Z0-9_-]/.test(e)||e.charCodeAt(0)>=160}function s(e){return/^-?[a-zA-Z_][a-zA-Z0-9_-]*$/.test(e)}if(1!==e.nodeType)return new DOMNodePathStep("");var u=e.getAttribute("id"),c=e.nodeName.toLowerCase();if(u)return new DOMNodePathStep(c.toLowerCase()+function(e){return"#"+o(e)}(u));var d=e.parentNode;if(!d||9===d.nodeType)return new DOMNodePathStep(c.toLowerCase());for(var f=n(e),m=!1,p=!1,l=-1,h=d.children,g=[],v=0;(-1===l||!p)&&v<h.length;++v){var y=h[v],w=y.nodeName.toLowerCase();if(g.push(w),y!==e){if(!p&&w===c.toLowerCase())if("body"===d.nodeName.toLowerCase()){m=!0;var b=f,E=b.length;if(0!==E)for(var _=n(y),C=0;C<_.length;++C){var O=_[C];if(!b.indexOf(O)&&(delete b[O],!--E)){p=!0;break}}else p=!0}else p=!0}else l=v}var S=c.toLowerCase();if(t&&"input"===c.toLowerCase()&&e.getAttribute("type")&&!e.getAttribute("id")&&!e.getAttribute("class")&&(S+='[type="'+e.getAttribute("type")+'"]'),p){for(var P=g[0]+":first-child",A=1;A<=l;A++)P+="+"+g[A];S=P}else if(m)for(var k in f)f.hasOwnProperty(k)&&(S+="."+o(f[k].substr(1)));return new DOMNodePathStep(S)},hasAttribute=window.Element&&window.Element.prototype&&window.Element.prototype.hasAttribute?function(e,t){return e.hasAttribute(t)}:function(e,t){return"undefined"!=typeof e[t]},pageIntcmp=queryToJson(win.location.search.slice(1)).intcmp,isGomeWebView=/gomeplus/i.test(ua),isPhantomJSUser=/PhantomJSUser/i.test(ua),allowBindClick=!isGomeWebView,allowPvLog=allowBindClick||!!tid,allowSendLog=!isPhantomJSUser&&allowPvLog,BPConfig=win.BPConfig,sendLogByPost=allowSendLog?function(e){return function(t,n){"object"==typeof t&&(t=JSON.stringify(t)),sendPostLog(e,t,n)}}(beaconUrl):voidFunc,send=voidFunc,BP=Object.freeze({sendLogByPost:sendLogByPost,send:send}),PROP_EVENT="e",PROP_HREF="href",PROP_HREF_QUERY="insertQuery",PROP_A_NODE="atarget",CODE_META="data-code",MOD_META="modelid",BP_BLOCK="block",BP_POINT="point",bps,bplength=0,updateEvent=function(e,t){return function(n){return n.commit({key:PROP_EVENT+"."+e,data:t})}},setAnchorNode=function(e){return function(t){return t.commit({key:PROP_A_NODE,data:e})}},setHrefObj=function(e){return function(t){return t.commit({key:PROP_HREF,data:e})}},updateHrefQuery=function(e,t){return function(n){return n.commit({key:PROP_HREF_QUERY+"."+e,data:t})}},updateAnchorHref=function(){return function(e){var t=e.getState(PROP_HREF),n=e.getState(PROP_HREF_QUERY);if(t&&n){Object.assign(t.query,n);var o=e.getState(PROP_A_NODE);o&&(o.href=t.format())}}},UBA=function(){function e(e,t){this._filterd=[],this._blocks=[],this._points=[],this.ptfound=!1,this.blockfound=!1,this.ubaparam=[];for(var n=!1,o=0;o<bplength;o++){var r=bps[o],i=r.selector,a=void 0;try{a=querySelector(i),this._filterd.push(r)}catch(s){n=!0}a&&(r.type===BP_BLOCK?this._blocks.push({node:a,data:r}):this.ptfound||r.type!==BP_POINT||(t===a?(this.ptfound=!0,this.ubaparam.push(r)):this._points.push({node:a,data:r})))}n&&setData(bps)}return e.prototype.process=function(e,t){var n=!1;if(!this.ptfound&&!this.blockfound)for(var o=this._points,r=0,i=o.length;r<i;r++)if(o[r].node===t){this.ubaparam.push(o[r].data),this.ptfound=!0,n=!0;break}if(!n){for(var a=void 0,s=this._blocks,r=0,i=s.length;r<i;r++)if(s[r].node===t){this.ubaparam.push(s[r].data),this.blockfound=!0,a=r;break}null!=a&&s.splice(a,1)}},e.prototype.post=function(e){var t=this.ubaparam;if(t.length){for(var n=t[0]._point_id,o="",r=0,i=t.length;r<i;r++)o+=t[r].pointParam+"|";o=o.slice(0,-1).replace(/=/g,":").replace(/&/g,"|"),updateEvent("UBA",o)(e),updateEvent("UBAid",n)(e)}},e=__decorate([before(fetchData),permit(allowBindClick&&!GOME_REGEX.test(pageHost)&&!lessThanIE8)],e)}(),getPageID=function(){return document.body.getAttribute("data-page")||window[PAGE_ID]||getSubDomain(pageHost,PLUS_REGEX)||"null"},Intcmp=function(){function e(){}return e.prototype.process=function(e,t){if(!this.atarget&&"a"===t.tagName.toLowerCase()&&/^http/.test(t.href)&&(this.atarget=t),hasAttribute(t,CODE_META))this.datacode=t.getAttribute(CODE_META);else if(hasAttribute(t,MOD_META))return this.modelid=t.getAttribute(MOD_META),this.modeltarget=t,!0},e.prototype.post=function(e){var t=this.atarget;if(t){var n=t.href,o=urlParse(n),r=void 0,i=getPageID();if(this.datacode)r=i+"-"+this.datacode;else if(this.modelid){var a=calcTagNum(this.modeltarget,t).count;r=i+"-"+this.modelid+"-"+a}else r=o.query.intcmp;r&&updateEvent("i",r)(e),isGomePlus&&o.query.intcmp!==r&&(delete o.query.intcmp,updateHrefQuery("intcmp",r)(e)),setHrefObj(o)(e),setAnchorNode(t)(e)}},e=__decorate([permit(allowBindClick)],e)}(),CMPID_REGEX=/([?&])cmpid=(.+?)(&(.+))?(#.*)?$/,CMPID_FLAG="plus_",cmpid,getAnchorHref=function(e){return e.getState(PROP_HREF)},DOMAIN_REGEX=/^(https?:)?\/\//,Cmpid=function(){function e(){}return e.prototype.post=function(e){var t=getAnchorHref(e);if(t&&DOMAIN_REGEX.test(t)&&!PLUS_REGEX.test(t)){var n=getCmpid();n&&updateHrefQuery("cmpid",n)(e)}},e=__decorate([permit(allowBindClick&&isGomePlus)],e)}(),Store=function(){function e(e){void 0===e&&(e={}),this._state=e}return e.prototype.getState=function(e){return e?this._state[e]:this._state},e.prototype.commit=function(e){for(var t=e.key,n=e.data,o=t.split("."),r=this._state,i=o.length-1,a=0;a<i;a++){var s=o[a];r=r[s]||(r[s]={})}return r[o[i]]=n,n},e.prototype.fire=function(e){var t=e(this._state);return Object.assign(this._state,t),this},e}(),Commit=function(){function e(e){void 0===e&&(e=function(e){return{}}),this.__action=function(t){return __assign({},t,e(t))}}return e.of=function(t){return new e(t)},e.prototype.map=function(t){var n=this;return new e(function(e){var o=n.__action(e),r=t(o);return Object.assign(o,r)})},e.prototype.flatMap=function(e){return this.map(function(t){return e(t).__action(t)})},e.prototype.ap=function(e){return e.map(this.__action)},e.prototype.dispatch=function(){return this.__action},e}(),GMA="__gma",GMB="__gmb",GMC="__gmc",GMV="__gmv",GMZ="__gmz",chooseFromArray=function(e){return(Array.isArray(e)?e[0]:e)||""},initVar=function(){return function(e){return{gma:chooseFromArray(e[GMA]),gmb:chooseFromArray(e[GMB]),gmv:chooseFromArray(e[GMV]),gmz:chooseFromArray(e[GMZ])}}(parseCookie())},SEOList=[{h:"baidu.com",k:"wd"},{h:"baidu.com",k:"word"},{h:"baidu.cn",k:"word"},{h:"baidu.cn",k:"wd"},{h:"baidu.mobi",k:"word"},{h:"wap.baidu.com.cn",k:"word"},{h:"www.haosou.com",k:"q"},{h:"m.haosou.com",k:"q"},{h:"so.com",k:"m"},{h:"search.yahoo.com",k:""},{h:"www.sogou.com",k:"query"},{h:"m.sogou.com",k:"keyword"},{h:"wap.sogou.com",k:"keyword"},{h:"m.sm.cn",k:"q"},{h:"m.sp.sm.cn",k:"q"},{h:"m.yz.sm.cn",k:"q"},{h:"m.sj.sm.cn",k:"q"},{h:"m.sa.sm.cn",k:"q"},{h:"m.xm.sm.cn",k:"q"},{h:"cn.bing.com",k:"q"},{h:"www.bing.com",k:"q"},{h:"www.youdao.com",k:"q"},{h:"m.youdao.com",k:"q"},{h:/^(www\.)?google(\.com?)?(\.[a-z]{2})?$/,k:"q"}],getEnvState=function(){return Object.assign({tid:tid},getSEOInfo(document.referrer),initVar(),getCmpid$1(window.location.search.slice(1)))},minuteTimes=6e4,yearTimes=31536e6,setGma=function(e){return setCookie(GMA,e,10,mainhost,yearTimes),{gma:e}},setGmb=function(e){return setCookie(GMB,e,30,mainhost,minuteTimes),{gmb:e}},setGmc=function(e){return setCookie(GMC,e,0,mainhost),{gmc:e}},setGmv=function(e){return setCookie(GMV,e,10,mainhost,yearTimes),{gmv:e}},setGmz=function(e){return setCookie(GMZ,e,30,mainhost,minuteTimes),{gmz:e}},getGmaBaseInfo=function(e){var t=e.gma,n=t.split(".");return{domainHash:n[0],randomNum:n[1],timeStamp:n[2]}},getDomainHash=cached(function(e){return void 0===e&&(e=mainhost),sha1(e).substr(0,7)}),updateGmc=function(e){var t=e.domainHash;return setGmc(t)},setGmABCV=function(){var e=""+getDomainHash(),t=""+Math.ceil(1e12*(Math.random()+1)),n=""+Date.now();return __assign({},setGma(e+"."+t+"."+n+"."+n+"."+n+".1"),setGmb(e+".1."+t+"|1."+n),setGmc(""+e),setGmv(t+"."+n),{domainHash:e,randomNum:t,timeStamp:n})},updateExpireGmABVZ=function(e){var t=e.gma,n=e.gmb,o=e.gmv,r=e.gmz,i=e.isPageLoadHit;return setGma(t),setGmv(o),setGmz(r),n||(n=""),i?setGmb(n.replace(/^(.+?\.)(\d+)/,function(e,t,n){return""+t+(parseInt(n)+1)})):(setGmb(n),{})},updateGmABV=function(e){var t=e.gma,n=e.gmv;if(null==t)throw Error("gma must be string when invoking updateGmABV");var o=t.split("."),r=o[0],i=o[1],a=o[2],s=o[4],u=o[5],c=parseInt(u)+1,d=Date.now();return setGmv(n),__assign({},setGma([r,i,a,s,d,c].join(".")),setGmb(r+".1."+i+"|"+c+"."+d))},setGmzWithSemCmpid=function(e){var t=e.domainHash,n=e.randomNum,o=e.timeStamp,r=e.keyword,i=e.cmpid,a=e.tid;return setGmz(t+"|"+i+"|"+(r||"-")+"|sem|-|-|-|"+n+"."+o+"|"+a+"|"+Date.now())},setGmzWithNoSemCmpid=function(e){var t=e.domainHash,n=e.randomNum,o=e.timeStamp,r=e.cmpid,i=e.tid;return setGmz(t+"|"+r+"|-|paid|-|-|-|"+n+"."+o+"|"+i+"|"+Date.now())},setGmzWithoutCmpidOrReferer=function(e){var t=e.domainHash,n=e.randomNum,o=e.timeStamp,r=e.tid;return setGmz(t+"|-|-|direct|-|-|-|"+n+"."+o+"|"+r+"|"+Date.now())},setGmzWithSeoReferer=function(e){var t=e.domainHash,n=e.randomNum,o=e.timeStamp,r=e.refererHost,i=e.keyword,a=e.tid;return setGmz(t+"|"+r+"|"+i+"|seo|-|-|-|"+n+"."+o+"|"+a+"|"+Date.now())},setGmzWithNoSeoReferer=function(e){var t=e.domainHash,n=e.randomNum,o=e.timeStamp,r=e.refererHost,i=e.tid;return setGmz(t+"|"+r+"|-|referrer|-|-|-|"+n+"."+o+"|"+i+"|"+Date.now())},updateGmzWithCmpid=function(e){var t=e.isSemCmpid;return Commit.of(t?setGmzWithSemCmpid:setGmzWithNoSemCmpid)},updateGmzIfGmbIsFresh=function(e){var t=e.isSEOrefer,n=e.refererHost,o=e.cmpid,r=e.isSemCmpid;return o?updateGmzWithCmpid({isSemCmpid:r}):Commit.of(n?t?setGmzWithSeoReferer:setGmzWithNoSeoReferer:setGmzWithoutCmpidOrReferer)},updateGmIfGmbExists=function(e){var t=e.gmz,n=e.isSEOrefer,o=e.refererHost,r=e.cmpid;return r?t&&t.split("|")[1]===r?Commit.of(updateExpireGmABVZ):Commit.of(updateGmABV).flatMap(updateGmzWithCmpid):o&&n?Commit.of(updateGmABV).map(setGmzWithSeoReferer):Commit.of(updateExpireGmABVZ)},baseHitUpdate=function(e){return e.gmb?Commit.of().flatMap(updateGmIfGmbExists):Commit.of(updateGmABV).flatMap(updateGmzIfGmbIsFresh)},updateCookie=function(e){return function(t){return t.gma?Commit.of(function(){return{isPageLoadHit:e}}).flatMap(baseHitUpdate).ap(Commit.of(getGmaBaseInfo)).map(updateGmc):Commit.of(setGmABCV).flatMap(updateGmzIfGmbIsFresh)}},getInitState=Commit.of(getEnvState).flatMap(updateCookie(!0)),hitUpdate=Commit.of(initVar).flatMap(updateCookie(!1)),cookieStore=new Store({}),Gm=function(){function e(){cookieStore.fire(hitUpdate.dispatch())}return e=__decorate([before(function(){return cookieStore.fire(getInitState.dispatch())}),permit(allowBindClick)],e)}(),Processor=function(){function e(){}return e.prototype.init=function(e,t,n){for(var o=[],r=[],i=0,a=e;i<a.length;i++){var s=a[i],u=new s(t,n);u.process&&o.push(u),u.post&&r.push(u)}this.controllers={process:o,post:r},this.store=t},e.prototype.exec=function(e){var t=this.controllers[e];if(t)for(var n=void 0,o=0;n=t[o];)n[e](this.store,this.target)?t.splice(o,1):o++},e}(),CI={ss:function(){return scr.width+"x"+scr.height},cd:function(){return scr.colorDepth||""},ac:function(){return nav.appCodeName||""},an:function(){return nav.appName.indexOf("Microsoft Internet Explorer")>-1?"MSIE":nav.appName},cpu:function(){return nav.cpuClass||nav.oscpu||""},pt:function(){return nav.platform||""},nt:function(){var e="";if(e=nav.connection&&nav.connection.type?nav.connection.type:e)return e;try{doc.body.addBehavior("#default#clientCaps"),e=doc.body.connectionType}catch(t){e=""}return e},la:function(){return nav.systemLanguage||nav.language||""},tz:function(){return(new Date).getTimezoneOffset()/60||""},fv:function(){var f="",n=navigator,ii;if(n.plugins&&n.plugins.length){for(ii=0;ii<n.plugins.length;ii++)if(-1!==n.plugins[ii].name.indexOf("Shockwave Flash")){f=n.plugins[ii].description.split("Shockwave Flash ")[1];break}}else if(window.ActiveXObject)for(ii=10;ii>=2;ii--)try{var fl=eval("new ActiveXObject('ShockwaveFlash.ShockwaveFlash."+ii+"');");if(fl){f=ii+".0";break}}catch(e){}return f},ua:function(){return ua},tid:function(){return tid}},ref=document.referrer.toLowerCase(),PI={dt:function(){return encodeURIComponent(document.title||"-")},dr:function(){var e=/^[^?&#]*.swf([?#])?/;return(""===ref||ref.match(e))&&(ref=stringSplice(window.location.href,"ref","&","")),ref},is_hp:function(){var e="";try{document.body.addBehavior("#default#homePage"),e=document.body.isHomePage(window.location.href)?"Y":"N"}catch(t){e="unkown"}return e},dc:function(){return document.getElementsByTagName("*").length||""},ic:function(){return document.getElementsByTagName("iframe").length},dl:function(){return window.location.href},pid:function(){return win[PAGE_ID]||""},pn:function(){return win._page_name_||""},i:function(){return pageIntcmp},dp:function(){return document.body.getAttribute("data-page")||window[PAGE_ID]||getSubDomain(pageHost,PLUS_REGEX)||"null"},pageId:function(){return win.s&&win.s.page?win.s.page:""}},COOKIE_NEW="isnew",commonGetters=function(e,t){for(var n={},o=0,r=e;o<r.length;o++){var i=r[o];!function(e){n[e]=function(){return t[e]||""}}(i)}return n},UI=__assign({is_new:function(){var e=getCookie(COOKIE_NEW);return""===e?(e=getRandom(),setCookie(COOKIE_NEW,e,7),1):0},uid:function(){return win.userId||""}
},commonGetters(["shop_id","vshop_id","produce_id","sku_id"],BPConfig),{group_id:function(){return win.groupId||""},topic_id:function(){return win.topicId||""}}),startTime=BPConfig.startTime,headEndTime=BPConfig.headEndTime,P={sdate:function(){return BPConfig.serverTime||"-"},lt:function(){return startTime&&loadTime?loadTime-startTime:"-"},rt:function(){return startTime&&readyTime?readyTime-startTime:"-"},fst:function(){return headEndTime&&startTime?headEndTime-startTime:"-"},v:function(){return"1.4.1_2.0"}},COOKIE_LASTTIME="plasttime",SI={plt:function(){var e=getCookie(COOKIE_LASTTIME);if(BPConfig.serverTime)e||(e=BPConfig.serverTime),setCookie(COOKIE_LASTTIME,BPConfig.serverTime,365);else{var t=Math.round((new Date).getTime()/1e3);e||(e=t),setCookie(COOKIE_LASTTIME,t,365)}return e},active_no:function(){return win.active_no?win.active_no:"-"},prds:function(){return win.s?win.s.products:""},es:function(){return win.s?win.s.events:""},oid:function(){return win.s?win.s.purchaseID:""}},collects=function(e){for(var t={},n=Object.keys(e),o=0,r=n;o<r.length;o++){var i=r[o];t[i]=e[i]()}return t},getPvData=function(e){void 0===e&&(e=1);for(var t=cookieStore.getState(),n={},o=0,r=["gma","gmb","gmc","gmv","gmz"];o<r.length;o++){var i=r[o];n["__"+i]=t[i]}var a=(t.gma||"").split("."),s=a[3],u=a[4],c=(t.gmb||"").split("."),d=c[1],f=(t.gmz||"").split("|"),m=f[1];return{t:e,order_id:BPConfig.order_id,order_system:BPConfig.order_system,ci:collects(CI),pi:__assign({st:u,lst:s,spv:d},collects(PI)),ui:__assign({cmpid:m},collects(UI)),si:collects(SI),p:collects(P),ck:n}};getPvData(1).si.prds="qqq",getPvData(1).si.oid="qqq",getPvData(1).si.es="qqq";var bpOnce=!1,loadTime,readyTime,setPvData=function(e){return function(t){return t.commit({key:"pv",data:e})}},Pv=function(){function e(){}return e.prototype.post=function(e){setPvData(getPvData(2))(e)},e=__decorate([before(init),permit(allowPvLog)],e)}(),__decorate$1=undefined&&undefined.__decorate||function(e,t,n,o){var r,i=arguments.length,a=i<3?t:null===o?o=Object.getOwnPropertyDescriptor(t,n):o;if("object"==typeof Reflect&&"function"==typeof Reflect.decorate)a=Reflect.decorate(e,t,n,o);else for(var s=e.length-1;s>=0;s--)(r=e[s])&&(a=(i<3?r(a):i>3?r(t,n,a):r(t,n))||a);return i>3&&a&&Object.defineProperty(t,n,a),a},DomSelector=function(){function e(e,t){this.steps=[],this.isTarget=!0}return e.prototype.process=function(e,t){this.steps.unshift(getNodeIdentifier(t,this.isTarget).toString()),this.isTarget=!1},e.prototype.post=function(e){updateEvent("dom",this.steps.join(">"))(e)},e=__decorate$1([permit(!0)],e)}(),getClickCoordinate=document.all?function(e){return[e.clientX+document.body.scrollLeft,e.clientY+document.body.scrollTop]}:window.Event?function(e){return[e.pageX,e.pageY]}:function(e){return[e.clientX+(document.documentElement.scrollLeft?document.documentElement.scrollLeft:document.body.scrollLeft),e.clientY+(document.documentElement.scrollTop?document.documentElement.scrollTop:document.body.scrollTop)]},getTouchCoordinate=function(e){var t=e.touches[0]||e.changedTouches[0];return[t.pageX,t.pageY]},getCoordinate=isMobile?getTouchCoordinate:getClickCoordinate,getWidth=function(){return window.innerWidth||document.documentElement.clientWidth||document.body.clientWidth},Coordinate=function(){function e(e,t){var n=getCoordinate(t);n.push(getWidth()),updateEvent("coordinate",n.join(","))(e)}return e=__decorate([permit(!0)],e)}(),SendEvent=function(){function e(){}return e.prototype.post=function(e){var t=e.getState(PROP_EVENT);if(t.i||t.UBAid){var n=e.getState("pv");n.e=t,sendLogByPost(n,!0),updateAnchorHref()(e)}},e=__decorate([permit(allowBindClick)],e)}(),isbrowser=function(){try{var e={};return Object.defineProperty(e,"bloger",{get:function(){return"\u9ad8\u7248\u672c"}}),!0}catch(t){return!1}}(),getOmnitrue=function(e){var t=win.s,n=t.products,o=t.purchaseID,r=getPvData(2);r.si.prds=n,r.si.oid=o,r.si.es=e,sendLogByPost(r)},eventsGloable,events,Omnitrue=function(){function e(){}return e=__decorate([before(function(){function e(t){void 0===t&&(t=0),win.s&&win.s.events?(t&&(events=win.s.events,eventsGloable=events,getOmnitrue(events)),isbrowser?(events=win.s.events,Object.defineProperty(win.s,"events",{get:function(){return this.__events||events},set:function(e){this.__events!=e&&setTimeout(function(){getOmnitrue(e)},100),this.__events=e}})):setInterval(function(){(events=win.s.events)&&events!=eventsGloable&&(eventsGloable=events,setTimeout(function(){getOmnitrue(events)},100))},500)):setTimeout(function(){e(1)},300)}eventsGloable=win.s&&win.s.events,e()}),permit(allowBindClick)],e)}();win.BP=BP,load(),clearRequestQueue(),setInterval(clearRequestQueue,5e3)}();