## Igra življenja

![Igra življenja](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/game_of_life.jpg)

[Conwayeva igra življenja](https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life) ni družabna igra. Gre za igro ene poteze, kjer igralec izbere začetno stanje modela. Nato pa spremljamo, kako spreminja število in položaj živih celic.

Kot vsaka igra ima tudi ta igra svoja pravila. Tu imamo 4 osnovna pravila:
1. Živa celica z manj kot dvema živima sosedoma umre.
2. Živa celica z več kot tremi živimi sosedi umre.
3. Živa celica z dvema ali tremi živimi sosedi preživi.
4. Mrtva celica z tremi živimi sosedi oživi.

Igra življenja ima določen potek že ob samem začetku, saj je vse odvisno od začetne porazdelitve živih celic. Ker je rezultat determinističen, ne gre za slučajni proces, zato ne moremo reči, da gre za primer standarden primer smrtno rojstnih procesov. Kar pa lahko rečemo je da velja, da je začetna porazdelitev slučajna. Torej gre za poseben primer rojstno smrtnih procesov, kjer ima posebno porazdelitev le začetek. 

## Celica

Te procese lahko opazujemo za raznolike resnične procese. Kot prvo jih lahko opazujemo za populacije, najbolj enostaven primer le teh pa so populacije enoceličarjev.

![Celica](https://raw.githubusercontent.com/mpracek/matematika-z-racunalnikom/master/slike/celica.jpg)

Ti organizmi se delijo in odmirajo neodvisno drug od drugega, dokler prostor, v katerem se nahajajo zadošča idelanim pogojem. Primer iz resničnega življenja so kvasovke, ki pospešujejo alkoholno vrenje, ki se nekaj časa delijo in odmirajo neodvisno, ko pa porabijo hrano se večanje populacije ustavi, nato pa začnejo pospešeno odmirati.

Populacije, ki jih bomo gledali si bomo torej predstavljali kot enoceličarje. 

Igro življenja si lahko predstavljamo kot poenostavljen model prostora enoceličarjev. 
