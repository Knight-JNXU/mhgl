-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00008 = {							-- 孙小红
	npc_id = 08,						-- NPC ID
	name = GetNpcName(08),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00008:Talk(bProcess)
  NpcAsk("欢迎来到天天西游,你可以在我这里激活各种推广序列号。")


--[[  local eq_MaxHP = 0
  local eq = player:GetBag():GetItem(120+4)  
  eq_MaxHP = eq_MaxHP + eq:GetMaxHP()	
  NpcSay(string.format("%s",eq_MaxHP)) --]]
  SetAnswer(1,"离开")
  WaitAnswer(1)
end

function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end




-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00008)
