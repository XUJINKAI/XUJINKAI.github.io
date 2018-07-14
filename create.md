---
layout: frame
title: Markdown Editor
component: markdown katex
drawer-close: 
---
<script src="/static/editor/kramed.min.js"></script>
{% include syntax-highlighter.html %}

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
.markdown-input,
.markdown-input-test {
    width: 100%;
    font-size: 1.05em;
    line-height: 1.6em;
    resize: none;
    max-width: 768px;
    float: right;
    font-family: consolas;
    border: 0;
    padding: 0em 0em 0em 0em;
    overflow: hidden;
}
.markdown-input:focus {
    outline: none;
}
.markdown-input-test {
    z-index: -1;
    height: 0;
}
.markdown-preview {
    overflow: scroll;
    max-width: 768px;
    border: 0px;
    background-color: #f3f3f3;
    padding: 2em 3.5em 100px 3.5em;
}
#scrollToTop,
#scrollToComment {
    display: none !important;
}
#toc {
    padding-top: 2em;
}
#toc .is-active-link,
#toc .toc-link::before,
#toc .is-active-link::before {
    font-weight: normal !important;
    color: black !important;
}
.savefile-button.active {
    font-weight: bolder;
    text-decoration: underline;
}
</style>

<div class="mdui-container full-container">
    <div class="toolbar-container">
        <button onclick="changeSaveFile(1)" class="savefile-button" data="1">存档1</button>
        <button onclick="changeSaveFile(2)" class="savefile-button" data="2">存档2</button>
        <button onclick="changeSaveFile(3)" class="savefile-button" data="3">存档3</button>
        <button onclick="InsertMetaData()">Insert MetaData</button>
        <button onclick="DownloadFile()">Dwonload</button>
        <span>字数：</span><span class="markdown-length"></span>
        <button style="float: right; color: red;" onclick="ClearLocalStorage();">清空全部数据</button>
    </div>
    <div class="mdui-container content-container">
        <div class="mdui-col-md-5 markdown-editor">
            <textarea class="markdown-input" id="raw-markdown"></textArea>
            <textarea class="markdown-input-test"></textArea>
        </div>
        <div class="mdui-col-md-5 markdown-preview"></div>
        <div class="mdui-col-md-2">
{% include toc.html %}
        </div>
    </div>
</div>

<script>
var regex_jekyll_format = /^---(.*?)---(.*)$/s;
var selector_input = ".markdown-input";
var selector_input_test = ".markdown-input-test";
var selector_left = ".markdown-editor";
var selector_right = ".markdown-preview";
var selector_toc = "#toc";
var CurrentSaveFileNum = localStorage.getItem("CurrentSaveFileNum");
if(CurrentSaveFileNum === null){
    CurrentSaveFileNum = 1;
    var content = getCurrentSaveFile();
    if(content === null){
        var url = "https://raw.githubusercontent.com/XUJINKAI/XUJINKAI.github.io/master/_posts/2018-07-03-本博客网站介绍.md";
        $.get(url, function(data){
            if(getCurrentSaveFile() === null){
                set_rawValue(data);
                setCurrentSaveFile(data);
                render();
            }
        });
    }
}
function ClearLocalStorage(){
    mdui.confirm("这会清空所有存档中的数据，确认吗？", function(){
        localStorage.removeItem("CurrentSaveFileNum");
        localStorage.removeItem("CurrentSaveFile_1");
        localStorage.removeItem("CurrentSaveFile_2");
        localStorage.removeItem("CurrentSaveFile_3");
        location = "/";
    });
}
function NewMetaData(){
    var date = (new Date()).toISOString();
    var s = "---\npermalink: /posts/new\ndisplay: normal\ntitle: \ntags: \nemotag: \ndate: " + date;
    s += "\ncomment: true\nlayout: post\ncomponent: katex\n---\n";
    return s;
};
function InsertMetaData(){
    var text = NewMetaData() + get_rawValue();
    set_rawValue(text);
    setCurrentSaveFile(text);
};
function download(data, filename, type) {
    var file = new Blob([data], {type: type});
    if (window.navigator.msSaveOrOpenBlob) // IE10+
        window.navigator.msSaveOrOpenBlob(file, filename);
    else { // Others
        var a = document.createElement("a"),
                url = URL.createObjectURL(file);
        a.href = url;
        a.download = filename;
        document.body.appendChild(a);
        a.click();
        setTimeout(function() {
            document.body.removeChild(a);
            window.URL.revokeObjectURL(url);  
        }, 0); 
    }
};
function DownloadFile(){
    var date = (new Date()).toISOString().substr(0, 10) + "-";
    download(get_rawValue(), date + ".md", "markdown");
};
function syncScroll(from, to){
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
};
function textarea_handle_special_keydown(){
    $("textarea").keydown(function(e) {
        // 没有history，修改文本后无法ctrl z，所以直接屏蔽掉
        if(e.keyCode === 9) { // tab was pressed
            e.preventDefault();
        }
    });
};
function get_rawValue(){return $(selector_input)[0].value;}
function set_rawValue(text){$(selector_input)[0].value = text;}
function textareaScrollHeight(){
    $(selector_input_test)[0].value = $(selector_input)[0].value;
    var scrollHeight = $(selector_input_test)[0].scrollHeight + 80;
    var minHeight = $(".markdown-editor").height() - 40;
    if(scrollHeight < minHeight) scrollHeight = minHeight;
    $(selector_input).height(scrollHeight);
};
function changeSaveFile(num){
    CurrentSaveFileNum = num;
    localStorage.setItem("CurrentSaveFileNum", num);
    set_rawValue(getCurrentSaveFile());
    render();
    activeSavefileButton();
};
function activeSavefileButton(){
    $(".savefile-button").removeClass("active");
    $(".savefile-button[data="+CurrentSaveFileNum+"]").addClass("active");
}
function getCurrentSaveFile(){
    return localStorage.getItem("CurrentSaveFile_" + CurrentSaveFileNum);
};
function setCurrentSaveFile(text){
    localStorage.setItem("CurrentSaveFile_" + CurrentSaveFileNum, text);
};
function set_markdownLength(length){
    $(".markdown-length").text(length);
};
function render(){
    var metadata = "";
    var raw = get_rawValue();
    set_markdownLength(raw.length);
    if(regex_jekyll_format.test(raw)){
        var regResult = regex_jekyll_format.exec(raw);
        metadata = regResult[1];
        raw = regResult[2];
    }
    // markdown
    var html = kramed(raw);
    html = "<pre style='line-height: 1.5em;'>"+metadata+"</pre>" + "<div class='markdown-body'>"+html+"</div>";
    $(selector_right).html(html);
    // code highlight
    syntax_highlighter('pre code');
    // tex
    var tex_list = $(".markdown-body tex");
    for (var i = 0; i < tex_list.length; i++) {
        var tex = tex_list[i];
        katex.render(tex.innerText, tex);
    }
    // link in new tab
    $(selector_right + " a").click(function(e){
        window.open($(this).attr("href"));
        e.preventDefault();
    })
    //
    TocRender(selector_right, selector_toc);
    textareaScrollHeight();
    syncScroll(selector_left, selector_right);
};
$(function(){
    activeSavefileButton();
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