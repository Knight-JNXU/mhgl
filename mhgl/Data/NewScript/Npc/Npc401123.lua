
local self = {}
self.npc_id = 401123
self.name = GetNpcName(401123)
npc401123 = self
self = npc401123
self.Talk = function(self, bProcess)
  NpcAsk("我们就是来送福利的，别说我不给你们机会，第一回先让你们准备下")
  SetAnswer(1, "来吧")
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
          if member:GetLevel() < 30 then 
            NpcSayParty("此活动过度危险，少侠到了#G30#W级再来吧")
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
    player:EncounterBattle(401123)
    end
   end
end
self = AddNpcTable
self(npc401123)