%setOnActuator(player(player(player(move(value__(X)))))):-
%setOnActuator(player(player(transform(position(x(X)))))):-
%setOnActuator(player(player(transform(position(z(X)))))):-
%trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(X,trunk(posX(V)))))).
%trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(X,trunk(posZ(V)))))).
%trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(X,trunk(dim(V)))))).
%trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(X,trunk(posX(V)))))).
%trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(X,trunk(posZ(V)))))).
%trunkLine2(trunkSpawnerLine2(trunkSpawner(spawnedComponents(X,trunk(dim(V)))))).
%trunkLine3(trunkSpawnerLine3(trunkSpawner(spawnedComponents(X,trunk(posX(V)))))).
%trunkLine3(trunkSpawnerLine3(trunkSpawner(spawnedComponents(X,trunk(posZ(V)))))).
%trunkLine3(trunkSpawnerLine3(trunkSpawner(spawnedComponents(X,trunk(dim(V)))))).
%turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(X,turtle(posX(V)))))).
%turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(X,turtle(posZ(V)))))).
%turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(X,turtle(posX(V)))))).
%turtleLine2(tSpawnerLine2(turtleSpawner(spawnedComponents(X,turtle(posZ(V)))))).
%lineCars1(lineCars1(scrollLine(dir(value(X))))).
%lineCars1(lineCars1(scrollLine(carComponents(X,car(posX(V)))))).
%lineCars1(lineCars1(scrollLine(carComponents(X,car(posZ(V)))))).
%lineCars2(lineCars2(scrollLine(dir(value(X))))).
%lineCars2(lineCars2(scrollLine(carComponents(X,car(posX(V)))))).
%lineCars2(lineCars2(scrollLine(carComponents(X,car(posZ(V)))))).
%lineCars3(lineCars3(scrollLine(dir(value(X))))).
%lineCars3(lineCars3(scrollLine(carComponents(X,car(posX(V)))))).
%lineCars3(lineCars3(scrollLine(carComponents(X,car(posZ(V)))))).
%lineCars4(lineCars4(scrollLine(dir(value(X))))).
%lineCars4(lineCars4(scrollLine(carComponents(X,car(posX(V)))))).
%lineCars4(lineCars4(scrollLine(carComponents(X,car(posZ(V)))))).
%lineSuperCar(lineSuperCar(scrollLine(dir(value(X))))).
%lineSuperCar(lineSuperCar(scrollLine(carComponents(X,car(posX(V)))))).
%lineSuperCar(lineSuperCar(scrollLine(carComponents(X,car(posZ(V)))))).
%goal(goal2(transform(position(x(X))))).
%goal(goal2(transform(position(z(X))))).
%goal(goal2(goal(empty(X)))).

%Reorganized Data From Sensors
trunk(X,Z,dim):- trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posX(X)))))),trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posZ(Z)))))),trunkLine1(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(dim(dim)))))).
trunk(X,Z,dim):- trunkLine1(trunkSpawnerLine2(trunkSpawner(spawnedComponents(T,trunk(posX(X)))))),trunkLine2(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posZ(Z)))))),trunkLine2(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(dim(dim)))))).
trunk(X,Z,dim):- trunkLine1(trunkSpawnerLine3(trunkSpawner(spawnedComponents(T,trunk(posX(X)))))),trunkLine3(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(posZ(Z)))))),trunkLine3(trunkSpawnerLine1(trunkSpawner(spawnedComponents(T,trunk(dim(dim)))))).
turtle(X,Z):- turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posX(X)))))), turtleLine1(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posZ(Z)))))).
turtle(X,Z):- turtleLine2(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posX(X)))))), turtleLine2(tSpawnerLine1(turtleSpawner(spawnedComponents(T,turtle(posZ(Z)))))).
car(X,Z,dir):- lineCars1(lineCars1(scrollLine(carComponents(T,car(posX(X)))))),lineCars1(lineCars1(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars1(lineCars1(scrollLine(dir(value(dir))))).
car(X,Z,dir):- lineCars2(lineCars2(scrollLine(carComponents(T,car(posX(X)))))),lineCars2(lineCars2(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars2(lineCars2(scrollLine(dir(value(dir))))).
car(X,Z,dir):- lineCars3(lineCars3(scrollLine(carComponents(T,car(posX(X)))))),lineCars3(lineCars3(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars3(lineCars3(scrollLine(dir(value(dir))))).
car(X,Z,dir):- lineCars4(lineCars4(scrollLine(carComponents(T,car(posX(X)))))),lineCars4(lineCars4(scrollLine(carComponents(T,car(posZ(Z)))))),lineCars4(lineCars4(scrollLine(dir(value(dir))))).
car(X,Z,dir):- lineSuperCar(lineSuperCar(scrollLine(carComponents(T,car(posX(X)))))),lineSuperCar(lineSuperCar(scrollLine(carComponents(T,car(posZ(Z)))))),lineSuperCar(lineSuperCar(scrollLine(dir(value(dir))))).
%home(X,Z,empty):- goal(goal2(transform(position(x(X))))),goal(goal2(transform(position(z(X))))),goal(goal2(goal(empty(X)))).