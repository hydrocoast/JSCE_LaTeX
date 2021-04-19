%%
%%
%% 
\typeout{\space\space\space
JSCE.CLS based on
Proc. of JSCE Ver. <30 Sep 2002>: M.Watanabe & T.Iwakuma,
followed by SANBI Co., Ltd.
LaTeX2e Class File for Japan Society of Cilvil Engineers
}
%

\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{jsce}
%%  [2002/09/30 v1 Standard pLaTeX class]
%%  [2003/05/09 v1.1 Standard pLaTeX class]
%%  [2003/06/11 v1.2 Standard pLaTeX class]
%%  [2003/07/30 v1.3 Standard pLaTeX class]
%%  [2005/03/31 v1.4 Standard pLaTeX class]
%%  [2012/10/24 v1.5 Standard pLaTeX class by JSCE]
%%  [2012/10/30 v1.6 Standard pLaTeX class by JSCE]
%%  [2012/11/03 v1.7 Standard pLaTeX class by JSCE]
%%  [2012/11/06 v1.71 Standard pLaTeX class by JSCE]
%%  [2012/11/15 v1.72 Standard pLaTeX class by JSCE]
%%  [2012/11/18 v1.73 Standard pLaTeX class by JSCE]
%%  [2012/11/19 v1.74 Standard pLaTeX class by JSCE]
%%  [2014/04/04 v1.75 Standard pLaTeX class by JSCE]
%%  [2014/04/25 v1.76 Standard pLaTeX class by JSCE]
%%  [2014/12/28 v1.77 Standard pLaTeX class by JSCE]
    [2016/01/29 v1.8 Standard pLaTeX class by JSCE]


\newif\if@Proof \@Prooffalse
\DeclareOption{Proof}{\@Prooftrue}

%%%
%\newif\if@autolastpage\@autolastpagefalse
%\DeclareOption{AUTOGRAF}{\gdef\@type{autograf}\@autolastpagetrue}
%%% 


\def\pushtowall{\relax\leavevmode
\ifmmode\def\next{\mathpalette\mathpushw@ll}
\else\let\next\makepushw@ll \fi \next}
\def\finpushw@ll{\wd0=0pt \box0}
\def\makepushw@ll#1{\setbox0=\hbox{#1}\finpushw@ll}
\def\mathpushw@ll#1#2{\setbox0=\hbox{$\m@th#1{#2}$}\finpushw@ll}





\newcounter{@paper}
\newif\if@landscape \@landscapefalse
\newcommand{\@ptsize}{}
\newif\if@restonecol
\newif\if@titlepage
\@titlepagefalse
\hour\time \divide\hour by 60\relax
\@tempcnta\hour \multiply\@tempcnta 60\relax
\minute\time \advance\minute-\@tempcnta
\newif\if@stysize \@stysizefalse
\newif\if@enablejfam \@enablejfamtrue
\DeclareOption{a4paper}{\setcounter{@paper}{1}%
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5paper}{\setcounter{@paper}{2}%
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4paper}{\setcounter{@paper}{3}%
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5paper}{\setcounter{@paper}{4}%
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{a4j}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5j}{\setcounter{@paper}{2}\@stysizetrue
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4j}{\setcounter{@paper}{3}\@stysizetrue
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5j}{\setcounter{@paper}{4}\@stysizetrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\DeclareOption{a4p}{\setcounter{@paper}{1}\@stysizetrue
  \setlength\paperheight {297mm}%
  \setlength\paperwidth  {210mm}}
\DeclareOption{a5p}{\setcounter{@paper}{2}\@stysizetrue
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}}
\DeclareOption{b4p}{\setcounter{@paper}{3}\@stysizetrue
  \setlength\paperheight {364mm}
  \setlength\paperwidth  {257mm}}
\DeclareOption{b5p}{\setcounter{@paper}{4}\@stysizetrue
  \setlength\paperheight {257mm}
  \setlength\paperwidth  {182mm}}
\if@compatibility
  \renewcommand{\@ptsize}{0}
\else
  \DeclareOption{10pt}{\renewcommand{\@ptsize}{0}}
\fi
\DeclareOption{11pt}{\renewcommand{\@ptsize}{1}}
\DeclareOption{12pt}{\renewcommand{\@ptsize}{2}}
\DeclareOption{landscape}{\@landscapetrue
  \setlength\@tempdima{\paperheight}%
  \setlength\paperheight{\paperwidth}%
  \setlength\paperwidth{\@tempdima}}
\DeclareOption{tombow}{%
  \tombowtrue \tombowdatetrue
  \setlength{\@tombowwidth}{.1\p@}%
  \@bannertoken{%
     \jobname\space:\space\number\year/\number\month/\number\day
      (\number\hour:\number\minute)}
  \maketombowbox}
\DeclareOption{tombo}{%
  \tombowtrue \tombowdatefalse
  \setlength{\@tombowwidth}{.1\p@}%
  \maketombowbox}
\DeclareOption{mentuke}{%
  \tombowtrue
  \setlength{\@tombowwidth}{\z@}%
  \@bannertoken\@empty
  \maketombowbox}
\DeclareOption{tate}{%
  \AtBeginDocument{\tate\message{《縦組モード》}%
                   \adjustbaseline}%
}
\DeclareOption{oneside}{\@twosidefalse}
\DeclareOption{twoside}{\@twosidetrue}
\DeclareOption{onecolumn}{\@twocolumnfalse}
\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{titlepage}{\@titlepagetrue}
\DeclareOption{notitlepage}{\@titlepagefalse}
\DeclareOption{leqno}{\input{leqno.clo}}
\DeclareOption{fleqn}{\input{fleqn.clo}}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}}
\if@compatibility
\else
  \DeclareOption{disablejfam}{\@enablejfamfalse}
\fi
\DeclareOption{draft}{\setlength\overfullrule{5pt}}
\DeclareOption{final}{\setlength\overfullrule{0pt}}
%% Orignal %%% \ExecuteOptions{a4paper,10pt,oneside,onecolumn,final}
\ExecuteOptions{a4paper,10pt,twoside,twocolumn,final}
\ProcessOptions\relax

%%%%%%%%%%%% \input{jsize1\@ptsize.clo}

% \ProvidesFile{jsize10.clo}
%  [1998/04/07 v1.1m Standard pLaTeX file (size option)]
\renewcommand{\normalsize}{%
    \@setfontsize\normalsize\@xpt{15}%
  \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
  \abovedisplayshortskip \z@ \@plus3\p@
  \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI
}
\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}
\newcommand{\small}{%
  \@setfontsize\small\@ixpt{11}%
  \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus2\p@
  \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 4\p@ \@plus2\p@ \@minus2\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}
\newcommand{\footnotesize}{%
  \@setfontsize\footnotesize\@viiipt{9.5}%
  \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
  \abovedisplayshortskip \z@ \@plus\p@
  \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
  \def\@listi{\leftmargin\leftmargini
              \topsep 3\p@ \@plus\p@ \@minus\p@
              \parsep 2\p@ \@plus\p@ \@minus\p@
              \itemsep \parsep}%
  \belowdisplayskip \abovedisplayskip
}
\newcommand{\scriptsize}{\@setfontsize\scriptsize\@viipt\@viiipt}
\newcommand{\tiny}{\@setfontsize\tiny\@vpt\@vipt}
\newcommand{\large}{\@setfontsize\large\@xiipt{17}}
\newcommand{\Large}{\@setfontsize\Large\@xivpt{21}}
\newcommand{\LARGE}{\@setfontsize\LARGE\@xviipt{25}}
\newcommand{\huge}{\@setfontsize\huge\@xxpt{28}}
\newcommand{\Huge}{\@setfontsize\Huge\@xxvpt{33}}


%%%%%%%%%%%%%%%%%
%% JY1 it
\DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JY1}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JY1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
\DeclareFontShape{JY1}{mc}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%% JT1 it
\DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
\DeclareFontShape{JT1}{mc}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%%%%%%%%%%%%%%

\DeclareFontShape{JY1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{m}{sc}{<->ssub*mc/m/n}{}

\DeclareFontShape{JY1}{mc}{m}{sl}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{m}{sl}{<->ssub*mc/m/n}{}






\setlength\headheight{12\p@}
\setlength\headsep{25\p@}
\setlength\topskip{1\Cht}
\setlength\footskip{30\p@}
\if@compatibility
  \setlength\maxdepth{4\p@}
\else
  \setlength\maxdepth{.5\topskip}
\fi
\if@compatibility
  \if@stysize
    \ifnum\c@@paper=2 % A5
      \if@landscape
        \setlength\textwidth{47\Cwd}
      \else
        \setlength\textwidth{28\Cwd}
      \fi
    \else\ifnum\c@@paper=3 % B4
      \if@landscape
        \setlength\textwidth{75\Cwd}
      \else
        \setlength\textwidth{60\Cwd}
      \fi
    \else\ifnum\c@@paper=4 % B5
      \if@landscape
        \setlength\textwidth{60\Cwd}
      \else
        \setlength\textwidth{37\Cwd}
      \fi
    \else % A4 ant other
      \if@landscape
        \setlength\textwidth{73\Cwd}
      \else
        \setlength\textwidth{47\Cwd}
      \fi
    \fi\fi\fi
  \else
    \if@twocolumn
      \setlength\textwidth{52\Cwd}
    \else
      \setlength\textwidth{327\p@}
    \fi
  \fi
\else
  \if@stysize
    \if@twocolumn
      \setlength\textwidth{.8\paperwidth}
    \else
      \setlength\textwidth{.7\paperwidth}
    \fi
  \else
    \setlength\@tempdima{\paperwidth}
    \addtolength\@tempdima{-2in}
    \setlength\@tempdimb{327\p@}
    \if@twocolumn
      \ifdim\@tempdima>2\@tempdimb\relax
        \setlength\textwidth{2\@tempdimb}
      \else
        \setlength\textwidth{\@tempdima}
      \fi
    \else
      \ifdim\@tempdima>\@tempdimb\relax
        \setlength\textwidth{\@tempdimb}
      \else
        \setlength\textwidth{\@tempdima}
      \fi
    \fi
  \fi
\fi
\@settopoint\textwidth
\if@compatibility
  \if@stysize
    \ifnum\c@@paper=2 % A5
      \if@landscape
        \setlength\textheight{17\Cvs}
      \else
        \setlength\textheight{28\Cvs}
      \fi
    \else\ifnum\c@@paper=3 % B4
      \if@landscape
        \setlength\textheight{38\Cvs}
      \else
        \setlength\textheight{57\Cvs}
      \fi
    \else\ifnum\c@@paper=4 % B5
      \if@landscape
        \setlength\textheight{22\Cvs}
      \else
        \setlength\textheight{35\Cvs}
      \fi
    \else % A4 and other
      \if@landscape
        \setlength\textheight{27\Cvs}
      \else
        \setlength\textheight{43\Cvs}
      \fi
    \fi\fi\fi
    \addtolength\textheight{\topskip}
  \else
  \setlength\textheight{578\p@}
  \fi
\else
  \if@stysize
    \setlength\textheight{.75\paperheight}
  \else
    \setlength\@tempdima{\paperheight}
    \addtolength\@tempdima{-2in}
    \addtolength\@tempdima{-1.5in}
    \divide\@tempdima\baselineskip
    \@tempcnta\@tempdima
    \setlength\textheight{\@tempcnta\baselineskip}
  \fi
\fi
\addtolength\textheight{\topskip}
\@settopoint\textheight
\if@compatibility
  \if@stysize
    \setlength\topmargin{-.3in}
  \else
    \setlength\topmargin{27\p@}
  \fi
\else
  \setlength\topmargin{\paperheight}
  \addtolength\topmargin{-\headheight}
  \addtolength\topmargin{-\headsep}
  \addtolength\topmargin{-\textheight}
  \addtolength\topmargin{-\footskip}
  \if@stysize
    \ifnum\c@@paper=2 % A5
      \addtolength\topmargin{-1.3in}
    \else
      \addtolength\topmargin{-2.0in}
    \fi
  \else
    \addtolength\topmargin{-2.0in}
  \addtolength\topmargin{-.5\topmargin}
  \fi
\fi
\@settopoint\topmargin
\if@twocolumn
  \setlength\marginparsep{10\p@}
\else
  \setlength\marginparsep{10\p@}
\fi
\setlength\marginparpush{5\p@}
\if@compatibility
    \if@twoside
      \setlength\oddsidemargin   {44\p@}
      \setlength\evensidemargin  {82\p@}
      \setlength\marginparwidth {107\p@}
    \else
     \setlength\oddsidemargin   {60\p@}
     \setlength\evensidemargin  {60\p@}
     \setlength\marginparwidth  {90\p@}
  \fi
  \if@twocolumn
     \setlength\oddsidemargin  {30\p@}
     \setlength\evensidemargin {30\p@}
     \setlength\marginparwidth {48\p@}
  \fi
  \if@stysize
    \if@twocolumn\else
      \setlength\oddsidemargin{0\p@}
      \setlength\evensidemargin{0\p@}
    \fi
  \fi
\else
  \setlength\@tempdima{\paperwidth}
  \addtolength\@tempdima{-\textwidth}
  \if@twoside
    \setlength\oddsidemargin{.4\@tempdima}
  \else
    \setlength\oddsidemargin{.5\@tempdima}
  \fi
  \addtolength\oddsidemargin{-1in}
  \@settopoint\oddsidemargin
  \setlength\evensidemargin{\paperwidth}
  \addtolength\evensidemargin{-2in}
  \addtolength\evensidemargin{-\textwidth}
  \addtolength\evensidemargin{-\oddsidemargin}
  \@settopoint\evensidemargin
  \if@twoside
    \setlength\marginparwidth{.6\@tempdima}
    \addtolength\marginparwidth{-.4in}
  \else
    \setlength\marginparwidth{.5\@tempdima}
    \addtolength\marginparwidth{-.4in}
  \fi
  \ifdim \marginparwidth >2in
    \setlength\marginparwidth{2in}
  \fi
  \@settopoint\marginparwidth
\fi
\setlength\footnotesep{6.65\p@}
\setlength{\skip\footins}{9\p@ \@plus 4\p@ \@minus 2\p@}
\setlength\floatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\textfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dblfloatsep    {12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength\dbltextfloatsep{20\p@ \@plus 2\p@ \@minus 4\p@}
\setlength\@fptop{0\p@ \@plus 1fil}
\setlength\@fpsep{8\p@ \@plus 2fil}
\setlength\@fpbot{0\p@ \@plus 1fil}
\setlength\@dblfptop{0\p@ \@plus 1fil}
\setlength\@dblfpsep{8\p@ \@plus 2fil}
\setlength\@dblfpbot{0\p@ \@plus 1fil}
\setlength\partopsep{2\p@ \@plus 1\p@ \@minus 1\p@}
\def\@listi{\leftmargin\leftmargini
  \parsep 4\p@ \@plus2\p@ \@minus\p@
  \topsep 8\p@ \@plus2\p@ \@minus4\p@
  \itemsep4\p@ \@plus2\p@ \@minus\p@}
\let\@listI\@listi
\@listi
\def\@listii{\leftmargin\leftmarginii
   \labelwidth\leftmarginii \advance\labelwidth-\labelsep
   \topsep  4\p@ \@plus2\p@ \@minus\p@
   \parsep  2\p@ \@plus\p@  \@minus\p@
   \itemsep\parsep}
\def\@listiii{\leftmargin\leftmarginiii
   \labelwidth\leftmarginiii \advance\labelwidth-\labelsep
   \topsep 2\p@  \@plus\p@\@minus\p@
   \parsep\z@
   \partopsep \p@ \@plus\z@ \@minus\p@
   \itemsep\topsep}
\def\@listiv {\leftmargin\leftmarginiv
              \labelwidth\leftmarginiv
              \advance\labelwidth-\labelsep}
\def\@listv  {\leftmargin\leftmarginv
              \labelwidth\leftmarginv
              \advance\labelwidth-\labelsep}
\def\@listvi {\leftmargin\leftmarginvi
              \labelwidth\leftmarginvi
              \advance\labelwidth-\labelsep}
% \endinput
%%
%% End of file `jsize10.clo'.


%%%%%%%%%%%% end jsize1\@ptsize.clo
\if@stysize
  \setlength\columnsep{2\Cwd}
\else
  \setlength\columnsep{10\p@}
\fi
\setlength\columnseprule{0\p@}
\setlength\lineskip{1\p@}
\setlength\normallineskip{1\p@}
\renewcommand{\baselinestretch}{}
\setlength\parskip{0\p@ \@plus \p@}
\setlength\parindent{1\Cwd}
\@lowpenalty   51
\@medpenalty  151
\@highpenalty 301
\setcounter{topnumber}{2}
\setcounter{bottomnumber}{1}
\setcounter{totalnumber}{3}
\setcounter{dbltopnumber}{2}
\renewcommand{\topfraction}{.7}
\renewcommand{\bottomfraction}{.3}
\renewcommand{\textfraction}{.2}
\renewcommand{\floatpagefraction}{.5}
\renewcommand{\dbltopfraction}{.7}
\renewcommand{\dblfloatpagefraction}{.5}

%\def\ps@plain{\let\@mkboth\@gobbletwo
%   \let\ps@jpl@in\ps@plain
%   \let\@oddhead\@empty
%   \def\@oddfoot{\reset@font\hfil\thepage\hfil}%
%   \let\@evenhead\@empty
%   \let\@evenfoot\@oddfoot}

%\let\ps@jpl@in\ps@plain


\def\ps@headnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@headnombre
  \def\@evenhead{\thepage\hfil}%
  \def\@oddhead{\hfil\thepage}%
  \let\@oddfoot\@empty\let\@evenfoot\@empty}
\def\ps@footnombre{\let\@mkboth\@gobbletwo
    \let\ps@jpl@in\ps@footnombre
  \def\@evenfoot{\thepage\hfil}%
  \def\@oddfoot{\hfil\thepage}%
  \let\@oddhead\@empty\let\@evenhead\@empty}
\if@twoside
  \def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \let\@oddfoot\@empty\let\@evenfoot\@empty
    \def\@evenhead{\thepage\hfil\leftmark}%
    \def\@oddhead{{\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
    \def\sectionmark##1{\markboth{%
       \ifnum \c@secnumdepth >\z@ \thesection.\hskip1zw\fi
       ##1}{}}%
    \def\subsectionmark##1{\markright{%
       \ifnum \c@secnumdepth >\@ne \thesubsection.\hskip1zw\fi
       ##1}}%
  }
\else % if not twoside
  \def\ps@headings{\let\ps@jpl@in\ps@headnombre
    \let\@oddfoot\@empty
    \def\@oddhead{{\rightmark}\hfil\thepage}%
    \let\@mkboth\markboth
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\m@ne \thesection.\hskip1zw\fi
     ##1}}%
  }
\fi
\if@twoside
  \def\ps@bothstyle{\let\ps@jpl@in\ps@footnombre
    \def\@evenhead{\leftmark\hfil}% right page
    \def\@evenfoot{\thepage\hfil}% right page
    \def\@oddhead{\hfil\rightmark}% left page
    \def\@oddfoot{\hfil\thepage}% left page
  \let\@mkboth\markboth
  \def\sectionmark##1{\markboth{%
     \ifnum \c@secnumdepth >\z@ \thesection.\hskip1zw\fi
     ##1}{}}%
  \def\subsectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\@ne \thesubsection.\hskip1zw\fi
     ##1}}%
  }
\else % if one column
  \def\ps@bothstyle{\let\ps@jpl@in\ps@footnombre
    \def\@oddhead{\hfil\rightmark}%
    \def\@oddfoot{\hfil\thepage}%
    \let\@mkboth\markboth
  \def\sectionmark##1{\markright{%
     \ifnum \c@secnumdepth >\m@ne \thesection.\hskip1zw\fi
     ##1}}%
  }
\fi
\def\ps@myheadings{\let\ps@jpl@in\ps@plain%
  \let\@oddfoot\@empty\let\@evenfoot\@empty
  \def\@evenhead{\thepage\hfil\leftmark}%
  \def\@oddhead{{\rightmark}\hfil\thepage}%
  \let\@mkboth\@gobbletwo
  \let\sectionmark\@gobble
  \let\subsectionmark\@gobble
}
\if@compatibility
\newenvironment{titlepage}
    {%
     \if@twocolumn\@restonecoltrue\onecolumn
     \else\@restonecolfalse\newpage\fi
     \thispagestyle{empty}%
     \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn\else\newpage\fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi
\def\p@thanks#1{\footnotemark
  \protected@xdef\@thanks{\@thanks
    \protect{\noindent$\m@th^\thefootnote$~#1\protect\par}}}
\if@titlepage
  \newcommand{\maketitle}{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\Large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
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
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }%
\else
  \newcommand{\maketitle}{\par
  \begingroup
    \renewcommand{\thefootnote}{\fnsymbol{footnote}}%
    \def\@makefnmark{\hbox{\ifydir $\m@th^{\@thefnmark}$
      \else\hbox{\yoko$\m@th^{\@thefnmark}$}\fi}}%
     \long\def\@makefntext##1{\parindent 1em\noindent
       \hbox to1.8em{\hss$\m@th^{\@thefnmark}$}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne \@maketitle
      \else \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
%% original     \thispagestyle{jpl@in}\@thanks
     \thispagestyle{plain}
\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\p@thanks\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
  }
  \def\@maketitle{%
  \newpage\null
  \vskip 2em%
  \begin{center}%
  \let\footnote\thanks
    {\LARGE \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par\vskip 1.5em}
\fi
\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        {\bfseries\abstractname}%
        \@endparpenalty\@M
      \end{center}}%
      {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
    \if@twocolumn
      \section*{\abstractname}%
    \else
      \small
      \begin{center}%
        {\bfseries\abstractname\vspace{-.5em}\vspace{\z@}}%
      \end{center}%
      \quotation
    \fi}{\if@twocolumn\else\endquotation\fi}
\fi
\setcounter{secnumdepth}{3}
\newcounter{part}
\newcounter{section}
\newcounter{subsection}[section]
\newcounter{subsubsection}[subsection]
\newcounter{paragraph}[subsubsection]
\newcounter{subparagraph}[paragraph]
\renewcommand{\thepart}{\@Roman\c@part}
\renewcommand{\thesection}{\@arabic\c@section}
\renewcommand{\thesubsection}{\thesection.\@arabic\c@subsection}
\renewcommand{\thesubsubsection}{%
   \thesubsection.\@arabic\c@subsubsection}
\renewcommand{\theparagraph}{%
   \thesubsubsection.\@arabic\c@paragraph}
\renewcommand{\thesubparagraph}{%
   \theparagraph.\@arabic\c@subparagraph}
\newcommand{\part}{\par\addvspace{4ex}%
  \@afterindentfalse
  \secdef\@part\@spart}
\def\@part[#1]#2{%
  \ifnum \c@secnumdepth >\m@ne
    \refstepcounter{part}%
    \addcontentsline{toc}{part}{%
       \prepartname\thepart\postpartname\hspace{1zw}#1}%
  \else
    \addcontentsline{toc}{part}{#1}%
  \fi
  \markboth{}{}%
  {\parindent\z@\raggedright
   \interlinepenalty\@M\reset@font
   \ifnum \c@secnumdepth >\m@ne
     \Large\bfseries\prepartname\thepart\postpartname
     \par\nobreak
   \fi
   \huge\bfseries#2\par}%
  \nobreak\vskip3ex\@afterheading}
\def\@spart#1{{%
  \parindent\z@\raggedright
  \interlinepenalty\@M\reset@font
  \huge\bfseries#1\par}%
  \nobreak\vskip3ex\@afterheading}

\newcommand{\section}{%
\@startsection{section}{1}{\z@}%
   {1.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {.5\Cvs \@plus.3\Cdp}%
   {\reset@font\Large\bfseries\sffamily}
}


\newcommand{\subsection}{%
\@startsection{subsection}{2}{\z@}%
   {1.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {.5\Cvs \@plus.3\Cdp}%
   {\reset@font\large\bfseries\sffamily}
}


\newcommand{\subsubsection}{%
\@startsection{subsubsection}{3}{\z@}%
   {1.5\Cvs \@plus.5\Cdp \@minus.2\Cdp}%
   {.5\Cvs \@plus.3\Cdp}%
   {\reset@font\normalsize\bfseries\sffamily}
}

\newcommand{\paragraph}{%
\@startsection{paragraph}{4}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\reset@font\normalsize\bfseries\sffamily}
}

\newcommand{\subparagraph}{%
\@startsection{subparagraph}{5}{\z@}%
   {3.25ex \@plus 1ex \@minus .2ex}%
   {-1em}%
   {\reset@font\normalsize\bfseries\sffamily}
}




\newcommand{\appendix}{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand{\thesection}{\@Alph\c@section}}



\if@twocolumn
  \setlength\leftmargini {2em}
\else
  \setlength\leftmargini {2.5em}
\fi
\setlength\leftmarginii  {2.2em}
\setlength\leftmarginiii {1.87em}
\setlength\leftmarginiv  {1.7em}
\if@twocolumn
  \setlength\leftmarginv {.5em}
  \setlength\leftmarginvi{.5em}
\else
  \setlength\leftmarginv {1em}
  \setlength\leftmarginvi{1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty
\renewcommand{\theenumi}{\@arabic\c@enumi}
\renewcommand{\theenumii}{\@alph\c@enumii}
\renewcommand{\theenumiii}{\@roman\c@enumiii}
\renewcommand{\theenumiv}{\@Alph\c@enumiv}
\newcommand{\labelenumi}{\theenumi.}
\newcommand{\labelenumii}{(\theenumii)}
\newcommand{\labelenumiii}{\theenumiii.}
\newcommand{\labelenumiv}{\theenumiv.}
\renewcommand{\p@enumii}{\theenumi}
\renewcommand{\p@enumiii}{\theenumi(\theenumii)}
\renewcommand{\p@enumiv}{\p@enumiii\theenumiii}
\renewenvironment{enumerate}
  {\ifnum \@enumdepth >3\relax\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newcommand{\labelitemi}{\textbullet}
\newcommand{\labelitemii}{%
  \iftdir
     {\textcircled{~}}
  \else
     {\normalfont\bfseries\textendash}
  \fi
}
\newcommand{\labelitemiii}{\textasteriskcentered}
\newcommand{\labelitemiv}{\textperiodcentered}
\renewenvironment{itemize}
  {\ifnum \@itemdepth >3\relax\@toodeep\else
   \advance\@itemdepth\@ne
   \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
   \expandafter
   \list{\csname \@itemitem\endcsname}{%
      \iftdir
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@ \itemsep\z@ \parsep\z@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@itemdepth =\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
         \advance\leftmargin 1zw
      \fi
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
\newenvironment{description}
  {\list{}{\labelwidth\z@ \itemindent-\leftmargin
   \iftdir
     \leftmargin\leftskip \advance\leftmargin3\Cwd
     \rightmargin\rightskip
     \labelsep=1zw \itemsep\z@
     \listparindent\z@ \topskip\z@ \parskip\z@ \partopsep\z@
   \fi
           \let\makelabel\descriptionlabel}}{\endlist}
\newcommand{\descriptionlabel}[1]{%
   \hspace\labelsep\normalfont\bfseries #1}
\newenvironment{verse}
  {\let\\\@centercr
   \list{}{\itemsep\z@ \itemindent -1.5em%
           \listparindent\itemindent
           \rightmargin\leftmargin \advance\leftmargin 1.5em}%
           \item\relax}{\endlist}
\newenvironment{quotation}
  {\list{}{\listparindent 1.5em%
           \itemindent\listparindent
           \rightmargin\leftmargin
           \parsep\z@ \@plus\p@}%
           \item\relax}{\endlist}
\newenvironment{quote}
  {\list{}{\rightmargin\leftmargin}%
           \item\relax}{\endlist}


\newcounter{figure}
\renewcommand{\thefigure}{\@arabic\c@figure}
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}



\newcounter{table}
\renewcommand{\thetable}{\@arabic\c@table}
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}

\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{10\p@}
\setlength\belowcaptionskip{0\p@}
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \iftdir\sbox\@tempboxa{#1\hskip1zw#2}%
    \else\sbox\@tempboxa{#1: #2}%
  \fi
  \ifdim \wd\@tempboxa >\hsize
    \iftdir #1\hskip1zw#2\relax\par
      \else #1: #2\relax\par\fi
  \else
    \global \@minipagefalse
    \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\renewcommand{\theequation}{\@arabic\c@equation}
\if@enablejfam
  \DeclareSymbolFont{mincho}{JY1}{mc}{m}{n}
  \DeclareSymbolFontAlphabet{\mathmc}{mincho}
  \SetSymbolFont{mincho}{bold}{JY1}{gt}{m}{n}
  \DeclareMathAlphabet{\mathgt}{JY1}{gt}{m}{n}
  \reDeclareMathAlphabet{\mathrm}{\@mathrm}{\@mathmc}
  \reDeclareMathAlphabet{\mathbf}{\@mathbf}{\@mathgt}
  \jfam\symmincho
\else
  \DeclareRobustCommand{\mathmc}{%
    \@latex@error{Command \noexpand\mathmc invalid with\space
       `disablejfam' class option.}\@eha
  }
  \DeclareRobustCommand{\mathgt}{%
    \@latex@error{Command \noexpand\mathgt invalid with\space
       `disablejfam' class option.}\@eha
  }
\fi
\DeclareOldFontCommand{\mc}{\normalfont\mcfamily}{\mathmc}
\DeclareOldFontCommand{\gt}{\normalfont\gtfamily}{\mathgt}
\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*{\cal}{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*{\mit}{\@fontswitch\relax\mathnormal}
\setcounter{tocdepth}{3}
\newcommand{\@pnumwidth}{1.55em}
\newcommand{\@tocrmarg}{2.55em}
\newcommand{\@dotsep}{4.5}
\newdimen\toclineskip
\setlength\toclineskip{\z@}
\newdimen\@lnumwidth
\def\numberline#1{\hbox to\@lnumwidth{#1\hfil}}
\def\@dottedtocline#1#2#3#4#5{\ifnum #1>\c@tocdepth \else
  \vskip\toclineskip \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
    \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode
   \@lnumwidth #3\relax
   \advance\leftskip \@lnumwidth \hbox{}\hskip -\leftskip
    {#4}\nobreak\leaders\hbox{$\m@th \mkern \@dotsep mu.\mkern \@dotsep
       mu$}\hfill \nobreak\hbox to\@pnumwidth{%
         \hss\reset@font\rmfamily \normalcolor #5}\par}\fi}
\def\addcontentsline#1#2#3{%
  \protected@write\@auxout
    {\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
\@temptokena{\thepage}}%
    {\string\@writefile{#1}%
       {\protect\contentsline{#2}{#3}{\the\@temptokena}}}%
}
\newcommand{\tableofcontents}{%
  \section*{\contentsname
    \@mkboth{\contentsname}{\contentsname}%
  }\@starttoc{toc}%
}
\newcommand*{\l@part}[2]{%
  \ifnum \c@tocdepth >-2\relax
    \addpenalty{\@secpenalty}%
    \addvspace{2.25em \@plus\p@}%
    \begingroup
    \parindent\z@\rightskip\@pnumwidth
    \parfillskip-\@pnumwidth
    {\leavevmode\large\bfseries
     \setlength\@lnumwidth{4zw}%
     #1\hfil\nobreak
     \hbox to\@pnumwidth{\hss#2}}\par
    \nobreak
    \if@compatibility
    \global\@nobreaktrue
    \everypar{\global\@nobreakfalse\everypar{}}%
    \fi
     \endgroup
  \fi}
\newcommand*{\l@section}[2]{%
  \ifnum \c@tocdepth >\z@
    \addpenalty{\@secpenalty}%
    \addvspace{1.0em \@plus\p@}%
    \begingroup
      \parindent\z@ \rightskip\@pnumwidth \parfillskip-\rightskip
      \leavevmode\bfseries
      \setlength\@lnumwidth{1.5em}%
      \advance\leftskip\@lnumwidth \hskip-\leftskip
      #1\nobreak\hfil\nobreak\hbox to\@pnumwidth{\hss#2}\par
    \endgroup
  \fi}
\newcommand*{\l@subsection}   {\@dottedtocline{2}{1.5em}{2.3em}}
\newcommand*{\l@subsubsection}{\@dottedtocline{3}{3.8em}{3.2em}}
\newcommand*{\l@paragraph}    {\@dottedtocline{4}{7.0em}{4.1em}}
\newcommand*{\l@subparagraph} {\@dottedtocline{5}{10em}{5em}}
\newcommand{\listoffigures}{%
    \section*{\listfigurename
  \@mkboth{\listfigurename}{\listfigurename}}%
  \@starttoc{lof}%
}
\newcommand*{\l@figure}{\@dottedtocline{1}{1.5em}{2.3em}}
\newcommand{\listoftables}{%
    \section*{\listtablename
  \@mkboth{\listtablename}{\listtablename}}%
  \@starttoc{lot}%
}
\let\l@table\l@figure
\newdimen\bibindent
\setlength\bibindent{1.5em}
\newcommand{\newblock}{\hskip .11em\@plus.33em\@minus.07em}
\newenvironment{thebibliography}[1]
{\section*{\refname\@mkboth{\refname}{\refname}}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
        {\settowidth\labelwidth{\@biblabel{#1}}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}
\let\@openbib@code\@empty
\newenvironment{theindex}
  {\if@twocolumn\@restonecolfalse\else\@restonecoltrue\fi
   \columnseprule\z@ \columnsep 35\p@
   \twocolumn[\section*{\indexname}]%
   \@mkboth{\indexname}{\indexname}%
   \thispagestyle{jpl@in}\parindent\z@
   \parskip\z@ \@plus .3\p@\relax
   \let\item\@idxitem}
  {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand{\@idxitem}{\par\hangindent 40\p@}
\newcommand{\subitem}{\@idxitem \hspace*{20\p@}}
\newcommand{\subsubitem}{\@idxitem \hspace*{30\p@}}
\newcommand{\indexspace}{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand{\footnoterule}{%
  \kern-3\p@
  \hrule width .4\columnwidth
  \kern 2.6\p@}
\newcommand\@makefntext[1]{\parindent 1em
  \noindent\hbox to 1.8em{\hss\@makefnmark}#1}
\newif\if西暦 \西暦false
\def\西暦{\西暦true}
\def\和暦{\西暦false}
\newcount\heisei \heisei\year \advance\heisei-1988\relax
\def\today{{%
  \iftdir
    \if西暦
      \kansuji\number\year 年
      \kansuji\number\month 月
      \kansuji\number\day 日
    \else
      平成\ifnum\heisei=1 元年\else\kansuji\number\heisei 年\fi
      \kansuji\number\month 月
      \kansuji\number\day 日
    \fi
  \else
    \if西暦
      \number\year~年
      \number\month~月
      \number\day~日
    \else
      平成\ifnum\heisei=1 元年\else\number\heisei~年\fi
      \number\month~月
      \number\day~日
    \fi
  \fi}}
\newcommand{\prepartname}{第}
\newcommand{\postpartname}{部}
\newcommand{\contentsname}{目 次}
\newcommand{\listfigurename}{図 目 次}
\newcommand{\listtablename}{表 目 次}
\newcommand{\refname}{参考文献}
\newcommand{\indexname}{索 引}
\newcommand{\figurename}{図}
\newcommand{\tablename}{表}
\newcommand{\appendixname}{付 録}
\newcommand{\abstractname}{概 要}







\pagestyle{plain}
\pagenumbering{arabic}
\raggedbottom
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi
\if@twoside
  \@mparswitchtrue
\else
  \@mparswitchfalse
\fi




%\setlength{\textheight}{30\baselineskip}%% = 31L
%\addtolength{\textheight}{\topskip}
%\setlength{\textwidth}{35\Cwd}
  \setlength\paperheight {210mm}
  \setlength\paperwidth  {148mm}

%% 天地左右中央
%\evensidemargin=-8.375mm%-25.375mm%    小口 17mm
%\oddsidemargin=-8.375mm%-15mm%-7mm%   
%\topmargin=-11.75mm%          天 21mm



%% 1pt=.3514mm
%\textwidth=168.672mm%170mm
%\textheight=253mm
%\headheight=12pt
%\headsep=1mm
%\footskip=8mm
%\columnsep=6mm

\evensidemargin=-4.5mm
\oddsidemargin=-4.5mm


  \topmargin=-11.5mm
%
\flushbottom


% \typeout{\space\space\space
% Proc. of JSCE Ver. <29 Apr 1998> [-30]1076.1: M.Watanabe & T.Iwakuma}
%
% OFSS vs. NFSS
\@ifundefined{reset@font}{\let\reset@font\empty}{}
%
% INPUT indent.sty for indentation
%
\input indent.sty%
%
% DOCUMENT SIZE
%
\textwidth=170mm
\textheight=253mm
\headheight=12pt
\headsep=1mm
\footskip=8mm
\columnsep=6mm
%
\flushbottom
% \pagestyle{empty} % H_AND_F
%
% Header Control; No Header at the last submission
\newif\ifNoHeader \NoHeaderfalse
\def\finalversion{\NoHeadertrue}
%

% for ASCII
  \evensidemargin=-5.5mm
  \oddsidemargin=-5.5mm
  \topmargin=-11.5mm

%
% JAPANESE setting = default
%
\newif\ifEN@LISH \EN@LISHfalse
%
% adjust spacings at equations to save spaces in the document
%




%
%\normalsize
%
% line pitch
%

  \renewcommand{\baselinestretch}{1.000}



\renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@xpt{15pt plus1pt minus1pt}%
  \abovedisplayskip \jot plus3pt \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \z@ plus3pt\belowdisplayshortskip \jot plus3pt
  \let\@listi\@listI
}
\normalsize
\setbox0\hbox{\char\euc"A1A1}%
\setlength\Cht{\ht0}
\setlength\Cdp{\dp0}
\setlength\Cwd{\wd0}
\setlength\Cvs{\baselineskip}
\setlength\Chs{\wd0}

\renewcommand{\small}{%
\@setfontsize\small\@ixpt{11pt}%
  \abovedisplayskip \jot plus2pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \z@ plus2pt\belowdisplayshortskip \jot plus2pt
  \def\@listi{\leftmargin\leftmargini \topsep 4pt plus 2pt minus 2pt\parsep 2pt
  plus 1pt minus 1pt
  \itemsep \parsep}%
}
\renewcommand{\footnotesize}{%
\@setfontsize\footnotesize\@viiipt{9.5pt}
  \abovedisplayskip \jot plus 1pt\belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \z@ plus 1pt\belowdisplayshortskip \jot plus 1pt
  \def\@listi{\leftmargin\leftmargini \topsep 3pt plus 1pt minus 1pt\parsep 2pt
  plus 1pt minus 1pt
  \itemsep \parsep}%
}


%%% 2.09 font size convert to LaTeX2e
\let\vpt\@vpt
\let\vipt\@vipt
\let\viipt\@viipt
\let\viiipt\@viiipt%%%%%

\let\ixpt\@ixpt
%\let\xpt\@xpt%%%%%
%\let\xipt\@xipt%%%%%

%% jsce-man.tex 
%% \def\CL{\hbox{\xpt\raisebox{.2ex}[0pt][0pt]{{\sc c}}\kern-1.4ex{\xipt\sl L}}}
%% c L を重ねる記号のフォントサイズ：うまくいかない！
\font\xpt=cmr10 at 10pt
\font\xipt=cmr10 at 11pt
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%\let\xiipt\@xiipt%%%%%
%%jsce-fig.tex 
\font\xiipt=cmr10 at 12pt

\let\xivpt\@xivpt



\renewcommand{\baselinestretch}{1}%%%% default {}
%%%%%%%%%%%% end 


%%%%%%%%%%%%%%%%%
%% JY1 it
\DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JY1}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JY1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
\DeclareFontShape{JY1}{mc}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%% JT1 it
\DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{bx}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{m}{it}{<->ssub*gt/m/n}{}
\DeclareFontShape{JT1}{gt}{bx}{it}{<->ssub*gt/m/n}{}
%%
\DeclareFontShape{JT1}{mc}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{mc}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{b}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{eb}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JT1}{gt}{ub}{it}{<->ssub*mc/m/n}{}
%%%%%%%%%%%%%%


\DeclareFontShape{JT1}{mc}{m}{it}{<->ssub*mc/m/n}{}
\DeclareFontShape{JY1}{mc}{m}{it}{<->ssub*mc/m/n}{}

%\DeclareFontShape{JT1}{mc}{m}{sc}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{mc}{m}{sc}{<->ssub*mc/m/n}{}

%\DeclareFontShape{JT1}{mc}{m}{sl}{<->ssub*mc/m/n}{}
%\DeclareFontShape{JY1}{mc}{m}{sl}{<->ssub*mc/m/n}{}





%
%\def\figurename{図\mbox{}--}
%\def\tablename{表\mbox{}--}
%\def\photoname{写真\mbox{}--}
%\def\figuresname{図\mbox{}--}
%\def\tablesname{表\mbox{}--}
%\def\photosname{写真\mbox{}--}
%\def\@receivename{\ 受付}
%\def\appendixname{付録}
%\def\appendixsectionname{\Roman{section}}
%\def\refname{参考文献}


\renewcommand{\figurename}{図\nobreak--}
\renewcommand{\tablename}{表\nobreak--}
\newcommand{\photoname}{写真\nobreak--}

\newcommand{\figuresname}{図\nobreak--}
\newcommand{\tablesname}{表\nobreak--}
\newcommand{\photosname}{写真\nobreak--}

%\newcommand{\@receivename}{\ 受付}
\newcommand{\@receivename}{Received\ }
\newcommand{\@acceptname}{Accepted\ }
\renewcommand{\appendixname}{付録}
\newcommand{\appendixsectionname}{\Roman{section}}
\renewcommand{\refname}{参考文献}
\newcommand{\ackname}{謝辞:}


%
% ENGLISH setting
%
\def\inenglish{\EN@LISHtrue
%
  \footskip=9mm
%
% for 11pt from art11.sty
%
\renewcommand{\normalsize}{%
\@setfontsize\normalsize\@xipt{13.6pt}
  \abovedisplayskip \jot plus3\p@
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip  \z@ plus3\p@
  \belowdisplayshortskip  \jot plus3\p@
  \let\@listi\@listI
}
  \normalsize
%
\renewcommand{\small}{%
\@setfontsize\small\@xpt{12pt}
  \abovedisplayskip \jot plus2\p@
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip  \z@ plus2\p@
  \belowdisplayshortskip  \jot plus2\p@
  \def\@listi{\leftmargin\leftmargini
  \topsep 6\p@ plus2\p@ minus2\p@\parsep 3\p@ plus2\p@ minus\p@
  \itemsep \parsep}
}
%
%
\renewcommand{\footnotesize}{%
\@setfontsize\footnotesize\@ixpt{11pt}
  \abovedisplayskip \jot plus\p@
  \belowdisplayskip \abovedisplayskip
  \abovedisplayshortskip \z@ plus\p@
  \belowdisplayshortskip \jot plus\p@
  \def\@listi{\leftmargin\leftmargini
  \topsep 4\p@ plus2\p@ minus2\p@\parsep 2\p@ plus\p@ minus\p@
  \itemsep \parsep}
}
%
%

%
% line pitch
%
  \renewcommand{\baselinestretch}{.943}%
%
% footer for page numbers    :    H_AND_F
  \def\@oddfoot{\@Lbot%
   \setcounter{englishpage}{\@fromenglishpage}%
   \addtocounter{englishpage}{\thepage}%
   \addtocounter{englishpage}{-\@frompage}%
%   \reset@font\rm\hfil\thepage~(\theenglishpage{s})\hfil}%
   \reset@font\rm\hfil\thepage\hfil\@Rbot}%CHANGED
  \let\@evenfoot\@oddfoot
%
%  \def\figurename{Fig.}%
%  \def\tablename{Table}%
%  \def\photoname{Photo}%

%  \def\figuresname{Figs.}%
%  \def\tablesname{Tables}%
%  \def\photosname{Photos}%

%  \def\fnum@figure{\figurename~\thefigure}%
%  \def\fnum@table{\tablename~\thetable}%
%  \def\fnum@photo{\photoname~\thephoto}%

%  \def\@receivename{Received\ }%
%  \def\appendixname{Appendix}%
%  \def\appendixsectionname{\Alph{section}}%
%  \def\refname{REFERENCES}%
%%%%% 

\renewcommand{\figurename}{Fig.}
\renewcommand{\tablename}{Table}
\renewcommand{\photoname}{Photo}

\renewcommand{\figuresname}{Figs.}
\renewcommand{\tablesname}{Tables}
\renewcommand{\photosname}{Photos}

  \def\fnum@figure{\figurename\thefigure}%
  \def\fnum@table{\tablename\thetable}%
  \def\fnum@photo{\photoname\thephoto}%

\renewcommand{\@receivename}{Received\ }
\renewcommand{\appendixname}{APPENDIX}
\renewcommand{\appendixsectionname}{\Alph{section}}
\renewcommand{\refname}{REFERENCES}
\renewcommand{\ackname}{ACKNOWLEDGMENT:}
}
%
% BASIC SETTINGS FOR HEADERS AND FOOTERS : H_AND_F
%
\newcounter{englishpage} % page # for english part
\newcounter{@field@number}
%
\def\firstpagenumber#1{\gdef\@frompage{#1}%
  \global\setcounter{page}{\@frompage}} \gdef\@frompage{1}
\def\firstenglishpagenumber#1{\gdef\@fromenglishpage{#1}}
\gdef\@fromenglishpage{1}
%
\gdef\@topage{\pageref{page:lastpagenumber}}
\gdef\@toenglishpage{\ref{page:lastenglishpagenumber}}
%
\def\volumenumber#1{\gdef\@volumenumber{#1}} \gdef\@volumenumber{0}
\def\journalnumber#1{\gdef\@numberofjournal{#1}} \gdef\@numberofjournal{0}
\def\pubmonth#1{\gdef\@month{#1}} \gdef\@month{\number\month}
\gdef\@englishmonth{\ifcase\@month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi}
\def\pubyear#1{\gdef\@year{#1}} \gdef\@year{\number\year}
\def\procnumber#1{\gdef\@numberofpub{#1}} \gdef\@numberofpub{0}
\def\fieldnumber#1{\setcounter{@field@number}{#1}}
  \setcounter{@field@number}{1}
\def\@fieldnumber{\Roman{@field@number}}
\def\@ejournalname{\ifcase\arabic{@field@number}\or
  Structural Mechanics and Earthquake Engineering\or % 1 SECTION
  Hydraulic and Sanitary Engineering\or              % 2
  Geotechnical Engineering\or                        % 3
  Infrastructure Planning and Management\or          % 4
  Concrete Engineering and Pavement\or               % 5
  The Civil Engineering\fi}                          % 6
\def\procnumberofthefield#1{\gdef\@numberoffieldnumber{#1}}
  \gdef\@numberoffieldnumber{1}
%
% plain page style
%
%\def\ps@plain{\let\@mkboth\@gobbletwo
% \ifNoHeader\def\@oddhead{}\else
%     \def\@oddhead{\reset@font\viiipt\rm\hfil
%  \ifEN@LISH Journal of~\@ejournalname, Vol.\@volumenumber,
%   No.\@numberofjournal, %      ~(JSCE No.\@numberofpub/%
%%                              \@fieldnumber--\@numberoffieldnumber),
%%     \@fromenglishpage{s}---\@toenglishpage{s}, \@year~\@englishmonth
%     \@fromenglishpage---\@toenglishpage, \@year~\@englishmonth%CHANGED
%  \else
%   土木学会論文集 No.\@numberofpub/\@fieldnumber--\@numberoffieldnumber,
%   pp.\@frompage--\@topage, \@year.\@month
%  \fi}\def\@oddfoot{\reset@font\xpt\rm\hfil\thepage
%%   \ifEN@LISH%
%%    \setcounter{englishpage}{\@fromenglishpage}%CHANGED
%%    \addtocounter{englishpage}{\thepage}%
%%    \addtocounter{englishpage}{-\@frompage}%
%%      ~(\theenglishpage{s})
%%   \fi%
%     \hfil}%
% \fi
% \let\@evenhead\@empty\let\@evenfoot\@oddfoot%
%}
%%%%%%% 

\if@Proof
 \def\@Rtop{\rlap{\smash{\rule[-\headsep]{0.05mm}{10mm}%
  \rule[-\headsep]{10mm}{0.05mm}}}}
 \def\@Ltop{\llap{\smash{\rule[-\headsep]{10mm}{0.05mm}%
  \rule[-\headsep]{0.05mm}{10mm}}}}
 \def\@Rbot{\rlap{\smash{\raisebox{1\footskip}
  {\rule[-10mm]{0.05mm}{10mm}\rule{10mm}{0.05mm}}}}}
%  {\rule[-15.73mm]{0.05mm}{15.73mm}\rule{23.73mm}{0.05mm}\rule[-15.73mm]{0.05mm}{15.73mm}}}}}
 \def\@Lbot{\llap{\smash{\raisebox{1\footskip}
  {\rule{10mm}{0.05mm}\rule[-10mm]{0.05mm}{10mm}}}}}
% \def\pot@jobname{\smash{\raise7mm\rlap{\LARGE\texttt{\jobname}}}}
\else
 \let\@Rtop\relax\let\@Ltop\relax\let\@Rbot\relax\let\@Lbot\relax
% \let\pot@jobname\relax
\fi

%% HEADER:  title pages
  \def\ps@plain{%
 \ifNoHeader\def\@oddhead{}\else
\def\@oddhead{\@Ltop%\reset@font\@viiipt\rm
\footnotesize\rm\hfil
  \ifEN@LISH Journal of~\@ejournalname, Vol.\@volumenumber,
   No.\@numberofjournal, %
     \@fromenglishpage---\@toenglishpage, \@year~\@englishmonth%CHANGED
  \else
   土木学会論文集 No.\@numberofpub/\@fieldnumber--\@numberoffieldnumber,
   pp.\@frompage--\@topage, \@year.\@month
  \fi\@Rtop}%
\def\@evenhead{\@Ltop\hfil\@Rtop}%
\def\@oddfoot{\@Lbot%\reset@font\@xpt
\normalsize\rm\hfil\thepage\hfil\@Rbot}%
\let\@evenfoot\@oddfoot%
\let\@mkboth\markboth%
\fi
 \let\@evenhead\@empty\let\@evenfoot\@oddfoot%
}
%% %%%%%%%%%%%%%%%%%%%%

%% HEADER: all pages
\def\ps@plainnormal{\let\@mkboth\@gobbletwo
   \let\ps@jpl@in\ps@plainnormal
   \def\@oddhead{\@Ltop\normalsize\rm\hfil{}\hfil\@Rtop}%
  \def\@oddfoot{\@Lbot\normalsize\rm\hfil\thepage\hfil\@Rbot}%
   \def\@evenhead{\@Ltop\normalsize\rm\hfil{}\hfil\@Rtop}%
   \let\@evenfoot\@oddfoot
}
%% %%%%%%%%%%%%%%%%%%%


%
%
% MAKETITLE
%
\newdimen\vspace@title
\newdimen\vspace@abstract
\vspace@title=5.5cm
\vspace@abstract=4cm
\def\titlepagecontrol#1{\gdef\@titlepagecontrol{#1}}
\gdef\@titlepagecontrol{0}
%
% minor-font definition for {'KEY WORDS:'}
%
% \font\fontkeywords=cmbxti10
\def\fontkeywords{}
\long\def\abstract#1{\gdef\@abstract{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
% \def\keywordsname{\fontkeywords Key Words :} % cmbxti じゃなくした JSCE
\def\keywordsname{\textbf{\textit Key Words:}} % セミコロン前不要なはず？
%
% \maketitle
%
\def\maketitle{\par
  \begingroup
%    \def\thefootnote{\fnsymbol{footnote}}% simple numbering
    \def\@makefnmark{\hbox
        %to\z@
{$\m@th^{\@thefnmark}$\hss}}%
    \if@twocolumn
      \twocolumn[\@maketitle]%
      \else \newpage
      \global\@topnum\z@
      \@maketitle \fi\thispagestyle{plain}% \@thanks
%                                   ^^^^^ was "empty" : H_AND_F
  \endgroup
%
  \setcounter{footnote}{0}%
  \let\maketitle\relax
  \let\@maketitle\relax
  \gdef\@thanks{}\gdef\@author{}\gdef\@title{}\let\thanks\relax%
}
%
% \@maketitle
%
\def\@maketitle{\newpage\null
   \ifEN@LISH\vskip 7mm\else\vskip 4mm\fi % cheating
%                                                                title
   \begin{ctrindent}{10mm}{10mm}%
    {\ifEN@LISH\LARGE\else\huge\fi\bfseries\sffamily \lineskip .5em \@title \par}%
   \end{ctrindent} \vskip 12mm % cheating
%                                                               author
   \begin{ctrindent}{10mm}{10mm}%
    {\large \@author\par}%
   \vskip 4mm % cheating
%
   \setcounter{footnote}{0}%
%    {\footnotesize\baselineskip3.5mm \@thanks}% original
%    {\footnotesize\baselineskip3.5mm \@thanks}% 行間少し狭いので調整 v1.2
     {\small\baselineskip4.5mm \@thanks}% 9pt (\small) に調整 フォントサイズに応じて行間も修正
   \end{ctrindent}
%
  \vskip 9mm % cheating
%                                                             abstract
   \@ifundefined{@abstract}{}{%
   \begin{list}{}{\setlength{\leftmargin}{10mm}%
    \topsep=0pt \partopsep=0pt \parsep=0pt \listparindent=9pt
    \setlength{\rightmargin}{\leftmargin}%
    \small
\xkanjiskip=.25zw plus1pt minus1pt%
}%
   \item \ignorespaces\hspace*{\listparindent}\ignorespaces
              \@abstract \par
   \vskip 1.5em%
%                                                             keywords
   \@ifundefined{@keywords}{}{%
    \begin{list}{\keywordsname}{%
     \topsep=-0.8\parskip \partopsep=0pt
     \settowidth{\labelwidth}{\keywordsname}%
     \settowidth{\leftmargin}{1.1\keywordsname}%
     \small\it\setlength{\baselineskip}{0.75\normalbaselineskip}}%
    \item \@keywords \par
    \end{list}}%
   \end{list}}%
   \vskip 9mm%
%                                      adjust or avoid Underfull \vbox
  \vskip \@titlepagecontrol ex%
}
%
% Re-definition of \thanks which no longer in the footnote
%
\def\thanks#1{\footnotemark\begingroup
\def\protect{\noexpand\protect\noexpand}\xdef\@thanks{\@thanks
  \protect\footnotemark\hspace{1ex}#1\protect\par}\endgroup}



%%% redefinition by SANBI %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\def\@Mfor#1:=#2\do#3{\edef\@fortmp{#2}\ifx\@fortmp\@empty \else
    \expandafter\@Mforloop#2・\@nil・\@nil\@@#1{#3}\fi}

\def\@Mforloop#1・#2・#3\@@#4#5{\def#4{#1}\ifx #4\@nnil \else
       #5\def#4{#2}\ifx #4\@nnil \else#5\@Miforloop #3\@@#4{#5}\fi\fi}

\def\@Miforloop#1・#2\@@#3#4{\def#3{#1}\ifx #3\@nnil 
       \let\@nextwhile=\@fornoop \else
      #4\relax\let\@nextwhile=\@Miforloop\fi\@nextwhile#2\@@#3{#4}}


%%% 
%% begin to make of Author \expandafter
\newcounter{choshai}
\newcounter{choshaii}
\def\author#1{\gdef\@author{\Guest{#1}}}

%\def\Guest#1/#2/{#1{\small\csname #2\endcsname}}
\def\Guest#1{#1}

\def\editor#1{\setbox0=\hbox{#1}%
\setcounter{choshai}{\m@ne}%
\setcounter{choshaii}{\z@}%
\@Mfor\member:=#1\do{\addtocounter{choshai}{\@ne}}%
\@Mfor\member:=#1\do{\addtocounter{choshaii}{\@ne}%
\ifnum\c@choshaii<\c@choshai
 \ifnum\c@choshai<1\relax \expandafter\Guest\member
\else
\ifnum\c@choshai<2\relax \member\space
\else \expandafter\Guest\member\makebox[1zw]{・}%
%
\fi\fi
\else
%%%%%%%%%%
\ifnum\thechoshaii >1
%
\ifnum\c@choshaii=\c@choshai 
\expandafter\Guest\member\makebox[1zw]{・}%\space and
\else 
\expandafter\Guest\member%
\fi
\else%%%%%%%%%%
\ifnum\c@choshaii=\c@choshai 
\expandafter\Guest\member\makebox[1zw]{・}%\space and
\else 
\expandafter\Guest\member%
\fi
\fi%%%%%%%%%%%
%%%%%%%%%%
\fi
}}

%%% \long を付けた
%\long\def\thanks#1{\footnotemark\begingroup
%\def\protect{\noexpand\protect\noexpand}\xdef\@thanks{\@thanks
%  \protect\footnotemark#1\protect\par}\endgroup\ignorespaces}

%%% email対応 及び今後urlを予測して ~の制御
\long\def\thanks#1{{\def~{\noexpand~}\footnotemark\begingroup
\def\protect{\noexpand\protect\noexpand}\xdef\@thanks{\@thanks
  \protect\footnotemark#1\protect\par}\endgroup}\ignorespaces}



%%%%%%%%%%%%%%%%%%>>>>> email macros <<<<<%%%%%%%%%%%%%%%%%%%%%%%%%
\def\sanitize@period{.}\@onelevel@sanitize\sanitize@period
\def\sanitize@tilde{~}\@onelevel@sanitize\sanitize@tilde
\def\sanitize@underbar{_}\@onelevel@sanitize\sanitize@underbar
\def\sanitize@langle{<}
\def\sanitize@rangle{>}
\def\sanitize@space{ }\@onelevel@sanitize\sanitize@space


\def\emailstyle#1{\def\@emailstyle{#1}}
\emailstyle{\rmfamily}

\DeclareRobustCommand*{\email}[1]{\par%
   \bgroup
%E-mail:% 
   \def\@email{#1}
   \@onelevel@sanitize\@email
%   \typeout{>>>>\meaning\@email}%
   \@emailstyle E-mail:\,%
   \save@word@space
   \delete@word@space
   \expandafter\@tfor\expandafter\tempA
      \expandafter:\expandafter=\@email\do{%
         \ifx\tempA\sanitize@period.%
\else
%%%%%%%%%%%%%%%%%%%%%%%        
         \if\tempA\sanitize@tilde\textasciitilde\else
            \if\tempA\sanitize@underbar\textunderscore\else
               \if\tempA\sanitize@langle$\langle$\else
                  \if\tempA\sanitize@rangle$\rangle$\else
                     \tempA%
                  \fi
               \fi
            \fi
         \fi
         \ %
%%%%%%%%%%%%%%%%%%%%%%%
         \fi
   }%
   \restore@word@space
   \egroup
}

\def\save@word@space{%
   \edef\saved@word@space{%
      \the\fontdimen2\font,%
      \the\fontdimen3\font,%
      \the\fontdimen4\font%
   }%
}%

\def\restore@word@space{%
   \bgroup
   \count@\@ne
   \expandafter\@for\expandafter\tempA
      \expandafter:\expandafter=\saved@word@space\do{%
         \advance\count@\@ne
         \fontdimen\count@\font\tempA\relax%
   }%
   \egroup
}

\def\delete@word@space{%
   \fontdimen2\font\z@
   \fontdimen3\font\z@
   \fontdimen4\font\z@
}%
%%%%%%%%%%%%%>>>>> END EMAIL MACROS <<<<<%%%%%%%%%%%%%%%%%





%
% SECTION, SUBSECTION, SUBSUBSECTION and APPENDIX numbering
%                 modification of expression of section and subsection
%
%     1. {\large\bf SECTION}  indentation is retrieved
%      (1) {\bf SUBSECTION}
%        a) {\bf SUBSUBSECTION}
%     Appendix I or A. {\large\bf SECTION} with equation-numbering
%                     Eq.(I.1) ... or Eq.(A.1) ...
%
%\def\section{\@startsection {section}{1}{\z@}{3.5ex plus
% .2ex minus.1ex}{2.3ex plus.2ex}{\reset@font\large\bf}}
%\def\subsection{\@startsection{subsection}{2}{\z@}{3.25ex plus
% .1ex minus.1ex}{.1ex plus.1ex}{\reset@font\normalsize\bf}}
%\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{.2ex plus
% .1ex minus.1ex}{.1ex plus.1ex}{\reset@font\normalsize\bf}}
%\def\paragraph{\@startsection
% {paragraph}{4}{\z@}{.2ex plus.1ex minus.1ex}{-1em}{\reset@font
% \normalsize\bf}}
%\def\subparagraph{\@startsection
% {subparagraph}{4}{\parindent}{.2ex plus.1ex minus
% .1ex}{-1em}{\reset@font\normalsize\bf}}
\renewcommand{\section}{%
\@startsection{section}{1}{\z@}%
    {3.5ex plus .2ex minus.1ex}%
    {2.3ex plus.2ex}%
    {\reset@font\large\bfseries\sffamily}%
}

\renewcommand{\subsection}{%
\@startsection{subsection}{2}{\z@}%
    {3.25ex plus .1ex minus.1ex}%
    {.1ex plus.1ex}%
    {\reset@font\normalsize\bfseries\sffamily}%
}

\renewcommand{\subsubsection}{%
\@startsection{subsubsection}{3}{\z@}%
    {.2ex plus .1ex minus.1ex}%
    {.1ex plus.1ex}%
    {\reset@font\normalsize\bfseries\sffamily}%
}

\renewcommand{\paragraph}{%
\@startsection{paragraph}{4}{\z@}%
    {.2ex plus.1ex minus.1ex}%
    {-1em}%
    {\reset@font\normalsize\bfseries\sffamily}%
}

\renewcommand{\subparagraph}{%
\@startsection{subparagraph}{4}{\parindent}%
    {.2ex plus.1ex minus .1ex}%
    {-1em}%
    {\reset@font\normalsize\bfseries\sffamily}%
}


\renewcommand{\thesection}{\arabic{section}.}
\renewcommand{\thesubsection}{(\arabic{subsection})}
\renewcommand{\thesubsubsection}{\alph{subsubsection})}

%



\renewcommand{\appendix}{\par
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand{\thesection}{\appendixname~\appendixsectionname}%
  \@addtoreset{equation}{section}%
  \def\theequation{\appendixsectionname.\arabic{equation}}%
}


%
% \label{} だとピリオドが付くので・・・
% \def\sectionlabel#1{\edef\@arabicsetion{\@arabic\c@section}%
%  \let\@currentlabel\@arabicsetion \label{#1}}
% section の label をピリオド無しで引用
\def\@Ref@X#1.{\def\@@RefJSCE{#1}}
\def\@JSCEref#1#2{%
 \ifx#1\relax ?? \else\edef\@RefJSCE{\ref{#2}}\expandafter\@Ref@X\@RefJSCE \@@RefJSCE\fi}
\def\Ref#1{\expandafter\@JSCEref\csname r@#1\endcsname{#1}}
% エラーメッセージは出してないが，ま，普通二回はコンパイルするだろう・・・

%
% adjust \ref spacing in Japanese
%
 \def\refno#1{\mbox{#1}}
%
% FOOTNOTE style : all lines are indented
% redefined by SANBI
\renewcommand\@makefntext[1]{\parindent 1em\noindent
 \hbox to 1.625em{\hss$\m@th^{\@thefnmark}$}
\everypar={\protect\hangindent=16.5pt\hangafter-17}%
\parindent1zw
\protect\hangindent=16.5pt\hangafter1%
#1}

%% ここまで

%
% MATH
%
% eqnarray : short spacing
%
\def\eqnarray{\stepcounter{equation}\let\@currentlabel\theequation
\global\@eqnswtrue\m@th
\global\@eqcnt\z@\tabskip\@centering\let\\\@eqncr
$$\halign to\displaywidth\bgroup\@eqnsel\hskip\@centering
  $\displaystyle\tabskip\z@{##}$&\global\@eqcnt\@ne
  \hfil$\;{##}\;$\hfil
  &\global\@eqcnt\tw@ $\displaystyle\tabskip\z@{##}$\hfil
   \tabskip\@centering&\llap{##}\tabskip\z@\cr}
%
% MANYEQNS environment - centering version:  T. Iwakuma 2/14/1991
%    modification of eqnarray to set equation numbers like (3-a)...
%
\@definecounter{whichequation}
% \def\themanyeqn{\theequation-\alph{whichequation}}
\def\themanyeqn{\theequation\alph{whichequation}} %CHANGED
\def\@manyeqnnum{{\rm (\themanyeqn)}}
%
\def\manyeqns{\stepcounter{equation}\let\@currentlabel=\themanyeqn
  \setcounter{whichequation}{1}
  \global\@eqnswtrue
  \global\@eqcnt\z@\tabskip\@centering\let\\=\@manyeqncr
  $$\halign to \displaywidth\bgroup\@eqnsel\hskip\@centering
  $\displaystyle\tabskip\z@
   \let\@currentlabel=\theequation
  {##}$&\global\@eqcnt\@ne \hfil$\;{##}\;$\hfil
  &\global\@eqcnt\tw@ $\displaystyle\tabskip\z@{##}$\hfil
   \tabskip\@centering&\llap{##}\tabskip\z@\cr}
%
\def\endmanyeqns{\@@manyeqncr\egroup
    \global\advance\c@equation\m@ne$$\global\@ignoretrue
%            Note: always increment "equation" at MANYEQNS environment
    \stepcounter{equation}}
%
\def\@manyeqncr{{\ifnum0=`}\fi\@ifstar{\global\@eqpen\@M
    \@ymanyeqncr}{\global\@eqpen\interdisplaylinepenalty \@ymanyeqncr}}
%
\def\@ymanyeqncr{\@ifnextchar [{\@xmanyeqncr}{\@xmanyeqncr[\z@]}}
%
\def\@xmanyeqncr[#1]{\ifnum0=`{\fi}\@@manyeqncr
   \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}}
%
\def\@@manyeqncr{\let\@tempa\relax
    \ifcase\@eqcnt \def\@tempa{& & &}\or \def\@tempa{& &}
      \else \def\@tempa{&}\fi
  \@tempa \if@eqnsw\@manyeqnnum\stepcounter{whichequation}\fi
     \global\@eqnswtrue\global\@eqcnt\z@\cr}
%
% ついでに・・・副番号付きの，1行の複数の式　北大の泉先生が苦労したところ
\def\twoeqns{$$\refstepcounter{equation}\let\@currentlabel=\theequation
  \setcounter{whichequation}{0}\xdef\@twoequ@tions{\theequation}}
\def\endtwoeqns{\eqno \hbox{{\rm (\@twoequ@tions)}}$$\@ignoretrue}
\def\EQab{\stepcounter{whichequation}\let\@currentlabel=\themanyeqn%
 \xdef\@twoequ@tions{\@twoequ@tions\ifnum\c@whichequation>\@ne,$\,$\fi%
 \alph{whichequation}}%
}
% short equations さらについでに・・・
\def\shorteqns{\stepcounter{equation}\let\@currentlabel=\themanyeqn
  \let\nonumber\empty % just in case
  \setcounter{whichequation}{1} \xdef\@shorteqnnum{\themanyeqn}%
  \global\@eqnswtrue
  \global\@eqcnt\z@\tabskip\@centering\let\\=\@shorteqncr
  $$\halign to \displaywidth\bgroup\@eqnsel\hskip\@centering
  $\displaystyle\tabskip\z@
   \let\@currentlabel=\theequation
  {##}$&\global\@eqcnt\@ne \hfil$\;{##}\;$\hfil
  &\global\@eqcnt\tw@ $\displaystyle\tabskip\z@{##}$\hfil
   \tabskip\@centering&\llap{##}\tabskip\z@\cr}
%
\def\endshorteqns{\@@shorteqncr\egroup
    \global\advance\c@equation\m@ne$$\global\@ignoretrue
%            Note: always increment "equation" at MANYEQNS environment
    \stepcounter{equation}}
%
\def\@shorteqncr{{\ifnum0=`}\fi\@ifstar{\global\@eqpen\@M
    \@yshorteqncr}{\global\@eqpen\interdisplaylinepenalty \@yshorteqncr}}
%
\def\@yshorteqncr{\@ifnextchar [{\@xshorteqncr}{\@xshorteqncr[\z@]}}
%
\def\@xshorteqncr[#1]{\ifnum0=`{\fi}\@@shorteqncr
   \noalign{\penalty\@eqpen\vskip\jot\vskip #1\relax}}
%
\def\@@shorteqncr{\let\@tempa\relax
    \ifcase\@eqcnt \def\@tempa{& & &}\or \def\@tempa{& &}
      \else \def\@tempa{&}\fi
  \@tempa \if@eqnsw{\rm (\@shorteqnnum)}\stepcounter{whichequation}%
    \xdef\@shorteqnnum{\themanyeqn}\fi
     \global\@eqnswtrue\global\@eqcnt\z@\cr}
%
\def\EQsep{\if@eqnsw\stepcounter{whichequation}\fi%
  \xdef\@shorteqnnum{\@shorteqnnum,$\,$\alph{whichequation}}}
%
% MATH SYMBOLS
%   therefore/because by m.watanabe@tainsbbms (Masatoshi Watanabe)
%    in Math (triangular 3 dots): June 15, 1991
%%   Mr. Iwakuma defined 
%\def\therefore{\setbox0 \hbox{$\cdot$}%
%  \raise-0.2em \copy0 \raise0.2em \copy0 \raise-0.2em \box0 ~}
%\def\because{\setbox0\hbox{$\cdot$}%
%  \raise0.2em \copy0 \raise-0.2em \copy0 \raise0.2em \box0 ~}
%% SANBI redefine
\def\Itherefore{\setbox0 \hbox{$\cdot$}%
  \raise-0.2em \copy0 \raise0.2em \copy0 \raise-0.2em \box0 ~}
\AtBeginDocument{\@ifundefined{therefore}{\let\therefore\Itherefore}{\relax}}
 %
\def\Ibecause{\setbox0\hbox{$\cdot$}%
  \raise0.2em \copy0 \raise-0.2em \copy0 \raise0.2em \box0 ~}
\AtBeginDocument{\@ifundefined{because}{\let\because\Ibecause}{\relax}}
%%% 
%   Big Zeros from RAKU RAKU LaTeX book
\def\bigzerol{\smash{\hbox{\huge 0}}}
\def\bigzerou{\smash{\lower1.7ex\hbox{\huge 0}}}
%   boldmath simplification
\def\fat#1{\mbox{\boldmath{$#1$}}}
%   always display style fraction
%%   Mr. Iwakuma defined 
%% \def\dfrac#1#2{\displaystyle{\frac{#1}{#2}}}
%% SANBI redefine
\def\Idfrac#1#2{\displaystyle{\frac{#1}{#2}}}
\AtBeginDocument{\@ifundefined{dfrac}{\let\dfrac\Idfrac}{\relax}}
 %
%% 


%   slanted fraction from "LaTeX bibunsho sakusei nyumon"
\def\slfrac#1#2{\leavevmode\kern-.1em%
  \raise.5ex\hbox{\the\scriptfont0 #1}\kern-.1em%
  /\kern-.15em\lower.25ex\hbox{\the\scriptfont0 #2}}
%
%   sub/super-script : \sup has been defined in the original TeX.
\def\sub#1{_{\mbox{\scriptsize #1}}}
\def\super#1{^{\mbox{\scriptsize #1}}}
% \def\subsc#1{_{\mbox{\footnotesize\sc \lowercase{#1}}}}
% \def\supersc#1{^{\mbox{\footnotesize\sc \lowercase{#1}}}}
% 頭に空白がくるのを微調整！！！！岩熊 2014/4/4
\def\subsc#1{_{\mbox{\footnotesize\sc\kern-.5ex \lowercase{#1}}}}
\def\supersc#1{^{\mbox{\footnotesize\sc\kern-.5ex \lowercase{#1}}}}
\def\d{\,\mbox{d}}
\def\slfracd{\mbox{\scriptsize d}}
%
% partial diff's
%                             d4 f(x,y)
% \D[4][3][y]{f(x,y)}{x} --> -----------
%   ^^^^^^^^^                  dx d3 y
%    options
%                \D : partial diff,   \D* : ordinary diff
\def\D{\@ifstar{\@OD}{\@PD}}
%
\def\@OD{\@ifnextchar [{\@OD@}{\@OD@[1]}}
\def\@OD@[#1]#2#3{%
  \ifdim#1pt<1.5pt\def\@tempa{}\else\def\@tempa{^#1}\fi
  \dfrac{\mbox{d}\@tempa #2}{\mbox{d}#3\@tempa}}
%
\def\@PD{\@ifnextchar [{\@D@}{\@D@[1]}}
\def\@D@[#1]{\@ifnextchar [{\@D@@[#1]}{\@D@@[#1][0]}}
\def\@D@@[#1][#2]{\@ifnextchar [{\@@D@@[#1][#2]}{\@@D@@[#1][0][s]}}
\def\@@D@@[#1][#2][#3]#4#5{%
  \ifdim#1pt<1.5pt\def\@tempa{\partial #4}\else
                  \def\@tempa{\partial^#1 #4}\fi
  \ifdim#2pt<.5pt\def\@tempb{}\else
    \ifdim#2pt<1.5pt\def\@tempb{\partial#3}%
     \else\def\@tempb{\partial#3^#2}%
    \fi
  \fi
  \count0=#1\advance\count0-#2
  \ifdim\the\count0pt<.5pt\dfrac{\@tempa}{\@tempb}\else
    \ifdim\the\count0pt<1.5pt\dfrac{\@tempa}{\partial#5\,\@tempb}\else
      \dfrac{\@tempa}{\partial#5^\the\count0\,\@tempb}%
    \fi
  \fi}
%
% FLOATS
%
% PHOTOS : new float
%
%\newcounter{photo}
%\def\thephoto{\@arabic\c@photo}
%\def\fps@photo{tp}
%\def\ftype@photo{4}
%\def\ext@photo{lop}
%\def\fnum@photo{\photoname\thephoto}
%\def\photo{\@float{photo}}
%\let\endphoto\end@float
%\@namedef{photo*}{\@dblfloat{photo}}
%\@namedef{endphoto*}{\end@dblfloat}

% redefine by SANBI
\newcounter{photo}
\renewcommand{\thephoto}{\@arabic\c@photo}
\def\fps@photo{tp}
\def\ftype@photo{4}%%% power of two
\def\ext@photo{lop}
\def\fnum@photo{\photoname\thephoto}
\newenvironment{photo}
               {\@float{photo}}
               {\end@float}
\newenvironment{photo*}
               {\@dblfloat{photo}}
               {\end@dblfloat}



% \setlength\abovecaptionskip{10\p@}  % in jarticle.cls
\setlength\belowcaptionskip{10\p@}

%
% FIGURE/TABLE/PHOTO CAPTIONS
%   positions and style change {\bf }
%
\def\fnum@figure{\figurename\thefigure}
\def\fnum@table{\tablename\thetable}
%
\def\fps@figure{tp}
\def\fps@table{tp}
%
\long\def\@makecaption#1#2{%
  \vskip \abovecaptionskip%10\p@
  \setbox\@tempboxa\hbox{{\bf #1}\ \ }%
   \@tempdima\hsize\advance\@tempdima-\wd\@tempboxa
   \setbox\@tempboxa\hbox{{\bf #1}\ \ #2}%
  \ifdim \wd\@tempboxa <\hsize
      \hfil {\bf#1}\ \ #2\hfil\par
  \else
      \hbox to\hsize{\hfil {\bf #1}\ \ \parbox[t]\@tempdima{#2}\hfil}%
  \fi%
\vskip\belowcaptionskip
}
% ここから
\long\def\@caption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \small
    \@makecaption{\csname fnum@#1\endcsname}{\ignorespaces #3}\par
  \endgroup}
%
% FIGURE/TABLE/PHOTO REFERENCE
%
% \def\figno#1{{\bf\figurename#1}}
% \def\tabno#1{{\bf\tablename\ifEN@LISH\ \fi#1}}
% \def\photono#1{{\bf\photoname\ifEN@LISH\ \fi#1}}
\def\figno{\@ifstar{\@floatno{\figurename}}{\@floatnoo{\figurename}}}
\def\tabno{\@ifstar{\@floatno{\tablename}}{\@floatnoo{\tablename}}}
\def\photono{\@ifstar{\@floatno{\photoname}}{\@floatnoo{\photoname}}}
%
\def\@floatno#1#2{{\bf #1\ifEN@LISH\ \fi#2}}
\ifx\gtfam\undefined
 \def\@floatnoo#1#2{{\bf #1\ifEN@LISH\ #2\else#2\,\fakejchar\fi}}
\else
 \def\@floatnoo#1#2{{\bf #1\ifEN@LISH\ #2\else\mbox{#2}\fi}}
\fi
%
%  plural #1 in English only
\def\figsno#1#2{{\bf\figuresname#1}\ignorespaces\ and\ {\bf#2}}
\def\tabsno#1#2{{\bf\tablesname\ #1}\ignorespaces\ and\ {\bf#2}}
\def\photosno#1#2{{\bf\photosname\ #1}\ignorespaces\ and\ {\bf#2}}
%
% FLOATS control: floats can be within 90% of textheight
%
\setcounter{topnumber}{4}            % ordinary +2
\setcounter{totalnumber}{5}          % ordinary +3
\setcounter{dbltopnumber}{4}         % ordinary +2
%\def\textfraction{.08}               % 4 lines / 48(page)
%\def\topfraction{.9}
%\def\floatpagefraction{.99}
%\def\dbltopfraction{.9}
%\def\dblfloatpagefraction{.99}

%% rewrite like 2e by SANBI
\renewcommand{\textfraction}{.08}               % 4 lines / 48(page)
\renewcommand{\topfraction}{.9}
\renewcommand{\floatpagefraction}{.99}
\renewcommand{\dbltopfraction}{.9}
\renewcommand{\dblfloatpagefraction}{.99}
%
% DASHED-LINE for tabular env.  by H.Isozaki
%

%%% insert by SANBI , This counter defined in LaTeX.TeX
\newcount\@cla
\newcount\@clb
%%% end inserted

\def\dlinepattern#1#2{%
  \ifdim#2<#1 \errmessage{First arg. must be <= Second one.}%
  \else \gdef\dline@solid{#1}\gdef\dline@period{#2}%
  \fi}
\dlinepattern{2pt}{4pt} % default
%
%\def\@cla{}
%\def\@clb{}
\def\dline#1{\@dline[#1]}
\def\@dline[#1-#2]{\noalign{\global\@cla#1\relax
  \global\advance\@cla\m@ne
  \ifnum\@cla>\z@\global\let\@gtempa\@dlinea\else
    \global\let\@gtempa\@dlineb\fi
  \global\@clb#2\relax
  \global\advance\@clb-\@cla}\@gtempa
  \noalign{\vskip-\arrayrulewidth}}
%
\def\@dlinea{\multispan\@cla&\multispan\@clb
  \unskip\cleaders\hbox to \dline@period
  {\hss\rule{\dline@solid}{\arrayrulewidth}\hss}\hfill
  \cr}
%
\def\@dlineb{\multispan\@clb
  \unskip\cleaders\hbox to \dline@period
  {\hss\rule{\dline@solid}{\arrayrulewidth}\hss}\hfill
  \cr}
%
% subfloat.sty:    set sub-number within one float
% Iwakuma Tetsuo (bear@hashi1.civil.tohoku.ac.jp)  8/7/1992
%                                                10/10/1992
%                   header control added       4/19-22/1993
%                   header control added           8/7/1993
%
\@definecounter{subfloatnumber}
\def\@T@bLe{table}
\def\subfloatcap{-\alph{subfloatnumber}} % default
%
\newif\if@subfloatcaptionhead \@subfloatcaptionheadtrue
\def\NoSubfloatCaptionHead{\@subfloatcaptionheadfalse}
%
\newif\if@subfloatwithcaptionhead
\def\subcaption{\@ifstar{%
  \@subfloatwithcaptionheadfalse\subc@ption}{%
  \@subfloatwithcaptionheadtrue\subc@ption}}
%
\def\subc@ption{\@addtoreset{subfloatnumber}{\@captype}%
  \ifx\@captype\@T@bLe\relax\else\addtocounter{\@captype}{1}\fi%
  \def\the@subfloatnumber{\csname the\@captype\endcsname\subfloatcap}%
  \stepcounter{subfloatnumber}%
  \edef\@currentlabel{\csname the@subfloatnumber\endcsname}%
  \@dblarg{\@subcaption\@captype}}
%
\long\def\@subcaption#1[#2]#3{\par\addcontentsline{\csname
  ext@#1\endcsname}{#1}{\protect\numberline{\csname
  the#1\endcsname\subfloatcap}{\ignorespaces #2}}\begingroup
    \@parboxrestore
    \small
   \if@subfloatcaptionhead
    \if@subfloatwithcaptionhead
     \@makecaption{\csname fnum@#1\endcsname\subfloatcap}%
         {\ignorespaces #3}\par
    \else
     \@makecaptionWOheading{\subfloatcap}{\ignorespaces #3}
    \fi
   \else\@makecaptionWOheading{}{\ignorespaces #3}\par\fi
    \endgroup%
     \ifx\@captype\@T@bLe\relax\else\addtocounter{\@captype}{-1}\fi}
%
\long\def\@makecaptionWOheading#1#2{%
  \vskip 10\p@
  \setbox\@tempboxa\hbox{#1 #2}%
  \ifdim \wd\@tempboxa >\hsize
      #1 #2\par
    \else
      \hbox to\hsize{\hfil\box\@tempboxa\hfil}%
  \fi}
%
% BIBLIOGRAPHY
% SPECIAL DEFINITIONS OF BIBLIOGRAPHY STYLE #2
%          by M.Watanabe (watanabe@akiu.gw.tohoku.ac.jp) (C) 1990,10/06
% and partially T.Iwakuma(bear@hashi1.civil.tohoku.ac.jp)
%  \cite           : $^{\mbox{\scriptsize LABEL)}}$
%                    $^{\mbox{\scriptsize LABEL1) LABEL2) ...}}$
%  \thebibliography: LABEL)
%
% \nobreak is added
\DeclareRobustCommand\cite{%
  \@ifnextchar [{\@tempswatrue\nobreak\kern-0ex\@citex}{\@tempswafalse\nobreak\kern-0ex\@citex[]}}
%
\def\@citex[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{),\penalty\@m}%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \@ifundefined{b@\@citeb}{{\reset@font\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
     \hbox{\csname b@\@citeb\endcsname}}}{#1}}
%
\def\@cite#1#2{\leavevmode\hbox{$^{%              by Isozaki
  \mbox{\scriptsize{#1\if@tempswa , #2\fi})}}$}}
%
\def\@biblabel#1{#1)}
%
% \textcite
%
\def\textcite{\@tempswafalse\nobreak\@textcitex[]}
%
\def\@textcitex[#1]#2{%
 \if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
%   \let\@citea\@empty
  \let\@citea\,
  \@textcite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{),\penalty\@m\ }%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \@ifundefined{b@\@citeb}{{\reset@font\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
     \hbox{\csname b@\@citeb\endcsname}}}{#1}}
%
\def\@textcite#1#2{{#1\if@tempswa ), #2\fi})}
%
% 二つの〜を用いた引用
\DeclareRobustCommand\CITE{%
  \@ifnextchar [{\@tempswatrue\nobreak\kern-0ex\@CITEx}{\@tempswafalse\nobreak\kern-0ex\@CITEx[]}}
%
\def\@CITEx[#1]#2{\if@filesw\immediate\write\@auxout{\string\citation{#2}}\fi
  \let\@citea\@empty
  \@cite{\@for\@citeb:=#2\do
    {\@citea\def\@citea{)$\,\sim\,$\penalty\@m}%
     \def\@tempa##1##2\@nil{\edef\@citeb{\if##1\space##2\else##1##2\fi}}%
     \expandafter\@tempa\@citeb\@nil
     \@ifundefined{b@\@citeb}{{\reset@font\bf ?}\@warning
       {Citation `\@citeb' on page \thepage \space undefined}}%
     \hbox{\csname b@\@citeb\endcsname}}}{#1}}
%
% REFERENCE style
%     modification of reference-list: char-size and \baselineskip
%
\def\thebibliography#1{%
  \subsection*{\refname\@mkboth
  {\uppercase{\refname}}{\uppercase{\refname}}}\list
  {\@biblabel{\arabic{enumi}}}{\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth
    \advance\leftmargin\labelsep
     \parsep\z@ \itemsep\z@ \topsep\z@ \small
    \usecounter{enumi}%
    \let\p@enumi\@empty
    \def\theenumi{\arabic{enumi}}}%
    \def\newblock{\hskip .11em plus.33em minus.07em}%
    \sloppy\clubpenalty4000\widowpenalty4000
    \sfcode`\.=1000\relax
}

% 謝辞
\def\ack{\@ifnextchar [{\@ack}{\@ack[1em]}}
\def\@ack[#1]{\vskip#1\paragraph{\ackname}}


%
% ETC.
%
% ENCIRCLED numerals by Hideki ISOZAKI
%
\def\MARU#1{{\ooalign
  {\hfill$\scriptstyle#1$\hfill\crcr$\bigcirc$}}}
%
% 温度 degree centigrade
\def\degC{$\mbox{}^\circ$\kern-.2ex C}
%
% LIST environment
%  make sep's small
%
% \let\Enumerate\enumerate \let\endEnumerate\endenumerate
% 英語の場合のスペーシングに戻したもの・・・jsce.cls で変更されてしまった JSCE
\newenvironment{Enumerate}
  {\ifnum \@enumdepth >3\relax\@toodeep\else
   \advance\@enumdepth\@ne
   \edef\@enumctr{enum\romannumeral\the\@enumdepth}%
   \list{\csname label\@enumctr\endcsname}{%
         \ifnum \@listdepth=\@ne \topsep.5\normalbaselineskip
           \else\topsep\z@\fi
         \parskip\z@
         \itemsep 8\p@ \@plus2\p@ \@minus4\p@
         \parsep 4\p@ \@plus2\p@ \@minus\p@
         \labelwidth1zw \labelsep.3zw
         \ifnum \@enumdepth=\@ne \leftmargin1zw\relax
           \else\leftmargin\leftskip\fi
           \leftmargin\leftmargini \advance\leftmargin 1zw
         \usecounter{\@enumctr}%
         \def\makelabel##1{\hss\llap{##1}}}%
   \fi}{\endlist}
%
\let\Itemize\itemize \let\endItemize\enditemize
\let\Description\description \let\endDescription\enddescription
%           these above are the normal ones
\def\enumerate{\ifnum \@enumdepth >3 \@toodeep\else
  \advance\@enumdepth \@ne
  \edef\@enumctr{enum\romannumeral\the\@enumdepth}\list
  {\csname label\@enumctr\endcsname}{\usecounter
    {\@enumctr}\def\makelabel##1{\hss\llap{##1}}%
  \parsep\z@ \itemsep\z@ \topsep\z@}\fi}
%
\def\itemize{\ifnum \@itemdepth >3 \@toodeep\else \advance\@itemdepth \@ne
  \edef\@itemitem{labelitem\romannumeral\the\@itemdepth}%
  \list{\csname\@itemitem\endcsname}{\def\makelabel##1{\hss\llap{##1}}%
  \parsep\z@ \itemsep\z@ \topsep\z@}\fi}
%
\def\description{\list{}{\labelwidth\z@ \itemindent-\leftmargin
  \let\makelabel\descriptionlabel \parsep\z@ \itemsep\z@ \topsep\z@}}
%
% LASTPAGE SETTING AND CONTROL
%
\def\receivedate#1{\gdef\@receivedate{#1}}
\def\@receivedate{\ifEN@LISH\@englishmonth\ \number\day, \number\year\else\number\year. \number\month. \number\day\fi}% used to be {\today}
%
\def\acceptdate#1{\gdef\@acceptdate{#1}}

%
\long\def\endtitle#1{\gdef\@endtitle{#1}} \def\@endtitle{}
\def\endauthor#1{\gdef\@endauthor{#1}} \def\@endauthor{}
\long\def\endabstract#1{\gdef\@endabstract{#1}} % permit paragraphs
%
% to create enough space of footnote to align columns of the last page
%
\newdimen\lastp@geheight \lastp@geheight=10mm
\newsavebox{\lastp@gebox}
%
% LASTPAGECONTROL
%
\def\lastpagecontrol{\@ifnextchar [{\l@stpagecontrol}%
  {\l@stpagecontrol[\z@]}}
%
\def\l@stpagecontrol[#1]#2{\global\lastp@geheight=#2%
%
  \@ifundefined{@endabstract}{}{% save \endabstract in a box
  \global\sbox{\lastp@gebox}{%
%   \hspace*{-20mm} a
\begin{minipage}{150mm}
%%% check \smash{\raisebox{-159mm}{\rule{.1mm}{180mm}}}\color{red}
\vspace*{#1}%
    \parindent=10pt%
    \vspace{.5ex}%
%%%% Mr.Iwakuma define
%
   %\begin{center} {\large \lineskip .5em \@endtitle} \end{center}%
   % \vskip .5ex%
   %\begin{center} {\lineskip .5em \@endauthor} \end{center}%
   % \vskip .5ex%
%
%%%% end define
%%%% SANBI define
%% \begin{center}...\end{center} 上下スペースを防ぐ
\def\Center{\topsep\z@\parsep\z@\partopsep\z@\itemsep\z@
 \trivlist \centering\item\relax}
\def\endCenter{\endtrivlist}
%
   \baselineskip0pt\begin{Center} 
{\large%\baselineskip15\p@
\lineskip .5em 
\nonfrenchspacing\@endtitle\endgraf%
}
\end{Center}%
%    \vskip .5ex%
\vskip13pt%%% 行間 22pt \large = xiipt bs 17pt
%   \vspace*{-7pt}
\begin{Center} 
% 4/25/2014 クレームあり
% {\normalsize\lineskip .5em \nonfrenchspacing\@endauthor\endgraf}%
{\large\lineskip .5em \nonfrenchspacing\@endauthor\endgraf}%
\end{Center}%
%    \vskip .5ex%
\vskip16pt
%
%%%% end define
%     \small
% \ifEN@LISH\small\baselineskip=13.7pt%
%            \else \small\baselineskip=10pt \fi
% 
% 4/25/2014 クレームあり
\normalsize
\ifEN@LISH\baselineskip=15pt%
           \else \baselineskip=12pt \fi
%%     \ignorespaces\hspace*{\parindent}\ignorespaces%% by Mr.Iwakuma?? １行目のインデントがさがりすぎる
%     \ignorespaces%\hspace*{\parindent}\ignorespaces%% by SANBI
     \hspace*{\parindent}\ignorespaces%% by Iwakuma: need indent 戻した JSCE
                 {\nonfrenchspacing\@endabstract}\endgraf%
  \end{minipage}}}%
%
% insert footnote with abstract if enough room left
%                 without abstract otherwise
%
   \@tempdima\ht\lastp@gebox \advance\@tempdima\dp\lastp@gebox
  \ifdim\@tempdima>\lastp@geheight
   \@tempdima\lastp@geheight \global\lastp@geheight=0pt
  \else
   \global\advance\lastp@geheight -\@tempdima
   \@tempdima\lastp@geheight \global\lastp@geheight\textheight
  \fi
   \def\footnoterule{\null}% force it to \null at the last page
   \insert\footins{\footnotesize
   \interlinepenalty\interfootnotelinepenalty
   \splittopskip\footnotesep
   \splitmaxdepth \dp\strutbox \floatingpenalty \@MM
   \hsize\textwidth \@parboxrestore
    \ifdim\lastp@geheight=\z@\else\mbox{}\hspace{10mm}\usebox{\lastp@gebox}\fi%
   \vspace*{\@tempdima}}%
}
%
% LASTPAGESETTINGS
\newif\if@letter\@letterfalse
%
\def\lastpagesettings{\@ifnextchar [{\l@stpagesettings}%
  {\l@stpagesettings[\z@]}}
%
\def\l@stpagesettings[#1]{%
  \begin{flushright}
      {\small\bf (\@receivename{}\@receivedate\relax)} \\
      {\small\bf (\@acceptname{}\@acceptdate\relax)}
  \end{flushright}%
%   \begin{flushright}{\small\bf (\@acceptname{}\@acceptdate
%   \relax)} \end{flushright}%
%   \begin{flushright}{\small\bf (\ifEN@LISH\@receivename{}\fi \@receivedate
%   \ifEN@LISH\relax\else\@receivename{}\fi)} \end{flushright}%
%
% put \endabstract in the next page when no room left for it
%
  \ifdim\lastp@geheight=\z@
   \onecolumn\null\vspace*{#1}\noindent\centering\usebox{\lastp@gebox}%
  \fi
% page numbers for reference
% H_AND_F
  \label{page:lastpagenumber}%
  \setcounter{englishpage}{\@fromenglishpage}%
  \addtocounter{englishpage}{\thepage}%
  \addtocounter{englishpage}{-\@frompage}%
  \def\@currentlabel{\theenglishpage}%
  \label{page:lastenglishpagenumber}%
}
%















%%%% ps@plainnormal by SANBI 
\pagestyle{plainnormal}

\let\fakejchar=\relax
\endinput
%%
%% End of file `jarticle.cls'.
