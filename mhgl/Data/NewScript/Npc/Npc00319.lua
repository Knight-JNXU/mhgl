
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00319 = {							-- 杵官王
	npc_id = 319,						-- NPC ID
	name = GetNpcName(319),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00319:Talk(bProcess) 
  NpcAsk("名字代表了一个人的身份和特征，没有什么特别情况，是万不可随意更改的。如果你确实需要更改名字，也不是不行，只需要付出一点代价就行。你现在是否需要修改名字？")
  SetAnswer(1,"购买 ")
  SetAnswer(2,"我要学习装备图鉴技能 ")
  SetAnswer(3,"我要学习召唤兽图鉴技能 ")
  SetAnswer(4,"导标旗和合成旗介绍 ")
  SetAnswer(5,"领取支线任务 ")
  SetAnswer(6,"没事啦 ")
  WaitAnswer(6)
  if GetAnswer() == 1 then
    if IsProcess() then
      script:OpenInterface("shop", 601);
    end
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00319)
