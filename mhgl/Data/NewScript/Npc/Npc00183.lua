
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00183 = {							-- 孙小红
	npc_id = 183,						-- NPC ID
	name = GetNpcName(183),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00183:Talk(bProcess)
   NpcAsk({"大唐国境丛林密布，常有强盗拦路抢劫，路过可要当心了。",
          "尽管金山寺就在一水之隔，可要想去上香还得翻山越岭。",
          "听说通向阴曹地府的路口就在附近。"
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
AddNpcTable(Npc00183)
