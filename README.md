# NIFC RISM entries #

This repository contains RISM entries in the MarcXml format for
NIFC related projects associated with Humdrum digital scores.  RISM
IDs are extracted from Humdrum digital scores into a file called
list.txt by the command:

```bash
make list
```

The extraction script expects a reference record in the form:

```tsv
!!!NIFC-rismID: 300000291
```

If the record has empty contents, it will be ignored.  If it has
content other than decimal digits, then it will be processed, but
the downloading script will ignore such an invalid entry.  The RISM
ID on that line is then used to download the MarcXml record from
this URL:

```
https://opac.rism.info/id/rismid/300000291?format=marc
```

by typing the following command:

```bash
make download
```

If an existing MarcXML record already exists, then a new file
will *not* be downloaded (delete all downloaded files to update
the records).

To check if there are any missing MarcXml files by running the command:

```bash
make empty
```


## MARC 21 Documentation ##


| field range | information                                          |
| ----------- | ---------------------------------------------------- |
| 00X         | https://www.loc.gov/marc/bibliographic/bd00x.html    |
| 01X-09X     | https://www.loc.gov/marc/bibliographic/bd01x09x.html |
| X00-X30     | https://www.loc.gov/marc/bibliographic/bdheading.html|
| 1XX         | https://www.loc.gov/marc/bibliographic/bd1xx.html    |
| 20X-24X     | https://www.loc.gov/marc/bibliographic/bd20x24x.html |
| 25X-28X     | https://www.loc.gov/marc/bibliographic/bd70x75x.html |
| 3XX         | https://www.loc.gov/marc/bibliographic/bd3xx.html    |
| 4XX         | https://www.loc.gov/marc/bibliographic/bd4xx.html    |
| 5XX         | https://www.loc.gov/marc/bibliographic/bd5xx.html    |
| 6XX         | https://www.loc.gov/marc/bibliographic/bd6xx.html    |
| 70X-75X     | https://www.loc.gov/marc/bibliographic/bd70x75x.html |
| 76X-78X     | https://www.loc.gov/marc/bibliographic/bd76x78x.html |
| 80X-83X     | https://www.loc.gov/marc/bibliographic/bd80x83x.html |
| 841-88X     | https://www.loc.gov/marc/bibliographic/bd84188x.html |


* <a href="https://opac.rism.info/fileadmin/user_upload/lod/update">RISM database files</a>


