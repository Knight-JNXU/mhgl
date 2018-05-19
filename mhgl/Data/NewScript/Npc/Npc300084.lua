Npc300084 = {							-- 丁喜
	npc_id = 300084,						-- NPC ID
	name = GetNpcName(300084),				-- NPC 名称
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc300084:Talk(bProcess)
  NpcAsk("现在讲求和平时代,打打杀杀的已经被唐王禁止了,少侠还是去参加文试吧")
  SetAnswer(1,"离开")
	WaitAnswer(1)
end
   
   --[[
    local flag = player:GetQuests():GetFlag(50008)
	local Quest = player:GetQuests():GetQuest(50008)
	if Quest ~= nil then
		if Quest:IsFailed() then
			NpcSay("请去京城（27.280）丁敖除取消任务再次科举吧。")
		else
		    local NpcId = player:GetQuests():GetQuest(50008):GetTargetNpcId(1)
			if HasQuest(50008) and NpcId == self.npc_id then
				NpcAsk("准备好挑战了吗？")
				SetAnswer(1, "请指教")
				SetAnswer(2, "还没准备好")
				WaitAnswer(2)
				
				if GetAnswer() == 1 then
					if party then
						NpcSay("不能组队进行挑战。")
						return
					end
				    local Job = player:GetJob()
					if bProcess then
						if Job == 1 or Job == 4 then
						    player:EncounterBattle(self.npc_id)
						else
						    player:EncounterBattle(300088)
						end
					end
				end
			elseif NpcId == 300080 then
			    local npcName = GetNpcName(NpcId)
			    NpcSay("去回复武考官吧")
			else
			    NpcSay("科举期间你在这瞎逛什么！")
			end
		end
	else
		NpcSay("请去比武岛，龙门，好汉庄，黄石镇找乡试考官开始科举考试。")
	end
end

--]]
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc300084)
