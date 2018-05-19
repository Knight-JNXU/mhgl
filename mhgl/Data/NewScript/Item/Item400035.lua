-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Item400035.out 

Item400035 = {}
Item400035.MapUse = function(self, target)
  if player:GetSkillLv(9778) < 5 then
    ItemSay("变化之术不够,不能使用")
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
        player:ChangeToMob(773, 1)
        player:AddBuff(bid, 0, 0, 0, 60, 100)
        player:AddBuff(21015, 0, 0, 0, 60, 100)
        if not item:ReduceCount() then
          return 
        end
      else
        ItemSay("已经处于变身状态中,无法进行再次变身。2")
      end
    end
  end
end

Item400035.CanUse = function(self, user, target)
end

Item400035.BattleUse = function(self, user, target)
end

AddItemTable(Item400035)

