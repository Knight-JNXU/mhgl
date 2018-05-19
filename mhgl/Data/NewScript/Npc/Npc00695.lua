Preload("Quest30601.lua")
Preload("Quest30602.lua")
Preload("Quest30603.lua")
Preload("Quest30604.lua")
Preload("Quest30605.lua")
Preload("Quest30606.lua")
Preload("Quest30607.lua")
Preload("Quest30608.lua")
Preload("Quest30610.lua")
Preload("Quest30611.lua")
Preload("Quest30612.lua")




Npc00695 = {							
	npc_id = 695,						
	name = GetNpcName(695),				
	quests = {Quest30601,Quest30602,Quest30603}	
}

function Npc00695:Talk(bProcess) 
    NpcAsk("长风镖局广招天下英雄侠客运送镖银,武艺越高押送的镖银越贵重,报仇也更丰厚,不过预交的押金也自然更多些。")
	  if not (HasQuest(30601) or HasQuest(30602) or HasQuest(30603) or HasQuest(30604) or
		   HasQuest(30605) or HasQuest(30606) or HasQuest(30607)or 
		   HasQuest(30610) or HasQuest(30611) or HasQuest(30612)) then
    SetAnswer(1,"一级镖银(押金10000两,30级能运)")
    SetAnswer(2,"二级镖银(押金20000两,50级能运)")
    SetAnswer(3,"三级镖银(押金30000两,70级能运)")
    SetAnswer(4,"四级镖银(押金40000两,90级能运)")
    SetAnswer(5,"五级镖银(押金50000两,110级能运)")
   else
    SetAnswer(7,"取消任务")
  end
  SetAnswer(6,"保命要紧,逃跑先")
  WaitAnswer(6)
  if GetAnswer() == 1 then   --30级
    if not bProcess then
			--player:AntiHack()
	  end
    Quest30601:Take()
  elseif GetAnswer() == 2 then  --50级
    if not bProcess then
		 --player:AntiHack()
	  end
		Quest30602:Take()
	elseif GetAnswer() == 3 then  --60级
    if not bProcess then
			--player:AntiHack()
	  end
		Quest30603:Take()
	elseif GetAnswer() == 4 then  --60级
    if not bProcess then
			--player:AntiHack()
	  end
		Quest30604:Take()
	elseif GetAnswer() == 5 then  --60级
    if not bProcess then
			--player:AntiHack()
	  end
		Quest30605:Take()		
	elseif GetAnswer() == 7 then  --取消任务
		player:GetQuests():RemoveQuest(30601)
		player:GetQuests():RemoveQuest(30602)
		player:GetQuests():RemoveQuest(30603)
		player:GetQuests():RemoveQuest(30604)
		player:GetQuests():RemoveQuest(30605)		
		player:RemoveBuff(257)
  end
end
     
      
      
    
    
  

 



AddNpcTable(Npc00695)
