
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00039 = {							-- 孙小红
	npc_id = 39,						-- NPC ID
	name = GetNpcName(39),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00039:Talk(bProcess)
  if player:GetLevel() <= 10 then
    NpcAsk("我可以将你传送到#R建邺城#W,你要传送吗？")
    SetAnswer(1,"我要传送")
    SetAnswer(2,"我还要逛逛")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if player:GetLevel() > 10 then
        NpcSay("我只能传送10级以下的新人")
        return
      end
      player:JumpMap(1,135,114)
    end
  else
    NpcAsk("哧哧...哧哧...(虾精挥舞着双钳)！")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00039)
