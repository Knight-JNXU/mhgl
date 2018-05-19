
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00485 = {							-- 杵官王
	npc_id = 485,						-- NPC ID
	name = GetNpcName(485),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00485:Talk(bProcess) 
  NpcAsk("俺们朱紫国国王和西梁女国是知己好友，现特意开辟通往西梁国的直达栈道，客官如想前往神秘浪漫的女儿国观光旅游，小的可送您一程传送到西梁女国 !"..RandomLine(8))
  SetAnswer(1,"传送到西梁女国")
  SetAnswer(2,"我还是先参观朱紫国好了  ")
  WaitAnswer(2)
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
AddNpcTable(Npc00485)
