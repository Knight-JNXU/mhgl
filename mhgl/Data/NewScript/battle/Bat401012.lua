-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\Battle\Bat300400.out 

Bat300400 = {}
Bat300400.OnInit = function(self)
  battle:AddMob(935, 1,109)
  battle:AddMob(214, 2,99)
  battle:AddMob(224, 3,99)
  battle:AddMob(229, 4,99)  
  battle:AddMob(275, 5,99)   
   battle:AddMob(285, 2,89) 
   battle:AddMob(284, 6,89) 
  battle:AddMob(283, 8,89) 
   battle:AddMob(282, 9,89)  
end

Bat300400.OnPreTurn = function(self, turn)
end

Bat300400.OnPostTurn = function(self, turn)
end

Bat300400.OnFinish = function(self, turn, result)
  if result == LuaI.END_WIN then
    for i = 0, battle:GetCharacterCount() - 1 do
      local actor = battle:GetCharacter(i)
      local member = actor:GetOwner()
      local Exp = 0
      local LvPlayer = member:GetLevel()
      local AvgLevel = 0
      if party and party:GetRealMemNum() < 2 then
        AvgLevel = party:GetAvgLevel()
      else
        AvgLevel = player:GetLevel()
      end
      local lvdiffModify = 1
      local lvdiff = math.abs(LvPlayer - AvgLevel)
      if lvdiff <= 2 then
        lvdiffModify = 1.1
      elseif lvdiff <= 4 then
        lvdiffModify = 0.9
      elseif lvdiff <= 6 then
        lvdiffModify = 0.75
      elseif lvdiff <= 10 then
        lvdiffModify = 0.55
      elseif lvdiff >= 10 then
        lvdiffModify = 0
      end
      local baseExp = (20 * AvgLevel + 10) * 6.6 * 70 / 5
      Exp = lvdiffModify * baseExp
      partnerExp = (20 * AvgLevel + 10) * 6.6 * 70 / 5
      local ItemList_zitie = {{item_id = 402840, item_name = "爱国福"}, {item_id = 402841, item_name = "富强福"}, {item_id = 402842, item_name = "和谐福"}, {item_id = 402843, item_name = "友善福"}, {item_id = 402844, item_name = "敬业福"}}
      local r = RandTable(ItemList_zitie)
      local RateJL = math.random(1, 500)
      if not actor:IsDead() and member then
        member:ChangeExpForScript(Exp, 5)
        member:GetScript():ShowError(string.format("#W战斗胜利，获得经验值%d", Exp))
        PartnerOne = actor:GetCurPartner()
        Mypartner = member:GetCurPartner()
        if Mypartner and PartnerOne and not PartnerOne:IsDead() and Mypartner:GetLevel() - member:GetLevel() < 5 then
          Mypartner:ChangeExpForScript(partnerExp, 5)
          member:GetScript():ShowError(string.format("#W同伴获得经验值%d", partnerExp))
        end
        if member:GetItems():GetFreeSlot(0) > 0 then
          item_id = 0
          if RateJL <= 50 then
           item_id = RandTable({15006, 15007, 15008, 15009})
          elseif RateJL <= 100 then
            item_id = r.item_id
          elseif RateJL <= 200 then
            item_id = RandTable({20000, 30000})
          elseif RateJL <= 0 then
            item_id = RandTable({60401, 60411, 60421, 60431, 60441, 60451, 60461, 60471, 401669})
          elseif RateJL <= 450 then
            item_id = RandTable({61300, 61300})
          end
          if item_id ~= 0 then
            member:GetItems():AddItemForScript(item_id, 1)
            member:GetScript():ShowError(string.format("#W获得%s", GetItemName(item_id)))
            member:GetScript():ShowHint(string.format("获得%s", GetItemName(item_id)))

            local r = math.random(1, 2)
            if r == 1 then
              --script:Rumor(string.format("#W %s #O，你太可恶了，竟然敢欺负到我身上来，我要用#B%s#O砸死你，砸死你！", member:GetCharNameLink(), GetItemName(item_id)), false)
            else
             -- script:Rumor(string.format("#W %s #O果然身手不凡，在与神秘小偷切磋时不仅占着上风，还把他身上的#B%s#O一下子夺走了。", member:GetCharNameLink(), GetItemName(item_id)), false)
          end
          end		
        end
      end
    end
  end
end

AddBattleTable(Bat300400)

