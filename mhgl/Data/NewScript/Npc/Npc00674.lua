
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00674 = {							-- 孙小红
	npc_id = 674,						-- NPC ID
	name = GetNpcName(674),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00674:Talk(bProcess) 
 --[[ NpcAsk("音乐能陶冶人的情操")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

  NpcAsk({"哟,大爷,你可好阵子没来啦！",
          "要不要小桃红唱首新学的小曲儿给您听听？",
          "小女子善弹琵琶,客观可要来上一曲？",
          "人面桃花相映红。客观请与小女桃红满饮此杯!"})
	SetAnswer(1,"离开")
	WaitAnswer(1)
end        



--[[
  NpcSay({"",
          "",
          "",
          "",
          ""})
        end--]]









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00674)
