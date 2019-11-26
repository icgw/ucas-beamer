#! /bin/sh
#
# build.sh
# Copyright (C) 2019 Guowei Chen <icgw@outlook.com>
#
# Distributed under terms of the GPL license.
#
set -e

#
# get file's name
#
if [[ $# == "1" ]]; then
  fileName=`echo *.tex`
elif [[ $# == "2" ]]; then
  fileName=$2
else
  echo "---------------------------------------------------------------------------"
  echo "Usage: "$0"  -<l|p|x><x|a|b>  <filename>"
  echo "TeX engine parameters: <l:lualatex>, <p:pdflatex>, <x:xelatex>"
  echo "Bib engine parameters: <x:none>, <a:bibtex>, <b:biber>"
  echo "---------------------------------------------------------------------------"
  exit
fi
fileName=${fileName%".tex"}

#
# get tex compiler
#
if [[ $1 == 'l'* ]]; then
  texC="lualatex"
elif [[ $1 == 'p'* ]]; then
  texC="pdflatex"
else
  texC="xelatex"
fi

#
# get bib compiler
#
if [[ $1 == *'a' ]]; then
  bibC="bibtex"
elif [[ $1 == *'b' ]]; then
  bibC="biber"
else
  bibC="biber"
fi

# set LaTeX environmental variables to add subdirs into search path
export TEXINPUTS=".//:$TEXINPUTS" # paths to locate .tex 
export BIBINPUTS=".//:$BIBINPUTS" # paths to locate .bib
export BSTINPUTS=".//:$BSTINPUTS" # paths to locate .bst

tmpDir="temp"
if [[ ! -d ${tmpDir} ]]; then
  mkdir -p ${tmpDir}/
fi

# build textual content and auxiliary files
${texC} -output-directory=${tmpDir} ${fileName} || exit

# build references and links
if [[ -n ${bibC} ]]; then
  #- fix the inclusion path for hierarchical auxiliary files
  sed -i -e "s|\@input{|\@input{${tmpDir}/|g" ${tmpDir}/"$fileName".aux
  # extract and format bibliography database via auxiliary files
  ${bibC} ${tmpDir}/${fileName} || exit
  # insert reference indicators into textual content
  ${texC} -output-directory=${tmpDir} ${fileName} || exit
  # refine citation references and links
  ${texC} -output-directory=${tmpDir} ${fileName} || exit
fi

# set PDF viewer
if [[ `uname` == "Linux" ]]; then
  pdfViwer="xdg-open"
else
  pdfViwer="open"
fi

${pdfViwer} ./${tmpDir}/${fileName}.pdf || exit
echo "---------------------------------------------------------------------------"
echo "${texC} ${bibC} ${fileName}.tex finished..."
echo "---------------------------------------------------------------------------"
