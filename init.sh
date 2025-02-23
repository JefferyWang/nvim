# get the system type
platform='unknown'
system='unknown'
unamestr=$(uname)
if [[ "$unamestr" == 'Linux' ]]; then
  platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then
  platform='macos'
  system='macos'
else
  echo "Unsupported platform"
  exit 1
fi

# check if the system is archlinux or debian
if [[ $platform == 'linux' ]]; then
  if [[ -f /etc/arch-release ]]; then
    system='archlinux'
  elif [[ -f /etc/debian_version ]]; then
    system='debian'
  else
    echo "Unsupported linux distribution"
    exit 1
  fi
fi

# install neovim and other dependencies
if [[ $system == 'archlinux' ]]; then
  sudo pacman -S neovim curl git lazygit fzf ripgrep fd gcc --noconfirm
elif [[ $system == 'debian' ]]; then
  curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
  sudo rm -rf /usr/nvim
  sudo tar -C /usr -xzf nvim-linux-x86_64.tar.gz
  sudo mv /usr/nvim-linux-x86_64 /usr/nvim
  sudo ln -s /usr/nvim/bin/nvim /usr/bin/nvim
  sudo apt install -y curl git lazygit fzf ripgrep fd-find gcc
elif [[ $system == 'macos' ]]; then
  brew install neovim curl git lazygit fzf ripgrep fd
fi

# if the nvim directory exists, backup it
if [[ -d ~/.config/nvim ]]; then
  rm -Rf ~/.config/nvim
  rm -Rf ~/.local/share/nvim
  rm -Rf ~/.local/state/nvim
  rm -Rf ~/.cache/nvim
fi

git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git
