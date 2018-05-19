--改良版VIP道具卡-QQ：572099097，欢迎探讨。

Item80085 = {}
Item80085.MapUse = function(l_1_0, l_1_1)
if player:GetLevel() > 189 then
     ShowHint("你已经到达瓶颈")
	 return
	 end
   if player:GetExp() < 1130000000 then
     ShowHint("你的经验不足以升级")
	 return
	 end
	player:ChangeExp(-1130000000)
    player:ChangeLevel(1)	
	player:ChangeSPR(30)
    player:ChangeSTA(30)
    player:ChangeSTR(30)
    player:ChangeCON(30)
    player:ChangeAGI(30)	
    end
AddItemTable(Item80085)