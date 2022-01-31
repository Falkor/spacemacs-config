;;; Compiled snippets and support files for `latex-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'latex-mode
					 '(("begin" "\n\\begin{${1:environment}}\n$0\n\\end{$1}\n" "\\begin{environment} ... \\end{environment}" nil nil nil nil nil nil)
					   ("col" "%~~~~~~~~~~~~~~\n\\begin{columns}\n    \\column{0.${1:ratio}\\textwidth}\n	$0\n    \\column{0.$1\\textwidth}\n\n\\end{columns}\n" "\\begin{columns}  ... \\end{columns} " nil nil nil nil nil nil)
					   ("fra" "%.......\n\\frame{\n   \\frametitle{${1:Frame Title}}\n   $0\n}\n" "\\frame{ ... } " nil nil nil nil nil nil)
					   ("fra.1" "%............\n\\begin{frame}\n    \\frametitle{${1:Frame Title}}\n    $0\n\n\\end{frame}\n" "\\begin{frame}  ... \\end{frame} " nil nil nil nil nil nil)
					   ("frame" "%.......\n\\frame{\n   \\frametitle{${1:Frame Title}}\n   $0\n}\n" "\\frame{ ... } " nil nil nil nil nil nil)
					   ("frame.1" "%............\n\\begin{frame}\n    \\frametitle{${1:Frame Title}}\n    $0\n\n\\end{frame}\n" "\\begin{frame}  ... \\end{frame} " nil nil nil nil nil nil)
					   ("sec" "%====================\n\\section{${1:name}}\n\\label{sec:$2}\n\n$0" "\\section{name}" nil nil nil nil "direct-keybinding" nil)
					   ("sub" "%---------------------------\n\\subsection{${1:name}}\n\\label{sub:$2}\n\n$0" "\\subsection{name}" nil nil nil nil "direct-keybinding" nil)))


;;; Do not edit! File generated at Wed Dec 10 22:40:21 2014
