REPO := $(shell git config --get github.com/omega16/omega16.github.io)
GHPAGES = gh-pages

all: $(GHPAGES) $(addprefix $(GHPAGES)/, $(addsuffix .html, $(basename $(wildcard *.md))))

$(GHPAGES):
	echo "$(REPO)"
	git clone "$(REPO)" "$(GHPAGES)"
	(cd $(GHPAGES) && git checkout $(GHPAGES)) || (cd $(GHPAGES) && git checkout --orphan $(GHPAGES) && git rm -rf .)

$(GHPAGES)/%.html: %.md
	pandoc -s --toc --template "layouts/default.html5" -c "css/main.css" -f markdown -t html5 -o "$@" "$<"

clean:
	rm -rf "$(GHPAGES)"
	mkdir "$(GHPAGES)"

serve:
	cd $(GHPAGES) && python3 -m http.server


commit:
	cd $(GHPAGES) && \
		git add . && \
		git commit --edit --message="Publish @$$(date)"
	cd $(GHPAGES) && \
		git push origin $(GHPAGES)