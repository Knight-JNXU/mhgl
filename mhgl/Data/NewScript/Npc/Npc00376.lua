
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00376 = {							-- 杵官王
	npc_id = 376,						-- NPC ID
	name = GetNpcName(376),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00376:Talk(bProcess) 
  NpcAsk("我以前一直是在乡下种花的，最近香香邀我才来京城的，如果你对种养植物有什么问题的话，都可以问我")
  SetAnswer(1,"我要在哪里才能种植物？")
  SetAnswer(2,"我需要什么才能种植物？")
  SetAnswer(3,"我要怎样照料植物呢？")
  SetAnswer(4,"种养植物有什么好处呢？")
  SetAnswer(5,"怎样才能获得花种呢？")
  SetAnswer(6,"没什么问题，我都懂了。")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00376)
