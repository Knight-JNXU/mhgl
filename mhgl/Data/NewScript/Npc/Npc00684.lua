
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00684 = {							-- 孙小红
	npc_id = 684,						-- NPC ID
	name = GetNpcName(684),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00684:Talk(bProcess) 
--[[
  NpcAsk("我是发放通缉令的师爷")
  SetAnswer(1,"我要查询在线的通缉犯")
  SetAnswer(2,"我要抓通缉犯")
  SetAnswer(3,"我还有事,再见")
  WaitAnswer(3)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end
--]]
        




  NpcAsk({"父母总希望女儿能够生活的幸福平安,希望天下儿女都能够理解父母的苦心。",
          "我有个女儿远嫁江州十八年了,也没个书信回来,不过想来她应该过的很幸福吧~~~~",
          "此去经年,我的孙子或是孙女也应该很大了吧？真是挂念他们。",
          "我相公整日为国操劳,很幸苦的。"})
	SetAnswer(1,"离开")
	WaitAnswer(1)
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00684)
