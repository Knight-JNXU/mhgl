
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00187 = {							-- 孙小红
	npc_id = 187,						-- NPC ID
	name = GetNpcName(187),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00187:Talk(bProcess)
   NpcAsk({"法明那老头明明知道些什么，却那么嘴硬，不给点教训他还不知道本姑娘的厉害。",
          "我从何处而生？又要去往何处？",
          "没了，我终于知道什么是没了......",
          "前生今世，诸多因缘，谁能帮我辨清？"
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
AddNpcTable(Npc00187)
