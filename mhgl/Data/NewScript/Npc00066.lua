
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00066 = {							-- 孙小红
	npc_id = 66,						-- NPC ID
	name = GetNpcName(66),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00066:Talk(bProcess)
  NpcAsk("魔族的生活本该逍遥自在,但是总有些魔族弟子不守本分,还有些神仙没事就来找茬,你去调查一下究竟是个什么情况，必要时要使用武力解决问题。")
  SetAnswer(1,"好啊,我也正想教训他们呢")
  SetAnswer(2,"我来领取种族命盘")
  SetAnswer(5,"我不想去")
  WaitAnswer(5)
 end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00066)
