
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00177 = {							-- 孙小红
	npc_id = 177,						-- NPC ID
	name = GetNpcName(177),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00177:Talk(bProcess)
   NpcAsk({"风儿轻，月儿明，风轻月明好心情。",
          "今人不见古时月，今夜不见古人...不见古月...今月不见照古人？",
          "读书淡泊名利，隐居于此，倒也落个悠闲自在。"
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
AddNpcTable(Npc00177)
