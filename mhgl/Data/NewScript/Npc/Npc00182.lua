
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00182 = {							-- 孙小红
	npc_id = 182,						-- NPC ID
	name = GetNpcName(182),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00182:Talk(bProcess)
   NpcAsk({"我老伴早年就去世了，我只剩刘洪这么一个儿子可以依靠了。",
          "如今虽然吃穿不愁，可是我还是总觉得心里不踏实，这是何故？",
          "我儿子手下的人怎么都叫他陈大人啊？",
          "自从多年前他把我接过来这里享福的时候，我就发现我儿子变了，变得不认识了。"
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
AddNpcTable(Npc00182)
