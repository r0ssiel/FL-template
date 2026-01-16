\ProvidesClass{fl}

\LoadClass[12pt,a4paper,twocolumn,twoside]{book}

% packages
\setlength{\columnsep}{0.8cm}
\RequirePackage{fancyhdr,epsdice,titlesec,fontspec,graphicx,xparse,tcolorbox,hyphenat,enumitem,adjustbox,stfloats,booktabs}
\RequirePackage[brazilian]{babel}
\RequirePackage[
  top=4cm,
  bottom=3.5cm,
  left=2cm,
  right=2cm,
  headheight=50pt,
  headsep=40pt,
  footskip=2.7cm]{geometry}
\RequirePackage{lipsum}
\RequirePackage{tabularx,array}
\RequirePackage[table]{xcolor}

% table row stripe colors
\definecolor{rowgray}{gray}{0.90}
\definecolor{headgray}{gray}{0.80}
\renewcommand{\arraystretch}{1.2}
\setlength{\tabcolsep}{8pt}
\newcommand{\thead}[1]{\textbf{\footnotesize\MakeUppercase{#1}}}

% itemize spacing
\setlist[itemize]{itemsep=1pt}

% change standard book chapter naming style
\makeatletter
\renewcommand{\@makechapterhead}[1]{%
  \vspace*{-2cm}
  \begin{center}
    \begin{picture}(0,0)
      % Background image
      \put(0,-150){%
        \makebox[0pt][c]{%
          \includegraphics[width=1.05\textwidth]{images/chapter.png}%
        }%
      }
      % Chapter title INSIDE the image
      \put(0,-65){%
        \makebox[0pt][c]{%
          \titlefont\Huge\bfseries\MakeUppercase{#1}%
        }%
      }
    \end{picture}
  \end{center}
  \vspace{5.5cm}
}
\renewcommand{\@makeschapterhead}[1]{%
  \vspace*{-2cm}
  \begin{center}
    \begin{picture}(0,0)
      % Background image
      \put(0,-150){%
        \makebox[0pt][c]{%
          \includegraphics[width=1.2\textwidth]{images/chapter.png}%
        }%
      }
      % Chapter title INSIDE the image
      \put(0,-65){%
        \makebox[0pt][c]{%
          \titlefont\Huge\bfseries\MakeUppercase{#1}%
        }%
      }
    \end{picture}
  \end{center}
  \vspace{7cm}
}
\makeatother
\renewcommand{\chaptermark}[1]{%
  \markboth{#1}{}
}

% book standard page formatting
\fancypagestyle{FL}{%
  \fancyhf{}
    % even page header
    \fancyhead[LE]{\includegraphics[width=\textwidth]{images/header2.png}}
    % odd page header
    \fancyhead[LO]{\includegraphics[width=\textwidth]{images/header1.png}} 
    % even page footer
    \fancyfoot[CE]{
    \begin{picture}(0,0)
      % image
      \put(0,0){\makebox[0pt][c]{\includegraphics[scale=.4]{images/footer.png}}}
      % chapter name
      \put(0,10.5){%
      \makebox[0pt][c]{\small\MakeUppercase{\leftmark}}
    }
      % page number
      \put(-.45,41){\makebox[0pt][c]{\thepage}}
    \end{picture}
    }
    % odd page footer
    \fancyfoot[CO]{
    \begin{picture}(0,0)
      % image
      \put(0,0){\makebox[0pt][c]{\includegraphics[scale=.4]{images/footer.png}}}
      % chapter name
      \put(0,10.5){%
      \makebox[0pt][c]{\small CAPÍTULO~\thechapter}
    }
      % page number
      \put(0,41){\makebox[0pt][c]{\thepage}}
    \end{picture}
    }
    \renewcommand{\headrulewidth}{0pt}
}

% book chapter page formatting
\fancypagestyle{chapterpage}{%
  \fancyhf{} % clear everything
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
   % even page footer
    \fancyfoot[CE]{
    \begin{picture}(0,0)
      % image
      \put(0,0){\makebox[0pt][c]{\includegraphics[scale=.4]{images/footer.png}}}
      % chapter name
      \put(0,10.5){%
      \makebox[0pt][c]{\small\MakeUppercase{\leftmark}}
    }
      % page number
      \put(-.45,41){\makebox[0pt][c]{\thepage}}
    \end{picture}
    }
    % odd page footer
    \fancyfoot[CO]{
    \begin{picture}(0,0)
      % image
      \put(0,0){\makebox[0pt][c]{\includegraphics[scale=.4]{images/footer.png}}}
      % chapter name
      \put(0,10.5){%
      \makebox[0pt][c]{\small CAPÍTULO~\thechapter}
    }
      % page number
      \put(0,41){\makebox[0pt][c]{\thepage}}
    \end{picture}
    }
    \renewcommand{\headrulewidth}{0pt}
}
\RequirePackage{etoolbox}
\patchcmd{\chapter}
  {\thispagestyle{plain}}
  {\thispagestyle{chapterpage}}
  {}{}

% fonts
\setmainfont{MinionPro}[
  Path = ./fonts/mp/,
  Extension = .otf,
  UprightFont = *-Regular ,
  BoldFont = *-Bold ,
  ItalicFont = *-It ,
  BoldItalicFont = *-BoldIt
]

% Title font
\newfontfamily\titlefont{TrajanPro}[
  Path = ./fonts/tp/,
  UprightFont = *-Regular ,
  BoldFont = *-Bold ,
]

% sections

\titleformat{\section}
  {\Large\centering\titlefont\bfseries\MakeUppercase} % style
  {}                                             % no number label
  {0pt}                                          % separation label-title
  {}                                             % code before title text

\titlespacing*{\section}
  {0pt}   % left
  {0.8\baselineskip} % space before
  {0.3\baselineskip} % space after

\titleformat{\subsection}
  {\large\centering\titlefont\MakeUppercase} % style
  {}                                             % no number label
  {0pt}                                          % separation label-title
  {}                                             % code before title text

\titlespacing*{\subsection}
  {0pt}   % left
  {0.5\baselineskip} % space before
  {0.3\baselineskip} % space after

% boxes
\makeatletter
%% half page

% ---------- CONFIG ----------
\newlength\hpboxwidth
\setlength\hpboxwidth{\columnwidth}

% your padding
\newlength\HPInnerPadX
\newlength\HPInnerPadY
\setlength\HPInnerPadX{30pt}
\setlength\HPInnerPadY{22.5pt}

% header overlap
\newlength\HPHeaderOverlapV
\setlength\HPHeaderOverlapV{13pt}

% vertical seam gap between slices (negative = tighter)
\newlength\HPSliceGap
\setlength\HPSliceGap{-2pt}

% where the text begins relative to the very top of the BACKGROUND
% (increase -> moves text downward)
\newlength\HPTextStartFromTop
\setlength\HPTextStartFromTop{20pt} % ✅ use your preferred lift amount as a baseline
% keep this part of bottom clear (no text)
\newlength\HPBottomClearV
\setlength\HPBottomClearV{20pt}

% ---- heights (pixels) ----
\def\HPTopH{156}
\def\HPBottomH{114}
\def\HPMidOneH{43}
\def\HPMidTwoH{89}
\def\HPMidThreeH{37}
\def\HPMidFourH{130}
\def\HPMidFiveH{152}
\def\HPMidSixH{110}

% px -> pt scale factor as ratio: (HPpxNum/HPpxDen) pt per pixel
\def\HPpxNum{3}
\def\HPpxDen{5} % 3/5 = 0.6pt per px

% ---------- INTERNAL ----------
\newsavebox\hp@textbox
\newsavebox\hp@bgbox
\newlength\hp@textH
\newlength\hp@bgH

% helper: convert pixels -> dimension (sp safe)
\newcommand{\HPpxToDim}[1]{%
  \dimexpr
    \numexpr #1*\HPpxNum*65536/\HPpxDen \relax sp\relax
}

% include slice
\newcommand{\HPslice}[1]{%
  \includegraphics[width=\hpboxwidth]{images/box/#1}%
}

% ---------- ENVIRONMENT ----------
\NewDocumentEnvironment{hpbox}{m +b}{%

  % 1) build text box (measured)
  \sbox\hp@textbox{%
    \begin{minipage}{\dimexpr\hpboxwidth-2\HPInnerPadX\relax}
      \vspace*{\HPInnerPadY}%
      \small #2%
      \vspace*{\HPInnerPadY}%
    \end{minipage}%
  }%
  \setlength\hp@textH{\ht\hp@textbox}%
  \addtolength\hp@textH{\dp\hp@textbox}%

  % 2) incremental background height check: top+bottom then add middles
  \setlength\hp@bgH{\dimexpr \HPpxToDim{\HPTopH} + \HPpxToDim{\HPBottomH} + \HPSliceGap \relax}%

  \newif\ifHPuseMone   \HPuseMonefalse
  \newif\ifHPuseMtwo   \HPuseMtwofalse
  \newif\ifHPuseMthree \HPuseMthreefalse
  \newif\ifHPuseMfour  \HPuseMfourfalse
  \newif\ifHPuseMfive  \HPuseMfivefalse
  \newif\ifHPuseMsix   \HPuseMsixfalse

  \ifdim\dimexpr\hp@textH+\HPBottomClearV\relax>\hp@bgH
    \HPuseMonetrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\HPMidOneH} + \HPSliceGap \relax}%
  \fi
  \ifdim\dimexpr\hp@textH+\HPBottomClearV\relax>\hp@bgH
    \HPuseMtwotrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\HPMidTwoH} + \HPSliceGap \relax}%
  \fi
  \ifdim\dimexpr\hp@textH+\HPBottomClearV\relax>\hp@bgH
    \HPuseMthreetrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\HPMidThreeH} + \HPSliceGap \relax}%
  \fi
  \ifdim\dimexpr\hp@textH+\HPBottomClearV\relax>\hp@bgH
    \HPuseMfourtrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\HPMidFourH} + \HPSliceGap \relax}%
  \fi
  \ifdim\dimexpr\hp@textH+\HPBottomClearV\relax>\hp@bgH
    \HPuseMfivetrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\HPMidFiveH} + \HPSliceGap \relax}%
  \fi
  \ifdim\dimexpr\hp@textH+\HPBottomClearV\relax>\hp@bgH
    \HPuseMsixtrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\HPMidSixH} + \HPSliceGap \relax}%
  \fi

  % 3) build background box (real height)
  \sbox\hp@bgbox{%
    \begin{minipage}{\hpboxwidth}
      \centering
      \setlength{\parindent}{0pt}
      \setlength{\parskip}{0pt}

      \HPslice{header#1_hp.png}\par
      \vspace*{-\HPHeaderOverlapV}

      \HPslice{top_hp.png}\par
      \vspace*{\HPSliceGap}

      % print reverse: newest above older
      \ifHPuseMsix  \HPslice{middle6_hp.png}\par\vspace*{\HPSliceGap}\fi
      \ifHPuseMfive \HPslice{middle5_hp.png}\par\vspace*{\HPSliceGap}\fi
      \ifHPuseMfour \HPslice{middle4_hp.png}\par\vspace*{\HPSliceGap}\fi
      \ifHPuseMthree\HPslice{middle3_hp.png}\par\vspace*{\HPSliceGap}\fi
      \ifHPuseMtwo  \HPslice{middle2_hp.png}\par\vspace*{\HPSliceGap}\fi
      \ifHPuseMone  \HPslice{middle1_hp.png}\par\vspace*{\HPSliceGap}\fi

      \HPslice{bottom_hp.png}\par
    \end{minipage}%
  }%

  % 4) Output ONE combined object:
  % background as normal flow, text overlaid inside it
  \par\noindent
  \begin{minipage}{\hpboxwidth}
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{0pt}

    % background (gives height)
    \usebox\hp@bgbox

    % overlay text INSIDE background, without affecting height
    \rlap{%
  % Anchor at TOP of bg, then go DOWN by HPTextStartFromTop,
  % then anchor the TEXT by its TOP (not its baseline)
  \raisebox{\dimexpr\ht\hp@bgbox+\dp\hp@bgbox-\HPTextStartFromTop\relax}[0pt][0pt]{%
    \hspace*{\HPInnerPadX}%
    \raisebox{-\ht\hp@textbox}[0pt][0pt]{\usebox\hp@textbox}%
  }%
}%

  \end{minipage}
  \par\medskip

}{}

%% full page
% --- FP padding options (independent from hpbox) ---
\newlength\FPInnerPadX
\newlength\FPInnerPadTop
\newlength\FPInnerPadBottom

% sensible defaults (edit as you want)
\setlength\FPInnerPadX{20pt}
\setlength\FPInnerPadTop{15pt}
\setlength\FPInnerPadBottom{0pt}

% optional: keep bottom clear of text (like your hpbox)
% (set to 0pt if you don't want it)
\newlength\FPBottomClearV
\setlength\FPBottomClearV{10pt}

% --- FP pixel heights (your values) ---
\def\FPTopH{142}
\def\FPMidSixH{98}
\def\FPMidFiveH{98}
\def\FPMidFourH{107}
\def\FPMidThreeH{107}
\def\FPMidTwoH{83}
\def\FPMidOneH{57}
\def\FPBottomH{86}

% Start position of text measured from TOP of the background stack
% (0pt = text top aligned with very top of the top_fp slice)
\newlength\FPTextStartFromTop
\setlength\FPTextStartFromTop{18pt} % tune

\NewDocumentEnvironment{hpbox*}{+b}{%
  \begingroup
  \setlength\hpboxwidth{\textwidth}%

  % 1) Build text minipage (measured) with independent FP padding
  \sbox\hp@textbox{%
    \begin{minipage}{\dimexpr\hpboxwidth-2\FPInnerPadX\relax}
      \vspace*{\FPInnerPadTop}%
      #1%
      \vspace*{\FPInnerPadBottom}%
    \end{minipage}%
  }%
  \setlength\hp@textH{\ht\hp@textbox}%
  \addtolength\hp@textH{\dp\hp@textbox}%

  % 2) Incremental check: start with top+bottom (+ seam gap)
  \setlength\hp@bgH{%
    \dimexpr
      \HPpxToDim{\FPTopH} + \HPpxToDim{\FPBottomH} + \HPSliceGap
    \relax
  }%

  % Decide which FP middles are needed (incremental)
  \newif\ifFPuseMone   \FPuseMonefalse
  \newif\ifFPuseMtwo   \FPuseMtwofalse
  \newif\ifFPuseMthree \FPuseMthreefalse
  \newif\ifFPuseMfour  \FPuseMfourfalse
  \newif\ifFPuseMfive  \FPuseMfivefalse
  \newif\ifFPuseMsix   \FPuseMsixfalse

  \ifdim\dimexpr\hp@textH+\FPBottomClearV\relax>\hp@bgH
    \FPuseMonetrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\FPMidOneH} + \HPSliceGap \relax}%
  \fi

  \ifdim\dimexpr\hp@textH+\FPBottomClearV\relax>\hp@bgH
    \FPuseMtwotrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\FPMidTwoH} + \HPSliceGap \relax}%
  \fi

  \ifdim\dimexpr\hp@textH+\FPBottomClearV\relax>\hp@bgH
    \FPuseMthreetrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\FPMidThreeH} + \HPSliceGap \relax}%
  \fi

  \ifdim\dimexpr\hp@textH+\FPBottomClearV\relax>\hp@bgH
    \FPuseMfourtrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\FPMidFourH} + \HPSliceGap \relax}%
  \fi

  \ifdim\dimexpr\hp@textH+\FPBottomClearV\relax>\hp@bgH
    \FPuseMfivetrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\FPMidFiveH} + \HPSliceGap \relax}%
  \fi

  \ifdim\dimexpr\hp@textH+\FPBottomClearV\relax>\hp@bgH
    \FPuseMsixtrue
    \addtolength\hp@bgH{\dimexpr \HPpxToDim{\FPMidSixH} + \HPSliceGap \relax}%
  \fi

  % 3) Build FP background stack (NO header): top -> middles -> bottom
  \sbox\hp@bgbox{%
    \begin{minipage}{\hpboxwidth}
      \centering
      \setlength{\parindent}{0pt}
      \setlength{\parskip}{0pt}

      \HPslice{top_fp.png}\par
      \vspace*{\HPSliceGap}

      % print reverse so newest-added appears above older
      \ifFPuseMsix  \HPslice{middle6_fp.png}\par\vspace*{\HPSliceGap}\fi
      \ifFPuseMfive \HPslice{middle5_fp.png}\par\vspace*{\HPSliceGap}\fi
      \ifFPuseMfour \HPslice{middle4_fp.png}\par\vspace*{\HPSliceGap}\fi
      \ifFPuseMthree\HPslice{middle3_fp.png}\par\vspace*{\HPSliceGap}\fi
      \ifFPuseMtwo  \HPslice{middle2_fp.png}\par\vspace*{\HPSliceGap}\fi
      \ifFPuseMone  \HPslice{middle1_fp.png}\par\vspace*{\HPSliceGap}\fi

      \HPslice{bottom_fp.png}\par
    \end{minipage}%
  }%

  % 4) Output combined object: background + text overlaid INSIDE it
  \par\noindent
  \begin{minipage}{\hpboxwidth}
    \setlength{\parindent}{0pt}
    \setlength{\parskip}{0pt}

    % background defines height
    \usebox\hp@bgbox

    % overlay text anchored to TOP of background (stable)
    \rlap{%
      \raisebox{\dimexpr\ht\hp@bgbox+\dp\hp@bgbox-\FPTextStartFromTop\relax}[0pt][0pt]{%
        \hspace*{\FPInnerPadX}%
        % top-align text box so padding doesn't drift with text size
        \raisebox{-\ht\hp@textbox}[0pt][0pt]{\usebox\hp@textbox}%
      }%
    }%

  \end{minipage}
  \par\medskip

  \endgroup
}{}
\makeatother



% end document
\AtEndDocument{%
    \begin{hpbox}{0}
        \begin{center}
        {\large\textbf{Aviso}}
        \end{center}
        
        {Tanto este material quanto este \textit{template} devem ser usados para fins exclusivamente não comerciais. Toda a arte usada neste documento foi retirada do Manual do Jogador de \textit{Forbiden Lands}.}
    \end{hpbox}
}

% begin document
\AtBeginDocument{
\pagestyle{FL}
}