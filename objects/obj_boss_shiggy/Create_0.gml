/// @description Insert description here
// You can write your code in this editor
event_inherited();
maxHealth = 1000;
hp = maxHealth;
#macro MAX_SHIGGY_TIME 1200
myPath = path_boss_harder;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_boss_bob);
myWeapon.damage = 50;
myWeapon.pelletVelocity = 8;
target = noone;
timeline_index = tm_boss_shiggy;
enum ShiggyMode{
	followPath,
	targetCrystal,
	targetPlayer
}
mode = ShiggyMode.followPath;
timeline_position = 0;
timeline_running = true;
path_start(path_boss_harder,PATH_STD_SPEED,path_action_continue,true);