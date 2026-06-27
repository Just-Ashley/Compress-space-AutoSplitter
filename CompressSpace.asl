state("Compress-space", "Demo")
{
	// 0 in any menu entered from anywhere (including entering from a level) 1 when in a level.
	byte menu: "UnityPlayer.dll", 0x01CEA9C8, 0x210, 0x60, 0x140, 0x18, 0x38, 0x88, 0xDA8;
	// 0 in level 1 when complete
	byte complete: "mono-2.0-bdwgc.dll", 0x007512D0, 0x210, 0x3E8, 0x6E8, 0x188, 0xDCC;
	// 0 in level 1 in pause
	byte pause: "UnityPlayer.dll", 0x01CE8068, 0xA40, 0xBB8, 0x160, 0x60, 0x1B8, 0x120, 0x80;
}

isLoading
{
	if(old.complete == 1 && current.complete == 1 || old.pause == 1 && current.pause == 1)
		return true;
	if(old.complete == 1 && current.complete == 0 || old.complete == 0 && current.complete == 0 || current.complete == 0 || old.pause == 1 && current.pause == 0 || current.pause == 0 || old.pause == 0 && current.pause == 0)
		return false;
}

start
{
	if(current.menu == 1)
		return true;
}

reset
{
	if(old.menu == 1 && current.menu == 0)
		return true;
}

split
{
	if(old.complete == 0 && current.complete == 1)
		return true;
	
}