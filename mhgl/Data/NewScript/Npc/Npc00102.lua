
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00102 = {							-- 孙小红
	npc_id = 102,						-- NPC ID
	name = GetNpcName(102),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00102:Talk(bProcess) 
  NpcAsk("我是上古神殿的传送使者,无数守护者千万年来一直在神殿内看守着,进去的话可要先衡量一下自己的实力。")
  SetAnswer(1,"请送我进去。")
  SetAnswer(2,"我想了解一下神迹的事情。")
  
  SetAnswer(3,"我只是路过这里顺便瞻仰一下。")
  WaitAnswer(3)
  if GetAnswer() == 1  then
    player:JumpMap(107,30,259)
  elseif GetAnswer() == 2 then
    NpcSay("在中国的神话传送中,女娲是人类的始祖,至高无上的创世神。女娲神迹是颂扬其精神的所在,悬浮在极北端的天空之中,自北俱芦洲传达才可到达。近日神殿受到外来邪恶力量的冲击,试图进入的人都要经过考验才行。")
  end
end



-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00102)
