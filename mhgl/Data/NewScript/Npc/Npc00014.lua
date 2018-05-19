-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00014 = {							-- 孙小红
	npc_id = 14,						-- NPC ID
	name = GetNpcName(14),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00014:Talk(bProcess)
  NpcAsk("靠近东海湾城门那有个陈长寿心肠很好,新人看病从来不收钱,召唤兽医生也从来不收新人的钱。")
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
AddNpcTable(Npc00014)
