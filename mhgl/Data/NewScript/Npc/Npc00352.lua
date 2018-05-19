Preload("Quest10109.lua")
Preload("Quest10110.lua")
--vincent
Npc00352 = {							
	npc_id = 352,					
	name = GetNpcName(352),	
	quests = { Quest10109, Quest10110}	
}


function Npc00352:Talk(bProcess)
  NpcAsk("我可是知晓三界所有事情的人,看我名字你就知道了,有没有兴趣在这些榜上找到你自己的名字？")
	SetAnswer(1, "梦幻高手榜")
	SetAnswer(2, "梦幻名人榜")
	SetAnswer(3, "梦幻恶人榜")
	SetAnswer(4, "个人比武积分榜")
	SetAnswer(5, "帮派比武积分榜")
	SetAnswer(6, "离开")
	WaitAnswer(6)
	if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:Rank(0)
	elseif GetAnswer() == 2 and bProcess then
    script:SetSaying(true)
    script:Rank(3)
	elseif GetAnswer() == 3 and bProcess then
    script:SetSaying(true)
    script:Rank(4)
	elseif GetAnswer() == 4 and bProcess then
    script:SetSaying(true)
    script:Rank(6)
	elseif GetAnswer() == 5 and bProcess then
    script:SetSaying(true)
    player:ShowGuildRank()
  end
end



AddNpcTable(Npc00352)
