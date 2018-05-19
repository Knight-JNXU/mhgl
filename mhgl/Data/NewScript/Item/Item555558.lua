--改良版VIP道具卡-QQ：572099097，欢迎探讨。

Item80085 = {}
Item80085.MapUse = function(l_1_0, l_1_1)
if player:GetLevel() > 180 then
     ShowHint("你已经到达瓶颈")
	 return
	 end
   if player:GetExp() < 1130000000 then
     ShowHint("你的经验不足以升级")
	 return
	 end
	player:ChangeExp(-1130000000)
    player:ChangeLevel(1)	
	player:ChangeSPR(25)
    player:ChangeSTA(25)
    player:ChangeSTR(25)
    player:ChangeCON(25)
    player:ChangeAGI(25)	
    end
AddItemTable(Item80085)