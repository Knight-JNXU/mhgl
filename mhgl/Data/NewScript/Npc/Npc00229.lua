
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00229 = {							-- 杵官王
	npc_id = 229,						-- NPC ID
	name = GetNpcName(229),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00229:Talk(bProcess) 
  NpcAsk("我送阁下回大唐国境吧。!")
  SetAnswer(1,"回去咯")
  SetAnswer(2,"我还想在这转转")
  WaitAnswer(2)
  
  if GetAnswer() == 1 then
    
    player:JumpMap(19,140,685)
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00229)
