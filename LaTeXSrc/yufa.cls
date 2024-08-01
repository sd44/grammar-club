\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dingjia}[2018/12/08 dingjia book class]
% \RequirePackage[l2tabu, orthodox]{nag} %编译时，给出过时命令和不规范使用警告。

\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=ding,
  prefix=ding@
}


\LoadClass[UTF8, fontset = noto, a4paper, twoside, zihao =
5, scheme=chinese, heading = true]{ctexbook}

\ctexset{%
  abstractname = {摘\quad 要},  % book类没有摘要
  today = {small},
  % subsection/format += \centering,
  part/pagestyle = empty,
  % chapter = {
  % pagestyle = empty, beforeskip = {-30pt}, afterskip = {20pt plus 5pt}},
  section = {beforeskip = {3ex plus 1ex minus 0.2ex}, afterskip = {2.3ex
      plus 0.2ex}},
  subsection = {beforeskip = {3ex plus 1ex minus 0.2ex},
    afterskip = {1.5ex plus 0.2ex}, name={,、},
    number=\chinese{subsection},aftername={\,}, indent=0pt},
  subsubsection = {beforeskip = {1ex plus
      1ex minus 0.2ex}, afterskip = {0.5ex plus 0.2ex}},
  paragraph = {beforeskip = {1ex plus 1ex minus 0.2ex}, afterskip = {0.2ex plus 0.1ex
      minus 0.2ex},
    format += \raggedright, aftertitle += \@@par}, }


% iftex有｝bug，注销掉。
% \RequirePackage{iftex}
% \ifXeTeX
%   % LuaLaTeX 没有以下设置，只有XeTeX有。
%   \XeTeXgenerateactualtext=1
%   \xeCJKsetup{CJKmath=true}
%   \xeCJKsetup{xCJKecglue=true}
% \fi

\xeCJKsetup{CJKmath=true}
\global\hyphenpenalty=5000
\global\tolerance=1000

\defaultfontfeatures{Scale=MatchLowercase}

\RequirePackage[bodytextleadingratio = 1.68, restoremathleading = true,
footnoteleadingratio = 1.6]{zhlineskip}


\RequirePackage{amsmath, % amssymb,
  xfrac}
\RequirePackage[math-style=ISO, bold-style=ISO]{unicode-math} %注意，unicode-math与被其认为过时的bm包不兼容，不要\RequirePackage{bm}
\setmathfont[Scale = 1.1]{TeX Gyre Pagella Math}  % 因Libertinus目前的数学字体暂还没
% 有粗体，这里设置为允许伪粗体渲染。

\setmainfont[Scale=1.1]{TeX Gyre Pagella}
\setsansfont[Scale=1.1]{TeX Gyre Heros}
\setmonofont{Noto Sans Mono Condensed}


% \RequirePackage{microtype} % 改善单词、字母间距


\RequirePackage{verse}

% from package hyperref
\RequirePackage{hyperref}
\hypersetup{%
  colorlinks = true,
  citecolor=magenta,
  linkcolor=blue,
  bookmarks=true,
  bookmarksnumbered = true,
  bookmarksdepth = section,
  bookmarksopen = true,
  pdftitle = {英语魔法师之语法俱乐部},
  pdfauthor = {施元佑},
  pdfcreator = {sd44sd44@yeah.net},
}


\def\UrlFont{\ttfamily}



% 插图所需的宏包
\RequirePackage[table, dvipsnames]{xcolor}
\RequirePackage{graphicx}
\graphicspath{{figures/}}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{zhspace}{：}
\captionsetup{font=small, labelfont=bf, labelsep = zhspace, format = hang, figureposition=bottom, tableposition=top}
\newcommand{\capsource}[1]{ \vspace{-8pt} \caption*{\mdseries \footnotesize {#1}} } % 自定义图表来源
% 命令，vspace可酌情调整。

\RequirePackage{etoolbox}
% % 脚注按页编号
\RequirePackage{pifont}
\let\oldding\ding% Store old \ding in \oldding
\renewcommand{\ding}[2][1]{\scalebox{#1}{\oldding{#2}}}% Scale \oldding via optional argument

\RequirePackage[perpage, hang, symbol*]{footmisc}
\DefineFNsymbols{cqufnsymbol}{
  {\ding[1.1]{172}}    {\ding[1.1]{173}}
  {\ding[1.1]{174}}    {\ding[1.1]{175}}
  {\ding[1.1]{176}}    {\ding[1.1]{177}}
  {\ding[1.1]{178}}    {\ding[1.1]{179}}
  {\ding[1.1]{180}}    {\ding[1.1]{181}}
}
% 定义footnote的表示方法为cqufnsymbol
\setfnsymbol{cqufnsymbol}
% minipage需要额外定义一行
\renewcommand\thempfootnote{\fnsymbol{mpfootnote}}

\RequirePackage{scrextend}
\deffootnote{0em}{1.6em}{\thefootnotemark\enskip}

\AtBeginEnvironment{quotation}{\itshape }


\RequirePackage{geometry}
\geometry{%
  a4paper,
  heightrounded,
  includemp = false, % includes the margin notes, \marginparwidth and \marginparsep, into body when calculating horizontal calculation.
  inner = 3.5cm,
  outer = 3cm,
  % marginparwidth = 80pt,
  top = 3cm,
  bottom = 3cm,
  headheight = 6mm,
  headsep = 10mm,
  footskip = 10mm,
}

\RequirePackage{fancyhdr}
% \pagestyle{headings}
% \fancyhf{} % clear all header and footer fields
% \lhead{}
% \rhead{}
% \chead{\slshape \zihao{5} \leftmark}
\pagestyle{fancy}
\fancyhf{} % clear all header and footer fields
\fancyhead[LE,RO]{\slshape \small \thepage}
\fancyhead[RE]{\slshape \small \leftmark}
\fancyhead[LO]{\slshape \small \rightmark}
\renewcommand{\headrulewidth}{0.75pt}
\renewcommand{\footrulewidth}{0pt}
\fancyheadoffset{0cm}

\RequirePackage{emptypage} %空白页没有页眉页脚

\setlength\parskip{0em plus 4pt minus 2pt}

% 注意以下设定是为book/article所设，如是beamer的话需要修改。
\RequirePackage{pdfpages, pdflscape}
\RequirePackage{siunitx}
\sisetup{
  group-digits=none,
  tight-spacing=true,
  % round-mode=places,
  % round-precision=2,
  % round-integer-to-decimal=true,
  % per-mode=symbol,
  table-number-alignment=center,
}

\RequirePackage[usestackEOL]{stackengine}
\RequirePackage{multirow, tabularx, diagbox}

\RequirePackage{bookmark}
\RequirePackage{booktabs}
% \RequirePackage{lscape}
\RequirePackage{float}

% 双栏排版
\RequirePackage{multicol}
\setlength\columnsep{20pt} % This is the default columnsep for all pages

% 有时候, 浮动的边注在双面模式下会出现在错误的一侧, mparhack 可以修正该问题
% \RequirePackage{mparhack}

% for format of contents
\RequirePackage{tocloft}
\RequirePackage{tocbibind}
\renewcommand\cftdot{…}
\renewcommand{\cftdotsep}{0}
% \renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % ctexart的目录中，section也加点。
% \renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % ctexbook中，chapter也加点。

\renewcommand{\cfttoctitlefont}{\hfill\Large\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill} %使“目录”居中显示，将其中的toc改为lof
% 和lot，则会使浮动体列表和表格列表也居中显示

% \renewcommand{\contentsname}{\hspace*{\fill}\bfseries\Large
% 目录 \hspace*{\fill}}   % 不使用tocloft宏包时也适用的命令。

\renewcommand{\listfigurename}{插图索引}
\renewcommand{\listtablename}{表格索引}

% 设置目录中各级缩进
% \setlength{\cftsecindent}{2.5em}
\setlength{\cftsubsecindent}{4em}
\setlength{\cftsubsecnumwidth}{2.8em}
%
% 设置目录中 chapter 章节编号的宽度 (ctex 章节编号为中文, 需要特别注意).
% 参考 <<LaTeX 入门>>, 刘海洋 编著, 电子工业出版社, 2013.6
% \settowidth\cftchapnumwidth{第十章} % 最宽的可能编号
% \renewcommand\cftchapaftersnumb{\hspace{0.5em}} % 额外间距
% 定义所有的图片文件在 figures 子目录下
\graphicspath{{figures/}}
%
\newenvironment{dedications}
{
  \clearpage
  \thispagestyle{empty}
  \vspace*{\stretch{1.5}}% some space at the top
  \large \itshape
  % \raggedleft          % flush to the right margin
  \par % end the paragraph
}
{\par % end the paragraph
  \vspace{\stretch{3}} % space at bottom is three times that at the top
  \clearpage           % finish off the page
}

% 使用unicode字体中的单个罗马数字实现
\def\rnum#1{\symbol{\numexpr"216F+#1\relax}}
\def\Rnum#1{\symbol{\numexpr"215F+#1\relax}}
\def\uroman#1{\rnum{\the\value{#1}}}
\def\uRoman#1{\Rnum{\the\value{#1}}}
\newcommand{\Ronum}[1]{\uppercase\expandafter{\romannumeral #1\relax}}

\RequirePackage[shortlabels]{enumitem}
% \topsep 列表顶部与之前内容的额外空白，不含 \baselineskip
% \partopsep 如果列表之前是一个空行，列表顶部的额外空白
% \itemsep  列表各项之间额外的垂直空白
% \parsep 一个 item 中，如果分段，段落间额外空白
% \leftmargin 列表与左边距之间的水平距离，值为非负
% \rightmargin 列表与右边距之间的水平距离，值为非负
% \itemindent 每一 item 第一行的缩进
% \listparindent 每一 item各段首行的缩进
% \labelsep 标签盒子与每一 item 第一行文本之间距离
% \labelwidth 标签盒子的宽度；如果标签过长，这一宽度会自动变大，直到列表的第一行文本为止
% \setlist{leftmargin= \parindent, itemindent = \parindent, listparindent =
%   \parindent, %labelindent = \parindent,
%   parsep = 0ex, partopsep = 0ex, itemsep = 0.5em }


\setlist{topsep=5pt, partopsep=0pt}
\setlist[2]{align=right, itemindent=2\parindent} % Only the level 2

\setlist[enumerate]{leftmargin= 0ex, itemindent = 1.2\parindent,
  listparindent = 1.2\parindent, labelindent=1em, labelwidth=1.5em, parsep
  = 0ex, itemsep = 0.5em, align=right, ref=例\arabic* }
% \setlist[description]{style=nextline, font=\sffamily\bfseries}
\setlist[description]{font=\sffamily\bfseries}

\RequirePackage{tikz, pgfplots}
\tikzset{every picture/.style={/utils/exec={\footnotesize}}}
\usetikzlibrary{calc,patterns,decorations.pathreplacing, intersections}
\usetikzlibrary{arrows,arrows.meta, datavisualization}

\pgfplotsset{
  % compat=newest,
  compat=1.18,
  compat/show suggested version=false,
  tick label style={font=\tiny},
  label style={font=\small},
  legend style={font=\footnotesize},
  label shift=-4pt,
}

\newdimen\XCoord
\newdimen\YCoord

\newcommand*{\ExtractCoordinate}[1]{\path (#1); \pgfgetlastxy{\XCoord}{\YCoord};}%
\newcommand*{\LabelCurrentCoordinate}[2]{\fill [#1] ($(\XCoord,\YCoord)$) circle (2pt) node [right] {#2}}%

\usepackage{tcolorbox}
\tcbuselibrary{most}

\newtcolorbox{mybox}{colback=red!5!white, colframe=red!75!black}
% \newtcolorbox{mybox}[2][]{enhanced jigsaw,fonttitle = \large\sffamily\bfseries, fontupper =
% \small\itshape, fontlower = \small\itshape, before upper={\parindent=2\ccwd},
% left=20pt, title=#2,#1}


\RequirePackage{xargs}
\RequirePackage[colorinlistoftodos,prependcaption,textsize=small , disable]{todonotes}
\newcommandx{\unsure}[2][1=]{\todo[linecolor=red,backgroundcolor=red!25,bordercolor=red,#1]{#2}}
\newcommandx{\change}[2][1=]{\todo[linecolor=blue,backgroundcolor=blue!25,bordercolor=blue,#1]{#2}}
\newcommandx{\info}[2][1=]{\todo[linecolor=OliveGreen,backgroundcolor=OliveGreen!25,bordercolor=OliveGreen,#1]{#2}}
\newcommandx{\improve}[2][1=]{\todo[linecolor=Plum,backgroundcolor=Plum!25,bordercolor=Plum,#1]{#2}}
\newcommandx{\thiswillnotshow}[2][1=]{\todo[disable,#1]{#2}}

\renewcommand{\@todonotes@todolistname}{Todo 列表}

% 自定义我的丁家庄图片环境，包含纵向两个图片。注意这一自定义命令限制较多，只适合
% 此项目环境，A4纸，并且图片宽高比要接近3:2以防止溢出。使用方法
% 为
% \dingphotoh{photo1name}{photo1cap}{photo1description}{photo2name}{photo2cap}{photo2description}
\newcommand{\dingphotoh}[6] {
  \begin{figure}[!ht]
    \centering
    \includegraphics[width=0.9\textwidth]{dingjia/#1}
    \caption{#2}\label{fig:#1}
    \raggedright \small #3
    \vfill \vspace{1cm}
    \includegraphics[width=0.9\textwidth]{dingjia/#4}
    \caption{#5}\label{fig:#4}
    \raggedright \small #6
  \end{figure}
  \clearpage
}

% 同上，注意图片宽高比接近于2:3
\newcommand{\dingphotov}[3] {
  \begin{figure}[!ht]
    \centering
    \includegraphics[width=0.9\textwidth]{dingjia/#1}
    \caption{#2}\label{fig:#1}
    \raggedright \small #3
    \vfill
  \end{figure}
  \clearpage
}


% \setcounter{secnumdepth}{-2} % Warning: 因为是草稿阶段，为方便观看暂时性不显示章节编号，以后成品时会去掉这行。
\RequirePackage{adjustbox}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 以下设置来源于胡海星的xelatex-zh-book项目
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 默认情况下,LaTeX 要求每页的文字至少占据 20%,否则该页就只单独放置一个浮动环境。而这通常不是我们想要的。我们将这个要求降低到 5%。
\renewcommand*{\textfraction}{0.1}

% 有时如果多个浮动环境连续放在一起, LaTeX 会将它们分在几个不同页,即使它们可在同一
% 页放得下。我们可以通过修改\topfraction 和\bottomfraction分别设置顶端和底端的浮
% 动环境的最大比例。
\renewcommand*{\topfraction}{0.9}
\renewcommand*{\bottomfraction}{0.8}

% 有时 LaTeX 会把一个浮动环境单独放在一页,我们要求这个环境至少要占据 80% 才能单独放在一页。
% 注意: \floatpagefraction 的数值必须小于\topfraction。
\renewcommand*{\floatpagefraction}{0.80}

% 用于产生没有编号但在目次中列出的章。
\newcommand\nchapter[1]{%
  \if@mainmatter%
    \@mainmatterfalse%
    \chapter{#1}%
    \@mainmattertrue%
  \else
    \chapter{#1}%
  \fi
}

\RequirePackage{cleveref}
\newcommand{\ccref}[1]{\cref{#1} \nameref{#1}}
\crefname{equation}{公式}{公式}
\crefname{table}{表}{表}
\crefname{figure}{图}{图}
\crefformat{equation}{#2式~\textnormal{(}#1\textnormal{)}~#3}
\crefformat{figure}{#2图~#1~#3}
\crefformat{table}{#2表~#1~#3}
\crefformat{listing}{#2清单~#1~#3}
\crefformat{page}{#2第~#1~页#3}
\crefformat{line}{#2第~#1~行#3}
\crefformat{part}{#2第~#1~部#3}
\crefformat{chapter}{#2第~#1~章#3}
\crefformat{section}{#2~#1~节#3}
\crefformat{subsection}{#2~#1~节#3}
\crefformat{appendix}{#2附录~#1~#3}
\crefformat{enumi}{#2第~#1~点#3}
\crefformat{footnote}{#2脚注~#1~#3}
\crefformat{definition}{#2定义~#1~#3}
\crefformat{notation}{#2记号~#1~#3}
\crefformat{theorem}{#2定理~#1~#3}
\crefformat{lemma}{#2引理~#1~#3}
\crefformat{corollary}{#2推论~#1~#3}
\crefformat{proposition}{#2命题~#1~#3}
\crefformat{fact}{#2事实~#1~#3}
\crefformat{assumption}{#2假设~#1~#3}
\crefformat{conjecture}{#2猜想~#1~#3}
\crefformat{hypothesis}{#2假说~#1~#3}
\crefformat{axiom}{#2公理~#1~#3}
\crefformat{postulate}{#2公设~#1~#3}
\crefformat{principle}{#2定律~#1~#3}
\crefformat{problem}{#2问题~#1~#3}
\crefformat{exercise}{#2习题~#1~#3}
\crefformat{example}{#2例~#1~#3}
\crefformat{remark}{#2评注~#1~#3}
\crefformat{proof}{#2证明~#1~#3}
\crefformat{solution}{#2解~#1~#3}
\crefformat{algorithm}{#2算法~#1~#3}
\crefformat{result}{#2结果~#1~#3}
\crefname{appendix}{附录}{附录}
\crefname{enumi}{Point}{Points}
\crefname{footnote}{脚注}{脚注}
\crefname{theorem}{定理}{定理}
\crefname{lemma}{引理}{引理}
\crefname{corollary}{推论}{推论}
\crefname{proposition}{命题}{命题}
\crefname{definition}{定义}{定义}
\crefname{result}{R\'esultat}{R\'esultats}
\crefname{example}{例}{例}
\crefname{remark}{Remarque}{Remarques}
\crefname{note}{Commentaire}{Commentaires}
\crefname{algorithm}{算法}{算法}
\crefname{line}{行}{行}




\newlength{\drop}% for my convenience

\def\subtitle#1{\gdef\@subtitle{#1}}
\def\@subtitle{\@latex@warning{No \noexpand\subtitle given}}

% \def\authornick#1{\gdef\@authornick{#1}}
% \def\@authornick{\@latex@warning{No \noexpand\authornick given}}

\def\authorurl#1{\gdef\@authorurl{\url{#1}}}
\def\@authorurl{\@latex@warning{No \noexpand\authorurl given}}


\def\maketitle{%
  \thispagestyle{empty}
  \null
  \begingroup
  \drop = 0.2\textheight
  \centering
  \vspace*{0.6\drop}
  {\Huge \bfseries \@title}\\[2\baselineskip]
  % {\huge \bfseries \itshape \@subtitle}\\[3\baselineskip]

  \vspace*{0.8\drop}
  \begin{table}[!h]
    \centering
    \Large
    \begin{tabular}{cc}
      作\qquad 者： &  \@author \\
      简中转录： &  llwslc \\
      % 昵\quad 称： & \@authornick \\
      网\qquad 站： & \@authorurl \\
      日\qquad 期： & \@date \\
  \end{tabular}
\end{table}
\vspace*{0.5\drop}

\endgroup
\vfill\null
\clearpage

\begingroup
\thispagestyle{empty}
\null
\newpage
\endgroup
}
