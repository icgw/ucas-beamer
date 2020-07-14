#! /bin/sh
#
# build.sh
# Copyright (C) 2019 Guowei Chen <icgw@outlook.com>
#
# Distributed under terms of the GPL license.
#
set -e

#
# 获取 TeX 文件名
#
if [[ $# == "1" ]]; then
  fileName=`echo *.tex`
else
  echo "---------------------------------------------------------------------------"
  echo "Usage: "$0" <filename>"
  echo "TeX engine XeLaTeX"
  echo "Bib engine Biber"
  echo "---------------------------------------------------------------------------"
  exit
fi
fileName=${fileName%".tex"}

#
# 设置 TeX 编译方式
#
texC="xelatex"

#
# 设置文献信息编译方式
#
bibC="biber"

# 设置 LaTeX 环境变量和搜索路径为当前目录
export TEXINPUTS=".//:$TEXINPUTS" # *.tex 的路径
export BIBINPUTS=".//:$BIBINPUTS" # *.bib 的路径
export BSTINPUTS=".//:$BSTINPUTS" # *.bst 的路径

tmpDir="temp"
if [[ ! -d ${tmpDir} ]]; then
  mkdir -p ${tmpDir}/
fi

# 编译文本内容和辅助文件
${texC} -output-directory=${tmpDir} ${fileName} || exit

# 编译引用和链接
if [[ -n ${bibC} ]]; then
  # 在辅助文件中添加路径
  sed -i -e "s|\@input{|\@input{${tmpDir}/|g" ${tmpDir}/"$fileName".aux
  # 通过辅助文件抽取文献引用格式
  ${bibC} ${tmpDir}/${fileName} || exit
  # 插入引用标记到文本内容
  ${texC} -output-directory=${tmpDir} ${fileName} || exit
  # 重新精炼引用和链接
  ${texC} -output-directory=${tmpDir} ${fileName} || exit
fi

# 设置 PDF 阅读器
if [[ `uname` == "Linux" ]]; then
  pdfViwer="xdg-open"
else
  pdfViwer="open"
fi

${pdfViwer} ./${tmpDir}/${fileName}.pdf || exit
echo "---------------------------------------------------------------------------"
echo "${texC} ${bibC} ${fileName}.tex finished..."
echo "---------------------------------------------------------------------------"
