projects ?= $(shell ls src)
tmp := $(shell mktemp)

all:
	@echo "List of documented projects in src:"
	@echo "${projects}"
	@echo
	@echo "Use 'make deploy' to publish modifications"

deploy:
	-@for i in ${projects}; do git checkout master && \
		cd src/$$i && mkdocs build && tar cf ${tmp} -C site . \
		&& cd - && git checkout gh-pages && mkdir -p $$i && tar xf ${tmp} -C $$i \
		&& grep -v '^Build\ Date' $$i/index.html > ${tmp} && mv ${tmp} $$i/index.html \
		&& rm -f $$i/sitemap.xml.gz \
		&& git add $$i && git commit -m "update $$i" && git push && git checkout master \
		; done
	@git checkout master

deploy-root:
	-@mkdocs build && tar cf ${tmp} -C site . \
    && git checkout gh-pages && tar xf ${tmp} -C . \
    && grep -v '^Build\ Date' index.html > ${tmp} && mv ${tmp} index.html \
    && rm -f sitemap.xml.gz
	@echo "ready to review, then commit and push to gh-pages"
