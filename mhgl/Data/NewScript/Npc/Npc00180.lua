
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00180 = {							-- 孙小红
	npc_id = 180,						-- NPC ID
	name = GetNpcName(180),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00180:Talk(bProcess)
   NpcAsk({"最近老爷总是乱发脾气。",
          "小女子别无他求，只想再见尾生一面。",
          "衙门口往西走有个凉亭，有山有水有美人相伴，真是游玩的好去处。",
          "这江州还真是平安，什么事都没有。"
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
AddNpcTable(Npc00180)
