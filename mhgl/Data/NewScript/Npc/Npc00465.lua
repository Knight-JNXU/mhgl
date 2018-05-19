Preload("Quest310400.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00465 = {							-- 孙小红
	npc_id = 465,						-- NPC ID
	name = GetNpcName(465),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00465:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 10) then
    NpcAsk("我的事情太多，忙不过来，请优选选择一件你最想做的事情吧。(如果你想要做的事情不在列表中,请选择“#Y我要做其他事情#W”)")
    SetAnswer(1,"神器任务")
    SetAnswer(2,"积分购买")
    SetAnswer(3,"我要做其他事情")
    SetAnswer(4,"我点错了")
    WaitAnswer(4)
		if GetAnswer() == 1 then
		if player:GetQuests():HasQuest(310400) then
			local q = player:GetQuests():GetQuest(310400)
			if q:IsFailed() then
				NpcSay("任务已失败，请删除。")
			else
				NpcSay("怎么还不去，再不抓紧就让他跑了。")
			end
			return false
		else
			if npc then
				Quest310400:Take()
			end
		end
	end
	if GetAnswer() == 2 then
				  	local flag = player:GetQuests():GetFlag(310400)	
	script:SetSaying(true)
		NpcAsk(string.format("欢迎来到三眼商城，祝您购物愉快！\r你的神器积分为：#R %d", flag))
		--SetAnswer(1, "购买120书礼盒   【积分2】")
		--SetAnswer(2, "购买120铁       【积分4】")
		--SetAnswer(3, "购买130书礼盒   【积分4】")
		--SetAnswer(4, "购买130铁       【积分8】")		
		--SetAnswer(5, "购买140书礼盒   【积分6】")
		SetAnswer(6, "子母2     【积分50】")
		if player:GetLevel() > 155 then
		SetAnswer(7, "神碎片    【积分25】")	
end		
		SetAnswer(15, "我就看看")
		WaitAnswer(15)
	if GetAnswer() == 1 then
			  	local flag = player:GetQuests():GetFlag(310400)	
      script:SetSaying(true)
      if flag < 2 then
        NpcSay("你的余额不足#R4")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 2)
      player:GetItems():AddItem(58000, 1)
      script:Rumor(string.format("#E %s #O在#R杨戬#O那里兑换了一个120指南书宝盒#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 2 then

      script:SetSaying(true)
      if flag < 4 then
        NpcSay("你的余额不足#R4")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 4)
      player:GetItems():AddItem(20257, 1)
      script:Rumor(string.format("#E %s #O在#R杨戬#O那里兑换了一个120级百炼精铁#124", player:GetName()), false)
      player:GetOwner()
    end		
		if GetAnswer() == 3 then

      script:SetSaying(true)
      if flag < 4 then
        NpcSay("你的余额不足#R8")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 4)
      player:GetItems():AddItem(58001, 1)
      script:Rumor(string.format("#E %s #O在#R杨戬#O那里兑换了一个130指南书宝盒#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 4 then

      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足#R8")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 8)
      player:GetItems():AddItem(20258, 1)
      script:Rumor(string.format("#E %s #O在#R杨戬#O那里兑换了一个130级百炼精铁#124", player:GetName()), false)
      player:GetOwner()
    end	
		if GetAnswer() == 5 then

      script:SetSaying(true)
      if flag < 6 then
        NpcSay("你的余额不足#R25")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 6)
      player:GetItems():AddItem(58002, 1)
      script:Rumor(string.format("#E %s #O在#R杨戬#O那里兑换了一个140指南书宝盒#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 6 then

      script:SetSaying(true)
      if flag < 50 then
        NpcSay("你的余额不足#R25")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 50)
      player:GetItems():AddItem(404019, 1)
      script:Rumor(string.format("#E %s #O在#R杨戬#O那里兑换了一个子母2#124", player:GetName()), false)
      player:GetOwner()
    end	
	if GetAnswer() == 7 then

      script:SetSaying(true)
      if flag < 25 then
        NpcSay("你的余额不足#R10")
        return
      end
      player:GetQuests():SetFlag(310400, flag - 25)
	itemid = RandTable({600001})
	player:GetItems():AddItem(itemid, 1)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format(" %s #O在#R杨戬#O那里兑换神碎片#B%s#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
      player:GetOwner()
    end		
		end
	end


end

   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00465)
