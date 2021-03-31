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

car(X,Z,Dir):- lineCars1(lineCars1(scrollLine(carComponents(T,car(posX(X)))))),lineCars1(lineCars1(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars1(lineCars1(scrollLine(dir(value(Dir))))).
car(X,Z,Dir):- lineCars2(lineCars2(scrollLine(carComponents(T,car(posX(X)))))),lineCars2(lineCars2(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars2(lineCars2(scrollLine(dir(value(Dir))))).
car(X,Z,Dir):- lineCars3(lineCars3(scrollLine(carComponents(T,car(posX(X)))))),lineCars3(lineCars3(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars3(lineCars3(scrollLine(dir(value(Dir))))).
car(X,Z,Dir):- lineCars4(lineCars4(scrollLine(carComponents(T,car(posX(X)))))),lineCars4(lineCars4(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars4(lineCars4(scrollLine(dir(value(Dir))))).
car(X,Z,Dir):- lineSuperCar(lineSuperCar(scrollLine(carComponents(T,car(posX(X)))))),lineSuperCar(lineSuperCar(scrollLine(carComponents(T,car(posZ(Z)))))),lineSuperCar(lineSuperCar(scrollLine(dir(value(Dir))))).

goal(X,Z,Avaible):- goal1(goal1(goal(posX(X)))),goal1(goal1(goal(posZ(Z)))),goal1(goal1(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal2(goal2(goal(posX(X)))),goal2(goal2(goal(posZ(Z)))),goal2(goal2(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal3(goal3(goal(posX(X)))),goal3(goal3(goal(posZ(Z)))),goal3(goal3(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal4(goal4(goal(posX(X)))),goal4(goal4(goal(posZ(Z)))),goal4(goal4(goal(empty(Avaible)))).
goal(X,Z,Avaible):- goal5(goal5(goal(posX(X)))),goal5(goal5(goal(posZ(Z)))),goal5(goal5(goal(empty(Avaible)))).

%Posizioni non sicure perché occupate da macchine o tronchi
unsafe(T,X,Z):- car(X,Z,_),xCoord(X),zCoord(Z),firstStep(T).
unsafe(T,X,Z):- car(X1,Z,1),xCoord(X),zCoord(Z),X=X1+1,firstStep(T).
unsafe(T,X,Z):- car(X1,Z,-1),xCoord(X),zCoord(Z),X=X1-1,firstStep(T).
unsafe(T,X,Z):-not safe(X,Z),xCoord(X),zCoord(Z),Z>6,firstStep(T). %Tutte le tile che non sono tronchi o tartarughe

%unsafe(T,X,Z):- car(X1,Z,D),xCoord(X),zCoord(Z),X=X1+D,secondStep(T).
unsafe(T,X,Z):- car(X1,Z,1),xCoord(X),zCoord(Z),X=X1+2,secondStep(T).
unsafe(T,X,Z):- car(X1,Z,-1),xCoord(X),zCoord(Z),X=X1-2,secondStep(T).
unsafe(T,X,Z):-not nextSafe(X,Z),xCoord(X),zCoord(Z),Z>6,secondStep(T). %Tutte le tile che non sono tronchi o tartarughe


%Posizioni sicure perchè erba o tronco, tartaruga, goal
safe(T,X,Z):- xCoord(X),firstStep(T), Z=0.
safe(T,X,Z):- xCoord(X),firstStep(T), Z=6.
safe(T,X,Z):- trunk(X,Z),firstStep(T), xCoord(X),zCoord(Z).
safe(T,X,Z):- turtle(X,Z),firstStep(T), xCoord(X),zCoord(Z).
safe(T,X,Z):- goal(X,Z,true),firstStep(T).
safe(T,X,Z):-not unsafe(T,X,Z),xCoord(X),zCoord(Z),firstStep(T),Z<6. % Tutte le tile che non sono macchine

safe(T,X,Z):- xCoord(X),secondStep(T), Z=0.
safe(T,X,Z):- xCoord(X),secondStep(T), Z=6.
safe(T,X,Z):-trunk(X1,Z),xCoord(X1),zCoord(Z),secondStep(T),X=X1+1.
safe(T,X,Z):- turtle(X1,Z),xCoord(X1),zCoord(Z),secondStep(T),X=X1-1.
safe(T,X,Z):- goal(X,Z,true),secondStep(T).
safe(T,X,Z):-not unsafe(T,X,Z),xCoord(X),zCoord(Z),secondStep(T),Z<6. % Tutte le tile che non sono macchine

%Posizione Player
playerPos(X,Z):- playerSensor(player(player(posX(X)))),playerSensor(player(player(posZ(Z)))).

%RapportoMoveToDirezioneAuto
:-moveTo(right), playerPos(X,Z), car(X1,Z,1), X1=X+1.
:-moveTo(left), playerPos(X,Z), car(X1,Z,-1), X1=X-1.


nextPlayerPos(T,X,Z,P,still):-playerPos(X,Z),firstStep(T),P=null.
nextPlayerPos(T,X,Z1,P,up):-playerPos(X,Z), Z1=Z+1,firstStep(T),P=null.
nextPlayerPos(T,X,Z1,P,down):-playerPos(X,Z),Z1=Z-1,firstStep(T),P=null.
nextPlayerPos(T,X1,Z,P,left):-playerPos(X,Z), X1=X-1,firstStep(T),P=null.
nextPlayerPos(T,X1,Z,P,right):-playerPos(X,Z), X1=X+1,firstStep(T),P=null.

nextPlayerPos(T,X,Z,P,still):-nextPlayerPos(T1,X,Z,P1,M),firstStep(T1),secondStep(T),P=M,P1==null.
nextPlayerPos(T,X,Z1,P,up):-nextPlayerPos(T1,X,Z,P1,M), Z1=Z+1,M!=down,firstStep(T1),secondStep(T),P=M,P1==null.
nextPlayerPos(T,X,Z1,P,down):-nextPlayerPos(T1,X,Z,P1,M), Z1=Z-1, M!=up,firstStep(T1),secondStep(T),P=M,P1==null.
nextPlayerPos(T,X1,Z,P,left):-nextPlayerPos(T1,X,Z,P1,M), X1=X-1,M!=right,firstStep(T1),secondStep(T),P=M,P1==null.
nextPlayerPos(T,X1,Z,P,right):-nextPlayerPos(T1,X,Z,P1,M), X1=X+1, M!=left,firstStep(T1),secondStep(T),P=M,P1==null.


:-Answer(M,_), nextPlayerPos(T,X,Z,P,M),not safe(T,X,Z),firstStep(T),P!=null.
:-Answer(_,M), nextPlayerPos(T,X,Z,P,M), not safe(T,X,Z),secondStep(T),P==null.
:- # count {M,M1: Answer (M,M1)} > 1.
:- # count {M,M1: Answer (M,M1)} = 0.


Answer(Fs,Ss) | NotAnswer(Fs,Ss) :-nextPlayerPos(T,X,Z,Fs,Ss),Fs!=null.





