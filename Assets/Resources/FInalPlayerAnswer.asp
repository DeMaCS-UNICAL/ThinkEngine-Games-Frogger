%Versione Accorpata
%FattiNoti
firstStep(0).
secondStep(1).
xCoord(0..19).
maxXCoord(19).
maxZCoord(12).
zCoord(0..12).

setOnActuator(playerAct(player(player(answerA(X))))):-Answer(X).
%setOnActuator(playerAct(player(player(answerB(X))))):-Answer(_,X).

%Reorganized Data From Sensors
%trunkLine1(trunkSpawnerLine1,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(posX(V))))).
%trunkLine1(trunkSpawnerLine1,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(posZ(V))))).
%trunkLine1(trunkSpawnerLine1,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(dim(V))))).

trunkRaw(X,Z,Dim):- trunkLine1(trunkSpawnerLine1,_,trunkSpawner(spawnedComponents(T,trunk(posX(X))))),trunkLine1(trunkSpawnerLine1,_,trunkSpawner(spawnedComponents(T,trunk(posZ(Z))))),trunkLine1(trunkSpawnerLine1,_,trunkSpawner(spawnedComponents(T,trunk(dim(Dim))))).

%trunkLine2(trunkSpawnerLine2,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(posX(V))))).
%trunkLine2(trunkSpawnerLine2,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(posZ(V))))).
%trunkLine2(trunkSpawnerLine2,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(dim(V))))).

trunkRaw(X,Z,Dim):- trunkLine2(trunkSpawnerLine2,_,trunkSpawner(spawnedComponents(T,trunk(posX(X))))),trunkLine2(trunkSpawnerLine2,_,trunkSpawner(spawnedComponents(T,trunk(posZ(Z))))),trunkLine2(trunkSpawnerLine2,_,trunkSpawner(spawnedComponents(T,trunk(dim(Dim))))).

%trunkLine3(trunkSpawnerLine3,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(posX(V))))).
%trunkLine3(trunkSpawnerLine3,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(posZ(V))))).
%trunkLine3(trunkSpawnerLine3,objectIndex(X),trunkSpawner(spawnedComponents(P,trunk(dim(V))))).

trunkRaw(X,Z,Dim):- trunkLine3(trunkSpawnerLine3,_,trunkSpawner(spawnedComponents(T,trunk(posX(X))))),trunkLine3(trunkSpawnerLine3,_,trunkSpawner(spawnedComponents(T,trunk(posZ(Z))))),trunkLine3(trunkSpawnerLine3,_,trunkSpawner(spawnedComponents(T,trunk(dim(Dim))))).

trunk(X,Z):-trunkRaw(X,Z,1).
trunk(X,Z):-trunkRaw(X,Z,3).
trunk(X,Z):-trunkRaw(X1,Z,3),X=X1+1.
trunk(X,Z):-trunkRaw(X1,Z,3),X=X1-1.
trunk(X,Z):-trunkRaw(X,Z,5).
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1+1.
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1-1.
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1+2.
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1-2.

%turtleLine1(tSpawnerLine1,objectIndex(X),turtleSpawner(spawnedComponents(P,turtle(posX(V))))).
%turtleLine1(tSpawnerLine1,objectIndex(X),turtleSpawner(spawnedComponents(P,turtle(posZ(V))))).

turtle(X,Z):- turtleLine1(tSpawnerLine1,_,turtleSpawner(spawnedComponents(T,turtle(posX(X))))), turtleLine1(tSpawnerLine1,_,turtleSpawner(spawnedComponents(T,turtle(posZ(Z))))).

%turtleLine2(tSpawnerLine2,objectIndex(X),turtleSpawner(spawnedComponents(P,turtle(posX(V))))).
%turtleLine2(tSpawnerLine2,objectIndex(X),turtleSpawner(spawnedComponents(P,turtle(posZ(V))))).

turtle(X,Z):- turtleLine2(tSpawnerLine2,_,turtleSpawner(spawnedComponents(T,turtle(posX(X))))), turtleLine2(tSpawnerLine2,_,turtleSpawner(spawnedComponents(T,turtle(posZ(Z))))).

%lineCars1(lineCars1,objectIndex(X),scrollLine(dir(value(V)))).
%lineCars1(lineCars1,objectIndex(X),scrollLine(carComponents(P,car(posX(V))))).
%lineCars1(lineCars1,objectIndex(X),scrollLine(carComponents(P,car(posZ(V))))).

car(X,Z,Dir):- lineCars1(lineCars1,_,scrollLine(carComponents(T,car(posX(X))))),lineCars1(lineCars1,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars1(lineCars1,_,scrollLine(dir(value(Dir)))),xCoord(X).

%lineCars2(lineCars2,objectIndex(X),scrollLine(dir(value(V)))).
%lineCars2(lineCars2,objectIndex(X),scrollLine(carComponents(P,car(posX(V))))).
%lineCars2(lineCars2,objectIndex(X),scrollLine(carComponents(P,car(posZ(V))))).

car(X,Z,Dir):- lineCars2(lineCars2,_,scrollLine(carComponents(T,car(posX(X))))),lineCars2(lineCars2,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars2(lineCars2,_,scrollLine(dir(value(Dir)))),xCoord(X).

%lineCars3(lineCars3,objectIndex(X),scrollLine(dir(value(V)))).
%lineCars3(lineCars3,objectIndex(X),scrollLine(carComponents(P,car(posX(V))))).
%lineCars3(lineCars3,objectIndex(X),scrollLine(carComponents(P,car(posZ(V))))).

car(X,Z,Dir):- lineCars3(lineCars3,_,scrollLine(carComponents(T,car(posX(X))))),lineCars3(lineCars3,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars3(lineCars3,_,scrollLine(dir(value(Dir)))),xCoord(X).

%lineCars4(lineCars4,objectIndex(X),scrollLine(dir(value(V)))).
%lineCars4(lineCars4,objectIndex(X),scrollLine(carComponents(P,car(posX(V))))).
%lineCars4(lineCars4,objectIndex(X),scrollLine(carComponents(P,car(posZ(V))))).

car(X,Z,Dir):- lineCars4(lineCars4,_,scrollLine(carComponents(T,car(posX(X))))),lineCars4(lineCars4,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars4(lineCars4,_,scrollLine(dir(value(Dir)))),xCoord(X).

%lineSuperCar(lineSuperCar,objectIndex(X),scrollLine(dir(value(V)))).
%lineSuperCar(lineSuperCar,objectIndex(X),scrollLine(carComponents(P,car(posX(V))))).
%lineSuperCar(lineSuperCar,objectIndex(X),scrollLine(carComponents(P,car(posZ(V))))).

car(X,Z,Dir):- lineSuperCar(lineSuperCar,_,scrollLine(carComponents(T,car(posX(X))))),lineSuperCar(lineSuperCar,_,scrollLine(carComponents(T,car(posZ(Z))))),lineSuperCar(lineSuperCar,_,scrollLine(dir(value(Dir)))),xCoord(X).

%goal1(goal1,objectIndex(X),goal(empty(V))).
%goal1(goal1,objectIndex(X),goal(posX(V))).
%goal1(goal1,objectIndex(X),goal(posZ(V))).

goal(X,Z,Avaible):- goal1(goal1,_,goal(posX(X))),goal1(goal1,_,goal(posZ(Z))),goal1(goal1,_,goal(empty(Avaible))).

%goal2(goal2,objectIndex(X),goal(empty(V))).
%goal2(goal2,objectIndex(X),goal(posX(V))).
%goal2(goal2,objectIndex(X),goal(posZ(V))).

goal(X,Z,Avaible):- goal2(goal2,_,goal(posX(X))),goal2(goal2,_,goal(posZ(Z))),goal2(goal2,_,goal(empty(Avaible))).

%goal3(goal3,objectIndex(X),goal(empty(V))).
%goal3(goal3,objectIndex(X),goal(posX(V))).
%goal3(goal3,objectIndex(X),goal(posZ(V))).

goal(X,Z,Avaible):- goal3(goal3,_,goal(posX(X))),goal3(goal3,_,goal(posZ(Z))),goal3(goal3,_,goal(empty(Avaible))).

%goal4(goal4,objectIndex(X),goal(empty(V))).
%goal4(goal4,objectIndex(X),goal(posX(V))).
%goal4(goal4,objectIndex(X),goal(posZ(V))).

goal(X,Z,Avaible):- goal4(goal4,_,goal(posX(X))),goal4(goal4,_,goal(posZ(Z))),goal4(goal4,_,goal(empty(Avaible))).

%goal5(goal5,objectIndex(X),goal(empty(V))).
%goal5(goal5,objectIndex(X),goal(posX(V))).
%goal5(goal5,objectIndex(X),goal(posZ(V))).

goal(X,Z,Avaible):- goal5(goal5,_,goal(posX(X))),goal5(goal5,_,goal(posZ(Z))),goal5(goal5,_,goal(empty(Avaible))).

%Posizioni sicure perchè erba o tronco, tartaruga, goal
safe(X,Z):- xCoord(X), Z=0.
safe(X,Z):- xCoord(X), Z=6.
safe(X,Z):- trunk(X,Z).
safe(X,Z):- turtle(X,Z).
safe(X,Z):- goal(X,Z,true).
carPos(X,Z):-car(X,Z,_).
safe(X,Z):-not carPos(X,Z),xCoord(X),zCoord(Z),Z<6. % Tutte le tile che non sono macchine

%Posizione Player
playerPos(X,Z):- playerSensor(player,_,player(posX(X))),playerSensor(player,_,player(posZ(Z))).

%RapportoMoveToDirezioneAuto
:-Answer(right), playerPos(X,Z), car(X1,Z,1), X1=X+1.
:-Answer(left), playerPos(X,Z), car(X1,Z,-1), X1=X-1.

nextPlayerPos(X,Z,still):-playerPos(X,Z).
nextPlayerPos(X,Z1,up):-playerPos(X,Z), Z1=Z+1.
nextPlayerPos(X,Z1,down):-playerPos(X,Z),Z1=Z-1.
nextPlayerPos(X1,Z,left):-playerPos(X,Z), X1=X-1.
nextPlayerPos(X1,Z,right):-playerPos(X,Z), X1=X+1.

:-Answer(M), nextPlayerPos(X,Z,M), not safe(X,Z).  %NON ESISTE ANSWER M NON SAFE				

%PRIORITA MASSIMA [N@4]
:~ Answer(M), nextPlayerPos(X,Z,M), playerPos(X1,Z1), Z=Z1, X=X1. [1@4] %EVITA STILL

%PRIORITA MEDIA [N@2]
:~ Answer(M), nextPlayerPos(X,Z,M), playerPos(X1,Z1), Z<Z1, X=X1. [1@3] %CERCA DI AVANZARE

%PRIORITA MEDIA [N@2]
:~ Answer(right),nextPlayerPos(X,Z,right),car(X1,Z1,1),Z1=Z+1,X=X1. [1@2]
:~ Answer(left),nextPlayerPos(X,Z,left),car(X1,Z1,-1),Z1=Z+1,X=X1. [1@2]


%PRIORITA BASSA [N@1] - AVANZARE e se possibile evitare STILL
%PRIORITA SU DESTRA E SINISTRA IN BASE ALLA DIREZIONE DELLA Z SUCCESSIVA

%:~ Answer(right),nextPlayerPos(X,Z,right),trunk(X1,Z1),Z1=Z+1,X=X1. [1@1]
%:~ Answer(left),nextPlayerPos(X,Z,left),turtle(X1,Z1),Z1=Z+1,X=X1. [1@1]

%AGGIUNGERE ALTRA PRIORITA SU DUBBIO DESTRA O SINISTRA


{Answer(M):nextPlayerPos(_,_,M)}=1.



playerSensor(player,objectIndex(13),player(posX(6))).
playerSensor(player,objectIndex(13),player(posZ(6))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(0,trunk(posX(19))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(0,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(0,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(1,trunk(posX(10))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(1,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(1,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(2,trunk(posX(7))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(2,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(2,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(3,trunk(posX(4))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(3,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(3,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posX(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posX(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posX(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posX(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(dim(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posX(1))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(posZ(8))))).
trunkLine1(trunkSpawnerLine1,objectIndex(7),trunkSpawner(spawnedComponents(4,trunk(dim(1))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(0,trunk(posX(19))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(0,trunk(posZ(9))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(0,trunk(dim(3))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(1,trunk(posX(10))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(1,trunk(posZ(9))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(1,trunk(dim(3))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(2,trunk(posX(1))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(2,trunk(posZ(9))))).
trunkLine2(trunkSpawnerLine2,objectIndex(9),trunkSpawner(spawnedComponents(2,trunk(dim(3))))).
trunkLine3(trunkSpawnerLine3,objectIndex(14),trunkSpawner(spawnedComponents(0,trunk(posX(10))))).
trunkLine3(trunkSpawnerLine3,objectIndex(14),trunkSpawner(spawnedComponents(0,trunk(posZ(11))))).
trunkLine3(trunkSpawnerLine3,objectIndex(14),trunkSpawner(spawnedComponents(0,trunk(dim(5))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(0,turtle(posX(1))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(0,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(1,turtle(posX(0))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(1,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(2,turtle(posX(6))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(2,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(3,turtle(posX(5))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(3,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(4,turtle(posX(4))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(4,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(5,turtle(posX(11))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(5,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(6,turtle(posX(10))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(6,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(7,turtle(posX(9))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(7,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(8,turtle(posX(16))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(8,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(9,turtle(posX(15))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(9,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(10,turtle(posX(14))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(10,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(11,turtle(posX(21))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(11,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(12,turtle(posX(20))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(12,turtle(posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(13,turtle(posX(19))))).
turtleLine1(tSpawnerLine1,objectIndex(10),turtleSpawner(spawnedComponents(13,turtle(posZ(7))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(0,turtle(posX(2))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(0,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(1,turtle(posX(1))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(1,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(2,turtle(posX(5))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(2,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(3,turtle(posX(4))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(3,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(4,turtle(posX(8))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(4,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(5,turtle(posX(7))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(5,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(6,turtle(posX(11))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(6,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(7,turtle(posX(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(7,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(8,turtle(posX(14))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(8,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(9,turtle(posX(13))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(9,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(10,turtle(posX(17))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(10,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(11,turtle(posX(16))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(11,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(12,turtle(posX(20))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(12,turtle(posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(13,turtle(posX(19))))).
turtleLine2(tSpawnerLine2,objectIndex(16),turtleSpawner(spawnedComponents(13,turtle(posZ(10))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(dir(value(-1)))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(0,car(posX(9))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(0,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(1,car(posX(7))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(1,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(2,car(posX(-3))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(2,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(3,car(posX(-5))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(3,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(4,car(posX(33))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(4,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(5,car(posX(31))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(5,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(6,car(posX(21))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(6,car(posZ(4))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(7,car(posX(19))))).
lineCars1(lineCars1,objectIndex(12),scrollLine(carComponents(7,car(posZ(4))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(dir(value(-1)))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(0,car(posX(11))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(0,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(1,car(posX(5))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(1,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(2,car(posX(-1))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(2,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(3,car(posX(-7))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(3,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(4,car(posX(29))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(4,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(5,car(posX(23))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(5,car(posZ(3))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(6,car(posX(17))))).
lineCars2(lineCars2,objectIndex(8),scrollLine(carComponents(6,car(posZ(3))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(dir(value(1)))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(0,car(posX(23))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(0,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(1,car(posX(25))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(1,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(2,car(posX(33))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(2,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(3,car(posX(17))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(3,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(4,car(posX(7))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(4,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(5,car(posX(9))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(5,car(posZ(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(6,car(posX(1))))).
lineCars4(lineCars4,objectIndex(11),scrollLine(carComponents(6,car(posZ(1))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(dir(value(1)))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(0,car(posX(11))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(0,car(posZ(2))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(1,car(posX(19))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(1,car(posZ(2))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(2,car(posX(-5))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(2,car(posZ(2))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(3,car(posX(3))))).
lineCars3(lineCars3,objectIndex(15),scrollLine(carComponents(3,car(posZ(2))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(dir(value(1)))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(0,car(posX(19))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(0,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(1,car(posX(27))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(1,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(2,car(posX(11))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(2,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(3,car(posX(-5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(3,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(4,car(posX(3))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(4,car(posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(5,car(posX(-13))))).
lineSuperCar(lineSuperCar,objectIndex(6),scrollLine(carComponents(5,car(posZ(5))))).
goal1(goal1,objectIndex(5),goal(empty(true))).
goal1(goal1,objectIndex(5),goal(posX(2))).
goal1(goal1,objectIndex(5),goal(posZ(12))).
goal2(goal2,objectIndex(4),goal(empty(true))).
goal2(goal2,objectIndex(4),goal(posX(6))).
goal2(goal2,objectIndex(4),goal(posZ(12))).
goal3(goal3,objectIndex(3),goal(empty(true))).
goal3(goal3,objectIndex(3),goal(posX(10))).
goal3(goal3,objectIndex(3),goal(posZ(12))).
goal4(goal4,objectIndex(2),goal(empty(true))).
goal4(goal4,objectIndex(2),goal(posX(14))).
goal4(goal4,objectIndex(2),goal(posZ(12))).
goal5(goal5,objectIndex(1),goal(empty(true))).
goal5(goal5,objectIndex(1),goal(posX(18))).
goal5(goal5,objectIndex(1),goal(posZ(12))).
