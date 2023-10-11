#!/bin/bash

# 设置变量
PY_VERSION=3.11
PY_PATH=/usr/local/bin/python$PY_VERSION

# 1. 更新alternatives
sudo update-alternatives --install /usr/bin/python python $PY_PATH 1
sudo update-alternatives --install /usr/bin/python3 python3 $PY_PATH 1

# 2. 调整软链接 
sudo rm -f /usr/bin/python
sudo rm -f /usr/bin/python3
sudo ln -s $PY_PATH /usr/bin/python
sudo ln -s $PY_PATH /usr/bin/python3

# 3. 修改PATH优先级
echo "export PATH=$PY_PATH:\$PATH" >> ~/.bashrc
source ~/.bashrc

# 4. 测试版本
python --version
python3 --version