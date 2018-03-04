---
title: modèle de présentation avec LaTeX pour l'AMU
date: 2014-01-27 23:10 CET
tags:
  - marseille
  - france
  - linux
  - tricks
lang: fr
---
{% include figure image_path="/assets/img/slides-amu.png" alt="Capture d'écran." caption="Capture d'écran." %}{:.pull-right}

J'ai préparé des fiches LaTeX pour créer des jolie présentations tout dans le
design du »**université Aix-Marseille**« (AMU). Ça veut dire:

 * La présentation est fait dans les couleurs de l'AMU.
 * Elle prends la même police de caractères qui est utilise pour la logo (c'est Klavika).
 * Le logo de l'AMU est intégré également (télécharger [le logo] comme PDF, graphique vectoriel)
 * Le modèle LaTeX Beamer est modifié pour presenté en bas le numéro du page.

Tous les détails sont prix du [guide du design] officiel.

**Attention! :** Cettes fiches LaTeX marchent uniquement avec XeLaTeX ou LuaLaTex,
parce que j'utilise le package »fontspec« pour configurer la police de caractères
et cette package n'existe pas pour pdfLaTex. Mais en général, ça fait pas trop
de difference. Comme d'habitude LuaLaTeX est compris dans la distribution LaTeX. `;)`

[le logo]: http://dircom.univ-amu.fr/sites/dircom.univ-amu.fr/files/amu.pdf
[guide du design]: http://dircom.univ-amu.fr/sites/dircom.univ-amu.fr/files/charte_graphique_generale_amu_0.pdf

<!--more-->

## Fichiers

 * [Exemple PDF][pdf]
 * [Logo et fiches LaTeX pour télécharger][file]

[pdf]: {{ '/assets/files/slides-amu.pdf' | relative_url}}
[file]: {{ '/assets/files/slides-amu.zip' | relative_url}}

~~~latex
{% raw %}
\documentclass[compress]{beamer}
\usepackage{polyglossia} % hyphenation % works only in LuaTex with TexLive '13
% \setmainlanguage[spelling=new]{german} % works only in LuaTex with TexLive '13
\setmainlanguage[variant=british]{english} % works only in LuaTex with TexLive '13

% enable own font declarations, we take the Klavika font (official one)
% don't have this font: google for it or ask me how to google
\usepackage{fontspec}
\setsansfont[%
  % Path = /path/to/otf-files/i.e/home/.fonts/k/,
  % Extension = .otf,
  UprightFont={*-Regular},      
  ItalicFont={*-RegularItalic},
  BoldFont={*-Medium},
  BoldItalicFont={*-MediumItalic},
]{Klavika}

% Alter the Beamer template

% set new colors according to AMU design
% http://dircom.univ-amu.fr/sites/dircom.univ-amu.fr/files/charte_graphique_generale_amu_0.pdf
\definecolor{AMUDarkBlue}{RGB}{0,103,186}
\definecolor{AMULightBlue}{RGB}{110,188,253}
\definecolor{AMUYellow}{RGB}{246,189,23}
\usecolortheme[named=AMUDarkBlue]{structure}
% top bar with section navigation
\setbeamercolor{palette tertiary}{bg=black,fg=white}
% 2nd top bar with subsection navigation (only if subsection=true)
\setbeamercolor{palette secondary}{bg=AMUDarkBlue!50,fg=white}
% title bar of each slide
\setbeamercolor{titlelike}{bg=AMUDarkBlue,fg=white}
\setbeamercolor{title}{bg=AMUDarkBlue,fg=white}
\setbeamercolor{subtitle}{fg=white}
\setbeamercolor{block title}{bg=AMUDarkBlue,fg=white}
\setbeamercolor{block body}{bg=AMUDarkBlue!30}
\setbeamercolor{block title example}{bg=AMUYellow,fg=white}
\setbeamercolor{block body example}{bg=AMUYellow!30}
\setbeamercolor{block title alerted}{bg=red,fg=white}
\setbeamercolor{block body alerted}{bg=red!30}
% \setbeamercolor{colorbox}{bg=HUSand!30}
% http://tex.stackexchange.com/questions/74303
\usepackage{etoolbox}
\AtBeginEnvironment{exampleblock}{%
  \setbeamercolor{itemize item}{fg=AMUYellow!70}
}
\AtBeginEnvironment{alertblock}{%
  \setbeamercolor{itemize item}{fg=red!70}
}
\AtBeginEnvironment{block}{%
  \setbeamercolor{itemize item}{fg=AMUDarkBlue!70}
}
% \rowcolors{2}{Gray!30}{white}

% apply default template partials
\useinnertheme{rectangles}
\useoutertheme[subsection=false]{miniframes}
\setbeamertemplate{navigation symbols}{}
% reset the footer: show slide numbers
\setbeamertemplate{footline}{%
  \begin{beamercolorbox}[colsep=1.5pt]{upper separation line foot}
  \end{beamercolorbox}
  \begin{beamercolorbox}[ht=2.5ex,dp=1.125ex,%
    leftskip=.3cm,rightskip=.3cm plus1fil]{title in head/foot}%
    {\usebeamerfont{title in head/foot}\insertshorttitle}%
    \,
    {\usebeamerfont{author in head/foot}(\insertshortauthor)}%
    \hfill
    {\usebeamerfont{framenumber in head/foot}\textbf{\insertframenumber}}%
  \end{beamercolorbox}%
  \begin{beamercolorbox}[colsep=1.5pt]{lower separation line foot}
  \end{beamercolorbox}
}
% emphasizing means text in default accent color
\renewcommand{\emph}[1]{\textcolor{structure}{#1}}

% \usepackage{microtype} % enable this for improved text typesetting
\usepackage{hyperref} % this is of \href{}{} or \url{}
\usepackage{booktabs} % this is for \midrule \toprule etc in tables

\title[Status Report cw \#45]{%
  Status Report calendar week \#45
}
\subtitle{%
  what I did this week
}
\institute{%
  My Lab, AMU\\
  \medskip\emph{my@mail.fr}
}
\author{Thomas Dumont}
\titlegraphic{\includegraphics[width=0.4\linewidth]{amu}}
\date{November 05, 2013}
\logo{\includegraphics[width=0.25\linewidth]{amu}}
\subject{%
  weekly progress report
}
\keywords{%
  weekly progress report, progress, status
}
\begin{document}

\begin{frame}[plain]
\titlepage
\end{frame}

\include{content}

\end{document}
{% endraw %}
~~~
*slides.tex*
{: .code-meta}

~~~latex
\begin{frame}{Overview}
  \tableofcontents
\end{frame}

\section{Here we go}

\begin{frame}{Progress last week}
  utf8 check: ¡holla! – Tschüß – À bientôt
  \begin{itemize}
    \item list
    \item 2nd list
  \end{itemize}
\end{frame}


\section{Results}

\begin{frame}{blocks}
  \begin{huge}Big Font\end{huge}  \emph{emphasize}
  \begin{block}{Block Title}
    here we go,  \textbf{bold face}
  \end{block}

  \begin{exampleblock}{Example Block Title}
    here we go, \textit{italic face}
  \end{exampleblock}

  \begin{alertblock}{Alert Block Title}
    here we go, \texttt{typwritter face}
    \begin{itemize}
      \item list with marker of 70\% red
    \end{itemize}

  \end{alertblock}
\end{frame}


\begin{frame}{Next Steps (mostly like last  week)}  
  \begin{itemize}
    \item lots of items
    \item even more
  \end{itemize}

\end{frame}

\begin{frame}{Columns}
  \begin{columns}[T]
    \begin{column}{0.6\textwidth}
      \textbf{Here the image}
      \begin{figure}
        \includegraphics[width=\textwidth]{amu}
        \caption{here goes the logo again}
      \end{figure}
    \end{column}
    \begin{column}{0.4\textwidth}
      \textbf{Here the items}
      \begin{itemize}
        \item items
        \item over
        \item items
      \end{itemize}
    \end{column}
  \end{columns}
\end{frame}


\section{References}

\begin{frame}[plain]{References}
\begin{thebibliography}{xxxxxxxx}
  \bibitem{james}[James et al.] On Measurement Of Qubits
  \newblock D. James et al., Phys. Rev. A 64, 05/2312 (2001)
  \bibitem{stevenson}[Stevenson et al.] A semiconductor source of triggered entangled photon pairs
  \newblock R. M. Stevenson et al., Nature 439, 179-182 (2006)

  \bibitem{salter}[Salter et al.] An entangled-light-emitting diode
  \newblock C. L. Salter et al., Nature 465, 594–597 (2010)
  \bibitem{wootters}[Wootters et al.] Entanglement of Formation of an Arbitrary State of Two Qubits
  \newblock W. K. Wootters et al., Phys. Rev. Lett. 80, 2245-2248 (1998)
 \end{thebibliography}
\end{frame}
~~~
*content.tex*
{: .code-meta}
