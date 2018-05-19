
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00194 = {							-- 孙小红
	npc_id = 194,						-- NPC ID
	name = GetNpcName(194),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00194:Talk(bProcess)
   NpcAsk({"从前有座山，山上有个庙，庙里有个山神讲故事，他说从前有座山，山上有个庙，少侠你还想继续听么？",
          "最近来许愿的人越来越少了，山神也不好做啊！",
          "我是传说中的---山神。求财求子求姻缘来拜我就对了，不过这年头时间就是金钱，你没供奉就别耽误本神时间！",
          "山外有山，人外有人。这山神也是分三六九等的。"
          })
		SetAnswer(2, "离开")
		WaitAnswer(2)

end
--[[ 
  
  
  
   NpcSay({"",
          "",
          "",
          ""})
          
          
          
          
          
          --]]


          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00194)
