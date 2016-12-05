# markdown-latex-ntnu

> A starting point for writing reports in Markdown that compiles to LaTeX.

## Prerequisites

* [LaTeX](https://www.latex-project.org/get/)
* [Pandoc](http://pandoc.org/) (`brew install pandoc`)
* Mac OS X or Linux


## Writing

* You write your content using Markdown. All content reside in the `content` folder and you typically want one `.md` file for each chapter. To add a chapter you must create the file and update the list in `Makefile`.

* _Title_ and _authors_ are set using YAML front matter in `thesis.md`. You can also write all your content in this file if that is your game.

* References can be added to `references.bib` and glossary items in `content/glossary.tex`.

* To render a beautiful PDF, you must run `make` in your terminal. It will generate a `thesis.pdf` if everything go as it should.

* If you need to customize some stuff, just edit the template in `templates/ntnu.tex`.
