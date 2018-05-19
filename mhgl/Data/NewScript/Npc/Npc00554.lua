Npc00554 = {							
	npc_id = 554,						
	name = GetNpcName(554),				
										
}

function Npc00554:Talk(bProcess) 
  NpcAsk("欢迎来到曾经缅怀西游")
  SetAnswer(12,"爱你哦么么哒")
  WaitAnswer(12)






end




AddNpcTable(Npc00554)