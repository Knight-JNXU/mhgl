-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00731 = {							-- 孙小红
	npc_id = 731,						-- NPC ID
	name = GetNpcName(731),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00731:Talk(bProcess)
  NpcAsk("请问要去地狱迷宫吗?")
  SetAnswer(1,"传送")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    player:JumpMap(52,61,80)
  end
end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00731)
