\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mipt-thesis}[2014/06/05 Class for the BS thesis in the MIPT]

%%%%%% Class options %%%%%
\DeclareOption*{
    \ClassWarning{myclass}{Unknown option '\CurrentOption'}
}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{article}
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
% Graphics
\RequirePackage{graphicx}
\RequirePackage{subcaption}
% Tables
\RequirePackage{tabularx,multirow}
% Misc useful packages
\RequirePackage[binary-units]{siunitx}
%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Set up correct formatting %%%%%
\geometry{left=3cm}
\geometry{right=2cm}
\geometry{top=2cm}
\geometry{bottom=2cm}
\onehalfspace
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%% Titlepage and contents %%%%%
% Set some "variables"
\renewcommand{\author}[1]{\def\mtauthortext{#1}}
\renewcommand{\title}[1]{\def\mttitletext{#1}}
\newcommand{\groupnum}[1]{\def\mtgroupnumtext{#1}}
\newcommand{\supervisor}[1]{\def\mtsupervisortext{#1}}

\renewcommand{\titlepage}{
    \pagestyle{empty}
    \begin{center}
        {\bf Министерство образования и науки Российской Федерации \\
        Московский физико-технический институт (государственный
        университет) \\ }
        \vspace{1cm}

        Факультет проблем физики и энергетики \\
        Кафедра космической физики \\

        \vspace{3em}

        Выпускная квалификационная работа бакалавра по направлению 010900
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
        \vspace{2em}
        Научный руководитель \\
        \mtsupervisortext{} \\
    \end{flushright}

    \vspace{7em}

    \begin{center}
        Долгопрудный \the\year{}
    \end{center}

    \newpage
}

\newcommand{\titlecontents}{
    \titlepage
    \tableofcontents
    \newpage
    \pagestyle{plain}
    \setcounter{page}{1}
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\endinput
