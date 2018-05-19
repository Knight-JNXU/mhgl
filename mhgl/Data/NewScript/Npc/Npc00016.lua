-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00016 = {							-- 孙小红
	npc_id = 16,						-- NPC ID
	name = GetNpcName(16),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00016:Talk(bProcess)
  NpcAsk("城里有位好心的郎中陈长寿,给新人看病从不收银子。他一般都在东海湾的城门口附近摆摊看病。")

  SetAnswer(1,"离开")
  WaitAnswer(1)
end


--..RandomLine(10)
function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00016)
