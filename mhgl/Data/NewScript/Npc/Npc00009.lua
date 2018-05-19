-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00009 = {							-- 孙小红
	npc_id = 09,						-- NPC ID
	name = GetNpcName(09),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00009:Talk(bProcess)
  NpcAsk("欢迎来到天天西游,你可以在我这里领取游戏体验奖励。")
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
AddNpcTable(Npc00009)
