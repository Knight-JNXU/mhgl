--wangzl
Preload("Quest63521.lua")


Npc300522 = {							
	npc_id = 300522,				--战斗雪人明雷
	name = GetNpcName(300522),	
}


function Npc300522:Talk(bProcess)
  if player:HasBuff(40006) then
    NpcAsk("桃园春色,小侠士准备好接受桃园春色为你带来的祝福吗？\r#P最高只能累计5个小时的桃园春色状态,使用完后在来领取！")
   -- SetAnswer(1,"领取桃园春色")
    SetAnswer(2,"我要出去")
    SetAnswer(3,"离开")
    WaitAnswer(3)
	  if GetAnswer() == 1 and bProcess then
	    script:SetSaying(true)
      local Buff40006 = player:FindBuff(40006)
	    local Buff40006CoolDown = Buff40006:GetBuffCoolDown() 			
	    local A = math.floor(Buff40006:GetBuffCoolDown() / 60)		
	    if A >= 60 then
	      NpcSay("只能领取1个小时的桃园春色,使用完以后再来吧")
	      return
	    end
	    if player:HasBuff(40006) then
			  NewBuff40006CoolDown = (Buff40006CoolDown + 3600)/60 + 1;
			  player:AddBuff(40006, 0, 0, 0, NewBuff40006CoolDown, 100)
			  NpcSay("领取了一个小时的桃园春色状态")
			else
	      player:AddBuff(40006, 0, 0, 0, 60, 100)
	      NpcSay("领取了一个小时的桃园春色状态")
	    end
	  elseif GetAnswer() == 2 then
	    player:JumpMap(34,119,264)
	  end
	else
    NpcAsk("桃园春色,小侠士准备好接受桃园春色为你带来的祝福吗？\r#P最高只能累计5个小时的桃园春色状态,使用完后在来领取！")
    SetAnswer(1,"领取桃园春色")
    SetAnswer(2,"我要出去")
    SetAnswer(3,"离开")
    WaitAnswer(3)
  	if GetAnswer() == 1 and bProcess then
	    script:SetSaying(true)
	    if player:HasBuff(40006) then
        local Buff40006 = player:FindBuff(40006)
	      local Buff40006CoolDown = Buff40006:GetBuffCoolDown() 			
	      local A = math.floor(Buff40006:GetBuffCoolDown() / 60)		
	      if A >= 60 then
	        NpcSay("只能领取1个小时的桃园春色,使用完以后再来吧")
	        return
	      end
	    end
	    player:AddBuff(40006, 0, 0, 0, 60, 100)
	    NpcSay("领取了一个小时的桃园春色状态")
	  elseif GetAnswer() == 2 then
	    player:JumpMap(34,119,264)
	  end
  end
end


  
--]]




AddNpcTable(Npc300522)
