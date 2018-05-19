--改良版VIP道具卡-QQ：572099097，欢迎探讨。

Item80085 = {}
Item80085.MapUse = function(l_1_0, l_1_1)
  local flag63529 = player:GetQuests():GetFlag(63529)
  local flag = player:GetQuests():GetFlag(63529)
if player:GetLevel() > 174 then
     ShowHint("你已经到达瓶颈")
	 return
	 end
   if player:GetExp() < 1130000000 then
     ShowHint("你的经验不足以升级")
	 return
	 end
	  if player:GetItems():GetItemCount(80085) > 0 then   --50级精铁
		    ShowHint("还未渡劫")
		    return
		  end
		  if flag == 0 then
		  ShowHint("还未渡劫")
		  return
		  end
	player:ChangeExp(-1130000000)
    player:ChangeLevel(1)	
	player:ChangeSPR(20)
    player:ChangeSTA(20)
    player:ChangeSTR(20)
    player:ChangeCON(20)
    player:ChangeAGI(20)	
    end
AddItemTable(Item80085)