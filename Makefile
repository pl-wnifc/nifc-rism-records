
all: list


list:
	bin/makeRismList > list.txt

download:
	bin/downloadMarcXml list.txt marcxml

empty:
	@bin/listEmpties list.txt marcxml

count:
	@wc -l list.txt
