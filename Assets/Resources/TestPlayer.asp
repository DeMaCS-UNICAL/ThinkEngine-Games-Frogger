%Versione Accorpata
%FattiNoti
firstStep(0).
secondStep(1).
xCoord(0..19).
maxXCoord(19).
maxZCoord(12).
zCoord(0..12).

setOnActuator(playerAct(player,objectIndex(X),player(answerA(V)))):- objectIndex(playerAct,X), DoubleAnswer(V,_).

trunkRaw(X,Z,Dim):- trunkLine1(trunkSpawnerLine1,T,trunkSpawner(spawnedComponents(T1,trunk(posX(X))))),trunkLine1(trunkSpawnerLine1,T,trunkSpawner(spawnedComponents(T1,trunk(posZ(Z))))),trunkLine1(trunkSpawnerLine1,T,trunkSpawner(spawnedComponents(T1,trunk(dim(Dim))))).
trunkRaw(X,Z,Dim):- trunkLine2(trunkSpawnerLine2,T,trunkSpawner(spawnedComponents(T1,trunk(posX(X))))),trunkLine2(trunkSpawnerLine2,T,trunkSpawner(spawnedComponents(T1,trunk(posZ(Z))))),trunkLine2(trunkSpawnerLine2,T,trunkSpawner(spawnedComponents(T1,trunk(dim(Dim))))).
trunkRaw(X,Z,Dim):- trunkLine3(trunkSpawnerLine3,T,trunkSpawner(spawnedComponents(T1,trunk(posX(X))))),trunkLine3(trunkSpawnerLine3,T,trunkSpawner(spawnedComponents(T1,trunk(posZ(Z))))),trunkLine3(trunkSpawnerLine3,T,trunkSpawner(spawnedComponents(T1,trunk(dim(Dim))))).

trunk(X,Z):- trunkRaw(X,Z,1).
trunk(X,Z):- trunkRaw(X,Z,3).
trunk(X,Z):- trunkRaw(X1,Z,3),X=X1+1.
trunk(X,Z):- trunkRaw(X1,Z,3),X=X1-1.
trunk(X,Z):- trunkRaw(X,Z,5).
trunk(X,Z):- trunkRaw(X1,Z,5),X=X1+1.
trunk(X,Z):- trunkRaw(X1,Z,5),X=X1-1.
trunk(X,Z):- trunkRaw(X1,Z,5),X=X1+2.
trunk(X,Z):- trunkRaw(X1,Z,5),X=X1-2.

turtle(X,Z):- turtleLine1(tSpawnerLine1,T,turtleSpawner(spawnedComponents(T1,turtle(posX(X))))), turtleLine1(tSpawnerLine1,T,turtleSpawner(spawnedComponents(T1,turtle(posZ(Z))))).
turtle(X,Z):- turtleLine2(tSpawnerLine2,T,turtleSpawner(spawnedComponents(T1,turtle(posX(X))))), turtleLine2(tSpawnerLine2,T,turtleSpawner(spawnedComponents(T1,turtle(posZ(Z))))).

car(X,Z,Dir):- lineCars1(lineCars1,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars1(lineCars1,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars1(lineCars1,T1,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars2(lineCars2,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars2(lineCars2,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars2(lineCars2,T1,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars3(lineCars3,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars3(lineCars3,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars3(lineCars3,T1,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars4(lineCars4,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars4(lineCars4,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars4(lineCars4,T1,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineSuperCar(lineSuperCar,T1,scrollLine(carComponents(T,car(posX(X))))),lineSuperCar(lineSuperCar,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineSuperCar(lineSuperCar,T1,scrollLine(dir(value(Dir)))),xCoord(X).

%Generazione posizioni Unsafe in base alle macchine
unsafe(X,Z):- car(X,Z,_).
unsafe(X,Z):- car(X1,Z,_), X=X1+1.
unsafe(X,Z):- car(X1,Z,_), X=X1-1.

%GOAL
goalRaw(X,Z,Avaible):- goal1(goal1,T,goal(posX(X))),goal1(goal1,T,goal(posZ(Z))),goal1(goal1,T,goal(empty(Avaible))).
goalRaw(X,Z,Avaible):- goal2(goal2,T,goal(posX(X))),goal2(goal2,T,goal(posZ(Z))),goal2(goal2,T,goal(empty(Avaible))).
goalRaw(X,Z,Avaible):- goal3(goal3,T,goal(posX(X))),goal3(goal3,T,goal(posZ(Z))),goal3(goal3,T,goal(empty(Avaible))).
goalRaw(X,Z,Avaible):- goal4(goal4,T,goal(posX(X))),goal4(goal4,T,goal(posZ(Z))),goal4(goal4,T,goal(empty(Avaible))).
goalRaw(X,Z,Avaible):- goal5(goal5,T,goal(posX(X))),goal5(goal5,T,goal(posZ(Z))),goal5(goal5,T,goal(empty(Avaible))).

goal(X,Z,Avaible):- goalRaw(X,Z,Avaible).
goal(X,Z,Avaible):- goalRaw(X1,Z,Avaible),X=X1+1.

%Posizione Player
playerPos(X,Z):- playerSensor(player,_,player(posX(X))),playerSensor(player,_,player(posZ(Z))).

%Generazione posizioni safe
safe(X,Z):- xCoord(X), Z=0.
safe(X,Z):- xCoord(X), Z=6.
safe(X,Z):- trunk(X,Z),xCoord(X).
safe(X,Z):- turtle(X,Z),xCoord(X).
safe(X,Z):- goal(X,Z,true),xCoord(X),Z=12.
safe(X,Z):- not unsafe(X,Z),xCoord(X),zCoord(Z),Z<6.

%Generazione Mosse
nextPlayerPos(X,Z,still):-playerPos(X,Z).
nextPlayerPos(X,Z1,up):-playerPos(X,Z), Z1=Z+1.
nextPlayerPos(X,Z1,down):-playerPos(X,Z),Z1=Z-1.
nextPlayerPos(X1,Z,left):-playerPos(X,Z), X1=X-1.
nextPlayerPos(X1,Z,right):-playerPos(X,Z), X1=X+1.

%StrongConstraight
:-Answer(M),nextPlayerPos(X,Z,M),not safe(X,Z). %Non esiste risposta che porti ad una posizione non safe
:-Answer(left), playerPos(X,Z), car(X1,Z,1), X1<X. %Non esiste mossa LEFT se mi trovo sulla stella riga della macchina e questa si sta muovendo a destra
:-Answer(right), playerPos(X,Z), car(X1,Z,-1), X1>X. %Non esiste mossa RIGHT se mi trovo sulla stella riga della macchina e questa si sta muovendo a destra

%WeakConstraight
%PRIORITA MASSIMA [N@4]
:~ Answer(M), nextPlayerPos(X,Z,M), playerPos(X1,Z1), Z=Z1, X=X1. [1@4] % Non preferire mosse che non cambino la posizione del Player (stillAvoid)
%VERSIONE COMPATTA DA CHIEDERE :~ Answer(still). [1@4]

%PRIORITA ALTA [N@3]
:~ Answer(M), nextPlayerPos(X,Z,M), playerPos(_,Z1), Z<Z1. [1@3] %Non preferire mosse che fanno retrocedere il player di posizione (downAvoid)
%VERSIONE COMPATTA DA CHIEDERE :~ Answer(down). [1@3]

%PRIORITA MEDIA [N@2]
:~ Answer(right),nextPlayerPos(X,Z,right),car(X1,Z1,1),Z1=Z+1. [1@2] %Non preferire la mossa destra se ti trovi sulla riga prima di quella delle macchine che si muovono da sinistra verso destra
:~ Answer(left),nextPlayerPos(X,Z,left),car(X1,Z1,-1),Z1=Z+1. [1@2]  %Non preferire la mossa sinistra se ti trovi sulla riga prima di quella delle macchine che si muovono da destra verso sinistra

%PRIORITA BASSA [N@1] - Dubbio destra o sinistra
:~ Answer(left). [1@1]

%GUESS
{Answer(M):nextPlayerPos(X,Z,M)}=1.

objectIndex(playerAct,10).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(7,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(6,turtle(posZ(10))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(3,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(2,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(6,car(posX(1))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(5,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(4,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(3,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(2,turtle(posZ(10))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(1,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(0,car(posZ(1))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(5,turtle(posX(7))))).
goal1(goal1,objectIndex(5),goal(posX(2))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(13,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(12,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(11,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(10,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(9,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(8,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(1,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(0,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(13,turtle(posX(18))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(12,turtle(posX(19))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(11,turtle(posX(15))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(10,turtle(posX(16))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(9,turtle(posX(12))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(8,turtle(posX(13))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(7,turtle(posX(9))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(6,turtle(posX(10))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(5,turtle(posX(6))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(4,turtle(posX(7))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(3,turtle(posX(3))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(2,turtle(posX(4))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(1,turtle(posX(0))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(3,car(posX(7))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(2,car(posX(-1))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(1,car(posX(23))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(0,car(posX(15))))).
trunkLine3(trunkSpawnerLine3,objectIndex(16),trunkSpawner(spawnedComponents(1,trunk(dim(5))))).
trunkLine3(trunkSpawnerLine3,objectIndex(16),trunkSpawner(spawnedComponents(0,trunk(dim(5))))).
trunkLine3(trunkSpawnerLine3,objectIndex(16),trunkSpawner(spawnedComponents(1,trunk(posZ(11))))).
trunkLine3(trunkSpawnerLine3,objectIndex(16),trunkSpawner(spawnedComponents(0,trunk(posZ(11))))).
trunkLine3(trunkSpawnerLine3,objectIndex(16),trunkSpawner(spawnedComponents(1,trunk(posX(5))))).
trunkLine3(trunkSpawnerLine3,objectIndex(16),trunkSpawner(spawnedComponents(0,trunk(posX(15))))).
playerSensor(player,objectIndex(10),player(posZ(2))).
playerSensor(player,objectIndex(10),player(posX(11))).
lineCars4(lineCars4,objectIndex(8),scrollLine(dir(value(1)))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(6,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(5,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(5,car(posX(9))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(4,car(posX(7))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(3,car(posX(17))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(2,car(posX(33))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(1,car(posX(25))))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(0,car(posX(23))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(dir(value(-1)))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(7,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(6,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(5,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(4,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(3,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(2,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(1,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(0,car(posZ(4))))).
goal3(goal3,objectIndex(3),goal(empty(true))).
goal3(goal3,objectIndex(3),goal(posZ(12))).
goal3(goal3,objectIndex(3),goal(posX(10))).
goal5(goal5,objectIndex(1),goal(empty(true))).
goal5(goal5,objectIndex(1),goal(posZ(12))).
goal5(goal5,objectIndex(1),goal(posX(18))).
goal4(goal4,objectIndex(2),goal(empty(true))).
goal4(goal4,objectIndex(2),goal(posX(14))).
goal4(goal4,objectIndex(2),goal(posZ(12))).
goal2(goal2,objectIndex(4),goal(empty(true))).
goal2(goal2,objectIndex(4),goal(posX(6))).
goal2(goal2,objectIndex(4),goal(posZ(12))).
goal1(goal1,objectIndex(5),goal(empty(true))).
goal1(goal1,objectIndex(5),goal(posZ(12))).
lineCars4(lineCars4,objectIndex(8),scrollLine(carComponents(4,car(posZ(1))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(7,car(posX(11))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(6,car(posX(13))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(5,car(posX(23))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(4,car(posX(25))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(3,car(posX(-13))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(2,car(posX(-11))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(1,car(posX(-1))))).
lineCars1(lineCars1,objectIndex(9),scrollLine(carComponents(0,car(posX(1))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(11,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(10,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(9,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(8,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(7,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(6,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(5,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(4,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(3,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(2,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(1,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(0,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(11,turtle(posX(17))))).
turtleLine2(tSpawnerLine2,objectIndex(13),turtleSpawner(spawnedComponents(0,turtle(posX(1))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(dir(value(1)))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(3,car(posZ(2))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(2,car(posZ(2))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(1,car(posZ(2))))).
lineCars3(lineCars3,objectIndex(11),scrollLine(carComponents(0,car(posZ(2))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(4,turtle(posX(8))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(3,turtle(posX(9))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(2,turtle(posX(2))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(1,turtle(posX(3))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(0,turtle(posX(4))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(2,trunk(dim(3))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(1,trunk(dim(3))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(0,trunk(dim(3))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(2,trunk(posZ(9))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(1,trunk(posZ(9))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(0,trunk(posZ(9))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(2,trunk(posX(7))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(1,trunk(posX(14))))).
trunkLine2(trunkSpawnerLine2,objectIndex(15),trunkSpawner(spawnedComponents(0,trunk(posX(21))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(dir(value(-1)))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(10,turtle(posX(18))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(9,turtle(posX(19))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(8,turtle(posX(12))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(7,turtle(posX(13))))).
turtleLine1(tSpawnerLine1,objectIndex(12),turtleSpawner(spawnedComponents(6,turtle(posX(14))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(6,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(5,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(4,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(3,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(2,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(1,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(0,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(6,car(posX(21))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(5,car(posX(27))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(4,car(posX(33))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(3,car(posX(-3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(2,car(posX(3))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(1,car(posX(9))))).
lineCars2(lineCars2,objectIndex(7),scrollLine(carComponents(0,car(posX(15))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(4,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(3,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(2,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(1,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(0,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(4,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(3,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(2,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(1,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(0,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(4,trunk(posX(3))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(3,trunk(posX(7))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(2,trunk(posX(11))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(1,trunk(posX(15))))).
trunkLine1(trunkSpawnerLine1,objectIndex(14),trunkSpawner(spawnedComponents(0,trunk(posX(19))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(dir(value(1)))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(5,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(4,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(3,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(2,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(1,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(0,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(5,car(posX(-17))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(4,car(posX(-1))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(3,car(posX(-9))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(2,car(posX(7))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(1,car(posX(23))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(0,car(posX(15))))).


