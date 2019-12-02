<p align="center"><img src="http://www.ucas.ac.cn/newStyle/images/lougou.png"></p>

# `UCAS Beamer` (LaTeX)
> [中国科学院大学](http://www.ucas.ac.cn/) Beamer (LaTeX) - 非官方的模版

## 简介
* 集简洁、优雅、严肃的特性，用于报告展示的 Beamer (LaTeX) 模板，供中国科学院大学本科生、硕士生、博士生、留学生及各研究所研究人员自由使用，反馈意见请联系 [icgw@outlook.com](mailto:icgw@outlook.com)；
* 查看 \[[输出样例](https://github.com/icgw/ucas-beamer/releases/download/v1.1/template-zh.pdf)\] \[[下载](https://github.com/icgw/ucas-beamer/archive/v1.1.zip)\]
* 若你想用 PowerPoint 做展示，转至 \[[中国科学院大学官方提供的 PowerPoint 模板](http://onestop.ucas.edu.cn/Home/Info/e1e7b553-14c1-42f3-910a-88d25ebf9c48)\] \[[下载](http://onestop.ucas.edu.cn/Content/Upload/2019/4/2.zip)\]

## 安装 TeX Live
* [官方安装](https://www.tug.org/texlive/)
* [清华大学开源软件镜像站](https://mirrors.tuna.tsinghua.edu.cn/CTAN/systems/texlive/)

## 在线使用
* 推荐：[Overleaf](https://www.overleaf.com) 在线 LaTeX 编辑器

## 使用方法
* 离线使用
  - 手动方式：安装完 TeX Live 之后，先用 `xelatex` 对 `main.tex` 编译一次，再用 `biber` 编译一次，最后用 `xelatex` 连续编译两次；
  - 自动方式：`./build.sh xb main`
* 在线使用：
  1. 下载此模板的压缩包并上传至 Overleaf 的 Project；
    - 模板 \[[下载页面](https://github.com/icgw/ucas-beamer/releases)\]
    - `New Project` - `Upload Project` - `Select a .zip file`
  2. 编译器选项设置为 `XeLaTeX`，然后重新编译即可。
    - `Menu` - `Settings` - `Compiler` - `XeLaTeX`
    - `Recompile`

<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/"><img alt="知识共享许可协议" style="border-width:0" src="https://i.creativecommons.org/l/by-sa/4.0/88x31.png" /></a><br />本作品采用<a rel="license" href="http://creativecommons.org/licenses/by-sa/4.0/">知识共享署名-相同方式共享 4.0 国际许可协议</a>进行许可。
