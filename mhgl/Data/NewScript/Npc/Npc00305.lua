Npc00305 = {							
	npc_id = 305,					
	name = GetNpcName(305),	
}

function Npc00305:Talk(bProcess)
  NpcAsk("老夫近日组建了车队前往传送中的“藏宝阁”,那里商贾云集,珍宝满地。少侠如想做啥买卖,老夫的车队可代为中转。\r梦幻藏宝阁#Ghttp:xyq.cbg.163.com#W\r手机藏宝阁#Ghttp:m.cbg.163.com#W\r点击免费下载#Gios或android版藏宝阁")
  SetAnswer(1,"我想寄售点东西")
  SetAnswer(2,"取回未上架或寄售失败的东西")
  SetAnswer(3,"取出已买进的东西")
  SetAnswer(4,"我随便看看的")
  WaitAnswer(4)
  if GetAnswer() == 1 then
    NpcSay("近年来市场不进景气,老夫已经解散了车队,少侠还是下次再来吧")
  elseif GetAnswer() == 2 then
    NpcSay("近年来市场不进景气,老夫已经解散了车队,少侠还是下次再来吧")
  elseif GetAnswer() == 3 then 
		if bProcess then
			player:OpenGiftBox()
	  end
	end
end






AddNpcTable(Npc00305)

