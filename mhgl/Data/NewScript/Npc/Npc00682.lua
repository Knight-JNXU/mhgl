
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00682 = {							-- 孙小红
	npc_id = 682,						-- NPC ID
	name = GetNpcName(682),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00682:Talk(bProcess) 
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
        




  NpcAsk({"自从老爷接管了点卡交易处,咱府上就一直人来人往。",
          "当今社皇上治国有方,百姓也可以安居乐业了。",
          "我家老爷现在就喜欢怀旧,人老了真是不行了,哪像人家陈咬金,还开门收徒呢。",
          "我家老爷戎马一生,也到了该 退休享清福的时候了。"})
	SetAnswer(1,"离开")
	WaitAnswer(1)
end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00682)
