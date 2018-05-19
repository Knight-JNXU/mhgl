--马面宝宝
--屌毛

Npc00614 = {								-- 马面宝宝
	npc_id = 614,						-- NPC ID
	name = GetNpcName(614),				-- NPC 名称
}

function Npc00614:Talk(bProcess)
    local npclv = 35
	NpcAsk(".....")
    SetAnswer(1, "领养")
    SetAnswer(2, "我是路过的")
    WaitAnswer(2)
    if GetAnswer() == 1 then	   
		if player:GetLevel() < npclv then
			ShowHint("你算什么人物?一看就是等级低领养不了偶D#46")
			return false
		end
		if npc and npc:GetEnableBattle() then
			if bProcess then
				player:EncounterBattle(self.npc_id)
				if npc then
					npc:SetEnableBattle(false)
				end
			end
		else
		  ShowHint("测试缘分中，请稍后。#17")
		end	
  end
end

AddNpcTable(Npc00614)
