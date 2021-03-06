# Igra življenja
V projektu sem se osredotočil na igro živjenja. Da bi lahko le te razumeli, moramo najprej pogledati smrtno rojstne procese. 

## Smrtno rojstni procesi
Smrtno rojstni procesi posebna vrsta markovskih procesov v zveznem času, kjer obstajata le dve vrsti sprememb stanj. Prva je, da se populacija za eno poveča, torej smo dobili rojstvo, druga pa, da se populacija za eno zmanjša, torej smo imeli smrt.

![Prikaz procesa](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/BD-proces.png)

Stanja procesa so naravna števila z 0, ki predstavljajo velikost populacije. Proces ima eno vpijajoče stanje, in sicer 0. To je trenutek, ko je umrl zadnji osebek, in tako ne moremo imeti nobenega novega osebka več, ker ne moremo od nikjer več dobiti nikogar.
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

Populacije, ki jih bomo gledali si bomo torej predstavljali kot enoceličarje. 

Igro življenja si lahko predstavljamo kot poenostavljen model prostora enoceličarjev. 

## Igra življenja

![Igra življenja](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/game_of_life.jpg)

[Conwayeva igra življenja](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) ni družabna igra. Gre za igro ene poteze, kjer igralec izbere začetno stanje modela. Nato pa spremljamo, kako spreminja število in položaj živih celic.

Kot vsaka igra ima tudi ta igra svoja pravila. Tu imamo 4 osnovna pravila:
1. Živa celica z manj kot dvema živima sosedoma umre.
2. Živa celica z več kot tremi živimi sosedi umre.
3. Živa celica z dvema ali tremi živimi sosedi preživi.
4. Mrtva celica z tremi živimi sosedi oživi.

Igra življenja ima določen potek že ob samem začetku, saj je vse odvisno od začetne porazdelitve živih celic. Ker je rezultat determinističen, ne gre za slučajni proces, zato ne moremo reči, da gre za primer standarden primer smrtno rojstnih procesov. Kar pa lahko rečemo je da velja, da je začetna porazdelitev slučajna. Torej gre za poseben primer rojstno smrtnih procesov, kjer ima posebno porazdelitev le začetek. 

## Ideja projekta
Pri tem projektu bom uporabljal programski jezik R. Gre za projektno nalogo pri predmetu matematika z računalnikom.

Ideja tega projekta je, da pripravim Shiny vmesnik, ki bo omogočal interaktivno spoznavanje *igre življenja*.
Obiskovalec bo lahko začel igro življenja, ne bo pa je mogel igrati, saj je to igra nič igralcev. 


### Potrebne knjižnjice
Manj znane knjižnjice bodo povezane z CRAN stranjo
* shiny
* ggplot2
* [plot.matrix](https://cran.r-project.org/web/packages/plot.matrix/vignettes/plot.matrix.html)
* [shinydashboard](https://cran.r-project.org/web/packages/shinydashboard/shinydashboard.pdf)
* [ggplotify](https://cran.r-project.org/web/packages/ggplotify/vignettes/ggplotify.html)
* plotly

