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
.mdui-container > div {
    height: 100%;
}
.mdui-container {
    width: 100%;
    max-width: 100%;
    height: 100%;
    margin: 0;
    padding: 10px;
    padding-top: 3em;
}
#raw-markdown {
    width: 100%;
    height: 100%;
    font-size: 1.1em;
    resize: none;
    max-width: 768px;
    float: right;
    font-family: consolas;
}
#raw-markdown:focus {
    outline: none;
}
.markdown-preview {
    overflow: scroll;
    max-width: 768px;
    border: 1px solid #a7a7a7;
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

<div class="mdui-container">
    <div class="mdui-col-md-5 markdown-editor">
        <textarea id="raw-markdown"></textArea>
    </div>
    <div class="mdui-col-md-5 markdown-preview"></div>
    <div class="mdui-col-md-2 toc"></div>
</div>

<script>
var selector_left = "#raw-markdown";
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
        var scrollTo = scrollPercentage * (toHeight - containerHeight * 0.8);
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
function render(){
    var raw = $(selector_left)[0].value;
    renderMarkdown(raw, selector_right);
    openInNew(selector_right);
    createToc();
    syncScroll(selector_left, selector_right);
};
$(function(){
    $(selector_left)[0].value = localStorage.getItem("md");
    render();
    $(selector_left).bind('input propertychange', function() {
        localStorage.setItem("md", $(selector_left)[0].value);
        render();
    });
    textarea_handle_special_keydown();

    $(selector_left).scroll(function() {
        syncScroll(selector_left, selector_right);
    });
});
</script>