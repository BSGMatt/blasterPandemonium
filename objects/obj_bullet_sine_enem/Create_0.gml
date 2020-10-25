/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
dist = 0;
maxDist = 600;
dev = 30;
minMaxDefined = false;
shift = 1;

size = 1;
maxSize = 4;
maxDamage = 40;

startX = x;
startY = y;
timer = 10;
shiftTime = 10;
preShiftTime = 5;
preTimer = 0;
minVelX = sqrt(power(velX,2)+power(velY,2))*dcos(darctan(velY/velX)-dev);
minVelY = sqrt(power(velX,2)+power(velY,2))*dsin(darctan(velY/velX)-dev);

maxVelX = sqrt(power(velX,2)+power(velY,2))*dcos(darctan(velY/velX)+dev);
maxVelY = sqrt(power(velX,2)+power(velY,2))*dsin(darctan(velY/velX)+dev);