# 115 120
#datoteka, kjer dolocimo matrike za igre življenja


doloci_random_matriko <- function(vrstice,stolpci){
  #dal bom možnosti izbire velikosti, drugače bo začetna izbira za sedaj random
  dat <- sample(c(0,1), replace=TRUE, size=vrstice*stolpci)
  mdat <- matrix(dat,nrow = vrstice, ncol= stolpci)
  return(mdat)
}

# doloci_deter_matriko <- function(vrstice,stolpci,zaporedje){
#   #vrstice povedo št vrstice
#   #stolpci povedo število stolpcev
#   #zaporedje je podan vektor 0 in 1, ki opiše začetno stanje
#   if(vrstice*stolpci != length(zaporedje)){
#     return(print("Zaporedje ni prave dolžine."))
#   }
#   else if(sum(zaporedje==1) + sum(zaporedje==0) != length(zaporedje)){
#     return(print("Zaporedje vsebuje nepravilne znake"))
#   }
#   else{
#     mdat <- matrix(zaporedje,nrow = vrstice, ncol= stolpci)
#     return(mdat)
#   }
# }



#pri matrix nujno byrow = TRUE

#poglejmo Web: http://www.jmcgowan.com/

#krastača
#toad oscilator!
 

#pulsar
#oscilator
#13 stolpcev
#13 vrstic

pulsar <- c(0,0,1,1,1,0,0,0,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
           1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,1,
           1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,1,
           1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,1,
           0 ,0 ,1 ,1 ,1 ,0 ,0 ,0 ,1 ,1 ,1 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,1 ,1 ,1 ,0 ,0 ,0 ,1 ,1 ,1 ,0 ,0,
           1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,1,
           1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,1,
           1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,1,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,1 ,1 ,1 ,0 ,0 ,0 ,1 ,1 ,1 ,0 ,0)

pulzor <- matrix(pulsar,nrow = 13, ncol= 13,byrow=TRUE)


# gosper oscilaltor

#11 vrstic
gosper <- c(0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,1 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,1 ,0 ,0,
           0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,1 ,0 ,1 ,1 ,0 ,0 ,0 ,0 ,1 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,1 ,1 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0,
           0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0)

gosper1 <- matrix(gosper,nrow = 11, ncol= 39,byrow=TRUE)


#statično
X[2:4, 1:3] = 1
staticno1<- c(0, 1, 1, 0,
               1, 0, 0, 1,
               0, 1, 1, 0)
staticno1 <- c(0,1,0,1,0,1,1,0,1,0,1,0)
staticno1a <- matrix(staticno1,nrow = 3, ncol= 4)

staticno2 <- c(0, 1, 1, 0,
              1, 0, 0, 1,
              0, 1, 0, 1,
              0, 0, 1, 0)
staticno2a <- matrix(staticno2,nrow =4, ncol= 4,byrow = TRUE)

staticno3 <- c(1, 1, 0,
               1, 0, 1,
               0, 1, 0)
staticno3a <- matrix(staticno3,nrow = 3, ncol= 3,byrow = TRUE)


#rotacija
blinker = c(1, 1, 1)
rotacija <- matrix(blinker,nrow = 1, ncol= 3,byrow=TRUE)

#dve vrstici po 4
toad = c(1, 1, 1, 0,
        0, 1, 1, 1)
krastaca <- matrix(toad,nrow = 2, ncol= 4,byrow=TRUE)
#drsalec
#tri vrstice po tri
glider = c(1, 0, 0,
          0, 1, 1,
          1, 1, 0)
drsalec <- matrix(glider,nrow = 3, ncol= 3,byrow=TRUE)


#neprestana rast
#5 vrstic po 5
unbounded = c(1, 1, 1, 0, 1,
             1, 0, 0, 0, 0,
             0, 0, 0, 1, 1,
             0, 1, 1, 0, 1,
             1, 0, 1, 0, 1)
neomejeno <- matrix(unbounded,nrow = 5, ncol= 5,byrow=TRUE)

#glider gun
#36 stolpcev, 9 vrstic
glider_gun <- c(0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,
 1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 1,1,0,0,0,0,0,0,0,0,1,0,0,0,1,0,1,1,0,0,0,0,1,0,1,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
 0,0,0,0,0,0,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0)

pistola <- matrix(glider_gun,nrow = 9, ncol= 36,byrow=TRUE)
#dodatni primeri

# 3 vrstice 8 stolpcev
diehard = c(0, 0, 0, 0, 0, 0, 1, 0,
           1, 1, 0, 0, 0, 0, 0, 0,
           0, 1, 0, 0, 0, 1, 1, 1)
bruce_willis <- matrix(diehard,nrow = 3, ncol= 8,byrow=TRUE)
#3x3
boat = c(1, 1, 0,
        1, 0, 1,
        0, 1, 0)
ladja <- matrix(boat,nrow = 3, ncol= 3,byrow=TRUE)

#3x3
r_pentomino = c(0, 1, 1,
               1, 1, 0,
               0, 1, 0)
pent <- matrix(r_pentomimo,nrow = 3, ncol= 3,byrow=TRUE)
#4x4
beacon = c(0, 0, 1, 1,
          0, 0, 1, 1,
          1, 1, 0, 0,
          1, 1, 0, 0)
svetilka <- matrix(beacon,nrow = 4, ncol= 4,byrow=TRUE)
#3 vrstice 7 stolpcev
acorn = c(0, 1, 0, 0, 0, 0, 0,
         0, 0, 0, 1, 0, 0, 0,
         1, 1, 0, 0, 1, 1, 1)
zelod <- matrix(acorn,nrow = 3, ncol= 7,byrow=TRUE)
#5 stolpcev, 4 vrsticer
spaceship = c(0, 0, 1, 1, 0,
             1, 1, 0, 1, 1,
             1, 1, 1, 1, 0,
             0, 1, 1, 0, 0)
vesolje <- matrix(spaceship,nrow = 4, ncol= 5,byrow=TRUE)
#6 vrstic, 8 stoplcev
block_switch_engine = c(0, 0, 0, 0, 0, 0, 1, 0,
                       0, 0, 0, 0, 1, 0, 1, 1,
                       0, 0, 0, 0, 1, 0, 1, 0,
                       0, 0, 0, 0, 1, 0, 0, 0,
                       0, 0, 1, 0, 0, 0, 0, 0,
                       1, 0, 1, 0, 0, 0, 0, 0)
motor <- matrix(block_switch_engine,nrow = 6, ncol= 8,byrow=TRUE)