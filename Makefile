
# Base name of main Markdown file
DOC_MD = thesis

# Base name of final output
DOC_PDF = thesis

TEMPLATE = templates/ntnu.tex

# A list of .md files to concatenate
CHAPTERS = $(shell find content -name "[0-9][0-9]*.md")

PDFLATEX = pdflatex -shell-escape

all: $(DOC_PDF).pdf

%.png: %.gv
	dot $< -T png -o $@

%.pdf: %.pbm
	potrace -b pdf $<

$(DOC_PDF).tex: $(DOC_MD).md $(CHAPTERS)
	pandoc -s -S \
		--natbib   \
		--template $(TEMPLATE) \
		--columns 16 \
		--top-level-division chapter \
		$^ -o $@

$(DOC_PDF).pdf: $(DOC_PDF).tex references.bib $(TEMPLATE)
	pdflatex -shell-escape $<
	bibtex $(DOC_PDF)
	makeglossaries $(DOC_PDF)
	pdflatex -shell-escape $<
	pdflatex -shell-escape $<

it:
	@echo "Nice, you're making progress:"

count:
	@wc -w thesis.tex

real-count:
	@ps2ascii thesis.pdf | wc -w

clean:
	rm -f *.bbl *.aux *.log *.lof *.lot *.out *.tex *.blg *.toc *.glo *.acn *.acr *.alg *.glg *.gls *.ist

.PHONY: all clean count
