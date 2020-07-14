# `UCAS Beamer` (LaTeX)
![UCAS Beamer][UCAS Beamer Gif]

## 简介
* 简洁、优雅、严肃的 Beamer (LaTeX) 中文模板，供中国科学院大学本科生、硕士生、博士生、等科研工作者学习使用。如果你有任何疑问，无需犹豫，通过 [E-mail](mailto:icgw@outlook.com) 联系我。
* 查看 \[[样例](https://github.com/icgw/ucas-beamer/releases/download/v1.2/template-zh.pdf)\] \[[下载](https://github.com/icgw/ucas-beamer/archive/zh-CN.zip)\]
* 此外，如果你想要 PowerPoint 模版，推荐使用 \[[中国科学院大学官方提供的 PowerPoint 模板][UCAS PPT template Page]\] \[[下载][UCAS PPT template download link]\]

## 安装 TeX Live
* [官方安装](https://www.tug.org/texlive/)
* [清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/)

## 在线使用
* 推荐：[Overleaf](https://www.overleaf.com) 在线 LaTeX 编辑器

## 使用方法
* 离线使用 (需要安装和配置 TeX 编译环境)
  - 方式一：安装完 TeX Live 之后，先用 `xelatex` 对 `main.tex` 编译一次 (生成文本内容和辅助文件)，再用 `biber` 编译一次 (通过辅助文件抽取文献引用信息)，最后用 `xelatex` 连续编译两次 (将引用标记插入文本内容、生成目录、添加链接等)
  - 方式二：`./build.sh main` (Linux 或 Mac)
* 在线使用 (无需安装 TeX 环境但需要连接至互联网)
  1. 下载此模板压缩包并上传至 Overleaf 的 Project
    - 模板 \[[下载](https://github.com/icgw/ucas-beamer/releases)\]
    - `New Project` - `Upload Project` - `Select a .zip file`
  2. 编译方式选为 `XeLaTeX`
    - `Menu` - `Settings` - `Compiler` - `XeLaTeX`
    - `Recompile`

## 许可说明
<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">知识共享署名-相同方式共享 4.0 国际许可协议</a>进行许可。

[UCAS PPT template Page]: http://onestop.ucas.edu.cn/Home/Info/e1e7b553-14c1-42f3-910a-88d25ebf9c48
[UCAS PPT template download link]: http://onestop.ucas.edu.cn/Content/Upload/2019/4/2.zip
[UCAS Beamer Gif]: https://raw.githubusercontent.com/icgw/ucas-beamer/zh-CN/.github/example.gif
