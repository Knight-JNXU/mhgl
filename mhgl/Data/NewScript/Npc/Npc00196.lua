
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00196 = {							-- 孙小红
	npc_id = 196,						-- NPC ID
	name = GetNpcName(196),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00196:Talk(bProcess)
   NpcAsk({"宇宙万物，都由木、火、土、金、水五中基本物质的运动和变化所构成。少侠如有兴趣，可到长安袁天罡之徒处了解五行之道。"
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
AddNpcTable(Npc00196)
