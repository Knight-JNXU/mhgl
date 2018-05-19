--大海龟宝宝
--屌毛

Npc00663 = {								-- 大海龟宝宝
	npc_id = 663,						-- NPC ID
	name = GetNpcName(663),				-- NPC 名称
}

function Npc00663:Talk(bProcess)
	NpcAsk("发现一只风吹上来的小动物,该怎么办?")
  SetAnswer(1, "抓住它")
  SetAnswer(2, "不理它")
  WaitAnswer(2)
  if GetAnswer() == 1 then	   
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

AddNpcTable(Npc00663)
