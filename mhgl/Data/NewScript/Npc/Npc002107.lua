
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc002101 = {							-- 孙小红
	npc_id = 2101,						-- NPC ID
	name = GetNpcName(2101),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc002101:Talk(bProcess)
 NpcAsk("进入下一层")
       SetAnswer(1,"下层")
       SetAnswer(2,"离开")
       WaitAnswer(2)
		if GetAnswer() == 1 and bProcess then 
		player:JumpMap(56623,50,100)
		ShowHint("少侠一路走好！逢年过节我会给你烧纸的...#120")
	end
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc002101)
