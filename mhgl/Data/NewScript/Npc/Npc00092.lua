
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00092 = {							-- 孙小红
	npc_id = 92,						-- NPC ID
	name = GetNpcName(92),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00092:Talk(bProcess)
  NpcAsk({"如今梦幻做什么最赚钱?当然是到社区炒房了！我看呐,傲来新开发的海景宅子不错,我得去看看。",
         "作买卖要讲究“变通”,眼明手快,商场如战场,时机不等人啊。",
         "我这里商品琳琅满目应有尽有,年轻人想要什么尽管开口。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
end





-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00092)
