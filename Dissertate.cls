% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "Dissertate.cls",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX, Dissertate",
%     docstring       = "Class for a dissertation."
% --------------------------------------------------------------------


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{Dissertate}[Dissertate Class]
\LoadClass[12pt, twoside, openright, a4paper]{book}

%
% Options
%
\RequirePackage{etoolbox}
\RequirePackage[a-2b,mathxmp]{pdfx}[\today]

% Line spacing: dsingle/ddouble
%   Whether to use single- or doublespacing.
\newtoggle{DissertateSingleSpace}
\toggletrue{DissertateSingleSpace}
\DeclareOption{dsingle}{
    \toggletrue{DissertateSingleSpace}
    \ClassWarning{Dissertate}{Single-spaced mode on.}
}
\DeclareOption{ddouble}{\togglefalse{DissertateSingleSpace}}

\ProcessOptions\relax

% Line Spacing
%   Define two line spacings: one for the body, and one that is more compressed.
\iftoggle{DissertateSingleSpace}{
    \newcommand{\dnormalspacing}{1.2}
    \newcommand{\dcompressedspacing}{1.0}
}{
    \newcommand{\dnormalspacing}{2.0}
    \newcommand{\dcompressedspacing}{1.2}
}

% Block quote with compressed spacing
\let\oldquote\quote
\let\endoldquote\endquote
\renewenvironment{quote}
    {\begin{spacing}{\dcompressedspacing}\oldquote}
    {\endoldquote\end{spacing}}

% Itemize with compressed spacing
\let\olditemize\itemize
\let\endolditemize\enditemize
\renewenvironment{itemize}
    {\begin{spacing}{\dcompressedspacing}\olditemize}
    {\endolditemize\end{spacing}}

% Enumerate with compressed spacing
\let\oldenumerate\enumerate
\let\endoldenumerate\endenumerate
\renewenvironment{enumerate}
    {\begin{spacing}{\dcompressedspacing}\oldenumerate}
    {\endoldenumerate\end{spacing}}

% Text layout.
\RequirePackage[outer=1.2in, inner=1in, top=1.2in,bottom=1.3in, twoside, a4paper]{geometry}
\usepackage{ragged2e}
%\RaggedRight
\RequirePackage{graphicx}
\parindent 12pt
\RequirePackage{lettrine}
\RequirePackage{setspace}
\RequirePackage{verbatim}
\RequirePackage{amsmath}
\RequirePackage{mathtools}
\DeclarePairedDelimiter{\abs}{\lvert}{\rvert}
\RequirePackage[per-mode=reciprocal, binary-units=true]{siunitx}
\DeclareSIUnit\eVperc{\eV\per\clight}
\DeclareSIUnit\clight{\text{\ensuremath{c}}}
\usepackage{epigraph}
\usepackage{rotating}
%\usepackage{polyglossia}

%\setmainlanguage{english}
%\setotherlanguages{sanskrit} %% or other languages

%\newfontfamily\devanagarifont[Script=Devanagari]{Lohit Devanagari}
% Fonts.
\RequirePackage{color}
\RequirePackage{hyperref}
\RequirePackage{url}
\Urlmuskip = 0mu plus 1mu
\RequirePackage{amssymb}
\RequirePackage{mathspec}
\setmathsfont(Digits,Latin,Greek)[Numbers={Proportional}]{EB Garamond}
\setmathrm{EB Garamond}
\AtBeginEnvironment{tabular}{\addfontfeature{RawFeature=+tnum}}
\widowpenalty=300
\clubpenalty=300
\setromanfont[Numbers=OldStyle, Ligatures={Common, TeX}, Scale=1.0]{EB Garamond}
\newfontfamily{\smallcaps}[RawFeature={+c2sc,+scmp}]{EB Garamond}
\setsansfont[Scale=MatchLowercase, BoldFont={Lato Bold}]{Lato Regular}
\setmonofont[Scale=MatchLowercase]{Source Code Pro}
\RequirePackage[labelfont={bf,small,color=SchoolColor},
                textfont={small},
                justification={justified},
                singlelinecheck=false,
                margin=0pt,
                figurewithin=chapter,
                tablewithin=chapter]{caption}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
\RequirePackage{microtype}

% Tikz
%\usepackage[table,xcdraw]{xcolor}
\usepackage{tikz}
\usepackage{pgfplots}
\pgfplotsset{compat=newest} 
\pgfplotsset{plot coordinates/math parser=false} 
\newlength\fheight
\newlength\fwidth
\usepackage{booktabs}
\usepackage{multirow}
%\usepackage{multicolumn}
\usepackage{subcaption}
\usetikzlibrary{patterns,decorations.pathreplacing,backgrounds,calc}
\usepackage{afterpage}
\usepackage{tabulary}
\newcommand{\ra}[1]{\renewcommand{\arraystretch}{#1}}
%\usepackage[table,xcdraw]{xcolor}

% Pseudocode
\usepackage{algorithm}
\usepackage{algorithmic}
\renewcommand\algorithmicthen{}
\renewcommand\algorithmicdo{}
\@addtoreset{algorithm}{chapter}% algorithm counter resets every chapter
\usepackage{lscape}
\renewcommand{\thealgorithm}{\thechapter.\arabic{algorithm}}% Algorithm # is <chapter>.<algorithm>
\newcommand{\algorithmautorefname}{Algorithm}

% Abbreviations
\newcommand{\abbrlabel}[1]{\makebox[3cm][l]{\textbf{#1}\ \dotfill}}
\newenvironment{abbreviations}{\begin{list}{}{\renewcommand{\makelabel}{\abbrlabel}}}{\end{list}}

% Headings and headers.
\RequirePackage{fancyhdr}
\RequirePackage[medium, md, sc]{titlesec} % format for the title of the sections
\setlength{\headheight}{15pt}
\usepackage{lineno}
%\linenumbers

\RequirePackage{titling}

% Front matter.
\setcounter{tocdepth}{2}
\usepackage[titles]{tocloft}
\usepackage[titletoc]{appendix}
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}}
\renewcommand{\cftchapfont}{\normalsize \scshape}
\renewcommand\listfigurename{Listing of figures}
\renewcommand\listtablename{Listing of tables}

% Endmatter
\renewcommand{\setthesection}{\arabic{chapter}.A\arabic{section}}

% References.
\renewcommand\bibname{References}
%\RequirePackage[super,comma,numbers]{natbib}
%\RequirePackage[comma,numbers]{natbib}

\RequirePackage[backend=biber,
            sorting=none,
            style=numeric-comp,
            firstinits=true,
            defernumbers=true,
            sortcites]{biblatex}

%\renewcommand{\bibnumfmt}[1]{[#1]}
\RequirePackage[palatino]{quotchap}
\renewcommand*{\chapterheadstartvskip}{\vspace*{-0.5\baselineskip}}
\renewcommand*{\chapterheadendvskip}{\vspace{1.3\baselineskip}}
%\bibliographystyle{IEEEtran}

% An environment for paragraph-style section.
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}%
}

% Align reference numbers so that they do not cause an indent.
\newlength\mybibindent
\setlength\mybibindent{0pt}
\renewenvironment{thebibliography}[1]
    {\chapter*{\bibname}%
     \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
     \list{\@biblabel{\@arabic\c@enumiv}}
          {\settowidth\labelwidth{\@biblabel{999}}
           \leftmargin\labelwidth
            \advance\leftmargin\dimexpr\labelsep+\mybibindent\relax\itemindent-\mybibindent
           \@openbib@code
           \usecounter{enumiv}
           \let\p@enumiv\@empty
           \renewcommand\theenumiv{\@arabic\c@enumiv}}
     \sloppy
     \clubpenalty4000
     \@clubpenalty \clubpenalty
     \widowpenalty4000%
     \sfcode`\.\@m
     }
    {\def\@noitemerr
      {\@latex@warning{Empty `thebibliography' environment}}
     \endlist}

% Some definitions.
\def\advisor#1{\gdef\@advisor{#1}}
\def\mastername#1{\gdef\@mastername{#1}}
\def\studentId#1{\gdef\@studentId{#1}}
\def\coadvisorOne#1{\gdef\@coadvisorOne{#1}}
%\def\coadvisorTwo#1{\gdef\@coadvisorTwo{#1}}
\def\coadvisorsUniversity#1{\gdef\@coadvisorsUniversity{#1}}
\def\academicYear#1{\gdef\@academicYear{#1}}
\def\department#1{\gdef\@department{#1}}
\def\university#1{\gdef\@university{#1}}

% School color 
\definecolor{SchoolColor}{RGB}{0,80,148} % UNIPD red
\definecolor{chaptergrey}{RGB}{0,91,129} % dialed back a little
\definecolor{midgrey}{rgb}{0.4, 0.4, 0.4}

\hypersetup{
    colorlinks,
    citecolor=black,
    filecolor=black,
    linkcolor=black,
    urlcolor=black,
}


\renewcommand{\frontmatter}{
	%\pagenumbering{roman}
	\input{frontmatter/personalize}\pagestyle{empty}%
	\maketitle\pagestyle{empty}%
	\frontispiece\pagestyle{empty}%
        \dummypage\pagestyle{empty}%
         \pagenumbering{roman}
	\dedicationpage
        \citationpage
	\abstractpage
	\tableofcontents
	\phantomsection
	

	\cleardoublepage
	\setcounter{page}{1}
	\pagenumbering{arabic}
}

\newcommand{\cover}{
	\pagenumbering{roman}
	\input{frontmatter/personalize}
	\makecover
}

\renewcommand{\maketitle}{
	\thispagestyle{empty}
	\setcounter{page}{1}
	\begin{center}
	\vbox to0pt{\vbox to\textheight{\vfill \includegraphics[width=11.5cm]{resources/cherubino_white.png} \vfill}\vss}
	%\vspace*{\fill}
 \setstretch{-20}
	\begin{figure}
	\centering
  		\includegraphics[height=6.55cm]{resources/marchio_unipi_pant541.png}
	\end{figure}

	%\setstretch{1.5}

	%\scshape{\huge{\bfseries{\@university}}} \\
	\line(1, 0){400} \\
        \setstretch{1.5}
	\scshape{\large{Department of \@department}} \\
	\vspace{3pt}
	\scshape{\large{\textit{Master Thesis in \@mastername}}} \\

	\vspace{2pt}

	\setstretch{1.8}

	\vspace{5pt}
	\scshape{\huge{\bfseries{\textcolor{SchoolColor}{\thetitle}}}} \normalsize \\
	\vspace{25pt}
	
	\setstretch{1.4}
 \vspace{15pt}
	\vfill
	\begin{normalsize}
	\begin{flushleft}
	  \textit{Supervisor} \hfill \textit{Candidate}\\
	  \vspace{1pt}
	  \@advisor \hfill \@author\\
	  %\@university \\
        \vspace{10pt}
        \textit{Co-Supervisor}  \hfill \textit{Student ID}\\
        \@coadvisorOne \hfill \@studentId \\
	  
	  %\@coadvisorTwo \\
	  %\@coadvisorsUniversity \\
	\vspace{50pt}
	\centering
	\large{\textit{Academic Year} \\ \@academicYear}
	\end{flushleft}
	\end{normalsize}
	
	\end{center}
	%\vspace*{\fill}
	\singlespacing
	\cleardoublepage
}

\newcommand{\copyrightpage}{
	\newpage
	\thispagestyle{empty}
	\vspace*{25pt}
	\begin{center}
	\scshape \noindent \small \copyright \  \small  \theauthor \\
	all rights reserved, \@degreeyear
	\end{center}
	\newpage
	\rm
}

\newcommand{\frontispiece}{
	\newpage
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
	\end{center}
	\vspace*{\fill}
}

\newcommand{\dummypage}{
	\phantomsection
	\setcounter{page}{3}
	\vspace*{\fill}
	\scshape \noindent \input{frontmatter/dummy}
	\vspace*{\fill}
	\cleardoublepage
	\rm
}

\newcommand{\dedicationpage}{
	\phantomsection
        \setcounter{page}{1}
	\vspace*{\fill}
	\scshape \noindent \flushright \input{frontmatter/dedication}
	\vspace*{\fill}
	\cleardoublepage
        \justifying
	\rm
}


\newcommand{\citationpage}{
	\phantomsection
	%\setcounter{page}{3}
	\vspace*{\fill}
	\scshape \noindent \input{frontmatter/citation}
	\vspace*{\fill}
	\cleardoublepage
	\rm
}


\newcommand{\acknowledgments}{
	\phantomsection
	\chapter*{Acknowledgements}
	\noindent
	\input{backmatter/thanks}
	\vspace*{\fill} \newpage
}

\newcommand{\acronyms}{
	\phantomsection
	\addcontentsline{toc}{chapter}{Listing of acronyms}
	\chapter*{Listing of acronyms}
	\input{backmatter/abbr.tex}
}

\newcommand{\abstractpage}{
	\phantomsection
	%\setcounter{page}{5}
	\addcontentsline{toc}{chapter}{Abstract}
	\chapter*{Abstract}
	\input{frontmatter/abstract}
}

\newcommand{\appendixA}{
	\phantomsection
	\addcontentsline{toc}{chapter}{A}
	\chapter*{Appendix A}
	\input{chapters/appendixA}
}

\renewcommand{\backmatter}{
    %\addcontentsline{toc}{Appendices}
    %\begin{appendices}
        %\appendixA
        

    %\end{appendices}
            \acronyms

    %\input{endmatter/personalize}
    %\clearpage
    %\bibliography{references}
    \nocite{*}
    \addcontentsline{toc}{chapter}{References}
    %\bibliographystyle{apalike2}
    \renewcommand{\bibname}{References}
    \printbibliography
    %\include{endmatter/colophon}

 % figure listing - required if you have any figures
	% \phantomsection
	%\addcontentsline{toc}{chapter}{List of figures}
	%\listoffigures	
	%\cleardoublepage

	% table listing - required if you have any tables
	%\phantomsection
	%\addcontentsline{toc}{chapter}{List of tables}
	%\listoftables
	%\cleardoublepage

}

