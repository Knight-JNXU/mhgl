
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00735 = {							-- 孙小红
	npc_id = 735,						-- NPC ID
	name = GetNpcName(735),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00735:Talk(bProcess)
  NpcAsk("我可以将你传送到#R小西天#W,你要传送吗？")
  SetAnswer(1,"我要传送")
  SetAnswer(2,"我还要逛逛")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    player:JumpMap(250,79,495)
  end
end
 








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00735)
