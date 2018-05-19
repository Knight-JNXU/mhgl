Npc300529 = {							-- 天蚕教
	npc_id = 300529,						-- NPC ID
	name = GetNpcName(300529),				-- NPC 名称
}

function Npc300529:Talk(bProcess)
  NpcSay({"淡定是快乐之源。我很淡定,我要快乐","都说女人是水做的,可是为啥边上这个如此冷霜？"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end






AddNpcTable(Npc300529)
