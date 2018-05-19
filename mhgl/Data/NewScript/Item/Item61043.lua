
Item63400 = {}
Item63400.MapUse = function(l_1_0, l_1_1)
    if not item:ReduceCount() then
      return 
    end
    player:ChangeExp(100000000)
  end


Item63400.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item63400.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item63400)

