
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00181 = {							-- 孙小红
	npc_id = 181,						-- NPC ID
	name = GetNpcName(181),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00181:Talk(bProcess)
   NpcAsk({"自打孩子走后，我天天以泪洗面，眼睛都快哭得不行了。",
          "大慈大悲的观音菩萨，请您保佑我的孩子平平安安，希望有一天能恶人遭诛，好人获救。",
          "听说国境又有强盗出没，看来太平盛世也有不安宁的地方。",
          "我苦命的相公和孩子啊，这种日子什么时候才能熬出头。"
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
AddNpcTable(Npc00181)
