--wangzl
Preload("Inst00010.lua")

Npc300512 = {							
	npc_id = 300512,				--战斗雪人明雷
	name = GetNpcName(300512),	
}


function Npc300512:Talk(bProcess)
  player:GetQuests():SetFlag(5500,1)
  local flag5500 = player:GetQuests():GetFlag(5500)

  NpcAsk("欢迎参加门派闯关竞赛活动,活动每月举行一次。你是否已经叫齐伙伴准备闯关了?")
  SetAnswer(1,"挑战")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then 
  --  NpcSay(string.format("%s",flag5500))
    EnterInstance(Inst00010, 272,13, 60)
  end
end

    


  





AddNpcTable(Npc300512)
