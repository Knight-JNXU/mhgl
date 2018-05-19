
Bat200239 = {}
Bat200239.OnInit = function(l_1_0)
  battle:AddMob(963, 1, 120)
  battle:AddMob(964, 2, 120)
  battle:AddMob(983, 3, 120)
  battle:AddMob(960, 4, 120)
  battle:AddMob(961, 5, 120)
  battle:AddMob(962, 6, 120)
  battle:AddMob(963, 7, 120)      
end

Bat200239.OnPreTurn = function(l_2_0, l_2_1)
end

Bat200239.OnPostTurn = function(l_3_0, l_3_1)
end

Bat200239.OnFinish = function(l_4_0, l_4_1, l_4_2)
  for i = 0, battle:GetCharacterCount() - 1 do
    local actor = battle:GetCharacter(i)
    if actor ~= nil then
      local owner = actor:GetOwner()
      if owner and l_4_2 == LuaI.END_WIN and not actor:IsDead() then
      Exp = 100000
      ExpPartner = 60000
	  PvP = math.random(6, 15)
	  Money = math.random(4000, 16000)
      local buff = owner:HasBuff(218) and 2 or 1 --角色双倍经验
	  local buff1 = owner:HasBuff(219) and 2 or 1 --角色三倍经验
      local buffowner = owner:HasBuff(246) and 2 or 1 --同伴双倍经验
      local worldbuff = owner:HasBuff(254) and 2 or 1 --世界性双倍
      local buff2 = owner:HasBuff(115) and 2 or 1 --角色三倍经验
	  local buff3 = owner:HasBuff(116) and 2 or 1 --角色三倍经验	  
      owner:ChangeExp(Exp * buff1 * buff * worldbuff, 304)
	  owner:ChangePvPScoreSingle(PvP * worldbuff * buff2 * buff3)
	  owner:ChangeMoney(Money) 
      owner:GetCurPartner():ChangeExp(ExpPartner * worldbuff * buffowner, 304)
	  owner:GetScript():ShowError(string.format("#W战斗胜利，获得官职积分：#A%d", PvP * worldbuff * buff2 * buff3))
	  owner:GetScript():ShowError(string.format("#W战斗胜利，获得银两%d", Money))
      owner:GetScript():ShowError(string.format("#W战斗胜利，获得经验值%d", Exp * buff * buff1 * worldbuff))
      owner:GetScript():ShowError(string.format("#W同伴获得经验值%d", ExpPartner * worldbuff * buffowner))
    local r = battle:GetCharacterCount()
    if r == 5 then
      script:Rumor(string.format("#Y%s %s %s %s %s#O不负使命，奋勇杀敌。助我#P朝廷#O击退“#A反贼头目#O”。#R皇帝#O给与丰厚的奖赏！", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName(), battle:GetCharacter(2):GetOwner():GetName(), battle:GetCharacter(3):GetOwner():GetName(), battle:GetCharacter(4):GetOwner():GetName()), false)
    elseif r == 4 then
      script:Rumor(string.format("#Y%s %s %s %s#O不负使命，奋勇杀敌。助我#P朝廷#O击退“#A反贼头目#O”。#R皇帝#O给与丰厚的奖赏！", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName(), battle:GetCharacter(2):GetOwner():GetName(), battle:GetCharacter(3):GetOwner():GetName()), false)
    elseif r == 3 then
      script:Rumor(string.format("#Y%s %s %s#O不负使命，奋勇杀敌。助我#P朝廷#O击退“#A反贼头目#O”。#R皇帝#O给与丰厚的奖赏！", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName(), battle:GetCharacter(2):GetOwner():GetName()), false)
    elseif r == 2 then
      script:Rumor(string.format("#Y%s %s#O不负使命，奋勇杀敌。助我#P朝廷#O击退“#A反贼头目#O”。#R皇帝#O给与丰厚的奖赏！", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName()), false)
    elseif r == 1 then
      script:Rumor(string.format("#Y%s#O不负使命，奋勇杀敌。助我#O朝廷#O击退“#R反贼头目#O”。#R皇帝#O给与丰厚的奖赏！", battle:GetCharacter(0):GetOwner():GetName()), false)
      end
	  end
	end
  end

  if l_4_2 == LuaI.END_WIN and npc then
     npc:Destroy()
  end
end

Bat200239.OnEscape = function(l_5_0, l_5_1, l_5_2)
  if battle:GetplayerCount() == 0 and npc then
    npc:SetEnableBattle(true)
  end
end

AddBattleTable(Bat200239)

