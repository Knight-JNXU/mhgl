
local self = {}
self.npc_id = 700021
self.name = GetNpcName(700021)
npc700021 = self
self = npc700021
self.Talk = function(self, bProcess)
  NpcAsk("看什么看，劳资刚刚说的就是你们这群垃圾")
  SetAnswer(1, "怂你")
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
        if lvmax - lvmin > 20 then 
          NpcSayParty("队员等级不可超过20级")
          return false
        else
          if member:GetLevel() < 60 then 
            NpcSayParty("此活动过度危险，少侠到了#G60#W级再来吧")
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
    player:EncounterBattle(700021)
    end
   end
end
self = AddNpcTable
self(npc700021)