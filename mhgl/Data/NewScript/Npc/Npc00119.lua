
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00119 = {							-- 孙小红
	npc_id = 119,						-- NPC ID
	name = GetNpcName(119),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00119:Talk(bProcess) 
  NpcAsk("我这里提供庭院饰品哦,有需要的话就开口好了。")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    
  end
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00119)
