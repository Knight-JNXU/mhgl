-- 1
Quest69205 = {quest_id = 69205, type_id = 8000, type_name = "宝图任务", 
round_info = {max_round = 300, limit_round = 300, limit_type = 1}, name = "消灭强盗", 
require = {minLv = 40}, 
feature = {"cancel", "failOverTime"}, time_limit = 1800}
Quest69205.Take = function(self)
  if party then
    NpcSayParty("该任务为单人任务")
    return 
  end
  if player:GetLevel() < 29 then
    NpcSay("任务有点危险，少侠还是再去历练下再来参加考验吧（需要玩家等级≥30级才能领取该任务）。")
    return 
  end
  if player:GetQuests():HasQuest(69205) then
    NpcSay("少侠，你身上不是已经有任务了吗，快去吧，别耽误了时间。")
    return 
  end
  if player:GetQuests():GetType(self.type_id) and player:GetQuests():GetType(self.type_id):GetTotalRound() >= 300 then
    NpcSay("注意休息呀，这位大侠。（每天只能领取300次任务）")
    return 
  end
  local map_list = {1,2,6,7,8,10,11,12,19,26,28,84,20}
  local map_id = RandTable(map_list)
  local map = GetMap(map_id)
  local oneMap = {
{map_id = map_id, x1 = 10, y1 = 10, x2 = map:GetWidth() - 30, y2 = map:GetHeight() - 30}}
  local loc = RandMapLoc(oneMap)
  local npc_id = 727
  NpcSay("强盗四处作乱，你帮我去教训下他们！")
  if loc then 
    script:GenerateNPC(npc_id, loc.map_id, loc.x, loc.y, true, 1800)
    local mapName = GetMapName(loc.map_id)
    self.descript = string.format("#P30#W分钟内去#P%s（%d,%d）#W一带消灭强盗。", mapName, loc.x, loc.y)
    self.target_npc = {
{npc_id = npc_id, map_id = loc.map_id--[[, x = loc.x, y = loc.y--]]}}
 --   player:JumpMap(loc.map_id,loc.x,loc.y)
    AddQuest(self)
    return true
  end
end

Quest69205.Return = function(self, character, partnerAlive)
  if IsProcess() then
    script:SetSaying(true)
    local lv = player:GetLevel()
    local partner = player:GetCurPartner()
    local qtype = player:GetQuests():GetType(self.type_id)
    if qtype == nil then
      return false
    end
    local round = qtype:GetRound()
    local Money = math.random(10000, 20000)
    local Honor = math.random(1,2)
    local Exp = math.floor((20 * lv + 10) * 6.6 * 70 * (5 + round) / 125)
  --  player:ChangeExpForScript(Exp, 5)
    player:ChangeHonor(Honor)
    player:ChangeMoneyForScript(Money, 10035)
  --  ShowError(string.format("#W获得经验值%d", Exp))
    player:GetQuests():RemoveQuest(69205)
    ShowError(string.format("#W获得%d三界功绩", Honor))
    ShowError(string.format("#W获得银两%d", Money))
    local A = math.random(1,5)
    if A < 4 then  
      item_id = 20000
      player:GetItems():AddItemForScript(item_id, 1)
      player:GetScript():ShowError(string.format("#W获得%s", GetItemName(item_id)))
        end
  end
end
 


AddQuestTable(Quest69205)

