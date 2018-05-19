-- 中秋活动 荷灯商人 
--author xiaofeng
Preload("Quest304100.lua")

Npc000533 = {							-- 荷灯商人
	npc_id = 000533,						-- NPC ID
	name = GetNpcName(000533),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc000533:Talk(bProcess)
	local Day =  LuaI.GetRealDay();
	local Month = LuaI.GetRealMonth();
	local Year = LuaI.GetRealYear();
	local QuestFlagA = player:GetQuests():GetFlag(80086)
	
	NpcAsk("#O鬼王任务，190升级必做")	
	if player:GetLevel() > 189 then
	SetAnswer(1, "交给我吧")
    end	
	SetAnswer(8, "离开")	
	WaitAnswer(8)
	if GetAnswer() == 1 then
		if player:GetQuests():HasQuest(304100) then
			local q = player:GetQuests():GetQuest(304100)
			if q:IsFailed() then
				NpcSay("任务已失败，请删除。")
			else
				NpcSay("怎么还不去，再不抓紧就让鬼王跑了。")
			end
			return false
		else
			if npc then
				Quest304100:Take()
			end
	end
	
    end
  end
  
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc000533)