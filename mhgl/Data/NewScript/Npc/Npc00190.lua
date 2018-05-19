
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00190 = {							-- 玄奘
	npc_id = 190,						-- NPC ID
	name = GetNpcName(190),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00190:Talk(bProcess)
   NpcAsk({"本寺的法明长老最近去长安化生寺会朋友去了，你若是有急事可以到化生寺找他。",
          "修行佛法贵在调心，“心生则法生，法生则心生”，只要心净，佛土自然清净。?",
          "酒肉和尚老是欺负玄奘，我们都看不过去，但是那酒肉和尚有几分蛮力，我们也不敢说什么。",
          "施主是来金山寺进香的吗？"
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
AddNpcTable(Npc00190)
