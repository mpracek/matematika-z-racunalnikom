# Rojstno smrtni procesi

Smrtno rojstni procesi posebna vrsta Markovskih procesov v zveznem času, kjer obstajata le dve vrsti sprememb stanj. Prva je, da se populacija za eno poveča, torej smo dobili rojstvo, druga pa, da se populacija za eno zmanjša, torej smo imeli smrt.

![Prikaz procesa](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/BD-proces.png)

Stanja procesa so $mathcal{N_0}$, ki predstavljajo velikost populacije. Proces ima eno vpijajoče stanje, in sicer 0. To je trenutek, ko je umrl zadnji osebek, in tako ne moremo imeti nobenega novega osebka več, ker ne moremo od nikjer več dobiti nikogar.
V majhnem primeru lahko pokažemo to na spodnjem grafu. 

![Potek procesa](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/potek.png)

Zelo je pomembno, kako hitro potekajo rojstva (delitve) in smrti v populaciji. V spodnjem grafu vidimo, kaj se zgodi, če so rojstva porazdeljena cauchyjevo, smrti pa normalno z povprečjem 0 in standardnim odklonom 1. 

![Potek procesa](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/velikost.png)

Poleg tega je za smrtno rojstne procese pomembno, kakšna je začetna velikost populacije. To je razvidno iz spodnjega grafa, kjer so porazdelitve rojstev in smrti enake kot zgoraj, le velikost začetne populacije je manjša, in sicer 10 namesto 50. 

![Potek procesa](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/velikost2.png)

## Celica

Te procese lahko opazujemo za raznolike resnične procese. Kot prvo jih lahko opazujemo za populacije, najbolj enostaven primer le teh pa so populacije enoceličarjev.

![Celica](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/celica.jpg)

Ti organizmi se delijo in odmirajo neodvisno drug od drugega, dokler prostor, v katerem se nahajajo zadošča idelanim pogojem. Primer iz resničnega življenja so kvasovke, ki pospešujejo alkoholno vrenje, ki se nekaj časa delijo in odmirajo neodvisno, ko pa porabijo hrano se večanje populacije ustavi, nato pa začnejo pospešeno odmirati.

## Igra življenja

![Igra življenja](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/game_of_life.jpg)

[Conwayeva igra življenja](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) ni družabna igra. Gre za igro ene poteze, kjer igralec izbere začetno stanje modela. Nato pa spremljamo, kako spreminja število in položaj živih celic.

Kot vsaka igra ima tudi ta igra svoja pravila. Tu imamo 4 osnovna pravila:
1. Celica z manj kot dvema živima sosedoma umre.
2. Celica z več kot tremi živimi sosedi umre.
3. Celica z dvema ali tremi živimi sosedi umre.
4. Mrtva celica z tremi živimi sosedi oživi.

V našem primeru bo model matrika, torej bomo imeli 2D model. Ta igra lahko obstaja tudi v več dimenzijah.


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

