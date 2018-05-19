-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Bat00001.out 
local l_0_0 = {}
l_0_0.addMob = true
l_0_0.addMob2 = true
l_0_0.addMob3 = true
l_0_0.addMob4 = true
l_0_0.addMob5 = true
l_0_0.addMob6 = true
l_0_0.addMob7 = true
l_0_0.addMob8 = true
l_0_0.addMob9 = true
l_0_0.addMob10 = true
Bat00001 = l_0_0
l_0_0 = Bat00001
l_0_0.OnInit = function(l_1_0)
end

l_0_0.OnPreTurn = function(l_2_0, l_2_1)
end

l_0_0.OnPostTurn = function(l_3_0, l_3_1)
  if battle:GetTeamExist(0) == 0 then
    if l_3_0.addMob then
       l_3_0.addMob = false--第二关  新增怪物
  battle:AddMob(253, 0)
  battle:AddMob(255, 1)
  battle:AddMob(265, 2)
  battle:AddMob(256, 3)
  battle:AddMob(274, 4)
  battle:AddMob(275, 5)
  battle:AddMob(281, 6)
  battle:AddMob(282, 7)
  battle:AddMob(259, 8)
  battle:AddMob(260, 9)
       battle:SetForceEnd(false)
       ISay("#小朋友们是不是难以等待了？哈哈哈,来吧")
    end
  end
end
Bat00001.OnFinish = function(l_4_0, l_4_1, result)
  if result == LuaI.END_WIN then
    for i = 0, battle:GetCharacterCount() - 1 do
      local actor = battle:GetCharacter(i)
      local owner = actor:GetOwner()
      local partner = actor:GetCurPartner()
      local partnerAlive = ((not partner or partner:IsDead()) and false)
      local LvPlayer = owner:GetLevel()
      local AvgLevel = party:GetAvgLevel()
      local Exp = (20 * AvgLevel + 10) * 6.6 * 70 * 2 * 1.2
      local ExpPartner = (10 * AvgLevel + 10) * 6.6 * 70 * 2 * 1.1
      local lvdiffModify = 0
      local lvdiff = math.abs(LvPlayer - AvgLevel)
      if lvdiff <= 2 then
        lvdiffModify = 1
      elseif lvdiff <= 4 then
        lvdiffModify = 0.9
      elseif lvdiff <= 6 then
        lvdiffModify = 0.75
      elseif lvdiff <= 8 then
        lvdiffModify = 0.55
      elseif lvdiff <= 10 then
        lvdiffModify = 0.3
      end
      local pLvPlayer = 0
      local partner = actor:GetCurPartner()
      if partner then
        pLvPlayer = partner:GetLevel()
      end
      local plvdiffModify = 0
      local plvdiff = math.abs(pLvPlayer - AvgLevel)
      if plvdiff <= 4 then
        plvdiffModify = 1
      elseif plvdiff <= 6 then
        plvdiffModify = 0.9
      elseif plvdiff <= 8 then
        plvdiffModify = 0.75
      elseif plvdiff <= 10 then
        plvdiffModify = 0.55
      elseif plvdiff <= 12 then
        plvdiffModify = 0.3
      elseif plvdiff <= 30 then
        plvdiffModify = 0.3 - plvdiff / 100
      else
        plvdiffModify = 0
      end
      if owner and not actor:IsDead() then
        owner:ChangeExpForScript(Exp * lvdiffModify, 500)
        ShowMessage(string.format("#W战斗胜利，获得经验值%d", Exp * lvdiffModify), owner)
        if partner and partnerAlive == true and partner:GetLevel() - owner:GetLevel() < 5 then
          owner:GetCurPartner():ChangeExpForScript(ExpPartner * plvdiffModify, 500)
          ShowMessage(string.format("#W同伴获得经验值%d", ExpPartner * plvdiffModify, 500), owner)
        end
        if owner:GetItems():GetFreeSlot(0) > 0 then
          local itemId = 0
          local r = math.random(1, 100)
          if r <= 100 then
           itemId = RandTable({60405, 60415, 60425, 60435, 60445, 60455, 60465, 60475, 402801, 402830, 401669, 60333, 60348, 15000, 15001, 15006, 15007, 15008, 15009, 30009, 30001, 20001, 80170, 80084, 63060})
          end
          if itemId ~= 0 then
            owner:GetItems():AddItemForScript(itemId, 1)
            owner:GetScript():ShowError(string.format("#W获得%s", GetItemName(itemId)))
            script:Rumor(string.format("%s #O在四处闲逛之时，遇到了#R送礼使者#O,只见 %s #O 他一人领先冲上前处，打得送礼使者四处奔逃，只留下 #Y %s #O遗留在地！#60", owner:GetCharNameLink(), owner:GetCharNameLink(), GetItemName(itemId)), false)
          end
        end
      end
    end
  end
end
AddBattleTable(Bat00001)

