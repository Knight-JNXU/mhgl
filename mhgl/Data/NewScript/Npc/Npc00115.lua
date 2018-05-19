
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00115 = {							-- 孙小红
	npc_id = 115,						-- NPC ID
	name = GetNpcName(115),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00115:Talk(bProcess) 
  NpcAsk({"天宫可是众仙云集之地,不是你想来就来,想走就走的！",
          "整天有人来打听这打听那的,什么红琉璃白琉璃,当心我火了打你一顿",
          "又要开蟠桃会了,我算算我守了多少年的门,自从我守门开始,已经开了2次蟠桃会了。",
          "天天在这里守门真是无聊死了,我也渴望冒险刺激的生活。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end





-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00115)
