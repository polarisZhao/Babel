## Zsh Usage

#### 1. 安装 zsh

~~~shell
sudo apt-get install zsh
~~~

#### 2. 安装 oh my zsh

~~~shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
~~~

#### 3. 修改主题

主题可以在 https://github.com/robbyrussell/oh-my-zsh/wiki/Themes　查找，直接在`~/.zshrc` 中修改即可．

~~~python
vim ~/.zshrc

# line 11
ZSH_THEME="agnoster"
# 修改为需要的目录即可
~~~

#### 4. 安装 Powerline 字体

~~~shell
# 将 Powerline 字体文件下载到「下载」文件夹中
cd ~/Downloads && git clone https://github.com/powerline/fonts.git	
cd fonts && ./install.sh	# 安装所有 Powerline 字体
cd && rm -rf ~/Downloads/fonts	# 删除下载的字体文件
~~~

终端 --> Edit --> Customer Font 选择一款 Powerline 字体（所有可选项请参考 Powerline 的 [GitHub 页面](https://link.zhihu.com/?target=https%3A//github.com/powerline/fonts)），调整一下字体大小即可。在这里我选择了 DejaVu Sans Mono for Powerline 字体（逮虾户！），大小设置为 14 磅。

#### 5. 常见用法

- 输入 grep 然后用上下箭头可以翻阅你执行过的所有 grep 命令
- tab补全:路径补全、命令补全，命令参数补全，插件内容补全等等。触发补全只需要按一下或两下 tab 键，补全项可以使用 `ctrl+n/p/f/b`上下左右切换。
- 目录浏览和跳转:输入 `d`，即可列出你在这个会话里访问的目录列表，输入列表前的序号，即可直接跳转

#### 6. 安装插件

oh my zsh里提供了非常多的插件，相关文件在`~/.oh-my-zsh/plugins`文件夹下，默认有100多种，我们可以根据自己的实际需要加载特定的插件。插件也是在`～/.zshrc`里配置，找到`plugins`关键字，你就可以加载自己的插件了，系统默认加载 git ，你可以在后面追加内容。

##### (1) git

当你处于git的目录下时，Shell 会明确显示 git 和 branch，另外对 git 很多命令进行了简化，例如 `gco=’git checkout’`、`gd=’git diff’`、`gst=’git status’`、`g=’git’`等等，熟练使用可以大大减少 git 的命令长度，命令内容可以参考 `~/.oh-my-zsh/plugins/git/git.plugin.zsh`

##### (2) 自动补全和代码高亮

~~~shell
#　下载自动补全插件
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-autosuggestions

#　下载代码高亮插件
cd ~/.oh-my-zsh/custom/plugins/
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git

# 配置
vim ~/.zshrc
#　添加如下配置
# plugins=(
#    git
#    zsh-autosuggestions
#    zsh-syntax-highlighting
# )

#　激活
source ~/.zshrc
~~~

##### (3) autojump

autojump可以说是zsh必备插件，有点双剑合璧的意思。安装了autojump之后，zsh会自动记录你访问过的目录，通过j+目录就可以直接进行目录跳转，而且目录名支持模糊匹配和自动补全，例如你访问过～/workspace目录，输入j wor即可正确跳转，如图。j –stat 可以看你的历史路径库。

~~~
$ git clone git://github.com/wting/autojump.git

$ cd autojump
$ ./install.py or ./uninstall.py
# 添加到环境

$ source ~/.zshrc
~~~

![img](https://pic1.zhimg.com/80/40060f8fc7fc6d14ce3e7e94dee6c518_hd.png)

##### (4) last-working-dir

last-working-dir 插件，可以记录上一次退出Shell时的所在路径，并且在下一次启动Shell时自动恢复到退出时所在的路径。这一切不需要进行任何操作，全部都是自动完成的。



#### 7. 命令纠错

如图，输入

```text
sudp apt-get install
```

nyae会提示`zsh: correct 'sudp' to 'sudo' [nyae]?`接下来直接按y/n就行了。真是太贴心了有木有

![img](https://pic1.zhimg.com/80/fbe2eeec558980e943abce2ee0b3947c_hd.png)

那如何开启nyae提示呢？

打开`～/.zshrc`，找到配置项更改为“true”即可

```text
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"
```

#### 8. 别名

在　`~/.zshrc`　可以进行别名的配置，　配置的示例为:

~~~shell
alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"
~~~

#### 9. 参考链接：

[1] [为啥说zsh是shell中的极品](https://www.zhihu.com/question/21418449/answer/300879747)

[2] https://zhuanlan.zhihu.com/p/19556676

[3] https://zhuanlan.zhihu.com/p/62501175