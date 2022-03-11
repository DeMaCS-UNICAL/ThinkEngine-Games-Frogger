%For runtime instantiated GameObject, only the prefab mapping is provided. Use that one substituting the gameobject name accordingly.
 %Sensors.
%playerSensor(player,objectIndex(Index),player(posX(Value))).
%playerSensor(player,objectIndex(Index),player(posZ(Value))).
%trunkLine1(trunkSpawnerLine1,objectIndex(Index),trunkSpawner(spawnComponent(posX(Value)))).
%trunkLine1(trunkSpawnerLine1,objectIndex(Index),trunkSpawner(spawnComponent(posZ(Value)))).
%trunkLine1(trunkSpawnerLine1,objectIndex(Index),trunkSpawner(spawnComponent(dim(Value)))).
%trunkLine2(trunkSpawnerLine2,objectIndex(Index),trunkSpawner(spawnedComponents(Index1,trunk(posX(Value))))).
%trunkLine2(trunkSpawnerLine2,objectIndex(Index),trunkSpawner(spawnedComponents(Index1,trunk(posZ(Value))))).
%trunkLine2(trunkSpawnerLine2,objectIndex(Index),trunkSpawner(spawnedComponents(Index1,trunk(dim(Value))))).
%trunkLine3(trunkSpawnerLine3,objectIndex(Index),trunkSpawner(spawnedComponents(Index1,trunk(posX(Value))))).
%trunkLine3(trunkSpawnerLine3,objectIndex(Index),trunkSpawner(spawnedComponents(Index1,trunk(posZ(Value))))).
%trunkLine3(trunkSpawnerLine3,objectIndex(Index),trunkSpawner(spawnedComponents(Index1,trunk(dim(Value))))).
%turtleLine1(tSpawnerLine1,objectIndex(Index),turtleSpawner(spawnedComponents(Index1,turtle(posX(Value))))).
%turtleLine1(tSpawnerLine1,objectIndex(Index),turtleSpawner(spawnedComponents(Index1,turtle(posZ(Value))))).
%turtleLine1(tSpawnerLine1,objectIndex(Index),turtleSpawner(spawnedComponents(Index1,turtle(dim(Value))))).
%turtleLine2(tSpawnerLine2,objectIndex(Index),turtleSpawner(spawnedComponents(Index1,turtle(posX(Value))))).
%turtleLine2(tSpawnerLine2,objectIndex(Index),turtleSpawner(spawnedComponents(Index1,turtle(posZ(Value))))).
%turtleLine2(tSpawnerLine2,objectIndex(Index),turtleSpawner(spawnedComponents(Index1,turtle(dim(Value))))).
%lineCars1(lineCars1,objectIndex(Index),scrollLine(carComponents(Index1,car(posX(Value))))).
%lineCars1(lineCars1,objectIndex(Index),scrollLine(carComponents(Index1,car(posZ(Value))))).
%lineCars1(lineCars1,objectIndex(Index),scrollLine(dir(value(Value)))).
%lineCars2(lineCars2,objectIndex(Index),scrollLine(carComponents(Index1,car(posX(Value))))).
%lineCars2(lineCars2,objectIndex(Index),scrollLine(carComponents(Index1,car(posZ(Value))))).
%lineCars2(lineCars2,objectIndex(Index),scrollLine(dir(value(Value)))).
%lineCars3(lineCars3,objectIndex(Index),scrollLine(carComponents(Index1,car(posX(Value))))).
%lineCars3(lineCars3,objectIndex(Index),scrollLine(carComponents(Index1,car(posZ(Value))))).
%lineCars3(lineCars3,objectIndex(Index),scrollLine(dir(value(Value)))).
%lineCars4(lineCars4,objectIndex(Index),scrollLine(carComponents(Index1,car(posX(Value))))).
%lineCars4(lineCars4,objectIndex(Index),scrollLine(carComponents(Index1,car(posZ(Value))))).
%lineCars4(lineCars4,objectIndex(Index),scrollLine(dir(value(Value)))).
%lineSuperCar(lineSuperCar,objectIndex(Index),scrollLine(carComponents(Index1,car(posX(Value))))).
%lineSuperCar(lineSuperCar,objectIndex(Index),scrollLine(carComponents(Index1,car(posZ(Value))))).
%lineSuperCar(lineSuperCar,objectIndex(Index),scrollLine(dir(value(Value)))).
%Actuators:
setOnActuator(playerAct(player,objectIndex(Index),player(answerA(Value)))) :-objectIndex(playerAct, Index), .
setOnActuator(playerAct(player,objectIndex(Index),player(answerB(Value)))) :-objectIndex(playerAct, Index), .
