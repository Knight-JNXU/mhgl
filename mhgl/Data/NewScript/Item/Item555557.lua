--改良版VIP道具卡-QQ：572099097，欢迎探讨。

Item80085 = {}
Item80085.MapUse = function(l_1_0, l_1_1)
if player:GetLevel() > 143 then
     ShowHint("你已经到达瓶颈")
	 return
	 end
    player:ChangeLevel(1)	
	player:ChangeSPR(2)
    player:ChangeSTA(2)
    player:ChangeSTR(2)
    player:ChangeCON(2)
    player:ChangeAGI(2)	
    end
AddItemTable(Item80085)