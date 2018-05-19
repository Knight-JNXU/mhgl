Npc00443 = {							
	npc_id = 443,					
	name = GetNpcName(443),	
}

function Npc00443:Talk(bProcess)
   if player:GetChar_id() == 2311 then
     NpcAsk("来吧")
     SetAnswer(1,"来")
     SetAnswer(2,"不")
     WaitAnswer(2)
     if GetAnswer() == 1 and bProcess then
       script:SetSaying(true)
       local name = "在美国北部联邦政府和南部邦联州之间进行的美国内战起始于那一年？"
       local a = "11111"
       script:Rumor(string.format("#Y三界书院遇到了一些难题,在此悬赏解题,欢迎各位英雄豪杰发挥无穷的才智,献计献策。此次的难题是--#G%s#Y--请知道答案的人快速在江湖频道公布答案,书院院长将会给予第一个正确解答难题的人奖励。",name), false)
       script:Rumor(string.format("#Y本次三界书院难题已经解答成功,恭喜#G%s#Y获得三界书院送的#P鬼将卡片#Y一个#46#Y请在贸易车夫处领取奖励#89",a), false)
     end
   end
 
 
 
 
 
 
 -- local pk = player:GetPK_Value()
 -- NpcSay(string.format("%s",pk))
 -- player:SetPK_Value(0)
  NpcAsk({"城外的野兽倒不少,可都是凶猛无比,真是恐怖啊！",
          "如今外出打猎要带一包袱的草药,都搞不清楚是谁打谁了。",
          "自从建邺城打开了新城门,经由我家门口去东海实在方便了许多。"})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end


AddNpcTable(Npc00443)

