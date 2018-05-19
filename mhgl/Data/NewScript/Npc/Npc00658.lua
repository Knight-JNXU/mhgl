--邪教护法NPC
--北方

Npc00658 = {							-- 邪教护法
	npc_id = 658,						-- NPC ID
	name = GetNpcName(658),				-- NPC 名称
}

function Npc00658:Talk(bProcess)
  local npclv
	NpcAsk("看什么看？再看把你剁成肉酱！")
  SetAnswer(1, "废话少说，看打！")
  SetAnswer(2, "我是路过的")
  WaitAnswer(2)
  if GetAnswer() == 1 then
	  if party == nil or party:GetRealMemNum() < 3 then
	    NpcSayParty("就这么一丁点人,我才懒得动手")
			return false
		else
		  local map = player:GetMap_id()
		  if map == 1 then
		    npclv = 10 
		  elseif map == 7 then
		    npclv = 65
		  elseif map == 8 then
		    npclv = 35
		  elseif map == 11 then
		    npclv = 85
		  elseif map == 12 then
		    npclv = 65
		  elseif map == 14 then
		    npclv = 45
		  elseif map == 19 then
	      npclv = 25
	    elseif map == 84 then
	      npclv = 75
	    elseif map == 86 then
	      npclv = 75
	    elseif map == 6 then
	      npclv = 15
	    end
		  if party:GetInPartyMember(0):GetLevel() < npclv then
				ShowError("你算什么东西,也来挑战我#80!")
				return false
			end
			local lvmin = player:GetLevel()
			local lvmax = player:GetLevel()
			for i = 0, party:GetCount() - 1 do
			  local member = party:GetMember(i)
        if member then
          local lv = member:GetLevel()
          if lv < lvmin then
            lvmin = lv
          elseif lvmax < lv then
            lvmax = lv
          end
          if lvmax - lvmin > 10 then --（队员之间等级不能超相差10级）
            NpcSayParty("队员之间等级不能相差10级")
            return false
          end
        end
      end
			if npc and npc:GetEnableBattle() then
				if bProcess then
					player:EncounterBattle(self.npc_id)
					if npc then
						npc:SetEnableBattle(false)
					end
				end
			else
				ShowError("别急，等会就轮到你了，先登记吧。#89")
			end
		end
  end
end

AddNpcTable(Npc00658)
