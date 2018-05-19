
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00530 = {							-- 崔判官
	npc_id = 530,						-- NPC ID
	name = GetNpcName(530),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00530:Talk(bProcess) 
   NpcAsk({"人生切莫把心欺，神鬼昭彰放过谁？",
          "生死有命，富贵在天。拜师的请进内室，地藏菩萨正在招收门徒。",
          "阎王要你三更死，不敢留你过五更。",
          "左执生死簿，右拿勾魂笔，赏善罚恶，管人生死一一这说的就是老夫我啦。"
          })
  SetAnswer(1,"离开")
  WaitAnswer(1)
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00530)
