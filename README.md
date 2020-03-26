# Rojstno smrtni procesi

Smrtno rojstni procesi posebna vrsta Markovskih procesov v zveznem času, kjer obstajata le dve vrsti sprememb stanj. Prva je, da se populacija za eno poveča, torej smo dobili rojstvo, druga pa, da se populacija za eno zmanjša, torej smo imeli smrt.

![Prikaz procesa](./slike/DB-proces.PNG)

Ti procese lahko opazujemo za veliko skupino resničnih procesov. Kot prvo jih lahko opazujemo za populacije, najbolj enostaven primer le teh pa so populacije enoceličarjev.

![Celica](./slike/celica.JPEG)

Ti organizmi se delijo in odmirajo neodvisno drug od drugega, dokler prostor, v katerem se nahajajo zadošča idelanim pogojem. Primer iz resničnega življenja so kvasovke, ki pospešujejo alkoholno vrenje, ki se nekaj časa delijo in odmirajo neodvisno, ko pa porabijo hrano se večanje populacije ustavi, nato pa začnejo pospešeno odmirati.

V majhnem primeru lahko pokažemo to na spodnjem grafu. 

![Potek procesa](./slike/potek.PNG)

Zelo je pomembno, kako hitro potekajo rojstva (delitve) in smrti v populaciji. V spodnjem grafu vidimo, kaj se zgodi, če so rojstva porazdeljena cauchyjevo, smrti pa normalno z povprečjem 0 in standardnim odklonom 1. 

![Potek procesa](./slike/velikost.PNG)

Poleg tega je za smrtno rojstne procese pomembno, kakšna je 


## Ideja projekta
Tema je opisana [tukaj](https://en.wikipedia.org/wiki/Birth%E2%80%93death_process). Pri tem projektu bom uporabljal programski jezik R. Gre za projektno nalogo pri predmetu matematika z računalnikom.

Ideja tega projekta je, da pripravim Shiny vmesnik, ki bo omogočal interaktivno spoznavanje *rojstno-smrtnih procesov*.
V okviru tega bom predstavil tudi [igro življenja](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) ter čakalne vrste.
Obiskovalec bo lahko začel igro življenja, ne bo pa je mogel igrati, saj je to igra nič igralcev. 


### Potrebne knjižnjice
Manj znane knjižnjice bodo povezane z CRAN stranjo
* shiny
* [queueing](https://cran.r-project.org/web/packages/queueing/index.html)
* ggplot2
* bodo dodane sproti

