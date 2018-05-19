-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00027 = {							-- 孙小红
	npc_id = 27,						-- NPC ID
	name = GetNpcName(27),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00027:Talk(bProcess)
  NpcAsk("这年头,当个捕头也是不容易。三界之大,调皮的侠士也不少,没事儿喜欢玩“失踪”。看这位英雄的表情,莫非有兴趣相助？"..RandomLine(10))


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
AddNpcTable(Npc00027)
