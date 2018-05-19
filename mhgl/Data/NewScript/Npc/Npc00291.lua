
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00291 = {							-- 孙小红
	npc_id = 291,						-- NPC ID
	name = GetNpcName(291),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00291:Talk(bProcess) 
  NpcAsk("我这里有不少珍品出售，不妨进来看看。")
  SetAnswer(1,"购买")
  SetAnswer(2,"提升召唤兽内丹")
 SetAnswer(3,"合成召唤兽内丹")
  SetAnswer(4,"我什么都不想做")
  WaitAnswer(4)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 611)
  elseif GetAnswer() == 2 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("subsidy", 0)
  elseif GetAnswer() == 3 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("refineitem", 0)
  end
end















-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00291)
