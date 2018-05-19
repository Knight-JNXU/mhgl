
local self = {}
self.npc_id = 400601
self.name = GetNpcName(400601)
npc400601 = self
self = npc400601
self.Talk = function(self, bProcess)
  NpcAsk("没听过千年小妖万年老妖吗？没错，我就是千年老妖")
  SetAnswer(1, "不怕你")
  SetAnswer(2, "怕怕")
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
    player:EncounterBattle(400601)
    end
   end
end
self = AddNpcTable
self(npc400601)