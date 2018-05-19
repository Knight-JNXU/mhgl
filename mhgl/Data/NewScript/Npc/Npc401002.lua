
local self = {}
self.npc_id = 401002
self.name = GetNpcName(401002)
npc401002 = self
self = npc401002
self.Talk = function(self, bProcess)
  NpcAsk("来吧，让我看看你们这群渣渣有进步没有")
  SetAnswer(1, "干")
  SetAnswer(2, "服了")
  WaitAnswer(2, 3)
   if GetAnswer() == 1 then  
    if party then
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
        if lvmax - lvmin > 10 then 
          NpcSayParty("队员等级不可超过10级")
          return false
        else
          if member:GetLevel() < 100 then 
            NpcSayParty("此活动过度危险，少侠到了#G100#W级再来吧")
            return false
          end
        end
      end
    end
   end
        if party == nil or party:GetCount() < 0 then 
      NpcSay("请组队挑战...")
      return 
    end  
		if npc and npc:GetEnableBattle() then
			if bProcess then
				player:EncounterBattle(self.npc_id)
				if npc then
					npc:SetEnableBattle(false)
				end
			end
		else
				NpcAskParty("没看我正忙着吗，打架也要排队的！")
				SetAnswer(1,"离开")
				WaitAnswer(1)
			end
		end
  end
self = AddNpcTable
self(npc401002)