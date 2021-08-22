##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Sun Aug 22 05:05:29 CEST 2021
## Last Modified: Sun Aug 22 05:05:31 CEST 2021
## Syntax:        GNU Makefile
## Filename:      nifc-rism-records/Makefile
## vim:           ts=3
##
## Description:   Makefile for various actions in the
##                nifc-rism-records repository.
##

.PHONY: aton


##############################
##
## all -- Default action when typing "make": lists
##     make targets available in this makefile.
##

all:
	@echo
	@echo "Makefile targets:"
	@echo "  make update    -- Run list/download/aton targets"
	@echo "  make list      -- Create list of RISM IDs to process."
	@echo "  make download  -- Download MarcXml files."
	@echo "  make empty     -- List missing MarcXml files."
	@echo "  make count     -- Count number of RISM IDs."
	@echo "  make aton      -- Convert MarcXml files to ATON files."
	@echo "  make composers -- List composers and RISM IDs counts for each."
	@echo


##############################
##
## udpate -- Update list.txt, download any new MarcXml files
##    and convert to ATON.
##

update: list download aton



##############################
##
## list -- Collate a list of RISM IDs from Humdrum digital
##     scores (in a different repository).

list:
	bin/makeRismList --popc1 ../production-chopin-first-editions/kern \
	   --popc2 ../production-polish-scores/krn-diplomatic/out > list.txt



##############################
##
## download -- Download MarcXml files if they
##     have not already been downloaded (delete
##     all MarcXml files to redownload with
##     any updates).
##
## Downloading is done with this command:
##     wget https://opac.rism.info/id/rismid/1001100269?format=marc -O - | xmllint --format -
## where 1001100269 is the RISM ID (wget and xmllint need to be installed).
##

download:
	bin/downloadMarcXml list.txt marcxml



##############################
##
## empty -- List missing MarcXml files based on
##     the list of RISM IDs in list.txt.  If there
##     are missing files, try running "make download"
##

empty:
	@bin/listEmpties list.txt marcxml



##############################
##
## count -- Count the number of RISM records lin list.txt.
##

count:
	@wc -l list.txt



##############################
##
## aton -- Generate ATON versions of MarcXml files.
##

aton:
	mkdir -p aton
	for i in marcxml/*.xml; \
	do \
	   bin/marcxml2aton $$i > aton/$$(basename $$i .xml).aton; \
	done



##############################
##
## composers -- Generate a list of the composers from the ATON
##     version of the MARC records, listing the number of
##     entries for each composer.
##

c: composers
composer: composers
composers:
	(cd aton; grep -h MARC-100a * | sed 's/@MARC-100a: //' | sort | uniq -c)



