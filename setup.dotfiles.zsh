#!/usr/bin/env zsh
# 
# DESCRIPTION
# 
# NOTE
# 
# Author: Adebayo Braimah

set -k # Ignore comments

dev_dir=${HOME}/Development/GitHub/dotfiles

link=https://github.com/AdebayoBraimah/dotfiles/archive/refs/tags/v0.0.1.zip

if [[ ! -d ${dev_dir} ]]; then
  mkdir -p ${dev_dir}
fi

cd ${dev_dir}

curl -L ${link} > file.zip

repo_name=$(echo ${link} | cut -d "/" -f 5)
version=$(echo ${link} | cut -d "/" -f 9 | sed "s@v@@g" | sed "s@.zip@@g")
name=${dev_dir}/${repo_name}-${version}

if [[ -d ${name} ]]; then
  rm -rf ${name}
fi

unzip file.zip
rm file.zip

cd ${name}

# Sym-link dot files to home directory
files=( 
  .zshrc 
  .gitignore 
  .inputrc 
  .osx 
  .vimrc 
  .bash_profile
  .gitconfig
  )

for file in ${files[@]}; do
  cp ${file} ${HOME}/
done
