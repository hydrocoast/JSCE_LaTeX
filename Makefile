# Makefile
# Takuya Miyashita (miyashita@hydrocoast.jp)

KANJI := utf8
PLATEX := platex -kanji=$(KANJI)
PBIB := pbibtex -kanji=$(KANJI)
DVIPDF := dvipdfmx -p a4

.PHONY: all clean new
all: ronbun
ronbun:
	$(eval FILE := ronbun-j)
	$(PLATEX) $(FILE)
	$(PBIB) $(FILE)
	$(PLATEX) $(FILE)
	$(PLATEX) $(FILE)
	$(DVIPDF) $(FILE)

clean:
	-rm -f *~ *.log *.dvi *.blg *.aux *.out *.bbl *.lot *.toc *.lof *.pdf *.fdb_latexmk *.fls

new: clean
	git init
	git remote rename origin template

template:
	git reset --hard template/master

