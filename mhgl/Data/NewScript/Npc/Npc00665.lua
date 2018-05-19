
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00665 = {							-- 孙小红
	npc_id = 665,						-- NPC ID
	name = GetNpcName(665),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00665:Talk(bProcess) 
  NpcAsk({"少侠是来选购兵器的吧?请慢慢挑选,务必看清楚名称哦！",
          "这里的风景还不错吧。",
          "行走江湖不能两手空空,来挑一件趁手的兵器吧。"
          })
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 607)
  end
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00665)
