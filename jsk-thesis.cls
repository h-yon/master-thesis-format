%
% jsk-thesis.cls by Ryosuke Tajima (rosk)
% $Id$b
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jsk-thesis}
  [2001/10/08 v0.1 thesis class by Ryosuke Tajima]
\LoadClassWithOptions{ujbook}

%表題
% \
\gdef\@thesis{修士論文}
\long\def\thesis#1{\long\gdef\@thesis{#1}}
\renewcommand{\maketitle}{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \vskip 6cm
  \begin{center}%
  {\LARGE \textbf{\@thesis} \par}
  \vskip 2cm
  {\LARGE \textbf{\@title} \par}
  \vskip 5cm
%  \vskip 5cm
  {\LARGE \textbf{\@date} \par}%       % Set date in \large size.
  \vskip 1.5cm
  {\LARGE \textbf{\@author} \par}
  \end{center}\par
  \@thanks\vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@thesis\@empty
  \global\let\@title\@empty
  \global\let\thesis\relax
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

%目次の見出し．改ページして中央ぞろえ．
\renewcommand{\tableofcontents}{%
  \if@twocolumn\@restonecoltrue\onecolumn
  \else\@restonecolfalse\fi
  {\centering
  \chapter*{\vskip -7cm \contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }
  }
  \if@openright\clearpage\else\clearpage\fi
  \@starttoc{toc}%
  \if@restonecol\twocolumn\fi
}

%章の見出し
\renewcommand{\chapter}{%
  \if@openright\clearpage\else\clearpage\fi
  \thispagestyle{empty}
  \global\@topnum\z@
  \@afterindentfalse
  \secdef\@chapter\@schapter}

\def\@chapter[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \if@mainmatter
    \refstepcounter{chapter}%
    \typeout{\@chapapp\space\thechapter\space\@chappos}%
    \addcontentsline{toc}{chapter}%
      {\protect\numberline{\@chapapp\thechapter\@chappos}#1}%
    \else\addcontentsline{toc}{chapter}{#1}\fi
  \else
    \addcontentsline{toc}{chapter}{#1}%
  \fi
  \chaptermark{#1}%
  \addtocontents{lof}{\protect\addvspace{10\p@}}%
  \addtocontents{lot}{\protect\addvspace{10\p@}}%
  \@makechapterhead{#2}\@afterheading
  \if@openright\clearpage\else\clearpage\fi}

\def\@makechapterhead#1{\hbox{}\vskip 4.5cm%
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \ifnum \c@secnumdepth >\m@ne
     \setlength\@tempdima{\linewidth}%
    {\centering
    \if@mainmatter
     \setbox\z@\hbox{\@chapapp\thechapter\@chappos}%
%     \addtolength\@tempdima{-\wd\z@}%
     \unhbox\z@\nobreak\vskip 1em
    \fi
     \vtop{\hsize\@tempdima#1}%
    }
   \else
    {\centering
    #1\relax
    }
   \fi}}

%chapter*{}のスタイル
\def\@schapter#1{%
  \@makeschapterhead{#1}\@afterheading
  \if@openright\clearpage\else\clearpage\fi
}

\def\@makeschapterhead#1{\hbox{}\vfil%
  {\parindent\z@
   \raggedright
   \reset@font\huge\bfseries
   \setlength\@tempdima{\linewidth}%
   {\centering
   \vtop{\hsize\@tempdima#1}}
}}

%ヘディングの設定
\def\ps@headings{\let\ps@jpl@in\ps@headnombre
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{%
	\underline{\hbox to \textwidth{\textbf{\leftmark\hfil\thepage}}}}%
  \def\@oddhead{%
	\underline{\hbox to \textwidth{\textbf{\leftmark\hfil\thepage}}}}
  \let\@mkboth\markboth}

\def\ps@myheadings{\let\ps@jpl@in\ps@plain%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{%
	\underline{\hbox to \textwidth{\textbf{\leftmark\hfil\thepage}}}}%
  \def\@oddhead{%
	\underline{\hbox to \textwidth{\textbf{\leftmark\hfil\thepage}}}}
  \let\@mkboth\@gobbletwo
  \let\chaptermark\@gobble
  \let\sectionmark\@gobble
}

\renewcommand{\bibname}{参考文献}
\setlength{\textwidth}{15cm}
\setlength{\headsep}{15mm}
\setlength{\evensidemargin}{10mm}
\setlength{\oddsidemargin}{10mm}
\setlength{\topmargin}{5mm}
\setlength{\textheight}{21cm}
\pagestyle{headings}
