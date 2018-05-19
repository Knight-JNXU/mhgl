

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00325 = {							-- 杵官王
	npc_id = 325,						-- NPC ID
	name = GetNpcName(325),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00325:Talk(bProcess) 
  NpcAsk("五行修业，乃因应每人不同的五行属性于合适的时机挑战相应的五行散仙，并在战斗过程中利用天地五行修炼人物经验方法。")
  SetAnswer(1,"我要进行五行修业。（领取20次任务）")
  SetAnswer(2,"五行修业是什么？我想尝试下（领取1次任务）")
  SetAnswer(3,"我想转换修业点。 ")
  SetAnswer(4,"使用修业点。 ")
  SetAnswer(5,"我只是看看而已。 ")
  WaitAnswer(5)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00325)
