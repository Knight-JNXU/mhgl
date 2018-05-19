
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00031 = {							-- 孙小红
	npc_id = 31,						-- NPC ID
	name = GetNpcName(31),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00031:Talk(bProcess)

  NpcAsk("东海湾的林老汉可以带你去东海岩洞,那里能遇到海毛虫哦"..RandomLine(10))
  SetAnswer(1,"离开")
  WaitAnswer(1)

end

--..RandomLine(10)
function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00031)
