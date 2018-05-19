
local self = {}
self.npc_id = 400801
self.name = GetNpcName(400801)
npc400801 = self
self = npc400801
self.Talk = function(self, bProcess)
  NpcAsk("#W知了知了知了......")
  SetAnswer(1, "我打")
  SetAnswer(2, "我闪")
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
          if member:GetLevel() < 50 then 
            NpcSayParty("此活动过度危险，少侠到了#G50#W级再来吧")
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
    player:EncounterBattle(400801)
    end
   end
end
self = AddNpcTable
self(npc400801)