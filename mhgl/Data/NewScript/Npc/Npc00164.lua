
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00164 = {							-- 孙小红
	npc_id = 164,						-- NPC ID
	name = GetNpcName(164),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00164:Talk(bProcess)
   NpcAsk({"最近有个妖怪擅闯五庄观，不仅偷吃人参果还打坏了果树，这可怎么办是好。",
          "人参果明明少了四个，那猴子还怪我算术不好！",
          "我们家的果子可是稀罕物，遇金而落，遇木而枯，遇水而化，遇火而焦，遇土而入！",
          "我家观主就是“地仙之祖”镇元大仙。"
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
AddNpcTable(Npc00164)
