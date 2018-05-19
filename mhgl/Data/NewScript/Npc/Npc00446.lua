
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00446 = {							-- 孙小红
	npc_id = 446,						-- NPC ID
	name = GetNpcName(446),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00446:Talk(bProcess) 
  NpcAsk({"瞧一瞧看一看了,我这里的武器最适合新人使用了。边上的老板出售高级一点的兵器，购买时请看清楚物品等级，别买错了哦",
          "长安武器店专卖0级和20级武器,0级和10级的武器则在建邺城出售。少侠记住了没"})
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 4)
  end
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00446)
