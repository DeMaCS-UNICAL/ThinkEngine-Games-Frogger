%Versione Accorpata
%FattiNoti
firstStep(0).
secondStep(1).
xCoord(0..19).
maxXCoord(19).
maxZCoord(12).
zCoord(0..12).
moveTo(still).
moveTo(up).
moveTo(left).
moveTo(right).
moveTo(down).

setOnActuator(playerAct(player(player(answerA(X))))):-Answer(X).
%setOnActuator(playerAct(player(player(answerB(X))))):-Answer(_,X).

%Reorganized Data From Sensors
trunkRaw(X,Z,Dim):- trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posX(X)))))),trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posZ(Z)))))),trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(dim(Dim)))))).
trunkRaw(X,Z,Dim):- trunkLine1(trunkSpawnerLine2(trunkSpawner(spawnedComponents(T,trunk(posX(X)))))),trunkLine2(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posZ(Z)))))),trunkLine2(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(dim(Dim)))))).
trunkRaw(X,Z,Dim):- trunkLine1(trunkSpawnerLine3(trunkSpawner(spawnedComponents(T,trunk(posX(X)))))),trunkLine3(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posZ(Z)))))),trunkLine3(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(dim(Dim)))))).
trunk(X,Z):-trunkRaw(X,Z,1).
trunk(X,Z):-trunkRaw(X,Z,3).
trunk(X,Z):-trunkRaw(X1,Z,3),X=X1+1.
trunk(X,Z):-trunkRaw(X1,Z,3),X=X1-1.
trunk(X,Z):-trunkRaw(X,Z,5).
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1+1.
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1-1.
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1+2.
trunk(X,Z):-trunkRaw(X1,Z,5),X=X1-2.

turtle(X,Z):- turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posX(X)))))), turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posZ(Z)))))).
turtle(X,Z):- turtleLine2(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posX(X)))))), turtleLine2(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posZ(Z)))))).

car(X,Z,Dir):- lineCars1(lineCars1(scrollLine(carComponents(T,car(posX(X)))))),lineCars1(lineCars1(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars1(lineCars1(scrollLine(dir(value(Dir))))),xCoord(X).
car(X,Z,Dir):- lineCars2(lineCars2(scrollLine(carComponents(T,car(posX(X)))))),lineCars2(lineCars2(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars2(lineCars2(scrollLine(dir(value(Dir))))),xCoord(X).
car(X,Z,Dir):- lineCars3(lineCars3(scrollLine(carComponents(T,car(posX(X)))))),lineCars3(lineCars3(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars3(lineCars3(scrollLine(dir(value(Dir))))),xCoord(X).
car(X,Z,Dir):- lineCars4(lineCars4(scrollLine(carComponents(T,car(posX(X)))))),lineCars4(lineCars4(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars4(lineCars4(scrollLine(dir(value(Dir))))),xCoord(X).
car(X,Z,Dir):- lineSuperCar(lineSuperCar(scrollLine(carComponents(T,car(posX(X)))))),lineSuperCar(lineSuperCar(scrollLine(carComponents(T,car(posZ(Z)))))),lineSuperCar(lineSuperCar(scrollLine(dir(value(Dir))))),xCoord(X).

goal(X,Z,Avaible):- goal1(goal1(goal(posX(X)))),goal1(goal1(goal(posZ(Z)))),goal1(goal1(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal2(goal2(goal(posX(X)))),goal2(goal2(goal(posZ(Z)))),goal2(goal2(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal3(goal3(goal(posX(X)))),goal3(goal3(goal(posZ(Z)))),goal3(goal3(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal4(goal4(goal(posX(X)))),goal4(goal4(goal(posZ(Z)))),goal4(goal4(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal5(goal5(goal(posX(X)))),goal5(goal5(goal(posZ(Z)))),goal5(goal5(goal(empty(Avaible)))).

%Posizioni sicure perchè erba o tronco, tartaruga, goal
safe(X,Z):- xCoord(X), Z=0.
safe(X,Z):- xCoord(X), Z=6.
safe(X,Z):- trunk(X,Z), xCoord(X),zCoord(Z).
safe(X,Z):- turtle(X,Z), xCoord(X),zCoord(Z).
safe(X,Z):- goal(X,Z,true).
unsafe(X,Z):-car(X,Z,_).
safe(X,Z):- not unsafe(X,Z),xCoord(X),zCoord(Z),Z<6. % Tutte le tile che non sono macchine

%Posizione Player
playerPos(X,Z):- playerSensor(player(player(posX(X)))),playerSensor(player(player(posZ(Z)))).

%RapportoMoveToDirezioneAuto
:-moveTo(right), playerPos(X,Z), car(X1,Z,1), X1=X+1.
:-moveTo(left), playerPos(X,Z), car(X1,Z,-1), X1=X-1.

nextPlayerPos(X,Z,still):-playerPos(X,Z).
nextPlayerPos(X,Z1,up):-playerPos(X,Z), Z1=Z+1.
nextPlayerPos(X,Z1,down):-playerPos(X,Z),Z1=Z-1.
nextPlayerPos(X1,Z,left):-playerPos(X,Z), X1=X-1.
nextPlayerPos(X1,Z,right):-playerPos(X,Z), X1=X+1.

:-Answer(M), nextPlayerPos(X,Z,M),not safe(X,Z).
:- #count {M: Answer (M)} > 1.
:- #count {M: Answer (M)} = 0.

Answer(M) | NotAnswer(M) :-nextPlayerPos(_,_,M).



