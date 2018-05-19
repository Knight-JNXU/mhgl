
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00167 = {							-- 孙小红
	npc_id = 167,						-- NPC ID
	name = GetNpcName(167),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00167:Talk(bProcess)
   NpcAsk({"当我站在雨花桥边，觉得非常难过，我总觉得，应该是两个人站在这里。",
          "雨花桥边的芦花，不知是否已经飘飞？",
          "我娘找不到我一定担心死了。",
          "村里的姐妹们都被妖怪抓去害死了，我好害怕。",
          "这是什么地方，我怎么会在这里？"
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
AddNpcTable(Npc00167)
