# Makefile
# written by Takuya Miyashita (miyashita@hydrocoast.jp)
# Graduate student, Kyoto University
# last modified Nov. 2018

KANJI := utf8
PLATEX := platex -kanji=$(KANJI)
PBIB := pbibtex -kanji=$(KANJI)
DVIPDF := dvipdfmx -p a4

.PHONY: all clean
all: ronbun
ronbun:
	$(eval FILE := ronbun-j)
	$(PLATEX) $(FILE)
	$(PBIB) $(FILE)
	$(PLATEX) $(FILE)
	$(PLATEX) $(FILE)
	$(DVIPDF) $(FILE)

man:
	$(eval FILE := jsce-man)
	$(PLATEX) $(FILE)
	$(PLATEX) $(FILE)
	$(DVIPDF) $(FILE)


bib:
	$(eval FILE := bibtex-j)
	$(PLATEX) $(FILE)
	$(PBIB) $(FILE)
	$(PLATEX) $(FILE)
	$(PLATEX) $(FILE)
	$(DVIPDF) $(FILE) 

soufu:
	$(eval FILE := soufuhyo2e)
	$(PLATEX) $(FILE)
	$(DVIPDF) $(FILE) 

clean:
	-rm -f *~ *.log *.dvi *.blg *.aux *.out *.bbl *.lot *.toc *.lof *.pdf *.fdb_latexmk *.fls

new: clean
	-rm bibtex-j.tex bibtexdb.bib jsce-man.tex soufu*
	git init
	git remote rename origin template

template:
	git reset --hard template/master

