
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00515 = {							-- 孙小红
	npc_id = 515,						-- NPC ID
	name = GetNpcName(515),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00515:Talk(bProcess)
   NpcAsk({"听说国境又有强盗出没，看来太平盛世也有不安宁的地方。",
          "小女子别无他求，只想再见尾生一面。",
          "绣花讲究的是精心细致，街坊领居都喜欢我绣的花布。",
          "不知道尾生投胎了没有。"
          })

  SetAnswer(1,"离开")
  WaitAnswer(1)
end
--[[ 
  
  
  
   NpcSay({"",
          "",
          "",
          ""})
          
          
          
          
          
          --]]


          













-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00515)
