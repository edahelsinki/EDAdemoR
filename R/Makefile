
FILES := Makefile run.R \
	demoR/demoR.R demoR/global.R demoR/server.R demoR/ui.R demoR/data \
	$(wildcard demoR/data/*.rds)

.PHONY: run
run: 
	Rscript --vanilla run.R

.PHONY: zip
zip: ../dist/demoR.zip

../dist/demoR.zip: $(FILES)
	rm -f ../dist/demoR.zip && zip ../dist/demoR.zip $(FILES)
