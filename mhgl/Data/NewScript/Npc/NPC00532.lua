
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00532 = {							-- 孙小红
	npc_id = 532,						-- NPC ID
	name = GetNpcName(532),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00532:Talk(bProcess) 
  NpcAsk("生亦何哀，死亦何苦，你不要太难过了，我送你回长安吧。")
  SetAnswer(1,"好啊")
  SetAnswer(2,"不用了，我还要参观一下地府")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    player:JumpMap(34,222,87)
  end
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00532)
