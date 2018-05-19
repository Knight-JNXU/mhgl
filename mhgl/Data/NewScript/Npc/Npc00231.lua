
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00231 = {							-- 杵官王
	npc_id = 231,						-- NPC ID
	name = GetNpcName(231),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00231:Talk(bProcess) 
  NpcAsk({"大唐首席弟子之争日趋白热。",
         "程老爷三板斧，你学道第几斧啦？",
         "府衙禁地，闲杂人等不得入内。",
         "能拜我们程老爷为师可是一种荣幸呢！",
         "这里是天子脚下，太平的很。",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00231)
