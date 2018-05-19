Npc401200 = {
	npc_id = 401200,
	name = GetNpcName(401200),
}

-- Npc00011 对话方法，bProcess 为脚本处理阶段
function Npc401200:Talk(bProcess)
	local q = player:GetQuests():GetQuest(304001)
	-- match npc id, map id and position
	if npc and q and q:GetTargetNpcId(1) == npc:GetNpc_id() and q:GetTargetNpcMap(1) == npc:GetMap_id() and q:GetTargetNpcX(1) == npc:GetCurPosX() and q:GetTargetNpcY(1) == npc:GetCurPosY() then
		NpcAsk("就你特么这种渣渣也想学人家做英雄？~")
		SetAnswer(1, "找打")
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if party ~= nil and party:GetRealMemNum() >= 1 then
				if bProcess then
					q:FindTargetNPC(401200)
					player:EncounterBattle(self.npc_id)
				end			
			else
				NpcSay("哈哈哈！别丢人现眼了，给我滚一边去！")
			end
		end
	else
		NpcSay("该干嘛干嘛去，别打扰我！")
	end
end

-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc401200)
