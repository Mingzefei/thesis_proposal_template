% !Mode:: "TeX:UTF-8"
%%%%% 'buaathesisproposal.cls' BEGIN

%%%%%%%%%% class clarification %%%%%%%%%%
% 模板声明
% modified from buaathesis v0.9 (by BHOSC)

\NeedsTeXFormat{LaTeX2e}[2007/10/19]
\ProvidesClass{buaathesisproposal}
              [2020/03/05 v0.9
The LaTeX template for thesis proposal of BUAA]
\typeout{Document Class `buaathesisproposal' v0.1 by HGB (2023/11)}

%%%%%%%%%% class options %%%%%%%%%%
% 模板选项

% 本模板自身包含五个选项
% 前四个为对应学位类型，决定不同样式
% 第五个为颜色选项，用于电子版的情况
\newif\ifbuaa@bachelor\buaa@bachelorfalse
\newif\ifbuaa@master\buaa@masterfalse
\newif\ifbuaa@doctor\buaa@doctorfalse
\newif\ifbuaa@professional\buaa@professionalfalse
\newif\ifbuaa@classfied\buaa@classfiedfalse
\newif\ifbuaa@color\buaa@colorfalse
\newif\ifbuaa@twoteacher\buaa@twoteacherfalse
\newif\ifbuaa@ktreport\buaa@ktreportfalse
\DeclareOption{bachelor}{\buaa@bachelortrue}
\DeclareOption{master}{\buaa@mastertrue}
\DeclareOption{doctor}{\buaa@doctortrue}
\DeclareOption{professional}{\buaa@professionaltrue}
\DeclareOption{classfied}{\buaa@classfiedtrue}
\DeclareOption{color}{\buaa@colortrue}
\DeclareOption{twoteacher}{\buaa@twoteachertrue}
\DeclareOption{ktreport}{\buaa@ktreporttrue}
\PassOptionsToPackage{quiet}{fontspec}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexart}} % 抑制 ctex 中一些不影响编译的输出
\ProcessOptions\relax
\LoadClass[a4paper,UTF8,titlepage,zihao=-4,AutoFakeBold]{ctexart}

%%%%%%%%%% global package %%%%%%%%%%
% 全局通用宏包
\RequirePackage{ifthen}

%%%%%%%%%% font %%%%%%%%%%
% 数学相关和字体设置

\RequirePackage{amsmath,amssymb,amsfonts,mathrsfs,bm}
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\RequirePackage{txfonts}

%%%%%%%%%% hyphen %%%%%%%%%%
% For the `\hyp{}` command. Allow the user to insert `hyp{}` manually to
% adjust the line break when necessary.
\RequirePackage{hyphenat}

% 主要字体为Times New Roman和宋体
% 模板某些标题需要华文行楷和32号字
\setmainfont{Times New Roman}
% 不需要设置CJKmainfont，ctex 宏包已经很好的处理了
% 不仅设置了粗体为黑体，斜体为楷体，还兼容了winfonts和adobefonts
% 直接设置反而会在只有adobefonts的情况下报错
% \setCJKmainfont{宋体}
% 重新定义了一下宋体和黑体，让其能支持textbf
% 华文行楷、华文楷体同上
\let\songti\relax
\let\heiti\relax
\setCJKfamilyfont{songti}[AutoFakeBold = {2.17}]{SimSun}
\setCJKfamilyfont{heiti}[AutoFakeBold = {2.17}]{SimHei}
\setCJKfamilyfont{hwxingkai}[AutoFakeBold = {2.17}]{STXingkai}
\setCJKfamilyfont{hwkaiti}[AutoFakeBold = {2.17}]{STKaiti}
\newcommand{\songti}{\CJKfamily{songti}}
\newcommand{\heiti}{\CJKfamily{heiti}}
\newcommand{\hwxingkai}{\CJKfamily{hwxingkai}}
\newcommand{\hwkaiti}{\CJKfamily{hwkaiti}}

% 修改了原本的预设字体
% 中文字号：https://www.jianshu.com/p/03c121c0868d
% （但我仍不确定 Word 中的 48/32 号字是否就是 4832 pt）
% 设置方法：\fontsize{字体尺寸}{行间距}\selectfont
% LaTeX中，默认的行距是字体字号的1.2倍，新版本的Word默认行距是字体字号的1.3倍
% 而在 ctexart 中默认行距是字号的 1.56 倍
\newcommand{\xiaochuhao}{\fontsize{36pt}{\baselineskip}\selectfont}
\newcommand{\yihao}{\fontsize{26pt}{39pt}\selectfont}
\newcommand{\xiaoyi}{\fontsize{24pt}{36pt}\selectfont}
\newcommand{\erhao}{\fontsize{22pt}{33pt}\selectfont}
\newcommand{\xiaoer}{\fontsize{18pt}{27pt}\selectfont}
\newcommand{\sanhao}{\fontsize{16pt}{24pt}\selectfont}
\newcommand{\xiaosan}{\fontsize{15pt}{22.5pt}\selectfont}
\newcommand{\sihao}{\fontsize{14pt}{21pt}\selectfont}
\newcommand{\xiaosi}{\fontsize{12pt}{18pt}\selectfont}
\newcommand{\wuhao}{\fontsize{10.5pt}{15.75pt}\selectfont}
\newcommand{\xiaowu}{\fontsize{9pt}{13.5pt}\selectfont}
\newcommand{\liuhao}{\fontsize{7.5pt}{11.25pt}\selectfont}
\newcommand{\fortyeight}{\fontsize{48pt}{60pt}\selectfont}
\newcommand{\thirtytwo}{\fontsize{32pt}{48pt}\selectfont}

%%%%%%%%%% color %%%%%%%%%%
% 颜色设置

% 只用于电子版
\RequirePackage{color}
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

%%%%%%%%%% page margin %%%%%%%%%%
% 页面边距
% 上 25.4 mm，下 25.4 mm，左 20 mm，右 20 mm
% 页眉顶端距离 15 mm，页脚底端距离 17.5 mm
\RequirePackage{geometry}
\newgeometry{
    top=25.4mm, bottom=33.3mm, left=20mm, right=20mm,
    headsep=10.4mm, headheight=5mm, footskip=7.9mm,
}
\savegeometry{geometry}
\loadgeometry{geometry}


%%%%%%%%%% space %%%%%%%%%%
% 其他间距

\renewcommand{\baselinestretch}{1.5}
\setlength{\parindent}{2em}
\setlength{\floatsep}{3pt plus 3pt minus 2pt}      % 图形之间或图形与正文之间的距离
\setlength{\abovecaptionskip}{10pt plus 1pt minus 1pt} % 图形中的图与标题之间的距离
\setlength{\belowcaptionskip}{3pt plus 1pt minus 2pt} % 表格中的表与标题之间的距离

%%%%%%%%%% header & footer %%%%%%%%%%
% 页眉页脚

\RequirePackage{fancyhdr}
\newif\iff@nch@compatViii
\let\f@nch@gbl\relax
\let\f@nch@gbl\global
    \f@nch@compatViiitrue

\fancypagestyle{contentsmatter}{
    \fancyhead{}
    \fancyfoot{}
  \renewcommand{\footrulewidth}{0bp}
  \renewcommand{\headrulewidth}{0bp} % 页眉线宽度
}

\fancypagestyle{mainmatter}{
    \fancyhead{}
    \fancyfoot{}
    \fancyfoot[C]{
        \thepage
    }
  \renewcommand{\footrulewidth}{0bp}
  \renewcommand{\headrulewidth}{0bp} % 页眉线宽度
}

\fancypagestyle{plain}{
    \pagestyle{fancy}
}

%%%%%%%%%% section number %%%%
% 章节标题
\RequirePackage{zhnumber} % change section number to chinese
\renewcommand\thesection{\zhnum{section}}

%%%%%%%%%% title %%%%%%%%%%
% 标题

% 汉化
\renewcommand{\contentsname}{\hfill\heiti\sanhao\bfseries 目\qquad 录 \hfill}
% \CTEXsetup[format={\Large\bfseries}]{section}
% 设置章节编号
\renewcommand\thesection{\chinese{section}}
\renewcommand\thesubsection{\arabic{section}.\arabic{subsection}}
\renewcommand\thesubsubsection{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}
% 格式
\ctexset{
    section={
        format={\bfseries\sihao\heiti},
        aftername={\quad},
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
    },
    subsection={
        format={\sihao\heiti},
        aftername={\quad},
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
    },
    subsubsection={
        format={\bfseries\xiaosi\songti},
        aftername={\quad},
        beforeskip={.5\baselineskip},
        afterskip={.5\baselineskip},
    },
}

%%%%%%%%%% contents %%%%%%%%%%
% 目录

\RequirePackage{titletoc}
\titlecontents{section}[2em]{\vspace{0.1\baselineskip}\xiaosi\songti}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsection}[4em]{\vspace{0.1\baselineskip}\xiaosi\songti}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}
\titlecontents{subsubsection}[6em]{\vspace{0.1\baselineskip}\xiaosi\songti}{\thecontentslabel\ }{}
    {\hspace{.5em}\titlerule*[4pt]{$\cdot$}\contentspage}


%%%%%%%%%% cross reference %%%%%%%%%%
% 交叉引用

\RequirePackage[xetex,unicode]{hyperref}
\ifbuaa@color
    \hypersetup{colorlinks}
\else
    \hypersetup{hidelinks}
\fi
\hypersetup{
    bookmarksnumbered,
    bookmarksopen,
    pdftitle={BUAA thesis},
    pdfauthor={BUAAer},
    pdfsubject={北航学位论文开题报告},
    pdfcreator={LaTeXed~By~BUAAer}
}

%%%%%%%%%% reference %%%%%%%%%%
% 参考文献
\RequirePackage{gbt7714}
\renewcommand{\bibsection}{}

%%%%%%%%%% table %%%%%%%%%%
% 表格

% 设置三线表格的上下边为粗实线
\RequirePackage{booktabs}

% 长表格
\RequirePackage{longtable}

% 表格中的行合并
\RequirePackage{multirow}

% 重定义table/tabular/tabularx环境，使表格内为5号字
% TODO(huxuan): 支持 longtable
\let\oldtable\table
\let\endoldtable\endtable
\renewenvironment{table}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtable[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtable}

\let\oldtabular\tabular
\let\endoldtabular\endtabular
\renewenvironment{tabular}[1][h!]
{\renewcommand{\arraystretch}{1.5}
\oldtabular[#1]\zihao{5}}
{\renewcommand{\arraystretch}{1}
\endoldtabular}

\RequirePackage{tabularx}
\let\oldtabularx\tabularx
\let\endoldtabularx\endtabularx
\renewenvironment{tabularx}[2]
{\renewcommand{\arraystretch}{1.5}
\zihao{5}\oldtabularx{#1}{#2}}
{\renewcommand{\arraystretch}{1}
\endoldtabularx}


\RequirePackage{array}

%%%%%%%%%% picture %%%%%%%%%%
% 图片

\RequirePackage{graphicx}
\graphicspath{{figure/}}
\RequirePackage{pifont} % “秘级”后的五角星
\RequirePackage{subfigure}

%%%%%%%%%% list %%%%%%%%%%
% 列表

\RequirePackage{enumitem}
\setlist{noitemsep}
\setlist[1,2]{labelindent=\parindent}
\setlist[enumerate,1]{label=\arabic*、}
\setlist[enumerate,2]{label=（\arabic*）}
\setlist{
    topsep=0pt,
    itemsep=0pt,
    partopsep=0pt,
    parsep=\parskip,
}

%%%%%%%%%% code %%%%%%%%%%
% 代码

% Listing 的设置请参考 http://en.wikibooks.org/wiki/LaTeX/Packages/Listings
\RequirePackage{listings}
\lstset{
    backgroundcolor=\color{white},
    basicstyle=\zihao{5}\ttfamily,
    columns=flexible,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    frame=single,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    stepnumber=1,
    rulecolor=\color{black},
    tabsize=2,
    texcl=true,
    title=\lstname,
    escapeinside={\%*}{*)},
    extendedchars=false,
    mathescape=true,
    xleftmargin=3em,
    xrightmargin=3em,
}
\ifbuaa@color
    \lstset{
        numberstyle=\color{gray},
        keywordstyle=\color{blue},
        commentstyle=\color{dkgreen},
        stringstyle=\color{mauve},
    }
\else
    \lstset{
        numberstyle=\color{black},
        keywordstyle=\color{black},
        commentstyle=\color{black},
        stringstyle=\color{black},
    }
\fi

% 重命名Listings标题头
\renewcommand{\lstlistingname}{代码}

%%%%%%%%%% file directory %%%%%%%%%%
% 文件目录

\RequirePackage{dirtree}
\ifbuaa@color
    \renewcommand*\DTstylecomment{\ttfamily\color{dkgreen}}
    \renewcommand*\DTstyle{\ttfamily\color{red}}
\fi

%%%%%%%%%% caption %%%%%%%%%%
% 图表标题

\RequirePackage{caption}
\DeclareCaptionFormat{masterfigure}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{mastertable}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\DeclareCaptionFormat{masterlstlisting}{\bf\songti\zihao{5}{#1\textrm{#2}#3}}
\RequirePackage{remreset}
\@removefromreset{table}{chapter}
\@removefromreset{figure}{chapter}
%使图表的标号与章节无关
\captionsetup[figure]{format=masterfigure,labelsep=quad}
\captionsetup[table]{format=mastertable,labelsep=quad}
\captionsetup[lstlisting]{format=masterlstlisting,labelsep=quad}
\renewcommand{\thefigure}{\arabic{figure}}
\renewcommand{\thetable}{\arabic{table}}
\renewcommand{\theequation}{\arabic{equation}}

% Fix subfigure reference bug
\let\p@subfigure=\thefigure

% 图片表格标题命令，主要用于混排
\newcommand\figcaption{\def\@captype{figure}\caption}
\newcommand\tabcaption{\def\@captype{table}\caption}


%%%%%%%%%% other settings %%%%%%%%%%
% 杂项

% 下划线
\RequirePackage{ulem}

% 设置行距
\RequirePackage{setspace}

%%%%%%%%%% index %%%%%%%%%%
% 首页

% 中文首页
\newcommand{\titlech}{
   \begin{titlepage}
        \newgeometry{
            top=30.9mm, bottom=21.8mm, left=20mm, right=20mm,
        }
        \begin{flushleft}
            \zihao{5}\heiti\bfseries
            中图分类号：\buaa@category  \\
            \vskip 6pt
            学\quad\qquad 号：\buaa@studentID\\
        \end{flushleft}
        \begin{center}
        \vskip 21 mm
        \includegraphics[width=.55\textwidth]{figure/buaaname_ch.pdf}
        \vskip 14 mm
        \begin{minipage}[h]{\textwidth}
            \centering
            \fortyeight\ziju{0.1}\hwxingkai\buaa@degreehead 论文开题报告  
        \end{minipage}
        \vskip 17 mm
        \begin{minipage}[h]{.85\textwidth}
            \centering
            \begin{spacing}{1}
                \thirtytwo\heiti\bfseries\buaa@thesistitle
            \end{spacing}
        \end{minipage}
        \end{center}
        \vspace*{\fill}
        \begin{minipage}[!b]{\textwidth}
            \begin{spacing}{2.6}
                \heiti\zihao{4}
                \hspace{19 mm}
                \begin{tabular}[b]{ll}
                    学生姓名：& \buaa@thesisauthor\\
                    指导教师：& \buaa@teacher \quad\buaa@teacherdegree\\
                    学科专业：& \buaa@major\\
                    培养学院：& \buaa@school 学院\\
                    报告日期：& \buaa@thesisdateyear ~~年~~\buaa@thesisdatemonth ~~月~~\buaa@thesisdateday ~~日\\
                \end{tabular}
            \end{spacing}
        \end{minipage}
    \end{titlepage}
}


%%%%%%%%%% settings for custom pages %%%%%%%%%%
% 首页
\renewcommand{\maketitle}{%
    \titlech
    \songti
    \zihao{-4}
}
% 目录页
\newcommand{\makecontents}{
    \pagestyle{contentsmatter}
    \tableofcontents
    \newpage
    \setcounter{page}{1} % 从下面开始编页码
}


%%%%%%%%%% common user info %%%%%%%%%%
% 用户信息
% 学号
\def\buaa@studentID{}
\newcommand{\studentID}[1]{%
    \def\buaa@studentID{#1}
}
% 学校名称
\def\buaa@university{北京航空航天大学}
\def\buaa@universityeng{Beihang University}
\newcommand{\university}[2]{%
    \def\buaa@university{#1}
    \def\buaa@universityeng{#2}
}
% 学院
\def\buaa@school{}
\def\buaa@schooleng{}
\newcommand{\school}[2]{%
    \def\buaa@school{#1}
    \def\buaa@schooleng{#2}
}
% 专业
\def\buaa@major{}
\def\buaa@majoreng{}
\newcommand{\major}[2]{%
    \def\buaa@major{#1}
    \def\buaa@majoreng{#2}
}
% 论文标题和副标题
\def\buaa@thesistitle{}
\def\buaa@thesissubtitle{}
\def\buaa@thesistitleeng{}
\def\buaa@thesissubtitleeng{}
\newcommand{\thesistitle}[4]{%
    \def\buaa@thesistitle{#1}
    \def\buaa@thesissubtitle{#2}
    \def\buaa@thesistitleeng{#3}
    \def\buaa@thesissubtitleeng{#4}
}
% 作者
\def\buaa@thesisauthor{}
\def\buaa@thesisauthoreng{}
\newcommand{\thesisauthor}[2]{%
    \def\buaa@thesisauthor{#1}
    \def\buaa@thesisauthoreng{#2}
}
% 指导老师
\def\buaa@teacher{}
\def\buaa@teachereng{}
\newcommand{\teacher}[2]{%
    \def\buaa@teacher{#1}
    \def\buaa@teachereng{#2}
}
% 导师职称
\def\buaa@teacherdegree{}
\def\buaa@teacherdegreeeng{}
\newcommand{\teacherdegree}[2]{%
    \def\buaa@teacherdegree{#1}
    \def\buaa@teacherdegreeeng{#2}
}
% 分类号
\def\buaa@category{}
\newcommand{\category}[1]{%
    \def\buaa@category{#1}
}
% 时间
\def\buaa@thesisdateyear{}
\def\buaa@thesisdatemonth{}
\def\buaa@thesisdateday{}
\newcommand{\proposaldate}[3]{%
    \def\buaa@thesisdateyear{#1}
    \def\buaa@thesisdatemonth{#2}
    \def\buaa@thesisdateday{#3}
}
% 学位
\def\buaa@degree{} % 中文首页
\def\buaa@degreeeng{} % 英文首页
\def\buaa@degreetitle{} % 题名页
\def\buaa@degreehead{} % 页眉页脚
\newcommand{\degree}[4]{%
    \def\buaa@degree{#1}
    \def\buaa@degreeeng{#2}
    \def\buaa@degreetitle{#3}
    \def\buaa@degreehead{#4}
}
\ifbuaa@bachelor
    \degree{学士学位}{Bachelor}{学士学位}{学士}
\else
    \ifbuaa@master
        \ifbuaa@professional
            \degree{专业硕士学位}{Master}{硕士学位}{硕士}
        \else
            \degree{硕士学位}{Master}{硕士学位}{硕士}
        \fi
    \else
        \ifbuaa@professional
            \degree{专业博士学位}{Doctor of Philosophy}{博士学位}{博士}
        \else
            \degree{博士学位}{Doctor of Philosophy}{博士学位}{博士}
        \fi
    \fi
\fi


%%%%% 'buaathesisproposal.cls' %%%%% END
