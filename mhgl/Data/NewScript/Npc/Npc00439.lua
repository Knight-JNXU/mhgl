Npc00439 = {							
	npc_id = 439,					
	name = GetNpcName(439),	
}

function Npc00439:Talk(bProcess)
  NpcAsk({"最近大唐国境总有强盗山贼出没,衙门里人手快不够用了",
          "虽有石狮把门,安全还得靠人。",
          "公堂禁地,闲杂人等不许乱闯",
          "作奸犯科可是要下大狱的。",
          "告状的话先把纸状准备好了到堂外排队去,别乱闯。"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end



AddNpcTable(Npc00439)

