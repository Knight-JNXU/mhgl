
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00166 = {							-- 孙小红
	npc_id = 166,						-- NPC ID
	name = GetNpcName(166),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00166:Talk(bProcess)
   NpcAsk({"为什么，为什么我总感觉冥冥之中有几个声音在耳边，而那声音又那么象我自己？",
          "我从何处而生？又要去往何处？",
          "我一直想验证一下，佛光中炼成的宝物，是不是也可以用恶魔之心加以感化呢？",
          "什么？你找女儿村的小姑娘？不认识！我从未去过女儿村！！"
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
AddNpcTable(Npc00166)
