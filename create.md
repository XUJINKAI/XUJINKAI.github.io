---
layout: frame
title: 主页
component: markdown katex
sidebar: 
drawer-close: true
---
<script src="/static/editor/kramed.min.js"></script>
<script src="/static/highlight/highlight.min.js"></script>
<link href="/static/highlight/monokai-sublime.css" rel="stylesheet" type="text/css"/>
<!-- <link href="/static/render/rouge-monokai.css" rel="stylesheet" type="text/css"/> -->
<link rel="stylesheet" href="/static/tocbot/tocbot.css">
<script src="/static/tocbot/tocbot.min.js"></script>

<style>
html {
    height: 100%;
}
body {
    height: calc(100% - 70px);
}
.full-container {
    height: calc(100% - 40px);
}
.content-container {
    height: 100%;
}
.full-container,
.content-container {
    width: 100%;
    max-width: 100%;
    margin: 0;
    padding: 0px;
}
.toolbar-container {
    background-color: grey;
}
.content-container > div {
    height: 100%;
}
.markdown-editor {
    overflow: scroll;
    padding: 0 3.5em;
}
#raw-markdown {
    width: 100%;
    font-size: 1.1em;
    resize: none;
    max-width: 768px;
    float: right;
    font-family: consolas;
    border: 0;
    padding: 0em 0em 0em 0em;
}
#raw-markdown:focus {
    outline: none;
}
.markdown-preview {
    overflow: scroll;
    max-width: 768px;
    border: 0px;
    background-color: #f3f3f3;
    padding: 2em 3.5em 100px 3.5em;
}
.toc {
    padding-top: 2em;
}
.toc-list {
    padding-left: 18px;
}
.toc-list .is-active-link {
    font-weight: normal;
}
.toc-link::before,
.is-active-link::before {
    background-color: #fff;
}
.toc-list li {
    padding: 8px 0px 0px 0.8em
}
</style>

<div class="mdui-container full-container">
    <div class="toolbar-container">
        <button onclick="changeSaveFile(1)">存档1</button>
        <button onclick="changeSaveFile(2)">存档2</button>
        <button onclick="changeSaveFile(3)">存档3</button>
    </div>
    <div class="mdui-container content-container">
        <div class="mdui-col-md-5 markdown-editor">
            <textarea id="raw-markdown"></textArea>
        </div>
        <div class="mdui-col-md-5 markdown-preview"></div>
        <div class="mdui-col-md-2">
            <div class="toc"></div>
        </div>
    </div>
</div>

<script>
var selector_textarea = "#raw-markdown";
var selector_left = ".markdown-editor";
var selector_right = ".markdown-preview";
var selector_toc = ".toc";
function renderCode(){
    $('pre code').each(function(i, block) {
        hljs.highlightBlock(block);
    });
};
function renderTeX(){
    var tex_list = $(".markdown-body tex");
    for (var i = 0; i < tex_list.length; i++) {
        var tex = tex_list[i];
        katex.render(tex.innerText, tex);
    }
};
function renderMarkdown(text, selector_to){
    var html = kramed(text);
    html = "<div class='markdown-body'>"+html+"</div>";
    $(selector_to).html(html);
    renderCode();
    renderTeX();
};
function syncScroll(from, to){
    $(from).scroll(function() {
        var elementFrom = $(from)[0];
        var elementTo = $(to)[0];
        var fromHeight = elementFrom.scrollHeight;
        var fromTop = elementFrom.scrollTop;
        var toHeight = elementTo.scrollHeight;
        var toTop = elementTo.scrollTop;
        var containerHeight = $(".mdui-container").height();
        var scrollPercentage = fromTop / (fromHeight - containerHeight);
        var scrollTo = scrollPercentage * (toHeight - containerHeight * 1);
        $(to).scrollTop(scrollTo);
    });
};
function textarea_handle_special_keydown(){
    $("textarea").keydown(function(e) {
        // 没有history，修改文本后无法ctrl z，所以直接屏蔽掉
        if(e.keyCode === 9) { // tab was pressed
            e.preventDefault();
        }
    });
};
function openInNew(selector){
    $(selector + " a").click(function(e){
        window.open($(this).attr("href"));
        e.preventDefault();
    })
};
function createToc(){
    tocbot.init({
        // Where to render the table of contents.
        tocSelector: selector_toc,
        // Where to grab the headings to build the table of contents.
        contentSelector: selector_right,
        // Which headings to grab inside of the contentSelector element.
        headingSelector: 'h1, h2, h3',
        scrollSmoothDuration: 200,
        isCollapsedClass: 'is-collapsed-', //disable collapse
    });
};
function get_rawValue(){return $(selector_textarea)[0].value;}
function set_rawValue(text){$(selector_textarea)[0].value = text;}
function textareaScrollHeight(){
    var scrollHeight = $(selector_textarea)[0].scrollHeight;
    var minHeight = $(".markdown-editor").height() - 40;
    if(scrollHeight < minHeight) scrollHeight = minHeight;
    $(selector_textarea).height(scrollHeight);//?
};
var CurrentSaveFileNum = localStorage.getItem("CurrentSaveFileNum") || 1;
function changeSaveFile(num){
    CurrentSaveFileNum = num;
    localStorage.setItem("CurrentSaveFileNum", num);
    set_rawValue(getCurrentSaveFile());
    render();
};
function getCurrentSaveFile(){
    return localStorage.getItem("CurrentSaveFile_" + CurrentSaveFileNum);
};
function setCurrentSaveFile(text){
    localStorage.setItem("CurrentSaveFile_" + CurrentSaveFileNum, text);
};
function render(){
    var raw = get_rawValue();
    renderMarkdown(raw, selector_right);
    openInNew(selector_right);
    createToc();
    textareaScrollHeight();
    syncScroll(selector_left, selector_right);
};
$(function(){
    set_rawValue(getCurrentSaveFile());
    render();
    $(selector_left).bind('input propertychange', function() {
        setCurrentSaveFile(get_rawValue());
        render();
    });
    textarea_handle_special_keydown();

    $(selector_left).scroll(function() {
        syncScroll(selector_left, selector_right);
    });
});
</script>