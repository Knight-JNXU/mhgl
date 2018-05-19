-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Quest96001.out 

Preload("Quest20002.lua")
Preload("Quest22017.lua")
Preload("Quest22011.lua")
Quest96001 = {quest_id = 96001, type_name = "野外战斗奖励", addMob = true, kill = false, weizhi = 0, catch = false, MobIsExist = false}
Quest96001.Take = function(self)
end

Quest96001.Return = function(self, OtherId)
  local RYear = LuaI.GetRealYear(LuaI.GetServiceTime())
  local RMonth = LuaI.GetRealMonth(LuaI.GetServiceTime())
  local RDay = LuaI.GetRealDay(LuaI.GetServiceTime())
  for i = 0, battle:GetCharacterCount() - 1 do
    local actor = battle:GetCharacter(i)
    local num = 0
    local level = {[2] = 1, [3] = 4, [4] = 4, [6] = 10, [8] = 37, [9] = 5, [12] = 34, [14] = 25, [18] = 37, [19] = 19, [22] = 26, [23] = 36, [49] = 30, [50] = 37, [51] = 41}
    local map = actor:GetOwner():GetMap_id()
    if level[map] ~= nil and level[map] + 10 <= actor:GetLevel() and not actor:IsDead() then
      local justice = 0
      for t = 0, battle:GetCharacterCount() - 1 do
        local member = battle:GetCharacter(t)
        local Lv = member:GetLevel() + 1
        local Exp = member:GetOwner():GetExp()
        local result = 0
        if Lv >= 1 and Lv <= 10 then
          result = 0.03 * Lv - 0.02
        elseif Lv >= 11 and Lv <= 20 then
          result = 0.166 * Lv - 1.38
        elseif Lv >= 21 and Lv <= 30 then
          result = 0.084 * Lv + 0.26
        elseif Lv >= 31 and Lv <= 40 then
          result = 0.404 * Lv - 9.34
        elseif Lv >= 41 and Lv <= 50 then
          result = 0.736 * Lv - 22.62
        elseif Lv >= 51 and Lv <= 60 then
          result = 0.516 * Lv - 11.62
        elseif Lv >= 61 and Lv <= 70 then
          result = 1.077 * Lv - 45.28
        elseif Lv >= 71 and Lv <= 80 then
          result = 0.267 * Lv + 11.42
        elseif Lv >= 81 and Lv <= 90 then
          result = 0.738 * Lv - 26.26
        end
        result = (result) * 6.6 * 70 * (4 * Lv + 10) + 100
        if level[map] - 3 <= Lv - 1 and Lv - 1 <= level[map] + 5 and Lv - 1 < 40 and Exp < result then
          if Lv - 1 < 10 then
            justice = 1
          elseif Lv - 1 < 20 then
            justice = 2
          elseif Lv - 1 < 30 then
            justice = 3
          else
            justice = 4
          end
          actor:GetOwner():ChangeGoodnessForScript(justice, 44)
          num = num + justice
        else
          if level[map] - 3 <= Lv - 1 and Lv - 1 <= level[map] + 5 and Lv - 1 < 40 and result <= Exp then
            ShowMessage(string.format("#W%s当前经验已满，无法获得善恶点#24", member:GetOwner():GetName()), actor:GetOwner())
          end
        end
      end
      if num ~= 0 then
        ShowHint(string.format("帮助新手有功，获得%d善恶点#46", num), actor)
      end
    end
  end
end

AddQuestTable(Quest96001)

