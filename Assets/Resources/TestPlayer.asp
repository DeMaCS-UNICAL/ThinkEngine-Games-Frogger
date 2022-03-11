%FattiNoti
firstStep(0).
secondStep(1).
xCoord(0..19).
maxXCoord(19).
maxZCoord(12).
zCoord(0..12).

setOnActuator(playerAct(player,objectIndex(X),player(answerA(V)))):- objectIndex(playerAct,X), DoubleAnswer(V,_).
setOnActuator(playerAct(player,objectIndex(X),player(answerB(V)))):- objectIndex(playerAct,X), DoubleAnswer(_,V).

trunkRaw(X,Z,Dim):- trunkLine1(trunkSpawnerLine1,_,trunkSpawner(spawnedComponents(T,trunk(posX(X))))),trunkLine1(trunkSpawnerLine1,_,trunkSpawner(spawnedComponents(T,trunk(posZ(Z))))),trunkLine1(trunkSpawnerLine1,_,trunkSpawner(spawnedComponents(T,trunk(dim(Dim))))).
trunkRaw(X,Z,Dim):- trunkLine2(trunkSpawnerLine2,_,trunkSpawner(spawnedComponents(T,trunk(posX(X))))),trunkLine2(trunkSpawnerLine2,_,trunkSpawner(spawnedComponents(T,trunk(posZ(Z))))),trunkLine2(trunkSpawnerLine2,_,trunkSpawner(spawnedComponents(T,trunk(dim(Dim))))).
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

turtle(X,Z):- turtleLine1(tSpawnerLine1,_,turtleSpawner(spawnedComponents(T,turtle(posX(X))))), turtleLine1(tSpawnerLine1,_,turtleSpawner(spawnedComponents(T,turtle(posZ(Z))))).
turtle(X,Z):- turtleLine2(tSpawnerLine2,_,turtleSpawner(spawnedComponents(T,turtle(posX(X))))), turtleLine2(tSpawnerLine2,_,turtleSpawner(spawnedComponents(T,turtle(posZ(Z))))).

%SEGUENDO TEMPLATE
%car(X,Z,Dir):- lineCars1(lineCars1,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars1(lineCars1,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars1(lineCars1,T1,scrollLine(dir(value(Dir)))),xCoord(X).
%car(X,Z,Dir):- lineCars2(lineCars2,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars2(lineCars2,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars2(lineCars2,T1,scrollLine(dir(value(Dir)))),xCoord(X).
%car(X,Z,Dir):- lineCars3(lineCars3,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars3(lineCars3,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars3(lineCars3,T1,scrollLine(dir(value(Dir)))),xCoord(X).
%car(X,Z,Dir):- lineCars4(lineCars4,T1,scrollLine(carComponents(T,car(posX(X))))),lineCars4(lineCars4,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineCars4(lineCars4,T1,scrollLine(dir(value(Dir)))),xCoord(X).
%car(X,Z,Dir):- lineSuperCar( lineSuperCar,T1,scrollLine(carComponents(T,car(posX(X))))),lineSuperCar(lineSuperCar,T1,scrollLine(carComponents(T,car(posZ(Z))))),lineSuperCar(lineSuperCar,T1,scrollLine(dir(value(Dir)))),xCoord(X).

%SEGUENDO SENSORI
car(X,Z,Dir):- lineCars1(lineCars1,T,scrollLine(carComponents(T1,carComponents(T1,posX(X))))),lineCars1(lineCars1,T,scrollLine(carComponents(T1,carComponents(T1,posZ(Z))))),lineCars1(lineCars1,T,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars2(lineCars2,T,scrollLine(carComponents(T1,carComponents(T1,posX(X))))),lineCars2(lineCars2,T,scrollLine(carComponents(T1,carComponents(T1,posZ(Z))))),lineCars2(lineCars2,T,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars3(lineCars3,T,scrollLine(carComponents(T1,carComponents(T1,posX(X))))),lineCars3(lineCars3,T,scrollLine(carComponents(T1,carComponents(T1,posZ(Z))))),lineCars3(lineCars1,T,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars1(lineCars1,T,scrollLine(carComponents(T1,carComponents(T1,posX(X))))),lineCars1(lineCars1,T,scrollLine(carComponents(T1,carComponents(T1,posZ(Z))))),lineCars1(lineCars1,T,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars1(lineCars1,T,scrollLine(carComponents(T1,carComponents(T1,posX(X))))),lineCars1(lineCars1,T,scrollLine(carComponents(T1,carComponents(T1,posZ(Z))))),lineCars1(lineCars1,T,scrollLine(dir(value(Dir)))),xCoord(X).


goal(X,Z,Avaible):- goal1(goal1,_,goal(posX(X))),goal1(goal1,_,goal(posZ(Z))),goal1(goal1,_,goal(empty(Avaible))).
goal(X,Z,Avaible):- goal2(goal2,_,goal(posX(X))),goal2(goal2,_,goal(posZ(Z))),goal2(goal2,_,goal(empty(Avaible))).
goal(X,Z,Avaible):- goal3(goal3,_,goal(posX(X))),goal3(goal3,_,goal(posZ(Z))),goal3(goal3,_,goal(empty(Avaible))).
goal(X,Z,Avaible):- goal4(goal4,_,goal(posX(X))),goal4(goal4,_,goal(posZ(Z))),goal4(goal4,_,goal(empty(Avaible))).
goal(X,Z,Avaible):- goal5(goal5,_,goal(posX(X))),goal5(goal5,_,goal(posZ(Z))),goal5(goal5,_,goal(empty(Avaible))).

%Posizioni sicure perchè erba o tronco, tartaruga, goal
safe(X,Z,0):- xCoord(X), Z=0.
safe(X,Z,0):- xCoord(X), Z=6.
safe(X,Z,0):- trunk(X,Z).
safe(X,Z,0):- turtle(X,Z).
safe(X,Z,0):- goal(X,Z,true).
carPos(X,Z):-car(X,Z,_).
safe(X,Z,0):- not carPos(X,Z),xCoord(X),zCoord(Z),Z<6.
safe(X,Z,0):- xCoord(X),zCoord(Z),not nextCar(X,Z,1),Z<6.

nextCar(X,Z,1):- car(X1,Z,1),X=X1+1.
nextCar(X,Z,1):- car(X1,Z,-1),X=X1-1.
nextTrunk(X,Z,1):- trunk(X1,Z),X=X1-1.
nextTurtle(X,Z,1):- turtle(X1,Z),X=X1+1.
safe(X,Z,1):- nextTurtle(X,Z,1).
safe(X,Z,1):- nextTrunk(X,Z,1).
safe(X,Z,1):- xCoord(X),zCoord(Z),not nextCar(X,Z,1),Z<6.
safe(X,Z,1):- xCoord(X), Z=0.
safe(X,Z,1):- xCoord(X), Z=6.
safe(X,Z,1):- goal(X,Z,true).

%Posizione Player
playerPos(X,Z):- playerSensor(player,_,player(posX(X))),playerSensor(player,_,player(posZ(Z))).

%RapportoMoveToDirezioneAuto
:-nextPlayerPos(_,_,right,0), playerPos(X,Z), car(X1,Z,1), X1=X+1.
:-nextPlayerPos(_,_,left,0), playerPos(X,Z), car(X1,Z,-1), X1=X-1.
:-nextPlayerPos(_,_,right,1), nextPlayerPos(X,Z,_,0), nextCar(X1,Z,1), X1=X+1.
:-nextPlayerPos(_,_,left,1), nextPlayerPos(X,Z,_,0), nextCar(X1,Z,1), X1=X-1.

%PRIMO STEP
nextPlayerPos(X,Z,still,0):-playerPos(X,Z).
nextPlayerPos(X,Z1,up,0):-playerPos(X,Z), Z1=Z+1.
nextPlayerPos(X,Z1,down,0):-playerPos(X,Z),Z1=Z-1.
nextPlayerPos(X1,Z,left,0):-playerPos(X,Z), X1=X-1.
nextPlayerPos(X1,Z,right,0):-playerPos(X,Z), X1=X+1.

%SECONDO STEP
nextPlayerPos(X,Z,still,1):-nextPlayerPos(X,Z,M,0).
nextPlayerPos(X,Z1,up,1):-nextPlayerPos(X,Z,M,0), Z1=Z+1.
nextPlayerPos(X,Z1,down,1):-nextPlayerPos(X,Z,M,0),Z1=Z-1.
nextPlayerPos(X1,Z,left,1):-nextPlayerPos(X,Z,M,0), X1=X-1.
nextPlayerPos(X1,Z,right,1):-nextPlayerPos(X,Z,M,0), X1=X+1.

%:-DoubleAnswer(M,_), nextPlayerPos(X,Z,M,0), not safe(X,Z,0).  %NON ESISTE ANSWER M NON SAFE	
%:-DoubleAnswer(_,M),nextPlayerPos(X,Z,M,1),not safe(X,Z,1).	 %NON ESISTE ANSWER M NON SAFE
%:-DoubleAnswer(M1,M), nextPlayerPos(X1,Z1,M1,0),nextPlayerPos(X,Z,M,1),not safe(X1,Z1,0),not safe(X,Z,1).	 %NON ESISTE ANSWER M NON SAFE

%PRIORITA MASSIMA [N@4]
:~ DoubleAnswer(M,_), nextPlayerPos(X,Z,M,0), playerPos(X1,Z1), Z=Z1, X=X1. [1@4] %EVITA STILL
:~ DoubleAnswer(M1,M), nextPlayerPos(X,Z,M,1), nextPlayerPos(X1,Z1,M1,0), Z=Z1, X=X1. [1@4]

%PRIORITA MEDIA [N@3]
:~ DoubleAnswer(M,_), nextPlayerPos(X,Z,M,0), playerPos(X1,Z1), Z<Z1, X=X1. [1@3] %CERCA DI AVANZARE
:~ DoubleAnswer(M1,M), nextPlayerPos(X,Z,M,1), nextPlayerPos(X1,Z1,M1,0), Z<Z1, X=X1. [1@3] %CERCA DI AVANZARE

%PRIORITA BASSA [N@2] NON SEGUIRE LA DIREZIONE DELLA MACCHINA DAVANTI A TE
:~ DoubleAnswer(right,_),nextPlayerPos(X,Z,right,0),car(X1,Z1,1),Z1=Z+1,X=X1. [1@2]
:~ DoubleAnswer(left,_),nextPlayerPos(X,Z,left,0),car(X1,Z1,-1),Z1=Z+1,X=X1. [1@2]

%PRIORITA MINIMA [N@1] PREFERISCI MOSSE UGUALI TRA LORO
:~ DoubleAnswer(M1,M2),M1!=M2. [1@1]

%DUE MOSSE
{DoubleAnswer(M1,M2):nextPlayerPos(X,Z,M1,0),nextPlayerPos(X,Z,M2,1)}=1.


objectIndex(playerAct,5).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(5,carComponents(5,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(4,carComponents(4,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(4,carComponents(4,posX(37))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(7,carComponents(7,posX(23))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(6,carComponents(6,posX(25))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(5,carComponents(5,posX(35))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(dir(value(-1)))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(7,carComponents(7,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(6,carComponents(6,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(3,carComponents(3,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(2,carComponents(2,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(1,carComponents(1,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(0,carComponents(0,posZ(4))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(3,carComponents(3,posX(-1))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(2,carComponents(2,posX(1))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(1,carComponents(1,posX(11))))).
lineCars1(lineCars1,objectIndex(4),scrollLine(carComponents(0,carComponents(0,posX(13))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(0,carComponents(0,posX(17))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(dir(value(1)))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(6,carComponents(6,posZ(1))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(5,carComponents(5,posZ(1))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(dir(value(1)))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(5,carComponents(5,posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(4,carComponents(4,posZ(5))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(5,carComponents(5,posX(-3))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(4,carComponents(4,posX(-5))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(3,carComponents(3,posX(5))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(2,carComponents(2,posX(21))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(1,carComponents(1,posX(13))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(0,carComponents(0,posX(11))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(dir(value(1)))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(4,carComponents(4,posZ(1))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(3,carComponents(3,posZ(1))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(2,carComponents(2,posZ(1))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(1,carComponents(1,posZ(1))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(0,carComponents(0,posZ(1))))).
lineCars4(lineCars4,objectIndex(3),scrollLine(carComponents(6,carComponents(6,posX(-11))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(1,carComponents(1,posX(25))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(0,carComponents(0,posX(17))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(dir(value(-1)))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(6,carComponents(6,posZ(3))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(5,carComponents(5,posZ(3))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(4,carComponents(4,posZ(3))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(3,carComponents(3,posZ(3))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(0,carComponents(0,posZ(3))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(6,carComponents(6,posX(19))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(5,carComponents(5,posX(25))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(4,carComponents(4,posX(31))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(3,carComponents(3,posX(-5))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(2,carComponents(2,posX(1))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(1,carComponents(1,posX(7))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(0,carComponents(0,posX(13))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(3,carComponents(3,posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(2,carComponents(2,posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(1,carComponents(1,posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(0,carComponents(0,posZ(5))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(5,carComponents(5,posX(-15))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(4,carComponents(4,posX(1))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(3,carComponents(3,posX(-7))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(2,carComponents(2,posX(9))))).
lineSuperCar(lineSuperCar,objectIndex(1),scrollLine(carComponents(1,carComponents(1,posX(25))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(2,carComponents(2,posZ(3))))).
lineCars2(lineCars2,objectIndex(2),scrollLine(carComponents(1,carComponents(1,posZ(3))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(2,spawnedComponents(2,posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(1,spawnedComponents(1,posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(0,spawnedComponents(0,posZ(10))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(3,carComponents(3,posZ(2))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(2,carComponents(2,posZ(2))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(1,carComponents(1,posZ(2))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(0,carComponents(0,posZ(2))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(3,carComponents(3,posX(9))))).
lineCars3(lineCars3,objectIndex(6),scrollLine(carComponents(2,carComponents(2,posX(1))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(5,spawnedComponents(5,posX(19))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(4,spawnedComponents(4,posX(20))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(3,spawnedComponents(3,posX(16))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(2,spawnedComponents(2,posX(17))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(1,spawnedComponents(1,posX(13))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(0,spawnedComponents(0,posX(14))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(5,spawnedComponents(5,dim(0))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(4,spawnedComponents(4,dim(0))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(3,spawnedComponents(3,dim(0))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(2,spawnedComponents(2,dim(0))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(1,spawnedComponents(1,dim(0))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(0,spawnedComponents(0,dim(0))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(5,spawnedComponents(5,posZ(7))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(5,spawnedComponents(5,dim(0))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(4,spawnedComponents(4,dim(0))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(3,spawnedComponents(3,dim(0))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(2,spawnedComponents(2,dim(0))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(1,spawnedComponents(1,dim(0))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(0,spawnedComponents(0,dim(0))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(5,spawnedComponents(5,posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(4,spawnedComponents(4,posZ(10))))).
turtleLine2(tSpawnerLine2,objectIndex(8),turtleSpawner(spawnedComponents(3,spawnedComponents(3,posZ(10))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(4,spawnedComponents(4,posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(3,spawnedComponents(3,posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(2,spawnedComponents(2,posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(1,spawnedComponents(1,posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(0,spawnedComponents(0,posZ(7))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(5,spawnedComponents(5,posX(19))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(4,spawnedComponents(4,posX(20))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(3,spawnedComponents(3,posX(21))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(2,spawnedComponents(2,posX(14))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(1,spawnedComponents(1,posX(15))))).
turtleLine1(tSpawnerLine1,objectIndex(7),turtleSpawner(spawnedComponents(0,spawnedComponents(0,posX(16))))).
playerSensor(player,objectIndex(5),player(posZ(6))).
playerSensor(player,objectIndex(5),player(posX(10))).


