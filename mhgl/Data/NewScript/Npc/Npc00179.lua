
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00179 = {							-- 孙小红
	npc_id = 179,						-- NPC ID
	name = GetNpcName(179),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00179:Talk(bProcess)
   NpcAsk({"龙宫的宝贝真是多啊，随便偷得一两件拿到外面来卖都能发笔横财。",
          "瞧一瞧看一看了，东海龙宫宝贝大展销啦。",
          "三界之间的恩怨情仇，从来就和我们这种小角色无关。"
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
AddNpcTable(Npc00179)
