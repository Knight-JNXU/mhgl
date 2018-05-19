
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00117 = {							-- 孙小红
	npc_id = 117,						-- NPC ID
	name = GetNpcName(117),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00117:Talk(bProcess) 
  NpcAsk({"人人都说神仙好,神仙的烦恼又有谁知道。",
          "天上星,亮晶晶,永灿烂,常安宁……",
          "兜率宫在左下角,广寒宫从左上角进,去天牢探监请向右上走。",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00117)
