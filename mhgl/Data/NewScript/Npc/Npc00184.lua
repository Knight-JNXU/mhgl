
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00184 = {							-- 孙小红
	npc_id = 184,						-- NPC ID
	name = GetNpcName(184),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00184:Talk(bProcess)
   NpcAsk({"听说东海里有很多珍奇的宝贝，我在海上打了一辈子鱼都没缘见到！",
          "前些年天天能钓到的金色鲤鱼现在一条也见不到了。",
          "烟波万里扁舟小，静依孤篷，西施声音绕。涤虑洗心名利少，闲攀蓼穗蒹葭草。",
          "老夫钓鱼只图一乐，哪能和傲来长寿那些以钓鱼为生的人比。",
          "授人以鱼，不如授人以渔。要想钓大鱼，技巧是最重要的。"
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
AddNpcTable(Npc00184)
