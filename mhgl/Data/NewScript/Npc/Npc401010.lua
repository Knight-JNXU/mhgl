
local self = {}
self.npc_id = 401010
self.name = GetNpcName(401010)
npc401010 = self
self = npc401010
self.Talk = function(self, bProcess)
  NpcAsk("你小子别特么乱说，我是个正经人")
  SetAnswer(1, "干你")
  SetAnswer(2, "看错")
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
        if lvmax - lvmin > 50 then 
          NpcSayParty("队员等级不可超过50级")
          return false
        else
          if member:GetLevel() < 20 then 
            NpcSayParty("此活动过度危险，少侠到了#G20#W级再来吧")
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
    if IsProcess() then
	  if npc then
        npc:Destroy()
      end
    player:EncounterBattle(401010)
    end
   end
end
self = AddNpcTable
self(npc401010)