# NIFC RISM records #

This repository contains RISM entries downloaded in the MarcXml
format for NIFC related projects associated with Humdrum digital
scores.  RISM IDs are first extracted from Humdrum digital scores
into a file called list.txt by the command:

```bash
make list
```

Digital scores from which the RISM IDs are extracted are found in the
[humdrum-chopin-first-editions](https://github.com/pl-wnifc/humdrum-chopin-first-editions)
and
[humdrum-polish-scores](https://github.com/pl-wnifc/humdrum-polish-scores)
repositories.


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

If an existing MarcXml record already exists, then a new file
will *not* be downloaded (delete all downloaded files to update
the records).

To check if there are any missing MarcXml files by running the command:

```bash
make empty
```

To view a list of the composers represented in the records and a count
of the records for each composer, type:

```bash
make composers
```

<details markdown="1">
<summary>
List of represented composers (August 2021)
</summary>

| Records | Composer |
| ------- | -------- |
| 351 | Anonymus                                   |
|   6 | Barcicki, Jan                              |
|   1 | Bauer                                      |
|   1 | Bauer, Joseph Anton                        |
|   1 | Beethoven, Ludwig van                      |
|   1 | Bencini                                    |
|   1 | Binder, Christlieb Siegmund                |
|   2 | Boczkowski, Kazimierz                      |
|   2 | Bogoimski, Tadeusz                         |
|   6 | Boguński, Baltazar                         |
|   1 | Bohdanowicz, Bazyli                        |
|   1 | Boieldieu, Adrien                          |
|   3 | Bolehovský, Josef                          |
|   9 | Brentner, Johann Joseph Ignaz              |
|   1 | Brioschi, Antonio                          |
|   1 | Brixi, František Xaver                     |
|   4 | Brykner, Jerzy                             |
|   1 | Brzezińska, Filipina                       |
|   1 | Bułakowski, Stefan                         |
|   1 | Caldara, Antonio                           |
| 333 | Chopin, Fryderyk Franciszek                |
|   1 | Conti                                      |
|   1 | Cramer, Johann Baptist                     |
|   1 | Danielski, Florian                         |
|   1 | Danka                                      |
|   1 | Dankowski, Adalbert                        |
|   1 | De Majo, Gian Francesco                    |
|   1 | Dembowska, Konstancja                      |
|   1 | Dittersdorf, Carl Ditters von              |
|   9 | Dobrzyński, Ignacy Feliks                  |
|   2 | Elsner, Józef                              |
|   1 | Engel, Jan                                 |
|   1 | Figulenti                                  |
|   1 | Filipowicz, P.                             |
|   1 | Fils, Anton                                |
|   1 | Fischietti, Giovanni                       |
|   1 | G. B. B.                                   |
|   1 | Gimeshoffer                                |
|   1 | Goetz-Gieczyński, Cyryl                    |
|   2 | Gorczycki, Grzegorz Gerwazy                |
|   1 | Gołąbek, Jakub                             |
|   9 | Graun, Carl Heinrich                       |
|   1 | Grose, Michael Ehregott                    |
|   1 | Guglielmi, Pietro Alessandro               |
|   3 | Habermann, Jan Piotr                       |
|  15 | Hasse, Johann Adolf                        |
|   6 | Haydn, Joseph                              |
|   3 | Hermanowski, A.                            |
|   2 | Hoffmeister, Franz Anton                   |
|   1 | Janicki, Mikołaj                           |
|   1 | Janisch                                    |
|   1 | Jarecki, Józef                             |
|   1 | Jeric                                      |
|   2 | Kamiński, F.                               |
|   1 | Kellerer, Christophorus                    |
|   2 | Kobierkowicz, Józef                        |
|   1 | Königsperger, Marianus                     |
|   1 | Kotowicz                                   |
|   1 | Kościuszko, Tadeusz                        |
|   1 | Kreith                                     |
|   3 | Krogulski, Józef Władysław                 |
|   1 | Krzewdzieński, Paweł                       |
|   1 | Kuci, Mateusz                              |
|   1 | Kuhlau, Friedrich                          |
|   4 | Kurpiński, Karol Kazimierz                 |
|   1 | Kuttricz, Lania                            |
|   1 | Lampugnani, Giovanni Battista              |
|  22 | Lechleitner, Ferdinand Simon               |
|   1 | Lessel, Franciszek                         |
|   1 | Loos, Karel                                |
|  14 | Luna, Georgius                             |
|   1 | Maader, Ludwik                             |
|   1 | Maintzer, Franz                            |
|   1 | Majewska, J.                               |
|   1 | Maldere, Pierre van                        |
|   1 | Marescalchi, Luigi                         |
|   1 | Méhul, Etienne-Nicolas                     |
|   1 | Mysliveček, Josef                          |
|   2 | Naumann, Johann Gottlieb                   |
|   1 | Neumann                                    |
|   1 | Orłowski, Michał                           |
|   1 | Pausch, Eugen                              |
|   1 | Pergolesi, Giovanni Battista               |
|   1 | Pichl, Václav                              |
|  11 | Pleyel, Ignace                             |
|   1 | Pokorný, Franz Xaver                       |
|   1 | Puchalski                                  |
|   2 | Pych, Leopold                              |
|   1 | Rathgeber, Johann Valentin                 |
|   1 | Rhein, Carolo de                           |
|   3 | Riccieri, Giovanni Antonio                 |
|   1 | Rossini, Gioachino                         |
|   1 | Rossochalski                               |
|   5 | Ruth, Christian Joseph                     |
|   1 | Sacchini, Antonio                          |
|   1 | Schall, Claus Nielsen                      |
|   1 | Schiedermayr, Johann Baptist               |
|   1 | Seger, Josef Ferdinand Norbert             |
|   1 | Sieprawski, Paweł                          |
|   6 | Siwiński, Andrzej                          |
|   1 | Stachowicz, Damian                         |
|   1 | Staromiejski, J.                           |
|   2 | Stefani, Jan                               |
|   1 | Stolle                                     |
|   1 | Stolpe, Alojzy                             |
|   1 | Szarzyński, Stanisław Sylwester            |
|   3 | Szczurowski, Jacek                         |
|  26 | Szymanowska, Maria                         |
|   1 | Toeschi, Carl Joseph                       |
|   1 | Turczyński, Paschalis                      |
|   2 | Vanhal, Johann Baptist                     |
|   2 | Victorini                                  |
|   1 | Vinci, Leonardo                            |
| 105 | Walczyński, Franciszek                     |
|   1 | Wański, Jan                                |
|   1 | Went, Johann Nepomuk                       |
|   2 | Winter, Peter von                          |
|   1 | Wołoszko, Andrzej                          |
|   1 | Wronowicz, Maciej H.                       |
|   1 | Zajączkowski, Roman                        |
|   1 | Zandtfelder, Nicolaus Joseph Ignatius      |
|   1 | Ziegler                                    |

</details>


## MARC21 Documentation ##


| Field range | Information                                          |
| ----------- | ---------------------------------------------------- |
| 00X         | https://www.loc.gov/marc/bibliographic/bd00x.html    |
| 01X-09X     | https://www.loc.gov/marc/bibliographic/bd01x09x.html |
| X00-X30     | https://www.loc.gov/marc/bibliographic/bdheading.html|
| 1XX         | https://www.loc.gov/marc/bibliographic/bd1xx.html    |
| 100         | [Main Entry-Personal Name (NR)](https://www.loc.gov/marc/bibliographic/bd100.html) |
| 100a        | Composer's name                                      |
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


