% ociamthesis
% 
% Originally by Keith A. Gillow (gillow@maths.ox.ac.uk), 1997
% Modified by Sam Evans (sam@samuelevansresearch.org), 2007
% Modified by John McManigle (john@oxfordechoes.com), 2015
%
% This version Copyright (c) 2015-2017 John McManigle
%
% Broad permissions are granted to use, modify, and distribute this software
% as specified in the MIT License included in this distribution's LICENSE file.
%
%
%-------------------------- identification ---------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{templates/ociamthesis}[2015/04/30 Oxford thesis class]
%-------------------------- initial code -----------------------

% JEM: Defaults to one-side, but passing 'twoside' should set everything up for that
\LoadClass[openright,12pt]{report}

\newif\ifmc@nobind
\mc@nobindfalse

\DeclareOption{nobind}{\mc@nobindtrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\relax

\setlength{\parskip}{0pt plus 1pt}
\setlength{\parfillskip}{0pt plus .7\textwidth}

% JEM: Lengths for single spacing (ie separate abstract, captions), front matter (abstract,
%   acknowledgements, table of contents, etc), and main body text.
\newlength{\singlebaselineskip}
\newlength{\frontmatterbaselineskip}
\newlength{\textbaselineskip}
% UL 2 Dec 2018: make it possible to customise line and paragraph spacing in separate abstract page
\newlength{\abstractseparatelineskip}  
\newlength{\abstractseparateparskip}  

\setlength{\singlebaselineskip}{\baselineskip}
\setlength{\frontmatterbaselineskip}{17pt plus1pt minus1pt}
\setlength{\textbaselineskip}{22pt plus2pt}
\setlength{\abstractseparatelineskip}{10pt plus1pt minus1pt}
\setlength{\abstractseparateparskip}{0pt plus 1pt}


\newcommand{\submittedtext}{{A thesis submitted for the degree of}}
\usepackage{varwidth}
\newcommand{\originalitytext}{%
   \rule[-2mm]{1pt}{7mm}\hspace{-1pt}%
   \rule[-2mm]{7mm}{1pt}\hspace{-1pt}%
   \rule[-2mm]{1pt}{7mm}\hspace{-7mm}%
   \rule[5mm]{7mm}{1pt}\hspace{1em}%
   \begin{varwidth}{\textwidth}I hereby certify that this is entirely\\my own work unless otherwise stated.\end{varwidth}}

%
% DECLARATIONS
%
% These macros are used to declare arguments needed for the
% construction of the title page and other preamble.

% The year and term the degree will be officially conferred
\def\degreedate#1{\gdef\@degreedate{#1}}
% The full (unabbreviated) name of the degree
\def\degree#1{\gdef\@degree{#1}}
% The name of your Oxford college (eg Christ Church, Pembroke)
\def\college#1{\gdef\@college{#1}}
% Your candidate number (ie for master's submissions)
\def\candidateno#1{\gdef\@candidateno{#1}}
% Your word count (for master's submissions)
\def\wordcount#1{\gdef\@wordcount{#1}}
\newif\ifmasterssubmission
% adds candidate number and word count in place of name and college
\masterssubmissionfalse

% The year and month the degree is awarded
\def\Year#1{\gdef\@Year{#1}}
\def\Month#1{\gdef\@Month{#1}}

% The institution name
\newcommand{\University}[1]{\gdef\@University{#1}}

% The department name
\newcommand{\Department}[1]{\gdef\@Department{#1}}

% The name of the advisor
\newcommand{\Advisor}[1]{\gdef\@Advisor{#1}}

% The title of the advisor
\newcommand{\AdvisorTitle}[1]{\gdef\@AdvisorTitle{#1}}

% The name of the committee member 2
\newcommand{\MemberA}[1]{\gdef\@MemberA{#1}}

% The tile of the committee member 2
\newcommand{\MemberATitle}[1]{\gdef\@MemberATitle{#1}}

% The name of the committee member 3
\newcommand{\MemberB}[1]{\gdef\@MemberB{#1}}

% The tile of the committee member 3
\newcommand{\MemberBTitle}[1]{\gdef\@MemberBTitle{#1}}

% The name of the committee member 4
\newcommand{\MemberC}[1]{\gdef\@MemberC{#1}}

% The tile of the committee member 4
\newcommand{\MemberCTitle}[1]{\gdef\@MemberCTitle{#1}}

% The name of the committee member 5
\newcommand{\MemberD}[1]{\gdef\@MemberD{#1}}

% The tile of the committee member 5
\newcommand{\MemberDTitle}[1]{\gdef\@MemberDTitle{#1}}
% If you only have three members including your advisor then delete Member C (needs multiple deletes below too)

% The name of the department chair
\newcommand{\DepRep}[1]{\gdef\@DepRep{#1}}

% The title of the department chair (allow for associate chair, etc.)
\newcommand{\DepRepTitle}[1]{\gdef\@DepRepTitle{#1}}

% The name of the dean
\newcommand{\Dean}[1]{\gdef\@Dean{#1}}

% The title of the dean
\newcommand{\DeanTitle}[1]{\gdef\@DeanTitle{#1}}


%
% CRESTS
%

\def\crest{{\includegraphics{figures/HarrisburgU_Logo.png}}}


%
% Define text area of page and margin offsets
%

\ifmc@nobind
\usepackage[includehead,hmargin={3.1cm, 3.1cm}, vmargin={2.5cm,2.7cm}, headsep=.8cm,footskip=1.2cm]{geometry}
\else
\usepackage[includehead,hmargin={3.6cm, 2.6cm}, vmargin={2.5cm,2.7cm}, headsep=.8cm,footskip=1.2cm]{geometry}
\fi

\usepackage{xcolor}
\usepackage{graphicx} 

\usepackage{fancyhdr}
\setlength{\headheight}{15pt}
\fancyhf{} % clear the header and footers
\pagestyle{fancy}
\renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{\thechapter. #1}}
% \renewcommand{\chaptermark}[1]{\markboth{\thechapter. #1}{}}
\renewcommand{\sectionmark}[1]{\markright{\thesection. #1}}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[CO]{\emph{\leftmark}}
\fancyhead[CE]{\emph{\rightmark}}
% \fancyhead[LO,RE]{}
% \fancyhead[LE,RO]{}
\fancyfoot[CO,CE]{\emph{\thepage}}

\fancypagestyle{plain}{\fancyhf{}\fancyfoot[C]{\emph{\thepage}}}

% JEM fix header on cleared pages for openright
\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
   \hbox{}
   % \fancyhead[RE,LO]{}
   \fancyhead[CE,CO]{}
   \newpage
   \if@twocolumn\hbox{}\newpage
   \fi
   % \fancyhead[LO]{\emph{\leftmark}} 
   % \fancyhead[RE]{\emph{\rightmark}} 
   \fancyhead[CO]{\emph{\leftmark}} 
   \fancyhead[CE]{\emph{\rightmark}} 
   \fi\fi}


\usepackage{microtype}
\usepackage{nicefrac}
\usepackage{amsmath}
\usepackage{amssymb}
\usepackage{textcomp}

\usepackage{longtable} 
	% Allows tables to span multiple pages (this package must be called before hyperref)

\usepackage[font=small,labelfont=bf]{caption} 
	% Nicer captions

\usepackage{multicol,multirow,array} 
	% Used to make multiple columns for the indices and for creating columns that span multiple rows in tables

\usepackage{rotating} 
	% To allow tables in landscape mode

\usepackage{booktabs} 
	% For better looking tables

\usepackage{pdfpages} 
	% Allows multi-page pdfs to be inserted as graphics

\usepackage{xfrac}

%\usepackage{enumerate} 
	% Allows different numbering styles for Lists
	% to use:
	% \begin{enumerate}[x] 
		% \item text 
	% \end{enumerate} 
	% where x is:
	% A	uppercase letters (as produced by \Alph)
	% a	lowercase letters (as produced by \alph)
	% I	uppercase roman numerals (as produced by \Roman)
	% i	lowercase roman numerals (as produced by \roman)
	% 1	arabic numbers (as produced by \arabic)
	
% JEM the following package allows changing spacing in lists (for acknowledgements)
\usepackage{enumitem}

% JEM the following allows table columns aligned by decimal point
\usepackage{dcolumn}
\newcolumntype{d}[3]{D{.}{\cdot}{#1} }

\usepackage{appendix} 
	% For helping format appendicies
\usepackage{notoccite} 
	% To format the bibliography	


%\usepackage[colorlinks=false,pdfpagelabels]{hyperref} 
	% for linking between references, figures, TOC, etc in the pdf document

\usepackage[nohints,tight]{minitoc} 
	\setcounter{minitocdepth}{2} 
	% Generates mini tables of contents per chapter
	
% JEM: The following fixes minitoc to not be multiple-spaced.
\let\oldmtc@verse\mtc@verse
\renewcommand{\mtc@verse}[1]{\oldmtc@verse{#1}\setlength{\baselineskip}{\z@}}


%
% Environments
%

% This macro define an environment for front matter that is always 
% single column even in a double-column document.

\newenvironment{alwayssingle}{%
       \@restonecolfalse
       \if@twocolumn\@restonecoltrue\onecolumn
       \else\if@openright\cleardoublepage\else\clearpage\fi
       \fi}%
       {\if@restonecol\twocolumn
       \else\newpage\thispagestyle{empty}\fi}


%define title page layout

\renewcommand{\maketitle}{%
\begin{alwayssingle}\null
    \renewcommand{\footnotesize}{\small}
    \renewcommand{\footnoterule}{\relax}
    \thispagestyle{empty}
    \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title}{bm:Title}
\ifmasterssubmission
  \begin{center}
  \vspace*{-3ex}
    { \LARGE {\bfseries {\@title}} \par}
{\large \vspace*{25mm} {\crest \par} \vspace*{20mm}}
    {{\Large Candidate no.\ \@candidateno} \par}
{\large \vspace*{1ex}
    {Word count: {\@wordcount} \par}
\vspace*{4ex}
    {{\submittedtext} \par}
\vspace*{1ex}
    {\it {\@degree} \par}
\vspace*{6ex}
	{{\originalitytext} \par}
\vspace*{2ex}
    {\@degreedate}}
  \end{center}
\else
  \begin{center}
    { \LARGE {\bfseries {\@title}} \par}
%{\large \vspace*{30mm} {\crest \par} \vspace*{25mm}}
  \vfill
    By\\[\baselineskip]
    {{\Large \@author} \par}
{\large \vspace*{1ex}
  \vfill
    A dissertation submitted for the degree of\\
    \MakeUppercase{\@degree} \\[\baselineskip]
    \begin{figure}[ht!]
    \begin{center}
    \includegraphics[height=2cm]{figures/HarrisburgU_Logo.png}
    \end{center}
    \end{figure}
    {{Department of Analytics} \par}
\vspace*{1ex}
    {Harrisburg University of Science and Technology \par}
\vspace*{1ex}
    {\@Month} {\@Year}}
  \end{center}
\fi
  \vfill\null
\end{alwayssingle}}

% COPYRIGHT
% ======================== Copyright page ===============================
\newcommand{\copyrightpage}{
    \thispagestyle{empty}
    %\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Copyright}{bm:Copyright}
    \addtocounter{page}{-1}
    \vspace*{\fill}
    \vfill
    \begin{center}
    \copyright\ Copyright by \MakeUppercase{\@author},~\@Year\\
    All Rights Reserved
    \end{center}
%    \vspace{1in}
    \clearpage
  }


% =============================== Approval page =======================
\newcommand{\datebox}{
    \parbox[t]{1.5in}{
        \ \\[2\baselineskip]
        \rule{0.in}{0.4pt}\\

    }
}

\newcommand{\signaturebox}[1]{
    \parbox[t]{3.6in}{
        \ \\[2\baselineskip]
        \rule{3.6in}{0.4pt}\\
        #1
    }
}

\newcommand{\phdapprovalpage}{
    \thispagestyle{plain}
    \begin{center}
    %\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Graduate Committee Approval}{bm:ComAp}
    \vspace*{0.375in}
    \textbf{Ph.D. COMMITTEE APPROVAL}\\[3\baselineskip]
    \end{center}
    \noindent
    To the Faculty of \@University:
    \par The members of the Committee appointed to examine the dissertation
of \MakeUppercase{\@author} find it satisfactory and recommend that it be accepted.\\[\baselineskip]
    \par
    \datebox\hfill\signaturebox{\@Advisor, \@AdvisorTitle, Chair}\\
    \datebox\hfill\signaturebox{\@MemberA, \@MemberATitle}\\
    \datebox\hfill\signaturebox{\@MemberB, \@MemberBTitle}\\
    \datebox\hfill\signaturebox{\@MemberC, \@MemberCTitle}\\    
    \datebox\hfill\signaturebox{\@MemberD, \@MemberDTitle}\\     
    \vfill
    \clearpage
  }
  
  
% ======================= Acceptance Page ============================
\newcommand{\acceptancepage}{
    \thispagestyle{empty}%
    \begin{center}
    %\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acceptance Page}{bm:Accept}
    \vspace*{0.375in}
    \textbf{ACCEPTANCE PAGE}\\[2\baselineskip]
    \@University\\[3\baselineskip]
    \end{center}%
    \noindent%
    As chair of the candidate's graduate committee, I have read the
    dissertation of \@author \ in its final form and have found
    that (1) its format, citations, and bibliographical style are
    consistent and acceptable and fulfill university and department
    style requirements; (2) its illustrative materials including
    figures, tables, and charts are in place; and (3) the final
    manuscript is satisfactory to the graduate committee
    and is ready for submission to the university library.
    \datebox\hfill\signaturebox{\@Advisor, \@AdvisorTitle\\Chair, Graduate Committee\\
    \@University}
    \vskip 0pt plus 2fill
    \vspace{1\baselineskip}%
    \noindent Accepted for the Department \\ of Analytics\hfill
    \signaturebox{\@DepRep \\Chair, Department of Analytics\\
    \@University}
    \vspace{1\baselineskip}%
    \vfill \noindent Accepted for the University\hfill
    \signaturebox{\@Dean, \\Provost \\
    \@University}
    \clearpage
  }
  
  
% DEDICATION
%
% The dedication environment makes sure the dedication gets its
% own page and is set out in verse format.

\newenvironment{dedication}
{\begin{alwayssingle}
%\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Dedication}{bm:Dedication}
  \thispagestyle{empty}
  \vspace*{\fill} \begin{center}}
{\end{center}\vspace*{\fill}\vspace*{\fill} \end{alwayssingle}}


% ACKNOWLEDGEMENTS
%
% The acknowledgements environment puts a large, bold, centered 
% "Acknowledgements" label at the top of the page. The acknowledgements
% themselves appear in a quote environment, i.e. tabbed in at both sides, and
% on its own page.

\newenvironment{acknowledgements}%
{   \begin{alwayssingle}\chapter*{Acknowledgements}
%\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acknowledgements}{bm:Acknowledgements}
    \thispagestyle{empty}
	\pagestyle{empty}
	\setlength{\baselineskip}{\frontmatterbaselineskip}
}
{\end{alwayssingle}}


%ABSTRACT
%
%The abstract environment puts a large, bold, centered "Abstract" label at
%the top of the page. The abstract itself appears in a quote environment,
%i.e. tabbed in at both sides, and on its own page.

\renewenvironment{abstract}%
{   \begin{alwayssingle}\chapter*{Abstract}
%\providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
    \thispagestyle{empty}
    \pagestyle{empty}
   \setlength{\baselineskip}{\frontmatterbaselineskip}}
{\end{alwayssingle}}

%The abstractseparate environment is for running of a page with the abstract
%on including title and author etc as required to be handed in separately

\newenvironment{abstractseparate} {\newgeometry{margin=3.3cm}\thispagestyle{empty}\begin{alwayssingle}
 \begin{center}
    {\Large \bfseries \@title \par}
\ifmasterssubmission
    {{\large \vspace*{3ex} Candidate no.\ \@candidateno} \par}
\else
    {{\large \vspace*{2ex} \@author} \par}
\fi
{\large \vspace*{1ex}
\ifmasterssubmission
    {Thesis word count: {\@wordcount} \par}
\else
    {{\@college} \par}
    {University of Oxford \par}
\fi
\vspace*{1ex}
    {{\it \submittedtext} \par}
    {\it {\@degree} \par}
\vspace*{2ex}
    {\@degreedate} \par}
\vfill
  {\Large \bfseries  Abstract}
  \end{center}
\vspace{1ex}
   \setlength{\baselineskip}{\abstractseparatelineskip} %UL was \z@ rather than \abstractseparatelineskip
   \setlength{\parskip}{\abstractseparateparskip}} %UL add this line so paragraph skip can be customised
{\vfill\end{alwayssingle}\restoregeometry}


%ROMANPAGES
%
% The romanpages environment set the page numbering to lowercase roman one
% for the contents and figures lists. It also resets
% page-numbering for the remainder of the dissertation (arabic, starting at 1).
%
% Edited by JEM

\newenvironment{romanpages}
{\cleardoublepage\setlength{\baselineskip}{\frontmatterbaselineskip}\setcounter{page}{1}\renewcommand{\thepage}{\roman{page}}}
{\cleardoublepage\setcounter{page}{1}\renewcommand{\thepage}{\arabic{page}}}


%Figure placement on page
%
%This is to help prevent too many figures on their own pages.  I got it from:
% http://dcwww.camd.dtu.dk/~schiotz/comp/LatexTips/LatexTips.html#captfont

\renewcommand{\topfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.75}


% JEM: VERSE, QUOTATION, and QUOTE must be single-spaced.
% These rename the internal commands for the \begin{...} and
% \end{...} environment commands.
\let\@ldquote=\quote
\let\@ldendquote=\endquote
\renewenvironment{quote}
   {\@ldquote\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendquote}

\let\@ldqttn=\quotation
\let\@ldendqttn=\endquotation
\renewenvironment{quotation}
   {\@ldqttn\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendqttn}

\let\@ldverse=\verse
\let\@ldendverse=\endverse
\renewenvironment{verse}
   {\@ldverse\setlength{\baselineskip}{\singlebaselineskip}}
   {\@ldendverse}

% JEM: Stuff for List of Abbreviations (or Glossary or other list)
\usepackage{calc}
\newcommand{\t@cfill}{\cleaders\hbox{$\m@th \mkern\@dotsep mu . \mkern\@dotsep mu$}\hfill}
\newcommand{\abbrl@bel}[1]{\makebox[\labelwidth][l]{\textbf{#1}\ \t@cfill}}
\newenvironment{mclistof}[2]{%
   \chapter*{#1}%
   \addcontentsline{toc}{chapter}{#1}
   \begin{list}{}%
   {\renewcommand{\makelabel}{\abbrl@bel}%
    \setlength{\labelwidth}{#2}%
    \setlength{\leftmargin}{\labelwidth+\labelsep}%
    \setlength{\itemsep}{0pt}%
    \markboth{#1}{#1}%
   }}
   {\end{list}\mtcaddchapter}


\usepackage[grey,utopia]{quotchap} 
	% To put nice quotes at the beginning of the chapters

\usepackage[nottoc]{tocbibind}
	% Used for inserting the Bibliography, List of Figures, indices, etc into the table of contents.

% JEM: Allow flexible spacing after figures, to reduce other stretching
\setlength{\textfloatsep}{20pt plus15pt minus4pt}

% JEM: Fix paragraph spacing within quotes for multi-par quotes
\renewenvironment{savequote}[1][8cm]{%
\begin{lrbox}{\@quotebox}
\begin{minipage}[t]{#1}\footnotesize\slshape%
\setlength{\parskip}{6px}}{%
\unskip\end{minipage}\end{lrbox}
\global\setbox\@quotebox\copy\@quotebox
\global\let\@printcites\@iprintcites
\ignorespacesafterend}
\renewcommand{\qauthor}[1]{\par
{\raggedright\upshape #1\qquad\hbox{}\par}\bigskip}

% JEM: All of this is so that headers in these sections aren't uppercase
\let\@ldtoc\tableofcontents
\renewcommand*\tableofcontents{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldtoc}}
\let\@ldlof\listoffigures
\renewcommand*\listoffigures{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlof}}
\let\@ldlot\listoftables
\renewcommand*\listoftables{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldlot}}
\let\@ldbib\bibliography
\renewcommand*\bibliography[1]{{%
\renewcommand*\MakeUppercase[1]{##1}\@ldbib{#1}}}

% JEM: for crazy multi character set quotes and Unicode and all
\usepackage{lmodern}
\usepackage[LGR,TS1,T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage[greek,latin,english]{babel}
\usepackage{csquotes}
\hyphenpenalty=500
\def\longs{{\fontencoding{TS1}\selectfont s}}

% JEM: for highlighting corrections
\newlength{\mccurrentbaselineskip}
\newlength{\mccurrentparskip}
\newlength{\mccurrentparindent}
\newif\ifcorrections
\newif\ifm@csection
\m@csectionfalse
\correctionsfalse

\colorlet{shadecolor}{blue!20}

\usepackage{framed}
\OuterFrameSep=-9pt
\newenvironment{correction}
{\ifcorrections\colorlet{shadecolor}{blue!20}\if@nobreak\m@csectiontrue\fi\begin{shaded}\ifm@csection\noindent\ignorespaces\fi\fi}
{\ifcorrections\end{shaded}\m@csectionfalse\ifx\@captype\@undefined\@nobreakfalse\fi\fi}

\usepackage{soul}
\sethlcolor{shadecolor}
\newcommand{\mccorrect}[1]{\ifcorrections\hl{#1}\else#1\fi}


% JEM: adjust start-of-chapter spacing
\renewcommand{\chapterheadstartvskip}{\vspace*{40pt}}
\renewcommand{\chapterheadendvskip}{\vspace{30pt}}


% JEM: combine all of the commands you run before appendices start
\newcommand{\startappendices}
  {\appendix\adjustmtc\noappendicestocpagenum\addappheadtotoc\appendixpage}
  
\usepackage{lipsum}
\usepackage{graphicx}
\usepackage{caption}
\usepackage{subcaption}
