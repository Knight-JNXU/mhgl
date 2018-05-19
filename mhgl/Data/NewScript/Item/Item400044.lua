-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Item400044.out 

Item400044 = {}
Item400044.MapUse = function(self, target)
  if player:GetSkillLv(9778) < 10 then
    ItemSay("变化之术不够10级,不能使用")
    return
  end
  local ctm = item:GetItem_id()
  local bid = ctm -350000
  if player:GetMobID() ~= 0 then
    ItemSay("已经处于变身状态中,无法进行再次变身。")
  else
    if player:GetPet_id() ~= 0 then
      ItemSay("使用坐骑时，无法变身。")
    else
      if player:GetMobID() == 0 then
        player:ChangeToMob(784, 1)
        player:AddBuff(bid, 0, 0, 0, 60, 100)
        player:AddBuff(21022, 0, 0, 0, 60, 100)
        if not item:ReduceCount() then
          return 
        end
      else
        ItemSay("已经处于变身状态中,无法进行再次变身。2")
      end
    end
  end
end

Item400044.CanUse = function(self, user, target)
end

Item400044.BattleUse = function(self, user, target)
end

AddItemTable(Item400044)

