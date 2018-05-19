
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc002007 = {							-- 孙小红
	npc_id = 002007,						-- NPC ID
	name = GetNpcName(002007),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc002007:Talk(bProcess)
  NpcAsk({"干架啊来啊"})
	SetAnswer(1, "那就干一架啊")
	SetAnswer(2, "我是路过的")
	WaitAnswer(2)
    if GetAnswer() == 1 then  
    if party then
    local lvmin = player:GetLevel()
    local lvmax = player:GetLevel()
    for i = 0, party:GetCount() - 1 do
      local member = party:GetMember(i)
      if member then
        local lv = member:GetLevel()
        if lv < lvmin then
          lvmin = lv
        elseif lvmax < lv then
          lvmax = lv
        end
        if lvmax - lvmin > 20 then 
          NpcSayParty("队员等级不可超过20级")
          return false
        else
          if member:GetLevel() < 60 then 
            NpcSayParty("此活动过度危险，少侠到了#G60#W级再来吧")
            return false
          end
        end
      end
    end
   end
        if party == nil or party:GetCount() < 0 then 
      NpcSay("请组队挑战...")
      return 
    end  
		if npc and npc:GetEnableBattle() then
			if bProcess then
				player:EncounterBattle(self.npc_id)
				if npc then
					npc:SetEnableBattle(false)
				end
			end
		else
				NpcAskParty("没看我正忙着吗，打架也要排队的！")
				SetAnswer(1,"离开")
				WaitAnswer(1)
			end
		end
  end


  




-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc002007)
