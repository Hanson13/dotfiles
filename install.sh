#!/bin/bash

# 定义颜色，让输出好看一点
GREEN='\033[0.32m'
BLUE='\033[0.34m'
NC='\033[0m' # 无颜色

echo -e "${BLUE}开始安装 Dotfiles...${NC}"

# 1. 获取当前脚本所在目录的绝对路径
DOTFILES_DIR=$(cd $(dirname $0); pwd)

# 2. 定义需要链接的文件 (源文件:目标位置)
# 格式: "文件名:目标路径"
files=(
    ".tmux.conf:~/.tmux.conf"
    ".vimrc:~/.vimrc"
)

# 3. 执行软链接
for item in "${files[@]}"; do
    src="${item%%:*}"
    dest="${item#*:}"
    
    # 扩展 ~ 路径
    dest_eval=$(eval echo $dest)
    
    echo -e "正在链接 ${BLUE}$src${NC} -> ${BLUE}$dest${NC}"
    
    # 如果目标已存在且不是链接，先备份
    if [ -f "$dest_eval" ] && [ ! -L "$dest_eval" ]; then
        echo "备份旧文件: $dest_eval.bak"
        mv "$dest_eval" "$dest_eval.bak"
    fi
    
    ln -sf "$DOTFILES_DIR/$src" "$dest_eval"
done

# 4. 自动安装 Tmux 插件管理器 (TPM)
if [ ! -d "~/.tmux/plugins/tpm" ]; then
    echo -e "${BLUE}正在安装 Tmux TPM...${NC}"
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

echo -e "${GREEN}安装完成！${NC}"
echo "提示: 进入 tmux 后按下 'Prefix + I' 来安装插件。"

# 自动安装 vim-plug (Vim 插件管理器)
if [ ! -f "~/.vim/autoload/plug.vim" ]; then
    echo "正在安装 vim-plug..."
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi
