
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00490 = {							-- 杵官王
	npc_id = 490,						-- NPC ID
	name = GetNpcName(490),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00490:Talk(bProcess) 
  NpcAsk({"我要吃糖葫芦，我要吃糖葫芦。",
  "呜呜呜，我迷路了。本来是偷偷跟着爷爷溜出来，可是人太多，把爷爷丢了。",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00490)
