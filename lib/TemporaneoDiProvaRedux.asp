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
%:- # count {M,M1: Answer (M,M1)} > 1.
%:- # count {M,M1: Answer (M,M1)} = 0.
:-Answer(M,M1),M==left,M1==still.


Answer(Fs,Ss) | NotAnswer(Fs,Ss) :-nextPlayerPos(T,X,Z,Fs,Ss),Fs!=null.


%fullAnswer(Fs,Ss,X,Z):- Answer(Fs,Ss),nextPlayerPos(T,_,_,Fs),nextPlayerPos(T1,X,Z,Ss).








lineCars1(lineCars1(scrollLine(dir(value(-1))))).
lineCars1(lineCars1(scrollLine(carComponents(0,car(posX(6)))))).
lineCars1(lineCars1(scrollLine(carComponents(1,car(posX(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(2,car(posX(-6)))))).
lineCars1(lineCars1(scrollLine(carComponents(3,car(posX(-8)))))).
lineCars1(lineCars1(scrollLine(carComponents(4,car(posX(30)))))).
lineCars1(lineCars1(scrollLine(carComponents(5,car(posX(28)))))).
lineCars1(lineCars1(scrollLine(carComponents(6,car(posX(18)))))).
lineCars1(lineCars1(scrollLine(carComponents(7,car(posX(16)))))).
lineCars1(lineCars1(scrollLine(carComponents(0,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(1,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(2,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(3,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(4,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(5,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(6,car(posZ(4)))))).
lineCars1(lineCars1(scrollLine(carComponents(7,car(posZ(4)))))).
lineCars2(lineCars2(scrollLine(dir(value(-1))))).
lineCars2(lineCars2(scrollLine(carComponents(0,car(posX(10)))))).
lineCars2(lineCars2(scrollLine(carComponents(1,car(posX(4)))))).
lineCars2(lineCars2(scrollLine(carComponents(2,car(posX(-2)))))).
lineCars2(lineCars2(scrollLine(carComponents(3,car(posX(-8)))))).
lineCars2(lineCars2(scrollLine(carComponents(4,car(posX(28)))))).
lineCars2(lineCars2(scrollLine(carComponents(5,car(posX(22)))))).
lineCars2(lineCars2(scrollLine(carComponents(6,car(posX(16)))))).
lineCars2(lineCars2(scrollLine(carComponents(0,car(posZ(3)))))).
lineCars2(lineCars2(scrollLine(carComponents(1,car(posZ(3)))))).
lineCars2(lineCars2(scrollLine(carComponents(2,car(posZ(3)))))).
lineCars2(lineCars2(scrollLine(carComponents(3,car(posZ(3)))))).
lineCars2(lineCars2(scrollLine(carComponents(4,car(posZ(3)))))).
lineCars2(lineCars2(scrollLine(carComponents(5,car(posZ(3)))))).
lineCars2(lineCars2(scrollLine(carComponents(6,car(posZ(3)))))).
lineCars3(lineCars3(scrollLine(dir(value(1))))).
lineCars4(lineCars4(scrollLine(dir(value(1))))).
lineCars4(lineCars4(scrollLine(carComponents(0,car(posX(10)))))).
lineCars4(lineCars4(scrollLine(carComponents(1,car(posX(12)))))).
lineCars4(lineCars4(scrollLine(carComponents(2,car(posX(20)))))).
lineCars4(lineCars4(scrollLine(carComponents(3,car(posX(4)))))).
lineCars4(lineCars4(scrollLine(carComponents(4,car(posX(-6)))))).
lineCars4(lineCars4(scrollLine(carComponents(5,car(posX(-4)))))).
lineCars4(lineCars4(scrollLine(carComponents(6,car(posX(-12)))))).
lineCars4(lineCars4(scrollLine(carComponents(0,car(posZ(1)))))).
lineCars4(lineCars4(scrollLine(carComponents(1,car(posZ(1)))))).
lineCars4(lineCars4(scrollLine(carComponents(2,car(posZ(1)))))).
lineCars4(lineCars4(scrollLine(carComponents(3,car(posZ(1)))))).
lineCars4(lineCars4(scrollLine(carComponents(4,car(posZ(1)))))).
lineCars4(lineCars4(scrollLine(carComponents(5,car(posZ(1)))))).
lineCars4(lineCars4(scrollLine(carComponents(6,car(posZ(1)))))).
lineSuperCar(lineSuperCar(scrollLine(dir(value(1))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(0,car(posX(32)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(1,car(posX(40)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(2,car(posX(24)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(3,car(posX(8)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(4,car(posX(16)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(5,car(posX(0)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(0,car(posZ(5)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(1,car(posZ(5)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(2,car(posZ(5)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(3,car(posZ(5)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(4,car(posZ(5)))))).
lineSuperCar(lineSuperCar(scrollLine(carComponents(5,car(posZ(5)))))).
playerSensor(player(player(posX(10)))).
playerSensor(player(player(posZ(6)))).
goal1(goal1(goal(empty(true)))).
goal1(goal1(goal(posX(2)))).
goal1(goal1(goal(posZ(12)))).
goal2(goal2(goal(empty(true)))).
goal2(goal2(goal(posX(6)))).
goal2(goal2(goal(posZ(12)))).
goal3(goal3(goal(empty(true)))).
goal3(goal3(goal(posX(10)))).
goal3(goal3(goal(posZ(12)))).
goal4(goal4(goal(empty(true)))).
goal4(goal4(goal(posX(14)))).
goal4(goal4(goal(posZ(12)))).
goal5(goal5(goal(empty(true)))).
goal5(goal5(goal(posX(18)))).
goal5(goal5(goal(posZ(12)))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(0,turtle(posX(1)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(1,turtle(posX(0)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(0,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(1,turtle(posZ(10)))))).
lineCars3(lineCars3(scrollLine(carComponents(0,car(posX(15)))))).
lineCars3(lineCars3(scrollLine(carComponents(1,car(posX(23)))))).
lineCars3(lineCars3(scrollLine(carComponents(2,car(posX(-1)))))).
lineCars3(lineCars3(scrollLine(carComponents(3,car(posX(7)))))).
lineCars3(lineCars3(scrollLine(carComponents(0,car(posZ(2)))))).
lineCars3(lineCars3(scrollLine(carComponents(1,car(posZ(2)))))).
lineCars3(lineCars3(scrollLine(carComponents(2,car(posZ(2)))))).
lineCars3(lineCars3(scrollLine(carComponents(3,car(posZ(2)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(0,trunk(posX(20)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(0,trunk(posZ(8)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(0,trunk(dim(1)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(0,turtle(posX(0)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(1,turtle(posX(-1)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(2,turtle(posX(5)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(0,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(1,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(2,turtle(posZ(7)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(1,trunk(posX(17)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(1,trunk(posZ(8)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(1,trunk(dim(1)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(2,turtle(posX(4)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(3,turtle(posX(3)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(2,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(3,turtle(posZ(10)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(3,turtle(posX(4)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(4,turtle(posX(3)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(5,turtle(posX(10)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(3,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(4,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(5,turtle(posZ(7)))))).
trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(0,trunk(posX(17)))))).
trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(0,trunk(posZ(9)))))).
trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(0,trunk(dim(3)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(2,trunk(posX(14)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(2,trunk(posZ(8)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(2,trunk(dim(1)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(4,turtle(posX(7)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(5,turtle(posX(6)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(4,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(5,turtle(posZ(10)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(3,trunk(posX(11)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(3,trunk(posZ(8)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(3,trunk(dim(1)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(6,turtle(posX(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(7,turtle(posX(9)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(6,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(7,turtle(posZ(10)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(6,turtle(posX(9)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(7,turtle(posX(8)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(8,turtle(posX(15)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(6,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(7,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(8,turtle(posZ(7)))))).
trunkLine3(trunkSpawnerLine3(trunkSpawner(spawnedComponents(0,trunk(posX(11)))))).
trunkLine3(trunkSpawnerLine3(trunkSpawner(spawnedComponents(0,trunk(posZ(11)))))).
trunkLine3(trunkSpawnerLine3(trunkSpawner(spawnedComponents(0,trunk(dim(5)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(4,trunk(posX(1)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(4,trunk(posZ(8)))))).
trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(4,trunk(dim(1)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(8,turtle(posX(13)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(9,turtle(posX(12)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(8,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(9,turtle(posZ(10)))))).
trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(1,trunk(posX(8)))))).
trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(1,trunk(posZ(9)))))).
trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(1,trunk(dim(3)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(9,turtle(posX(14)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(10,turtle(posX(13)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(11,turtle(posX(20)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(9,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(10,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(11,turtle(posZ(7)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(10,turtle(posX(16)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(11,turtle(posX(15)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(10,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(11,turtle(posZ(10)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(12,turtle(posX(20)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(12,turtle(posZ(10)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(12,turtle(posX(19)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(13,turtle(posX(18)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(12,turtle(posZ(7)))))).
turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(13,turtle(posZ(7)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(13,turtle(posX(19)))))).
turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(13,turtle(posZ(10)))))).
