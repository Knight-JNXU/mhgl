Npc000612 = {
	npc_id = 612,
	name = GetNpcName(612),
}

-- Npc00011 对话方法，bProcess 为脚本处理阶段
function Npc000612:Talk(bProcess)
	local q = player:GetQuests():GetQuest(30400)
	-- match npc id, map id and position
	if npc and q and q:GetTargetNpcId(1) == npc:GetNpc_id() and q:GetTargetNpcMap(1) == npc:GetMap_id() and q:GetTargetNpcX(1) == npc:GetCurPosX() and q:GetTargetNpcY(1) == npc:GetCurPosY() then
		NpcAsk("有钱能使鬼推磨,想让我回去,废话少说,拿钱来~")
		SetAnswer(1, "找打")
		SetAnswer(2, "离开")
		WaitAnswer(2)
		if GetAnswer() == 1 then
			if party ~= nil and party:GetRealMemNum() >= 3 then
				if bProcess then
					q:FindTargetNPC(1)
					player:EncounterBattle(self.npc_id)
				end			
			else
				NpcSay("钟馗就派你这丁点人来？哈哈哈！别丢人现眼了，给我滚一边去！")
			end
		end
	else
		NpcAsk("该干嘛干嘛去，别打扰我！")
		SetAnswer(1,"离开")
		WaitAnswer(1)
	end
end

-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc000612)
