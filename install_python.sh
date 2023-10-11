#!/bin/bash

# 更新源 和安装编译工具
sudo apt update
sudo apt install -y build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev wget pkg-config

export http_proxy=http://192.168.31.107:7890/
export https_proxy=$http_proxy

# 下载Python 3.11.6 源码
wget https://www.python.org/ftp/python/3.11.6/Python-3.11.6.tgz

# 解压
tar -zxf Python-3.11.6.tgz 

# 编译安装
cd Python-3.11.6
./configure --enable-optimizations
make -j 8
sudo make altinstall

# 输出Python版本确认
python3.11 -V