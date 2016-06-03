\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mipt-thesis}[2016/06/18 Class for the MS thesis in the MIPT]

%%%%%% Class options %%%%%
\DeclareOption*{
    \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Useful packages %%%%%
% Math packages, should be loaded before fontenc and babel for Cyrillic
\RequirePackage{amsmath,amsthm,amssymb}
\RequirePackage{mathtext}
% Fonts and lang
\RequirePackage[T1,TS1,T2A]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[english,russian]{babel}
% Formatting
\RequirePackage{geometry}
\RequirePackage{setspace}
\RequirePackage{indentfirst}
\RequirePackage{fancyhdr}
\RequirePackage{nopageno}
\RequirePackage{tocloft}
% Style file with additional packages
\RequirePackage{mipt-thesis}
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Set up correct formatting %%%%%
\geometry{left=3cm}
\geometry{right=2cm}
\geometry{top=2cm}
\geometry{bottom=2cm}
\onehalfspace
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Some dark TeX magic %%%%%
\renewcommand\contentsname{Оглавление}
\renewcommand\listfigurename{Список иллюстраций}
\renewcommand\listtablename{Список таблиц}
\renewcommand\bibname{Литература}
\renewcommand\indexname{Index}
\renewcommand\figurename{Рис.{}}
\renewcommand\tablename{Таблица}
\renewcommand\partname{Часть}
\renewcommand\chaptername{Глава}
\renewcommand\appendixname{Приложение}


\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \partmark{#1}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries\boldmath \partname~\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries\boldmath #2\par}%
    \@endpart}
\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries\boldmath #1\par}%
    \@endpart}

\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                       \if@mainmatter
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect\numberline{\thechapter}#2}%
                       \else
                         \addcontentsline{toc}{chapter}{#2}%
                       \fi
                    \else
                      \addcontentsline{toc}{chapter}{#2}%
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{10\p@}}%
                    \addtocontents{lot}{\protect\addvspace{10\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead{#2}]%
                    \else
                      \@makechapterhead{#2}%
                      \@afterheading
                    \fi}


\def\@makechapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright \normalfont
    \ifnum \c@secnumdepth >\m@ne
      \if@mainmatter
        \huge\bfseries\boldmath \@chapapp\space \thechapter
        \par\nobreak
        \vskip 20\p@
      \fi
    \fi
    \interlinepenalty\@M
    \Huge \bfseries\boldmath #1\par\nobreak
    \vskip 40\p@
  }}
\def\@makeschapterhead#1{%
  \vspace*{50\p@}%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries\boldmath  #1\par\nobreak
    \vskip 40\p@
  }}


\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                             {\normalfont\Large\raggedright}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                             {\normalfont\Large\sffamily\itshape\raggedright}}
%%%%%%%% Captions %%%%%%%%%%%%%%%%%%%%%%%%%%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1. #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1. #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}

%%%%%%%% Headings
\fancypagestyle{miptthesis}{%
    \fancyhf{}
    \fancyhead[RO, LE]{\thepage}
    \fancyhead[CO]{\leftmark}
    \fancyhead[CE]{\rightmark}
}
\pagestyle{miptthesis}
\renewcommand{\chaptermark}[1]{\markboth{\hfill\normalfont #1\hfill}{}}
\renewcommand{\sectionmark}[1]{\markright{\hfill\large\itshape \S\thesection\quad #1\hfill}}
\let\partmark=\chaptermark

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Right TOC numbering %%%%%
\renewcommand{\cftchapaftersnum}{.}
\renewcommand{\cftsecaftersnum}{.}
\renewcommand{\cftsubsecaftersnum}{.}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Easier references %%%%%
\newcommand{\formref}[1]{(\ref{#1})}
\newcommand{\picref}[1]{рис.~\ref{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Titlepage and contents %%%%%
% Set some "variables"
\renewcommand{\author}[1]{\def\mtauthortext{#1}}
\renewcommand{\title}[1]{\def\mttitletext{#1}}
\newcommand{\groupnum}[1]{\def\mtgroupnumtext{#1}}
\newcommand{\supervisor}[1]{\def\mtsupervisortext{#1}}
\newcommand{\referee}[1]{\def\mtrefereetext{#1}}

\newcommand{\addemptypage}{%
    \clearpage \mbox{} \clearpage
}

\renewcommand{\titlepage}{%
    \pagestyle{empty}
    \begin{center}
        {\bf Министерство образования и науки Российской Федерации \\
        Московский физико-технический институт (государственный
        университет) \\ }
        \vspace{1cm}

        Факультет проблем физики и энергетики \\
        Кафедра космической физики \\

        \vspace{3em}

        Выпускная квалификационная работа магистра по специальности 03.04.01
        <<Прикладные математика и физика>>
    \end{center}

    \begin{center}
        \vspace{\fill}
        \singlespacing

        \LARGE \mttitletext{}

        \vspace{\fill}
    \end{center}


    \begin{flushright}
        Студент \mtgroupnumtext{} группы \\
        \mtauthortext{} \\
        \vspace{3em}
        Научный руководитель \\
        \mtsupervisortext{} \\
        \vspace{3em}
        Рецензент \\
        \mtrefereetext{} \\
    \end{flushright}

    \vspace{6em}

    \begin{center}
        Долгопрудный \\
        \the\year{}
    \end{center}

}

\newcommand{\titlecontents}{
    \titlepage \addemptypage
    \tableofcontents \addemptypage
    \pagestyle{miptthesis}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput

% vim: syntax=tex:
