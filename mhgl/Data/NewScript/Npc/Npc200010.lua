

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc200010 = {							-- 杵官王
	npc_id = 200010,						-- NPC ID
	name = GetNpcName(200010),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc200010:Talk(bProcess) 
local QuestFlagA = player:GetQuests():GetFlag(55300)
  NpcAsk("下仙成功后开始可以来我这里开启双门派同时重置属性点哦需要298土豪积分哦")
  local Lv = player:GetLevel()
if player:GetLevel() == 181 and player:GetItems():GetItemCount(555559) < 1 then
  SetAnswer(1,"转生下仙")
  end
  SetAnswer(2,"洗点")
  SetAnswer(3,"领取下仙属性BUFF")
  SetAnswer(6,"删除任务")
if player:GetLevel() == 190 and player:GetItems():GetItemCount(555559) > 0  and player:GetQuests():GetFlag(55300) > 297 then
if player:GetItems():GetItemCount(555560) < 1 then
    SetAnswer(7,"大唐")
    SetAnswer(8,"化生") 
    SetAnswer(9,"女儿")
    SetAnswer(10,"神木")
    SetAnswer(11,"龙宫")
	SetAnswer(12,"天宫")
	SetAnswer(13,"普陀")
	SetAnswer(14,"凌波")
	SetAnswer(15,"狮驼")
	SetAnswer(16,"魔王")
	SetAnswer(17,"盘丝")
	SetAnswer(18,"无底")
	SetAnswer(19,"方寸")
	SetAnswer(20,"五庄")
	SetAnswer(21,"地府")
	  end
  end
  SetAnswer(5,"离开")
  WaitAnswer(5)

if GetAnswer() == 1 then
	   if player:GetQuests():HasQuest(63532) then
   	  local q = player:GetQuests():GetQuest(63532)
   	  if q:IsFailed() then 
   	    NpcSay("任务已失败，请删除任务后在领取~")
   	  else
   	    NpcSay("快去寻找伙伴一起闯关吧。")
   	  end
   	  return false
   	else
   	  Quest63532:Take()
   	end
	end
if GetAnswer() == 6 then
    player:GetQuests():RemoveQuest(63532)
  end
  if GetAnswer() == 2 then
  if player:GetLevel() < 191 then
  ShowHint("等级不足191")
  return
  end
  player:ResetCharLevel(Lv)
  	player:ChangeSPR(500)
    player:ChangeSTA(500)
    player:ChangeSTR(500)
    player:ChangeCON(500)
    player:ChangeAGI(500)
  end
   if GetAnswer() == 3 then
  if player:GetLevel() < 191 then
  ShowHint("等级不足191")
  return
  end
  player:AddSkill(70000)
  end
if GetAnswer() == 7 and bProcess then
  
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(13000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 8 and bProcess then
  
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(19000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 9 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(17000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 10 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(23000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 11 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(10000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 12 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(16000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 13 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(20000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 14 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(22000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 15 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(1800)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 1000)
 end
if GetAnswer() == 16 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(11000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 17 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(15000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 18 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(24000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 19 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(2600)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 20 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(21000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
if GetAnswer() == 21 and bProcess then
 
 player:ResetCharLevel(Lv)
 ShowHint("请重新分配人物属性点")
 player:AddSkill(12000)
 player:GetItems():RemoveItem(555559,10)
 player:GetItems():AddItem(555560, 1)
  player:GetQuests():SetFlag(55300, QuestFlagA - 297)
 end
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc200010)

