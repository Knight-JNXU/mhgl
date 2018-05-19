Npc00440 = {							
	npc_id = 440,					
	name = GetNpcName(440),	
}

function Npc00440:Talk(bProcess)
  NpcAsk({"公堂之上,岂容喧哗",
          "公平公正,廉洁高效,这词不错,明儿粉到墙上去。",
          "不能体恤民情的官不好好官"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end



AddNpcTable(Npc00440)

