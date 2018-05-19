-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00006 = {							-- 孙小红
	npc_id = 6,						-- NPC ID
	name = GetNpcName(6),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00006:Talk(bProcess)

  NpcAsk("布点和药店中间那块空地上,不知啥时候来了三个种族使者,有空我也去听听他们讲解技能。")
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
AddNpcTable(Npc00006)
