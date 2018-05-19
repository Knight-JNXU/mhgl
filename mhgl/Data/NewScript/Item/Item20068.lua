--author: apollo
--成长豪华礼盒

--[[
龙太子
local item = RandTable({63028, 63007})--修为丹


--]]











Item20068 = {
}
function Item20068:MapUse(target)
  IAsk("欢迎来到《KJ》,在50级之前,每个阶段都可以领取奖励哟~！")
  SetAnswer(1,"领取物品")
--  SetAnswer(2,"测试物品")
  SetAnswer(3,"离开")
  WaitAnswer(3)
  local answer = GetAnswer()
  if answer == 1 then 
    self:GetLevelItem()
  elseif answer == 2 then
  local flag = player:GetQuests():GetFlag(6050)	
    NpcAsk("请选择你需要设定的数值\r#Y 0 = 领取0级物品 \r 1 = 领取10级物品 \r 2 =领取20级物品\r 3 = 领取30级物品\r 4 = 领取40级物品\r 5 = 领取50级物品\r 6 = 领取60级物品")
    SetAnswer(1,"0")
    SetAnswer(2,"1")
    SetAnswer(3,"2")
    SetAnswer(4,"3")
    SetAnswer(5,"4")
    SetAnswer(6,"5")
    SetAnswer(7,"6")
    SetAnswer(8,"取消")
    WaitAnswer(8)
    if GetAnswer() == 1 then  
      player:GetQuests():SetFlag(6050,0)
    elseif GetAnswer() == 2 then 
      player:GetQuests():SetFlag(6050,1)
    elseif GetAnswer() == 3 then 
      player:GetQuests():SetFlag(6050,2)
    elseif GetAnswer() == 4 then 
      player:GetQuests():SetFlag(6050,3)
    elseif GetAnswer() == 5 then 
      player:GetQuests():SetFlag(6050,4)
    elseif GetAnswer() == 6 then 
      player:GetQuests():SetFlag(6050,5)
    elseif GetAnswer() == 7 then 
      player:GetQuests():SetFlag(6050,6)
    end
  end
end
function Item20068:GetLevelItem()
  local Lv = player:GetLevel() 
  local FreesLot = player:GetItems():GetFreeSlot(0)
  local flag = player:GetQuests():GetFlag(6050)	
  if math.floor(Lv/10) + 1 > flag then
   if flag == 0 then
      IAsk("现在你可以领取0级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
        if FreesLot >= 6 then
          ShowError(string.format("\#W获得%s",GetItemName(20406)))--0级腰带
          player:GetItems():AddItem(20406, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20421)))--0级鞋子
          player:GetItems():AddItem(20421, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20430)))--0级项链
          player:GetItems():AddItem(20430, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20261, 20270})--0级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20370)))--0级方巾
            player:GetItems():AddItem(20370, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20388)))--0级布衣-男
            player:GetItems():AddItem(20388, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20279, 20288})--0级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20379)))--0级簪子-女
            player:GetItems():AddItem(20379, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20397)))--0级布裙-女
            player:GetItems():AddItem(20397, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20297, 20306})--0级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20370)))--0级方巾
            player:GetItems():AddItem(20370, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20388)))--0级布衣-男
            player:GetItems():AddItem(20388, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20315, 20324})--0级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20379)))--0级簪子-女
            player:GetItems():AddItem(20379, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20397)))--0级布裙-女
            player:GetItems():AddItem(20397, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20343, 20270})--0级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20370)))--0级方巾
            player:GetItems():AddItem(20370, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20388)))--0级布衣-男
            player:GetItems():AddItem(20388, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20279, 20324})--0级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20379)))--0级簪子-女
            player:GetItems():AddItem(20379, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20397)))--0级布裙-女
            player:GetItems():AddItem(20397, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20343, 20352})--0级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20370)))--0级方巾
            player:GetItems():AddItem(20370, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20388)))--0级布衣-男
            player:GetItems():AddItem(20388, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20315, 20361})--0级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20379)))--0级簪子-女
            player:GetItems():AddItem(20379, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20397)))--0级布裙-女
            player:GetItems():AddItem(20397, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
    elseif flag == 1 then--10奖励
      IAsk("现在你可以领取10级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
        if FreesLot >= 6 then
          ShowError(string.format("\#W获得%s",GetItemName(20407)))--10级腰带
          player:GetItems():AddItem(20407, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20422)))--10级鞋子
          player:GetItems():AddItem(20422, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20431)))--10级项链
          player:GetItems():AddItem(20431, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20262, 20271})--10级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20371)))--10级方巾
            player:GetItems():AddItem(20371, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20389)))--10级布衣-男
            player:GetItems():AddItem(20389, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20280, 20289})--10级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20380)))--10级簪子-女
            player:GetItems():AddItem(20380, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20398)))--00级布裙-女
            player:GetItems():AddItem(20398, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20298, 20307})--10级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20371)))--10级方巾
            player:GetItems():AddItem(20371, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20389)))--10级布衣-男
            player:GetItems():AddItem(20389, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20316, 20325})--10级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20380)))--10级簪子-女
            player:GetItems():AddItem(20380, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20398)))--00级布裙-女
            player:GetItems():AddItem(20398, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20344, 20271})--10级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20371)))--10级方巾
            player:GetItems():AddItem(20371, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20389)))--10级布衣-男
            player:GetItems():AddItem(20389, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20280, 20325})--10级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20380)))--10级簪子-女
            player:GetItems():AddItem(20380, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20398)))--00级布裙-女
            player:GetItems():AddItem(20398, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20344, 20353})--10级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20371)))--10级方巾
            player:GetItems():AddItem(20371, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20389)))--10级布衣-男
            player:GetItems():AddItem(20389, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20316, 20362})--10级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20380)))--10级簪子-女
            player:GetItems():AddItem(20380, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20398)))--00级布裙-女
            player:GetItems():AddItem(20398, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
    elseif flag == 2 then
      IAsk("现在你可以领取20级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
        player:GetItems():AddItem(20619, 1)
        if FreesLot >= 6 then
          ShowError(string.format("\#W获得%s",GetItemName(20408)))--20级腰带
          player:GetItems():AddItem(20408, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20423)))--20级鞋子
          player:GetItems():AddItem(20423, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20432)))--20级项链
          player:GetItems():AddItem(20432, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20263, 20272})--20级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20372)))--20级方巾
            player:GetItems():AddItem(20372, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20390)))--20级布衣-男
            player:GetItems():AddItem(20390, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20281, 20290})--20级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20381)))--20级簪子-女
            player:GetItems():AddItem(20381, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20399)))--20级布裙-女
            player:GetItems():AddItem(20399, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20299, 20308})--20级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20372)))--20级方巾
            player:GetItems():AddItem(20372, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20390)))--20级布衣-男
            player:GetItems():AddItem(20390, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20317, 20326})--20级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20381)))--20级簪子-女
            player:GetItems():AddItem(20381, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20399)))--20级布裙-女
            player:GetItems():AddItem(20399, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20345, 20272})--20级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20372)))--20级方巾
            player:GetItems():AddItem(20372, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20390)))--20级布衣-男
            player:GetItems():AddItem(20390, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20281, 20326})--20级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20381)))--20级簪子-女
            player:GetItems():AddItem(20381, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20399)))--20级布裙-女
            player:GetItems():AddItem(20399, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20345, 20354})--20级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20372)))--20级方巾
            player:GetItems():AddItem(20372, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20390)))--20级布衣-男
            player:GetItems():AddItem(20390, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20317, 20363})--20级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20381)))--20级簪子-女
            player:GetItems():AddItem(20381, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20399)))--20级布裙-女
            player:GetItems():AddItem(20399, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
    elseif flag == 3 then
      IAsk("现在你可以领取30级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
        if FreesLot >= 6 then
          local item = RandTable({20409, 20410})--30级腰带
          ShowError(string.format("\#W获得%s",GetItemName(item)))--30级腰带
          player:GetItems():AddItem(item, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20424)))--30级鞋子
          player:GetItems():AddItem(20424, 1)
          local item = RandTable({20433, 20434})--30级项链
          ShowError(string.format("\#W获得%s",GetItemName(item)))--30级项链
          player:GetItems():AddItem(item, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20264, 20273})--30级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20373)))--30级方巾
            player:GetItems():AddItem(20373, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20391)))--30级布衣-男
            player:GetItems():AddItem(20391, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20282, 20291})--30级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20382)))--30级簪子-女
            player:GetItems():AddItem(20382, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20400)))--30级布裙-女
            player:GetItems():AddItem(20400, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20300, 20309})--30级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20373)))--30级方巾
            player:GetItems():AddItem(20373, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20391)))--30级布衣-男
            player:GetItems():AddItem(20391, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20318, 20327})--30级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20382)))--30级簪子-女
            player:GetItems():AddItem(20382, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20400)))--30级布裙-女
            player:GetItems():AddItem(20400, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20346, 20273})--30级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20373)))--30级方巾
            player:GetItems():AddItem(20373, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20391)))--30级布衣-男
            player:GetItems():AddItem(20391, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20282, 20327})--30级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20382)))--30级簪子-女
            player:GetItems():AddItem(20382, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20400)))--30级布裙-女
            player:GetItems():AddItem(20400, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20346, 20355})--30级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20373)))--30级方巾
            player:GetItems():AddItem(20373, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20391)))--30级布衣-男
            player:GetItems():AddItem(20391, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20318, 20364})--30级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20382)))--30级簪子-女
            player:GetItems():AddItem(20382, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20400)))--30级布裙-女
            player:GetItems():AddItem(20400, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
    elseif flag == 4 then
      IAsk("现在你可以领取40级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
        if FreesLot >= 6 then
          local item = RandTable({20411, 20412})--40级腰带
          ShowError(string.format("\#W获得%s",GetItemName(item)))--40级腰带
          player:GetItems():AddItem(item, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20425)))--40级鞋子
          player:GetItems():AddItem(20425, 1)
          local item = RandTable({20435, 20436})--40级项链
          ShowError(string.format("\#W获得%s",GetItemName(item)))--40级项链
          player:GetItems():AddItem(item, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20265, 20274})--40级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20374)))--40级方巾
            player:GetItems():AddItem(20374, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20392)))--40级布衣-男
            player:GetItems():AddItem(20392, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20283, 20292})--40级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20383)))--40级簪子-女
            player:GetItems():AddItem(20383, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20401)))--40级布裙-女
            player:GetItems():AddItem(20401, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20301, 20310})--40级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20374)))--40级方巾
            player:GetItems():AddItem(20374, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20392)))--40级布衣-男
            player:GetItems():AddItem(20392, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20319, 20328})--40级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20383)))--40级簪子-女
            player:GetItems():AddItem(20383, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20401)))--40级布裙-女
            player:GetItems():AddItem(20401, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20347, 20274})--40级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20374)))--40级方巾
            player:GetItems():AddItem(20374, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20392)))--40级布衣-男
            player:GetItems():AddItem(20392, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20283, 20328})--40级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20383)))--40级簪子-女
            player:GetItems():AddItem(20383, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20401)))--40级布裙-女
            player:GetItems():AddItem(20401, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20347, 20356})--40级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20374)))--40级方巾
            player:GetItems():AddItem(20374, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20392)))--40级布衣-男
            player:GetItems():AddItem(20392, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20319, 20365})--40级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20383)))--40级簪子-女
            player:GetItems():AddItem(20383, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20401)))--40级布裙-女
            player:GetItems():AddItem(20401, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
    elseif flag == 5 then
      IAsk("现在你可以领取50级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
        if FreesLot >= 6 then
          local item = RandTable({20413, 20414})--50级乱咬牙、魔童大牙
          ShowError(string.format("\#W获得%s",GetItemName(item)))--50级腰带
          player:GetItems():AddItem(item, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20426)))--50级鞋子
          player:GetItems():AddItem(20426, 1)
          local item = RandTable({20437, 20438})--50级荧光坠子、高速之星
          ShowError(string.format("\#W获得%s",GetItemName(item)))--50级项链
          player:GetItems():AddItem(item, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20266, 20275})--50级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20375)))--50级方巾
            player:GetItems():AddItem(20375, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20393)))--50级布衣-男
            player:GetItems():AddItem(20393, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20284, 20293})--50级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20384)))--50级簪子-女
            player:GetItems():AddItem(20384, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20402)))--50级布裙-女
            player:GetItems():AddItem(20402, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20302, 20311})--50级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20375)))--50级方巾
            player:GetItems():AddItem(20375, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20393)))--50级布衣-男
            player:GetItems():AddItem(20393, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20320, 20329})--50级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20384)))--50级簪子-女
            player:GetItems():AddItem(20384, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20402)))--50级布裙-女
            player:GetItems():AddItem(20402, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20348, 20275})--50级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20375)))--50级方巾
            player:GetItems():AddItem(20375, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20393)))--50级布衣-男
            player:GetItems():AddItem(20393, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20284, 20329})--50级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20384)))--50级簪子-女
            player:GetItems():AddItem(20384, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20402)))--50级布裙-女
            player:GetItems():AddItem(20402, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20348, 20357})--50级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20375)))--50级方巾
            player:GetItems():AddItem(20375, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20393)))--50级布衣-男
            player:GetItems():AddItem(20393, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20320, 20366})--50级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20384)))--50级簪子-女
            player:GetItems():AddItem(20384, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20402)))--50级布裙-女
            player:GetItems():AddItem(20402, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
    elseif flag == 6 then
      IAsk("现在你可以领取60级的成长奖励,您确定要领取吗?")
      SetAnswer(1,"领取")
      SetAnswer(2,"取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then 
      player:GetItems():RemoveItem(20068, 1)
      ShowHint("#W宝盒消耗掉了所有的仙气,已经消失~~~~~")
        if FreesLot >= 6 then
          local item = RandTable({20415, 20416})--60级双魂引、攫魂铃
          ShowError(string.format("\#W获得%s",GetItemName(item)))--60级腰带
          player:GetItems():AddItem(item, 1)
          ShowError(string.format("\#W获得%s",GetItemName(20427)))--60级鞋子
          player:GetItems():AddItem(20427, 1)
          local item = RandTable({20439, 20440})--60级风月宝链、八卦坠
          ShowError(string.format("\#W获得%s",GetItemName(item)))--60级项链
          player:GetItems():AddItem(item, 1)
          local job = player:GetJob()
          local sex = player:GetSex()		
          if job == 1 and sex == 0 then		--龙太子
            local item = RandTable({20267, 20276})--60级枪 扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20376)))--60级方巾
            player:GetItems():AddItem(20376, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20394)))--60级布衣-男
            player:GetItems():AddItem(20394, 1)
          elseif job == 1 and sex == 1 then  --骨精灵
            local item = RandTable({20285, 20294})--60级棒 爪
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20385)))--60级簪子-女
            player:GetItems():AddItem(20385, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20403)))--60级布裙-女
            player:GetItems():AddItem(20403, 1)
          elseif job == 2 and sex == 0 then  --虎头怪
            local item = RandTable({20303, 20312})--60级斧、锤
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20376)))--60级方巾
            player:GetItems():AddItem(20376, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20394)))--60级布衣-男
            player:GetItems():AddItem(20394, 1)
          elseif job == 2 and sex == 1 then  --舞天姬
            local item = RandTable({20321, 20330})--60级环、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20385)))--60级簪子-女
            player:GetItems():AddItem(20385, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20403)))--60级布裙-女
            player:GetItems():AddItem(20403, 1)
          elseif job == 3 and sex == 0 then  --逍遥生
            local item = RandTable({20349, 20276})--60级剑、扇
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20376)))--60级方巾
            player:GetItems():AddItem(20376, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20394)))--60级布衣-男
            player:GetItems():AddItem(20394, 1)
          elseif job == 3 and sex == 1 then  --玄彩娥
            local item = RandTable({20285, 20330})--60级魔棒、飘带
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20385)))--60级簪子-女
            player:GetItems():AddItem(20385, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20403)))--60级布裙-女
            player:GetItems():AddItem(20403, 1)
          elseif job == 4 and sex == 0 then  --剑侠客
            local item = RandTable({20349, 20358})--60级剑、刀、
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20376)))--60级方巾
            player:GetItems():AddItem(20376, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20394)))--60级布衣-男
            player:GetItems():AddItem(20394, 1)
          elseif job == 4 and sex == 1 then  --飞燕女
            local item = RandTable({20321, 20367})--60级环、双剑
            ShowError(string.format("\#W获得%s",GetItemName(item)))
            player:GetItems():AddItem(item, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20385)))--60级簪子-女
            player:GetItems():AddItem(20385, 1)
            ShowError(string.format("\#W获得%s",GetItemName(20403)))--60级布裙-女
            player:GetItems():AddItem(20403, 1)
          end
          player:GetQuests():SetFlag(6050,flag+1)
        else
          ShowHint("请先清理一下你的当前背包")
        end
      end
		elseif flag == 7 then
			ShowHint("已经领完所有奖励")	
		end
	else
		if flag == 1 then
			ShowHint("当你达到\#P10\#W级时才能再次领取奖励")
		elseif flag == 2 then
			ShowHint("当你达到\#P20\#W级时才能再次领取奖励")
		elseif flag == 3 then
			ShowHint("当你达到\#P30\#W级时才能再次领取奖励")
		elseif flag == 4 then
			ShowHint("当你达到\#P40\#W级时才能再次领取奖励")
		elseif flag == 5 then
			ShowHint("当你达到\#P50\#W级时才能再次领取奖励")
		elseif flag == 6 then
			ShowHint("当你达到\#P60\#W级时才能再次领取奖励")	
		elseif flag == 7 then
			ShowHint("已经领完所有奖励")
		end
	end
end






function Item20068:CanUse(user, target)

end

function Item20068:BattleUse(user, target)

end

AddItemTable(Item20068)