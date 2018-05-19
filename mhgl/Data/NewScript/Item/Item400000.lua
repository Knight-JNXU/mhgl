-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Item400000.out 

Item400000 = {}
Item400000.MapUse = function(self, target)

  local ctm = item:GetItem_id()
  local atm = item:GetItem_id() - 399260
  local bid = ctm -350000
  if player:GetMobID() ~= 0 then
    ItemSay("已经处于变身状态中,无法进行再次变身。")
  else
    if player:GetPet_id() ~= 0 then
      ItemSay("使用坐骑时，无法变身。")
    else
      if player:GetMobID() == 0 then
        player:ChangeToMob(atm, 1)
        player:AddBuff(bid, 0, 0, 0, 60, 100)
        if not item:ReduceCount() then
          return 
        end
      else
        ItemSay("已经处于变身状态中,无法进行再次变身。2")
      end
    end
  end
end

Item400000.CanUse = function(self, user, target)
end

Item400000.BattleUse = function(self, user, target)
end

AddItemTable(Item400000)

