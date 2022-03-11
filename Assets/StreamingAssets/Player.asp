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

car(X,Z,Dir):- lineCars1(lineCars1,_,scrollLine(carComponents(T,car(posX(X))))),lineCars1(lineCars1,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars1(lineCars1,_,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars2(lineCars2,_,scrollLine(carComponents(T,car(posX(X))))),lineCars2(lineCars2,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars2(lineCars2,_,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars3(lineCars3,_,scrollLine(carComponents(T,car(posX(X))))),lineCars3(lineCars3,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars3(lineCars3,_,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineCars4(lineCars4,_,scrollLine(carComponents(T,car(posX(X))))),lineCars4(lineCars4,_,scrollLine(carComponents(T,car(posZ(Z))))),lineCars4(lineCars4,_,scrollLine(dir(value(Dir)))),xCoord(X).
car(X,Z,Dir):- lineSuperCar(lineSuperCar,_,scrollLine(carComponents(T,car(posX(X))))),lineSuperCar(lineSuperCar,_,scrollLine(carComponents(T,car(posZ(Z))))),lineSuperCar(lineSuperCar,_,scrollLine(dir(value(Dir)))),xCoord(X).
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
safe(X,Z,0):-not carPos(X,Z),xCoord(X),zCoord(Z),Z<6.
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

:-DoubleAnswer(M,_), nextPlayerPos(X,Z,M,0), not safe(X,Z,0).  %NON ESISTE ANSWER M NON SAFE	
:-DoubleAnswer(_,M),nextPlayerPos(X,Z,M,1),not safe(X,Z,1).	 %NON ESISTE ANSWER M NON SAFE
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

#show setOnActuator/1.

