# 115 120
#datoteka s posebnimi matrikami, za posebne rasti
doloci_random_matriko <- function(vrstice,stolpci){
  #dal bom možnosti izbire velikosti, drugače bo začetna izbira za sedaj random
  dat <- sample(c(0,1), replace=TRUE, size=vrstice*stolpci)
  mdat <- matrix(dat,nrow = vrstice, ncol= stolpci)
  return(mdat)
}

doloci_deter_matriko <- function(vrstice,stolpci,zaporedje){
  #vrstice povedo št vrstice
  #stolpci povedo število stolpcev
  #zaporedje je podan vektor 0 in 1, ki opiše začetno stanje
  if(vrstice*stolpci != length(zaporedje)){
    return(print("Zaporedje ni prave dolžine."))
  }
  else if(sum(zaporedje==1) + sum(zaporedje==0) != length(zaporedje)){
    return(print("Zaporedje vsebuje nepravilne znake"))
  }
  else{
    mdat <- matrix(zaporedje,nrow = vrstice, ncol= stolpci)
    return(mdat)
  }
}



function [result] = life_toad(myseed, toad_x, toad_y)
% [result] = life_toad(myseed, toad_x, toad_y)
% add a "toad" oscilaltor to Conway's game of life
% myseed -- the universe array (2D)
% toad_x -- x coordinate of toad
% toad_y -- y coordinate of toad
%
% Author: John F. McGowan, Ph.D.
% Web: http://www.jmcgowan.com/
% E-Mail: jmcgowan11@earthlink.net
%

result = myseed;

result(toad_x, toad_y) = 1;
result(toad_x+1, toad_y) = 1;
result(toad_x+2, toad_y) = 1;

result(toad_x + 1, toad_y + 1) = 1;
result(toad_x + 2, toad_y + 1) = 1;
result(toad_x + 3, toad_y + 1) = 1;

end % function life_toad

function [result] = life_pulsar(myseed, pulsar_x, pulsar_y)
% [result] = life_pulsar(myseed, pulsar_x, pulsar_y)
% add a "pulsar" oscilaltor to Conway's game of life
% myseed -- the universe array (2D)
% pulsar_x -- x coordinate of pulsar
% pulsar_y -- y coordinate of pulsar
%
% Author: John F. McGowan, Ph.D.
% Web: http://www.jmcgowan.com/
  % E-Mail: jmcgowan11@earthlink.net
%

pulsar = [ 0 0 1 1 1 0 0 0 1 1 1 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0;
           1 0 0 0 0 1 0 1 0 0 0 0 1;
           1 0 0 0 0 1 0 1 0 0 0 0 1;
           1 0 0 0 0 1 0 1 0 0 0 0 1;
           0 0 1 1 1 0 0 0 1 1 1 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 1 1 1 0 0 0 1 1 1 0 0;
           1 0 0 0 0 1 0 1 0 0 0 0 1;
           1 0 0 0 0 1 0 1 0 0 0 0 1;
           1 0 0 0 0 1 0 1 0 0 0 0 1;
           0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 1 1 1 0 0 0 1 1 1 0 0;
           ];

result = myseed;

result(pulsar_x:pulsar_x+rows(pulsar)-1, pulsar_y:pulsar_y+columns(pulsar)-1) = pulsar;

end % function life_pulsar

function [result] = life_glider(myseed, glider_x, glider_y)
% [result] = life_glider(myseed, glider_x, glider_y)
% add a glider to Conway's game of life
% myseed -- the universe array (2D)
% glider_x -- x coordinate of glider
% glider_y -- y coordinate of glider
%
% Author: John F. McGowan, Ph.D.
% Web: http://www.jmcgowan.com/
% E-Mail: jmcgowan11@earthlink.net
%

result = myseed;

result(glider_x, glider_y) = 1;
result(glider_x+1, glider_y+1) = 1;
result(glider_x+2, glider_y+1) = 1;
result(glider_x, glider_y + 2) = 1;
result(glider_x + 1, glider_y + 2) = 1;

end % function life_glider


function [result] = life_gosper(myseed, gosper_x, gosper_y)
% [result] = life_gosper(myseed, gosper_x, gosper_y)
% add a "gosper" oscilaltor to Conway's game of life
% myseed -- the universe array (2D)
% gosper_x -- x coordinate of gosper
% gosper_y -- y coordinate of gosper
%
% Author: John F. McGowan, Ph.D.
% Web: http://www.jmcgowan.com/
  % E-Mail: jmcgowan11@earthlink.net
%

gosper = [ 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0;
           0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 1 1 0 0 0 0 0 0 0 0 1 0 0 0 1 0 1 1 0 0 0 0 1 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
           0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0;
           ];

result = myseed;

result(gosper_x:gosper_x+rows(gosper)-1, gosper_y:gosper_y+columns(gosper)-1) = gosper;

end % function life_gosper


#statično
X = np.zeros((6, 21))
X[2:4, 1:3] = 1
X[1:4, 5:9] = [[0, 1, 1, 0],
               [1, 0, 0, 1],
               [0, 1, 1, 0]]
X[1:5, 11:15] = [[0, 1, 1, 0],
                 [1, 0, 0, 1],
                 [0, 1, 0, 1],
                 [0, 0, 1, 0]]
X[1:4, 17:20] = [[1, 1, 0],
                 [1, 0, 1],
                 [0, 1, 0]]

life_animation(X, dpi=5, frames=3)

#rotacija
blinker = [1, 1, 1]
toad = [[1, 1, 1, 0],
        [0, 1, 1, 1]]

X = np.zeros((6, 11))
X[2, 1:4] = blinker
X[2:4, 6:10] = toad
life_animation(X, dpi=5, frames=4)

#pulzar
X = np.zeros((17, 17))
X[2, 4:7] = 1
X[4:7, 7] = 1
X += X.T
X += X[:, ::-1]
X += X[::-1, :]
life_animation(X, frames=6)

#drsalec
glider = [[1, 0, 0],
          [0, 1, 1],
          [1, 1, 0]]
X = np.zeros((8, 8))
X[:3, :3] = glider
life_animation(X, dpi=5, frames=32, interval=100)

#neprestana rast
unbounded = [[1, 1, 1, 0, 1],
             [1, 0, 0, 0, 0],
             [0, 0, 0, 1, 1],
             [0, 1, 1, 0, 1],
             [1, 0, 1, 0, 1]]
X = np.zeros((30, 40))
X[15:20, 18:23] = unbounded
life_animation(X, dpi=10, frames=100, interval=200, mode='once')

#glider gun
glider_gun =\
[[0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1],
 [0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1],
 [1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [1,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0],
 [0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0]]

X = np.zeros((50, 70))
X[1:10,1:37] = glider_gun

life_animation(X, dpi=15, frames=180, interval=50, mode='once')

#dodatni primeri
diehard = [[0, 0, 0, 0, 0, 0, 1, 0],
           [1, 1, 0, 0, 0, 0, 0, 0],
           [0, 1, 0, 0, 0, 1, 1, 1]]

boat = [[1, 1, 0],
        [1, 0, 1],
        [0, 1, 0]]

r_pentomino = [[0, 1, 1],
               [1, 1, 0],
               [0, 1, 0]]

beacon = [[0, 0, 1, 1],
          [0, 0, 1, 1],
          [1, 1, 0, 0],
          [1, 1, 0, 0]]

acorn = [[0, 1, 0, 0, 0, 0, 0],
         [0, 0, 0, 1, 0, 0, 0],
         [1, 1, 0, 0, 1, 1, 1]]

spaceship = [[0, 0, 1, 1, 0],
             [1, 1, 0, 1, 1],
             [1, 1, 1, 1, 0],
             [0, 1, 1, 0, 0]]

block_switch_engine = [[0, 0, 0, 0, 0, 0, 1, 0],
                       [0, 0, 0, 0, 1, 0, 1, 1],
                       [0, 0, 0, 0, 1, 0, 1, 0],
                       [0, 0, 0, 0, 1, 0, 0, 0],
                       [0, 0, 1, 0, 0, 0, 0, 0],
                       [1, 0, 1, 0, 0, 0, 0, 0]]