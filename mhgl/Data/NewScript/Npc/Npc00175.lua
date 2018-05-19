
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00175 = {							-- 孙小红
	npc_id = 175,						-- NPC ID
	name = GetNpcName(175),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00175:Talk(bProcess)
   NpcAsk({"想拜见我们洞主么？找我就对了！",
          "我们洞主就是人称魔界一枝花的性感又感性的美女~春十三娘",
          "盘丝岭的夕阳远望可谓梦幻中最美的风景。",
          "金姑娘就喜欢在亭子哪里用餐，说哪里风景好，吃东西就吃东西，还用选什么风景。",
          "最近总在附近发现一些人类的骸骨，不知道又是谁吃东西没清理好。"
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
AddNpcTable(Npc00175)
