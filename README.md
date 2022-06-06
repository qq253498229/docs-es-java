
```
📒 repository //根目录。默认在项目根目录，可以在playbook通过start_path、start_paths指定目录
    📄 antora.yml //文档描述文件。
    📂 modules //文档上级目录。必须和antora.yml同级，最少包含一个ROOT模块或者是其它名称的模块
        📂 ROOT //必须使用大写，其中至少包含一个子目录
            📁 attachments //附件子目录
            📁 examples //样例子目录
            📁 images //图片子目录
            📁 pages //页面子目录
            📁 partials //代码块子目录
            📄 nav.adoc //导航文件
        📂 named-module //自定义模块，和ROOT类似，也至少包含一个子目录
            📁 pages
            📄 nav.adoc //导航文件
    📁 packages //该文件不会被antora处理，因为它位于modules目录之外
```
