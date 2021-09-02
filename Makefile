##
## Programmer:    Craig Stuart Sapp <craig@ccrma.stanford.edu>
## Creation Date: Sun Aug 22 05:05:29 CEST 2021
## Last Modified: Thu Sep  2 06:50:59 CEST 2021
## Syntax:        GNU Makefile
## Filename:      nifc-rism-records/Makefile
## vim:           ts=3
##
## Description:   Makefile for various actions in the
##                nifc-rism-records repository.
##

.PHONY: aton-works aton-composers


##############################
##
## all -- Default action when typing "make": lists
##     make targets available in this makefile.
##

all:
	@echo
	@echo "Makefile targets:"
	@echo "  make update             -- Run list/download/aton targets"
	@echo "  make work-list          -- Create list of RISM IDs to process."
	@echo "  make composer-list      -- Create list of RISM composer IDs to process."
	@echo "  make download           -- Download MarcXml files."
	@echo "  make download-works     -- Download MarcXml files."
	@echo "  make download-composers -- Download MarcXml files."
	@echo "  make empty              -- List missing MarcXml files."
	@echo "  make count              -- Count number of RISM IDs."
	@echo "  make aton               -- Convert MarcXml files to ATON files."
	@echo "  make work-composers     -- List composers and RISM IDs counts for each."
	@echo


##############################
##
## udpate -- Update list-works.txt, download any new MarcXml files
##    and convert to ATON.
##

update: work-list composer-list download aton



##############################
##
## work-list -- Collate a list of RISM IDs from Humdrum digital
##     scores (in a different repository).

work-list:
	bin/makeRismList --popc1 ../production-chopin-first-editions/kern \
	   --popc2 ../production-polish-scores/krn-diplomatic/out > list-works.txt



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

download: download-works download-composers

dw: download-works
download-work: download-works
download-works:
	bin/downloadMarcXml list-works.txt marcxml-works

dc: download-composers
download-composer: download-composesr
download-composers:
	bin/downloadMarcXml list-composers.txt marcxml-composers



##############################
##
## empty -- List missing MarcXml files based on
##     the list of RISM IDs in list-works.txt.  If there
##     are missing files, try running "make download"
##

empty:
	@bin/listEmpties list-works.txt marcxml-works



##############################
##
## count -- Count the number of RISM records lin list-works.txt.
##

count:
	@wc -l list-works.txt



##############################
##
## aton -- Generate ATON versions of MarcXml files.
##

aton: aton-works aton-composers

aw: aton-works
aton-work: aton-work
aton-works:
	mkdir -p aton-works
	for i in marcxml-works/*.xml; \
	do \
	   bin/marcxml2aton $$i > aton-works/$$(basename $$i .xml).aton; \
	done

ac: aton-composers
aton-composer: aton-composers
aton-composers:
	mkdir -p aton-composers
	for i in marcxml-composers/*.xml; \
	do \
	   bin/marcxml2aton $$i > aton-composers/$$(basename $$i .xml).aton; \
	done



##############################
##
## work-composers -- Generate a list of the composers from the ATON
##     version of the MARC work records, listing the number of
##     entries for each composer.
##

mc: work-composers
work-composer: work-composers
work-composers:
	(cd aton-works; grep -h MARC-100a * | sed 's/@MARC-100a: //' | sort | uniq -c)



##############################
##
## check-composers -- Check to see if composer names in list-composers.txt
##     from the metadata spreadsheet matches to the composer names in the
##     RISM MARC records for the same composer.
##

cc: check-composers
check-composer: check-composers
check-composers:
	@bin/checkComposers list-composers.txt aton-composers



##############################
##
## composers -- Generate a list of the composers from the ATON
##     version of the MARC records, listing the number of
##     entries for each composer.
##

cl: composers-list
composer-list: composers-list
composers-list:
	bin/makeRismComposerList > list-composers.txt



