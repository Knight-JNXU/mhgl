
local self = {}
self.npc_id = 404001
self.name = GetNpcName(404001)
npc404001 = self
self = npc404001
self.Talk = function(self, bProcess)
  NpcAsk("#W哎呀，人家的小宠物跑掉了，你能帮我抓回来吗？")
  SetAnswer(1, "交给我啦")
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
        if lvmax - lvmin > 30 then 
          NpcSayParty("队员等级不可超过30级")
          return false
        else
          if member:GetLevel() < 100 then 
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
    player:EncounterBattle(404001)
    end
   end
end
self = AddNpcTable
self(npc404001)