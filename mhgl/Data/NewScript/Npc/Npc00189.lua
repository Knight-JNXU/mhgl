
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00189 = {							-- 孙小红
	npc_id = 189,						-- NPC ID
	name = GetNpcName(189),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00189:Talk(bProcess)
   NpcAsk({"师傅为我取法号“者释和尚”，意思是说，我是个和尚。",
          "施主是来金山寺进香的吗？",
          "本寺的法明长老最近去长安化生寺会朋友去了，你若是有急事可以到化生寺找他。",
          "清净之心可除烦恼，至诚之心可入佛号。"
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
AddNpcTable(Npc00189)
