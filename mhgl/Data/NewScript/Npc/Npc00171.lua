
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00171 = {							-- 杵官王
	npc_id = 171,						-- NPC ID
	name = GetNpcName(171),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00171:Talk(bProcess) 
  NpcAsk("我送阁下回长安吧。!")
  SetAnswer(1,"回去咯")
  SetAnswer(2,"我还想在这转转")
  WaitAnswer(2)
  
  if GetAnswer() == 1 then
    if player:GetLevel() < 10 then
      NpcSay("低于10级,不敢传送")
      return
    end
    player:JumpMap(34,236,509)
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00171)
