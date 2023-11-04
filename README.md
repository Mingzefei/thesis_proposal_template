# BUAA thesis proposal template

北京航空航天大学开题报告 Latex 模板

## 说明

- 本项目依据辅导员及往届学长提供的开题报告 Word 模板制作，非官方模板，仅供参考。
- 本项目适用于 14 系的硕/博士开题，各学院的开题报告模板并不统一，注意各学院具体要求。
- 目前仍在完善，欢迎提交 bug/issue/branch。

## 预览

查阅 [main.pdf](./main.pdf) 文件。

## 使用

0. 安装依赖：

模板依赖 v2.0 及以上版本的 ctex 包，请使用较新版本的 LaTeX 发行版（已在 TeXLive 2023 上通过测试）。此外，对于非 Windows 环境，需要确认已安装 `Times New Roman` 等字体库。

```bash
echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | sudo debconf-set-selections
sudo apt-get install -y ttf-mscorefonts-installer
```

1. 下载模板：

```bash
# 方法一：使用 git clone
git clone https://github.com/Mingzefei/thesis_proposal_template.git
# 方法二：直接下载 zip 包，解压。
```

2. 填写信息：编辑 `com_info.tex` 文件。

3. 添加内容：编辑 `main.tex` 文件。

4. 添加参考文献：编辑 `bibs.bib` 文件。

5. 编译：

```bash
# 方法一：使用 Makefile
make build # 编译
make clean # 删除编译过程中生成的文件（不包括 pdf）
make depclean # 删除编译过程中生成的文件（包括 pdf）
# 方法二：使用 Vscode 相关插件
# xelatex->bibtex->xelatex*2 编译
```

## 其他

1. 本项目主要参考 [BHOSC/BUAAthesis](https://github.com/BHOSC/BUAAthesis)，同时沿用其开源协议 GPLv3 和 LPPL。
2. 文件格式转换请参考 [文件格式相关](https://github.com/BHOSC/BUAAthesis#%E6%96%87%E4%BB%B6%E6%A0%BC%E5%BC%8F%E7%9B%B8%E5%85%B3).
3. 封面为手工调整，所以存在一定细微差异和不影响结果的报错。介意的同学可以在 Word 中填好信息，转化为 PDF 后进行替换。
4. 项目依据辅导员及往届学长提供的开题报告 Word 模板制作，所以确实存在排版上不严谨的地方。当前项目目标仅是通过开题审查。
