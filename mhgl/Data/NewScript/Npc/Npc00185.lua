
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00185 = {							-- 孙小红
	npc_id = 185,						-- NPC ID
	name = GetNpcName(185),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00185:Talk(bProcess)
   NpcAsk({"通向阴曹地府的路口就在附近，据说地府的地藏菩萨正在招收门徒，男女不限，不过只招收魔族的弟子。",
          "磨刀不误砍柴工，学完技能再打工。",
          "过了江州就是繁华的长安城了，金山寺下方的小城是洪州。",
          "砍了一辈子柴，连颗菩提树都没见过。"
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
AddNpcTable(Npc00185)
