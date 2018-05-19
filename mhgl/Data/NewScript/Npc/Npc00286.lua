
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00286 = {							-- 杵官王
	npc_id = 286,						-- NPC ID
	name = GetNpcName(286),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00286:Talk(bProcess) 
local QuestFlagC = player:GetQuests():GetFlag(55300) -- 小仙计数
  NpcAsk(string.format("#O回收土豪套装\r\#P当前已完成：\r土豪积分：%d/600\r", QuestFlagC))
  SetAnswer(1,"一键回收")
  if QuestFlagC >= 100 then
  SetAnswer(2,"100积分换土豪腰带 ")
  SetAnswer(3,"100积分换土豪项链 ")
  SetAnswer(4,"100积分换土豪鞋子 ") 
  SetAnswer(6,"100积分换土豪男头 ")
  SetAnswer(7,"100积分换土豪女头 ")
  SetAnswer(8,"100积分换土豪男衣 ")
  SetAnswer(9,"100积分换土豪女衣 ")
  SetAnswer(5,"100积分换神器碎片10个 ")
  end
  --SetAnswer(6,"我想了解下“礼品包装” ")
  SetAnswer(10,"不好意思，我点错了 ")
  WaitAnswer(10)
if GetAnswer() == 1  and bProcess then
   if player:GetItems():GetItemCount(404011) > 0 then	    
       player:GetItems():RemoveItem(404011, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	 
     elseif 	player:GetItems():GetItemCount(404012) > 0 then 
	  player:GetItems():RemoveItem(404012, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	 
	   elseif 	player:GetItems():GetItemCount(404013) > 0 then 
	  player:GetItems():RemoveItem(404013, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	 
	   elseif 	player:GetItems():GetItemCount(404014) > 0 then 
	  player:GetItems():RemoveItem(404014, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	 
	   	   elseif 	player:GetItems():GetItemCount(404015) > 0 then 
	  player:GetItems():RemoveItem(404015, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	  	 
	   elseif 	player:GetItems():GetItemCount(404016) > 0 then 
	  player:GetItems():RemoveItem(404016, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	
	   	   elseif 	player:GetItems():GetItemCount(404017) > 0 then 
	   player:GetItems():RemoveItem(404017, 1)  
       player:GetQuests():SetFlag(55300, QuestFlagC + 50)	
   end 
end   
if GetAnswer() == 2 and bProcess then
	player:GetItems():AddItem(404015, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 3 and bProcess then
	player:GetItems():AddItem(404017, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 4 and bProcess then
	player:GetItems():AddItem(404016, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 5 and bProcess then
	player:GetItems():AddItem(600001, 10)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 6 and bProcess then
	player:GetItems():AddItem(404011, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 7 and bProcess then
	player:GetItems():AddItem(404012, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 8 and bProcess then
	player:GetItems():AddItem(404013, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
   if GetAnswer() == 9 and bProcess then
	player:GetItems():AddItem(404014, 1)  
    player:GetQuests():SetFlag(55300, QuestFlagC - 100)	
	ShowHint("OK#46") 
   end
end





-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00286)
