
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00068 = {							-- 孙小红
	npc_id = 68,						-- NPC ID
	name = GetNpcName(68),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00068:Talk(bProcess)
  NpcAsk("如此低调还是被发现了,好吧,你可也是要小仙我送你去蓬莱仙岛的?终身免费！")
  SetAnswer(1,"是的,我要去")
  SetAnswer(5,"我还要逛逛")
  WaitAnswer(5)
  if GetAnswer() == 1 then
    if bProcess then
      player:JumpMap(85,4,253)
    end
  end
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00068)
