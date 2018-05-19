
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00688 = {							-- 孙小红
	npc_id = 688,						-- NPC ID
	name = GetNpcName(688),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00688:Talk(bProcess) 
--[[
  NpcAsk("奉唐王之命,为了表彰我大唐盛世的英雄豪杰,人物总经验满10000000000(1后面好多个……0好像是10个,嗯~)的高手,可以到我这里领取唐王特赐的纪念版名号,数量有限,先到先得,送完为止。")
  SetAnswer(1,"我就是传说中的高人")
  SetAnswer(3,"这里好像没我什么事")
  WaitAnswer(3)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

        
  NpcAsk({"别人说我老谋深算,其实我也有单纯的一面",
          "吃醋吃醋,我的老婆爱吃醋。",
          "我们做臣子的就是要对皇上忠心,为皇上分忧。",
          "臣闻理国要道,在于公平正直,故《尚书》云：“无偏无党,无道荡荡。无党无偏,王道平平。”"})
	SetAnswer(1,"离开")
	WaitAnswer(1)
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00688)
