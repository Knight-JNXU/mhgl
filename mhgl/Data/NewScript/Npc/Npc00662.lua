--大海龟宝宝
--屌毛

Npc00662 = {								-- 大海龟宝宝
	npc_id = 662,						-- NPC ID
	name = GetNpcName(662),				-- NPC 名称
}

function Npc00662:Talk(bProcess)
	NpcAsk("发现一只风吹上来的小动物,该怎么办?")
  SetAnswer(1, "抓住它")
  SetAnswer(2, "不理它")
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
		  NpcAsk("测试缘分中，请稍后。#17")
		  SetAnswer(1,"离开")
		  WaitAnswer(1)
		end	
  end
end

AddNpcTable(Npc00662)
