--擂台麒麟


Bat700046 = {}
Bat700046.OnInit = function(l_1_0)
  battle:AddMob(1310, 2,89)
  battle:AddMob(1309, 3,129)
  battle:AddMob(1309, 4,139)
  battle:AddMob(1308, 5,149)  
  battle:AddMob(1308, 6,129)   
   battle:AddMob(1308, 7,139) 
   battle:AddMob(1308, 8,149) 
  battle:AddMob(1308, 9,159) 
   battle:AddMob(1308, 1,139)  
end

Bat700046.OnPreTurn = function(self, turn)
end

Bat700046.OnPostTurn = function(self, turn)
end

Bat700046.OnFinish = function(self, turn, result)
  for i = 0, battle:GetCharacterCount() - 1 do
    local actor = battle:GetCharacter(i)
    if actor ~= nil then
      local owner = actor:GetOwner()
      if owner and result == LuaI.END_WIN and not actor:IsDead() then
        owner:AddTitle(RandTable({1000}))
				player:RemoveTitle(999)
        ShowMessage("#W战斗胜利", actor:GetOwner())
        local freeSlot = owner:GetItems():GetFreeSlot(0)
        if freeSlot > 0 then
          --ShowMessage("#W获得金铁x5", actor:GetOwner())
         
        end
      end
    end
  end
              local r = battle:GetCharacterCount()
            if r == 5 then
            script:Rumor(string.format("#W%s %s  %s  %s %s#O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，让我们期待他们接下来的的表演", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName(), battle:GetCharacter(2):GetOwner():GetName(), battle:GetCharacter(3):GetOwner():GetName(), battle:GetCharacter(4):GetOwner():GetName()), false)
        elseif r == 4 then
            script:Rumor(string.format("#W%s %s  %s  %s #O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，让我们期待他们接下来的的表演", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName(), battle:GetCharacter(2):GetOwner():GetName(), battle:GetCharacter(3):GetOwner():GetName()), false)
        elseif r == 3 then
            script:Rumor(string.format("#W%s %s  %s#O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，让我们期待他们接下来的的表演", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName(), battle:GetCharacter(2):GetOwner():GetName()), false)
        elseif r == 2 then
            script:Rumor(string.format("#W%s %s#O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，让我们期待他们接下来的的表演", battle:GetCharacter(0):GetOwner():GetName(), battle:GetCharacter(1):GetOwner():GetName()), false)
        elseif r == 1 then
            script:Rumor(string.format("#W%s#O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，让我们期待他们接下来的的表演", battle:GetCharacter(0):GetOwner():GetName()), false)
            end
	  if math.random(1, 1) then
    local r = math.random(0, 1)
    local actor = battle:GetCharacter(r)
    if actor then
      local owner = actor:GetOwner()
      if owner and not actor:IsDead() then
        local freeSlot = owner:GetItems():GetFreeSlot(0)
        if freeSlot > 1 then
          local SecondP = math.random(1, 100)
          if SecondP <= 50 then
local ItemList = {61026,61027,61028,61029,61030,61031,61032,61033,15000,60333,60330}
            local ItemId = RandTable(ItemList)
            ShowMessage(string.format("#W获得%s", GetItemName(ItemId)), actor:GetOwner())
            script:Rumor(string.format("#W%s#O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，得到举办方嘉奖#Y%s#O一个", owner:GetName(), GetItemName(ItemId)), false)
            owner:GetItems():AddItem(ItemId, 1)
			elseif SecondP <= 70 then
            local ItemList = {15006,15007,15008,15009,20001,30001,60416,60426,60436,60446,60456,60466,60476,60486}
            local ItemId = RandTable(ItemList)
            ShowMessage(string.format("#W获得%s", GetItemName(ItemId)), actor:GetOwner())
            script:Rumor(string.format("#W%s#O在#R水陆大会#O上英勇的消灭前来破坏的妖怪，得到举办方嘉奖#Y%s#O一个", owner:GetName(), GetItemName(ItemId)), false)
            owner:GetItems():AddItem(ItemId, 1)
          end
        end
      end
    end
  end		
  if result == LuaI.END_WIN and npc then
   -- npc:Destroy()
    do return end
    if result == LuaI.END_LOSE and npc then
      npc:SetEnableBattle(true)
    end
  end
end

Bat700046.OnEscape = function(self, turn, actor)
  if battle:GetCharacterCount() == 0 and npc then
    npc:SetEnableBattle(true)
  end
end


AddBattleTable(Bat700046)
