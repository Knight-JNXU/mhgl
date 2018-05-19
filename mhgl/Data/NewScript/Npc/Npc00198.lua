
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00198 = {							-- 孟婆
	npc_id = 198,						-- NPC ID
	name = GetNpcName(198),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00198:Talk(bProcess)
   NpcAsk({"喝下孟婆汤，过了奈何桥，前生的事就再与你无缘。",
          "听说地藏菩萨在广招门徒，年轻人想不想去学些本领?",
          "孟婆汤有甘、苦、辛、酸、咸五种口味，少侠想要哪一种。",
          "相见不如怀念，怀念不如忘记"
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
AddNpcTable(Npc00198)
