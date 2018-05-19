Preload("Quest10034.lua")
Preload("Quest10035.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00178 = {							-- 孙小红
	npc_id = 178,						-- NPC ID
	name = GetNpcName(178),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00178:Talk(bProcess)
  local quest_ids = {10034}
  if HasQuest(quest_ids) then
    NpcAsk("过路人,能否帮我个忙?")
    SetAnswer(1,"好吧,烦躁我也闲着,老人家有什么事情讲?")
    SetAnswer(2,"去去去,我自己还有事情忙呢！")
    WaitAnswer(2)
    if GetAnswer() == 1 then
		  if HasQuest(10034) then
			  if Quest10034:Return() then
			    Quest10035:Take()
			  end
			end
	  end
  else
   NpcAsk({"吴文彩又四处游玩去了，你可以到国境以东找找他。",
          "听说国境又有强盗出没，看来太平盛世也有不安宁的地方。",
          "年轻人要多读些书，将来才能为国家社稷出力。"
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)

end
end













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00178)
