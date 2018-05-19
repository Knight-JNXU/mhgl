
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00106 = {							-- 孙小红
	npc_id = 106,						-- NPC ID
	name = GetNpcName(106),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00106:Talk(bProcess) 
  NpcAsk("我可以送你去#R天宫#W,你要不要去呢?")
  SetAnswer(1,"是的,我要去")
  SetAnswer(2,"我还要逛逛")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    player:JumpMap(13,143,369)
  end
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00106)
