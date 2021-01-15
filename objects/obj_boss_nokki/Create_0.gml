/// @description Insert description here
// You can write your code in this editor
event_inherited();
maxHealth = 1000;
hp = maxHealth;
#macro PATH_STD_SPEED 8
#macro MAX_NOKKI_TIME 1200
myPath = path_boss_harder;
myWeapon = instance_create_depth(x,y,depth-100,obj_weapon_boss_bob_med);
myWeapon.damage = 15;
myWeapon.pelletVelocity = 20;
myWeapon.fireRate = 0.25*room_speed;
target = noone;
timeline_index = tm_boss_nokki;
enum NokkiMode{
	followPath,
	rotateWeapon,
}
mode = NokkiMode.followPath;
timeline_position = 0;
timeline_running = true;
path_start(path_boss,PATH_STD_SPEED,path_action_continue,true);