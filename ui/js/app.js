(function(e){function n(n){for(var t,r,c=n[0],l=n[1],d=n[2],u=0,b=[];u<c.length;u++)r=c[u],Object.prototype.hasOwnProperty.call(i,r)&&i[r]&&b.push(i[r][0]),i[r]=0;for(t in l)Object.prototype.hasOwnProperty.call(l,t)&&(e[t]=l[t]);s&&s(n);while(b.length)b.shift()();return a.push.apply(a,d||[]),o()}function o(){for(var e,n=0;n<a.length;n++){for(var o=a[n],t=!0,c=1;c<o.length;c++){var l=o[c];0!==i[l]&&(t=!1)}t&&(a.splice(n--,1),e=r(r.s=o[0]))}return e}var t={},i={app:0},a=[];function r(n){if(t[n])return t[n].exports;var o=t[n]={i:n,l:!1,exports:{}};return e[n].call(o.exports,o,o.exports,r),o.l=!0,o.exports}r.m=e,r.c=t,r.d=function(e,n,o){r.o(e,n)||Object.defineProperty(e,n,{enumerable:!0,get:o})},r.r=function(e){"undefined"!==typeof Symbol&&Symbol.toStringTag&&Object.defineProperty(e,Symbol.toStringTag,{value:"Module"}),Object.defineProperty(e,"__esModule",{value:!0})},r.t=function(e,n){if(1&n&&(e=r(e)),8&n)return e;if(4&n&&"object"===typeof e&&e&&e.__esModule)return e;var o=Object.create(null);if(r.r(o),Object.defineProperty(o,"default",{enumerable:!0,value:e}),2&n&&"string"!=typeof e)for(var t in e)r.d(o,t,function(n){return e[n]}.bind(null,t));return o},r.n=function(e){var n=e&&e.__esModule?function(){return e["default"]}:function(){return e};return r.d(n,"a",n),n},r.o=function(e,n){return Object.prototype.hasOwnProperty.call(e,n)},r.p="";var c=window["webpackJsonp"]=window["webpackJsonp"]||[],l=c.push.bind(c);c.push=n,c=c.slice();for(var d=0;d<c.length;d++)n(c[d]);var s=l;a.push([0,"chunk-vendors"]),o()})({0:function(e,n,o){e.exports=o("56d7")},"56d7":function(e,n,o){"use strict";o.r(n);var t=o("7a23");const i=Object(t["e"])("audio",{id:"audio_on",src:"mic_click_on.ogg"},null,-1),a=Object(t["e"])("audio",{id:"audio_off",src:"mic_click_off.ogg"},null,-1),r={key:0,class:"voiceInfo"},c={key:0},l=Object(t["e"])("strong",null,"Voice:",-1),d=Object(t["d"])(),s={key:0},u={key:1},b=Object(t["e"])("strong",null,"Radio:",-1),v=Object(t["d"])();function f(e,n,o,f,g,p){return Object(t["f"])(),Object(t["b"])("body",null,[i,a,f.voice.visible?(Object(t["f"])(),Object(t["b"])("div",r,[f.voice.voiceModes.length?(Object(t["f"])(),Object(t["b"])("p",c,[l,d,Object(t["e"])("span",{class:{talking:f.voice.talking}},[Object(t["d"])(Object(t["h"])(f.voice.voiceModes[f.voice.voiceMode][1])+" ",1),0!==f.voice.callInfo?(Object(t["f"])(),Object(t["b"])("span",s,"(On Call)")):Object(t["c"])("",!0)],2)])):Object(t["c"])("",!0),f.voice.radioEnabled&&0!==f.voice.radioChannel?(Object(t["f"])(),Object(t["b"])("p",u,[b,v,Object(t["e"])("span",{class:{talking:f.voice.usingRadio}},Object(t["h"])(f.voice.radioChannelFormatted)+" MHz",3)])):Object(t["c"])("",!0)])):Object(t["c"])("",!0)])}var g={name:"App",setup(){const e=Object(t["g"])({visible:!0,voiceModes:[],voiceMode:0,radioChannel:0,radioChannelFormatted:"Disconnect",radioEnabled:!1,usingRadio:!1,callInfo:0,talking:!1});return window.addEventListener("message",(function(n){const o=n.data;if(void 0!==o.visible&&(e.visible=o.visible),void 0!==o.voiceModes&&(e.voiceModes=JSON.parse(o.voiceModes)),void 0!==o.voiceMode&&(e.voiceMode=o.voiceMode),void 0!==o.radioChannel)if(e.radioChannel=o.radioChannel,e.radioChannel&&0!==e.radioChannel){if(e.radioChannel.toString().length>3)var t=e.radioChannel.toString().substring(0,2),i=e.radioChannel.toString().substring(2,4);else t=e.radioChannel.toString().substring(0,1),i=e.radioChannel.toString().substring(1,3);i.length<2&&(i="0"+i),e.radioChannelFormatted=t+"."+i}else e.radioChannelFormatted="Disconnect";if(void 0!==o.radioEnabled&&(e.radioEnabled=o.radioEnabled),void 0!==o.callInfo&&(e.callInfo=o.callInfo),o.usingRadio!==e.usingRadio&&(e.usingRadio=o.usingRadio,e.usingRadio&&(e.talking=!0)),void 0!==o.talking&&(e.talking=o.talking,e.talking||(e.usingRadio=!1)),o.sound&&e.radioEnabled){let e=document.getElementById(o.sound);e.load(),e.volume=o.volume,e.play().catch(e=>{})}})),{voice:e}}};o("e134");g.render=f;var p=g;Object(t["a"])(p).mount("#app")},9235:function(e,n,o){},e134:function(e,n,o){"use strict";o("9235")}});