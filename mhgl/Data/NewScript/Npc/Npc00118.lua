
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00118 = {							-- 孙小红
	npc_id = 118,						-- NPC ID
	name = GetNpcName(118),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00118:Talk(bProcess) 
  NpcAsk("我是三界闻名的顺风耳,什么事情都逃不过我的耳朵,我收你10000两就可以帮你打听消息,但这样偷偷摸摸的事是有损阴德的,这个要算在你头上哦。")
  SetAnswer(1,"打听流传的配方")
  SetAnswer(2,"我只是来问候你")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    
  end
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00118)
