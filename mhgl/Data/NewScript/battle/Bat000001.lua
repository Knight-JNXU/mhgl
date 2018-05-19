-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Bat000002.out 

Preload("Quest96001.lua")
Bat000001 = {}
Bat000001.OnInit = function(self)

  local num1 = 5 - battle:GetCharacterCount()
  local num2 = battle:GetCharacterCount() + 5
  if num1 > 0 and num2 < 10 then
    for i = 1, num1 do
      if player:HasBuff(264) then
        battle:AddGuest(145, i)
      else
        if player:HasBuff(265) then
          battle:AddGuest(142, i)
        else
          if player:HasBuff(266) then
            battle:AddGuest(426, i)
          end
        end
      end
    end
    for i = num2, 9 do
      if player:HasBuff(264) then
        battle:AddGuest(145, i)
      else
        if player:HasBuff(265) then
          battle:AddGuest(142, i)
        else
          if player:HasBuff(266) then
            battle:AddGuest(426, i)
          end
        end
      end
    end
  end
end

Bat000001.OnPreTurn = function(self, turn)
  if player:HasBuff(264) or player:HasBuff(265) or player:HasBuff(266) or player:HasBuff(267) or player:HasBuff(268) or player:HasBuff(269) or player:HasBuff(270) or player:HasBuff(271) or player:HasBuff(272) or player:HasBuff(273) or player:HasBuff(274) then
    battle:DisableCmd(LuaI.BATCMD_HELP)
  end
end

Bat000001.OnPostTurn = function(self, turn)
end

Bat000001.OnFinish = function(self, turn, result)

   
  if result == LuaI.END_WIN then
  --  Quest96001:Return(0)
  end
end

AddBattleTable(Bat000001)

