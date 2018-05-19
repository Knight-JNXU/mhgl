
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00165 = {							-- 孙小红
	npc_id = 165,						-- NPC ID
	name = GetNpcName(165),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00165:Talk(bProcess)
   NpcAsk({"我已修行了千年，为何还未成仙？",
          "灈垢泉乃天然温泉，是姐妹们美容养颜的好去处。",
          "盘丝洞几百年的规矩，不许男人入住，连收徒也只手女弟子。",
          "晶晶姑娘又发脾气了，把犯了门规的小妖挂在洞外七天七夜，差点咽了气。",
          "金琉璃最近老带着些人类女孩进进出出的，不知道在搞什么名堂。"
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
AddNpcTable(Npc00165)
