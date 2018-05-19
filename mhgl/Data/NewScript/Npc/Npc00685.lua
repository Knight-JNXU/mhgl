
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00685 = {							-- 孙小红
	npc_id = 685,						-- NPC ID
	name = GetNpcName(685),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00685:Talk(bProcess) 

  NpcAsk("奉唐王之命,为了表彰我大唐盛世的英雄豪杰,人物总经验满10000000000(1后面好多个……0好像是10个,嗯~)的高手,可以到我这里领取唐王特赐的纪念版名号,数量有限,先到先得,送完为止。")
  SetAnswer(1,"我就是传说中的高人")
  SetAnswer(3,"这里好像没我什么事")
  WaitAnswer(3)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end

        












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00685)
