-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\新建文件夹\NPC00050.out 

local l_0_0 = {}
l_0_0.npc_id = 50
l_0_0.name = GetNpcName(50)
Npc00050 = l_0_0
l_0_0 = Npc00050
ScriptRunNum = 0
l_0_0.Talk = function(l_1_0, l_1_1)
  local QuestFlagA = player:GetQuests():GetFlag(55201) -- 任务链计数
  local QuestFlagB = player:GetQuests():GetFlag(55202) -- 抓鬼计数
  local QuestFlagC = player:GetQuests():GetFlag(55203) -- 小仙计数
  local QuestFlagD = player:GetQuests():GetFlag(55204) -- 一阶蚩尤计数
  local QuestFlagE = player:GetQuests():GetFlag(55205) -- 二阶蚩尤计数
  local QuestFlagF = player:GetQuests():GetFlag(80086)
  NpcAsk(string.format("#O兑换物品哦\r\#P当前已完成：\r\#A任务链：%d/600\r抓鬼：%d/300\r侠客：%d/200\r一阶段蚩尤：%d/10\r二阶段蚩尤：%d/10\r\鬼王：%d/600\r\#P兑换后自动扣除次数！", QuestFlagA,QuestFlagB,QuestFlagC,QuestFlagD,QuestFlagE,QuestFlagF))
  SetAnswer(1, "领取升级道具（必领）")
  SetAnswer(2, "10E储备")
  SetAnswer(7, "66 免费领取")
  SetAnswer(3, "10E经验换金丹")
  SetAnswer(4, "任务链次数换+属性翅膀")
  SetAnswer(5, "10把银钥匙换1把金钥匙")
  SetAnswer(9, "66把铜钥匙换1把金钥匙")
  SetAnswer(6, "抓鬼次数换宠物资质丹")
    if QuestFlagC >= 50 then
  SetAnswer(8, "50次侠客换10个首冲礼包")
  end
  SetAnswer(15, "离开")
  WaitAnswer(15)
if GetAnswer() == 1 and l_1_1 then
  player:GetItems():AddItem(555557, 1)
  end
if GetAnswer() == 2 and l_1_1 then
    player:ChangeSMoney(1000000000)
	end
if GetAnswer() == 7 and l_1_1 then
  player:GetItems():AddItem(30000, 1)
  end
if GetAnswer() == 3 and l_1_1 then
    script:SetSaying(true)
   if player:GetExp() < 1000000000 then
   ShowHint("10E")
   return
   end
    player:ChangeExp(-1000000000)
	player:GetItems():AddItem(61041, 1)
    ShowHint("给你了#46") 
	end
if GetAnswer() == 5 and l_1_1 then
	script:SetSaying(true)
	 if player:GetItems():GetItemCount(600032) < 10 then	    
                NpcSay("你的钥匙不够")
                return
				end
				player:GetItems():RemoveItem(600032, 10)
                player:GetItems():AddItem(600033, 1)
	end
	if GetAnswer() == 9 and l_1_1 then
	script:SetSaying(true)
	 if player:GetItems():GetItemCount(600031) < 66 then	    
                NpcSay("你的钥匙不够")
                return
				end
				player:GetItems():RemoveItem(600031, 66)
                player:GetItems():AddItem(600033, 1)
	end
	if GetAnswer() == 8 and l_1_1 then
    player:GetItems():AddItem(402851, 10)
    player:GetQuests():SetFlag(55203, QuestFlagC - 50)
  end
if GetAnswer() == 4 then
  NpcAsk("#P翅膀兑换哦600环换一个")
   if QuestFlagA >= 600 then
  SetAnswer(1,"龙太子")
  SetAnswer(2,"舞天姬")
  SetAnswer(3,"玄彩娥")
  SetAnswer(4,"飞燕女")
  SetAnswer(5,"骨精灵")
  SetAnswer(6,"剑侠客")
  SetAnswer(7,"虎头怪")
  SetAnswer(8,"逍遥生")
  end
  SetAnswer(9,"子母灵饰之一100次")
  SetAnswer(15,"离开")
  WaitAnswer(15)
  if GetAnswer() == 1 and l_1_1 then
  player:GetItems():AddItem(500030, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
 if GetAnswer() == 2 and l_1_1 then
  player:GetItems():AddItem(500031, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
   if GetAnswer() == 3 and l_1_1 then
  player:GetItems():AddItem(500032, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
   if GetAnswer() == 4 and l_1_1 then
  player:GetItems():AddItem(500033, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
   if GetAnswer() == 5 and l_1_1 then
  player:GetItems():AddItem(500034, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
   if GetAnswer() == 6 and l_1_1 then
  player:GetItems():AddItem(500035, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
   if GetAnswer() == 7 and l_1_1 then
  player:GetItems():AddItem(500036, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
  end
  if GetAnswer() == 8 and l_1_1 then
  player:GetItems():AddItem(500037, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 600)
end
 if GetAnswer() == 9 and l_1_1 then
 if QuestFlagA < 100 then
    return
	end
  player:GetItems():AddItem(404018, 1)
  player:GetQuests():SetFlag(55201, QuestFlagA - 100)
end
end
if GetAnswer() == 6 then
  NpcAsk("#P抓鬼次数换东西哦")
   if QuestFlagB >= 150 then
  SetAnswer(1,"150积分换攻击资质丹")
  SetAnswer(2,"150积分换体力资质丹")
  SetAnswer(3,"150积分换法力资质丹")
  SetAnswer(4,"150积分换防御资质丹")
  SetAnswer(5,"150积分换速度资质丹")
  
  end
  SetAnswer(15,"离开")
  WaitAnswer(15)
  if GetAnswer() == 1 and l_1_1 then
  player:GetItems():AddItem(61032, 10)
  player:GetQuests():SetFlag(55202, QuestFlagB - 150)
  end
 if GetAnswer() == 2 and l_1_1 then
  player:GetItems():AddItem(61030, 10)
  player:GetQuests():SetFlag(55202, QuestFlagB - 150)
  end
   if GetAnswer() == 3 and l_1_1 then
  player:GetItems():AddItem(61031, 10)
  player:GetQuests():SetFlag(55202, QuestFlagB - 150)
  end
   if GetAnswer() == 4 and l_1_1 then
  player:GetItems():AddItem(61033, 10)
  player:GetQuests():SetFlag(55202, QuestFlagB - 150)
  end
   if GetAnswer() == 5 and l_1_1 then
  player:GetItems():AddItem(61029, 10)
  player:GetQuests():SetFlag(55202, QuestFlagB - 150)
  end
end
  end
l_0_0 = AddNpcTable
l_0_0(Npc00050)
