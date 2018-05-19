-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\梦幻古龙，修改NPC对话！教程+工具\Quest55101.out 

local l_0_0 = {}
l_0_0.quest_id = 55101
l_0_0.type_id = 551
l_0_0.type_name = "\229\187\186\232\174\190\228\187\187\229\138\161"
local l_0_1 = {}
l_0_1.max_round = 10
l_0_1.limit_type = 1
l_0_0.round_info = l_0_1
l_0_0.name = "\228\188\151\228\186\186\231\155\184\229\138\169"
l_0_1 = {"cancel"}
l_0_0.feature = l_0_1
l_0_0.time_mark = 551
Quest55101 = l_0_0
l_0_0 = Quest55101
l_0_1 = function(l_1_0)
  if player:GetQuests():HasQuest(55101) or player:GetQuests():HasQuest(55102) or player:GetQuests():HasQuest(55103) then
    NpcSay("\229\183\178\230\156\137\229\187\186\232\174\190\228\187\187\229\138\161\239\188\140\230\151\160\230\179\149\233\162\134\229\143\150\228\187\187\229\138\161\227\128\130")
    return 
  end
  if player:GetLevel() < 30 then
    NpcSay("\228\184\141\232\182\17930\231\186\167\239\188\140\230\151\160\230\179\149\233\162\134\229\143\150\228\187\187\229\138\161\227\128\130")
    return 
  end
  if player:HasGuild() == false then
    NpcSay("\230\151\160\229\184\174\228\186\186\229\163\171\230\152\175\230\128\142\228\185\136\232\191\155\230\157\165\231\154\132\239\188\159")
  end
  if player:GetQuests():TimeMarkOver(551, 1) == false then
    NpcSay("\229\143\150\230\182\136\228\187\187\229\138\161\228\184\141\232\182\1791\229\136\134\233\146\159\239\188\140\230\151\160\230\179\149\233\162\134\229\143\150\228\187\187\229\138\161\227\128\130")
    return 
  end
  if not IsProcess() then
    return true
  end
  script:SetSaying(true)
  local npcList = {{npc_id = 302, map_id = 34, tip = ""}, 
  {npc_id = 303, map_id = 34, tip = ""},
  {npc_id = 310, map_id = 34, tip = ""}, 
  {npc_id = 317, map_id = 34, tip = ""}, 
  {npc_id = 323, map_id = 34, tip = ""}, 
  {npc_id = 26, map_id = 1, tip = ""}, 
  {npc_id = 10, map_id = 1, tip = ""}, 
  {npc_id = 17, map_id = 1, tip = ""}, 
  {npc_id = 49, map_id = 6, tip = ""}, 
  {npc_id = 80, map_id = 10, tip = ""}, 
  {npc_id = 203, map_id = 20, tip = ""}, 
  {npc_id = 230, map_id = 26, tip = ""}}
  for i = 0, 500 do
    local r1 = RandTable(npcList)
    local r2 = RandTable(npcList)
    if r1 ~= r2 then
    
      local npcName1 = GetNpcName(r1.npc_id)
      local npcName2 = GetNpcName(r2.npc_id)
      local mapName1 = GetMapName(r1.map_id)
      local mapName2 = GetMapName(r2.map_id)
      local tips1 = r1.tip
      local tips2 = r2.tip
      NpcSay("\229\177\177\229\186\132\233\135\140\228\191\174\229\187\186\230\136\191\229\177\139\228\186\186\230\137\139\228\184\141\232\182\179\239\188\140\228\189\160\229\142\187\230\137\190\231\130\185\228\186\186\230\157\165\229\184\174\229\191\153\229\144\167\227\128\130")
      l_1_0.descript = string.format("\228\186\186\229\164\154\229\138\155\233\135\143\229\164\167\227\128\130\229\142\187#P%s#W\229\146\140#P%s#W\230\137\190#A%s#W\229\146\140#A%s#W\229\184\174\229\191\153\228\184\128\232\181\183\228\191\174\229\187\186\229\177\177\229\186\132\229\144\167\227\128\130##%s %s", mapName1, mapName2, npcName1, npcName2, tips1, tips2)
      l_1_0.end_npc = {npc_id = npc:GetNpc_id(), map_id = npc:GetMap_id()}
      l_1_0.target_npc = {r1, r2}
      AddQuest(l_1_0)
      return 
    end
  end
end

l_0_0.Take = l_0_1
l_0_0 = Quest55101
l_0_1 = function(l_2_0)
  if not QuestCompleted(l_2_0) then
    NpcSay("\228\186\164\231\187\153\228\189\160\231\154\132\228\186\139\230\131\133\233\131\189\229\138\158\229\165\189\228\186\134\229\144\151\239\188\159")
    return false
  end
  if IsProcess() then
    script:SetSaying(true)
    local Guild = player:GetGuild()
    local QuestTime = GetGlobalNpcFlag(773, player:GetGuildUid(), 1)
    SetGlobalNpcFlag(773, player:GetGuildUid(), 1, QuestTime + 1)
    local qtype = player:GetQuests():GetType(l_2_0.type_id)
    if qtype == nil then
      return false
    end
    local round = qtype:GetRound()
    local quest = player:GetQuests():GetQuest(l_2_0.quest_id)
    local freeSlot = player:GetItems():GetFreeSlot(0)
    local lv = player:GetLevel()
    local Exp = 0.5 * (4 * lv + 10) * 6.6 * 70 * (1.2 + 1.6 * round) / 3--取消除以/ 100
    local doubleRound = 1
  	local GuildDonate = 20
    if round < 7 then
      GuildDonate = 20
    else
		  GuildDonate = round + 20
		end

    local chunjie = 1
    if player:HasBuff(501) then
      chunjie = 2
    end
    if player:HasBuff(279) then
      GuildDonate = GuildDonate * 2 --帮贡翻5倍
    else
      if player:HasBuff(300) then
        GuildDonate = GuildDonate * 3 --帮贡翻5倍
      end
    end
    player:ChangeExpForScript(Exp, 4)
    player:ChangeGDonateForScript(GuildDonate * chunjie, 4)
    NpcSay(string.format("\229\129\154\231\154\132\229\190\136\229\165\189\239\188\140\229\165\150\229\138\177\228\189\160#P%d#W\231\130\185\231\187\143\233\170\140\229\146\140#P%d#W\229\184\174\232\180\161\227\128\130", Exp, GuildDonate * chunjie))
    ShowError(string.format("#W\232\142\183\229\190\151\231\187\143\233\170\140\229\128\188%d\239\188\140\229\184\174\232\180\161%d", Exp, GuildDonate * chunjie))
    if Guild:GetArtifactType() == 2 and round == 10 then
      player:ChangeGDonateForScript(600, 4)
      ShowError("#W\229\143\151\231\165\158\229\153\168\229\189\177\229\147\141\239\188\140\231\172\172\229\141\129\230\172\161\228\187\187\229\138\161\232\142\183\229\190\151\233\162\157\229\164\150\229\184\174\232\180\161\229\165\150\229\138\177600")
    end
    RemoveQuest(l_2_0)
    player:GetQuests():RemoveTimeMark(551)
    local Msg = "\230\151\160"
    local Type = Guild:GetBuildSwitch()
    local Lv = 5
    local Finish = Guild:GetBuildProcess()
    local Total = 0
    local change = 0
    if round < 6 then
      change = 30
    elseif round < 9 then
      change = 50
    else
      change = 80
    end
    if Type == 1 then
      Msg = "\228\185\166\233\153\162"
      Lv = Guild:GetCollege()
      GetManorBuildCollegeProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    elseif Type == 2 then
      Msg = "\229\142\162\230\136\191"
      Lv = Guild:GetRoom()
      GetManorBuildRoomProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    elseif Type == 3 then
      Msg = "\233\135\145\229\186\147"
      Lv = Guild:GetCoffers()
      GetManorBuildCoffersProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    elseif Type == 4 then
      Msg = "\229\155\155\231\155\184\230\136\191"
      Lv = Guild:GetElement()
      GetManorBuildElementProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    elseif Type == 5 then
      Msg = "\231\166\143\229\136\169\230\136\191"
      Lv = Guild:GetBoon()
      GetManorBuildBoonProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    elseif Type == 6 then
      Msg = "\228\191\174\231\130\188\230\136\191"
      Lv = Guild:GetTrain()
      GetManorBuildTrainProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    elseif Type == 7 then
      Msg = "\229\177\177\229\186\132\232\167\132\230\168\161"
      Lv = Guild:GetManorScale()
      GetManorBuildScaleProcess(Lv, Guild)
      Total = LuaI.GetTempResult()
    else
      player:GetScript():ShowError("#W\229\177\177\229\186\132\229\187\186\232\174\190\228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144")
      return 
    end
    if Total <= Finish + change then
      if Type == 1 then
        Guild:ChangeCollege(1, 0)
        player:GetScript():ShowError("#W\228\185\166\233\153\162\230\136\144\229\138\159\229\141\135\231\186\167")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\228\185\166\233\153\162\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d\227\128\130", Guild:GetCollege() + 1))
      elseif Type == 2 then
        Guild:ChangeRoom(1)
        player:GetScript():ShowError("#W\229\142\162\230\136\191\230\136\144\229\138\159\229\141\135\231\186\167")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\229\142\162\230\136\191\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d", Guild:GetRoom() + 1))
      elseif Type == 3 then
        Guild:ChangeCoffers(1)
        player:GetScript():ShowError("#W\233\135\145\229\186\147\230\136\144\229\138\159\229\141\135\231\186\167")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\233\135\145\229\186\147\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d", Guild:GetCoffers() + 1))
      elseif Type == 4 then
        Guild:ChangeElement(1, 0)
        player:GetScript():ShowError("#W\229\155\155\231\155\184\230\136\191\230\136\144\229\138\159\229\141\135\231\186\167")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\229\155\155\231\155\184\230\136\191\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d", Guild:GetElement() + 1))
      elseif Type == 5 then
        Guild:ChangeBoon(1, 0)
        player:GetScript():ShowError("#W\231\166\143\229\136\169\230\136\191\230\136\144\229\138\159\229\141\135\231\186\167")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\231\166\143\229\136\169\230\136\191\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d", Guild:GetBoon() + 1))
      elseif Type == 6 then
        Guild:ChangeTrain(1, 0)
        player:GetScript():ShowError("#W\228\191\174\231\130\188\230\136\191\230\136\144\229\138\159\229\141\135\231\186\167")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\228\191\174\231\130\188\230\136\191\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d", Guild:GetTrain() + 1))
      elseif Type == 7 then
        local newScaleLv = Guild:GetManorScale() + 1
        Guild:SetNewManorScale(newScaleLv)
        player:GetScript():ShowError("#W\229\177\177\229\186\132\232\167\132\230\168\161\230\136\144\229\138\159\230\143\144\229\141\135")
        Guild:SendGuildMessage(string.format("\233\128\154\232\191\135\229\164\167\229\174\182\231\154\132\229\138\170\229\138\155\229\187\186\232\174\190\239\188\140\229\177\177\229\186\132\232\167\132\230\168\161\233\161\186\229\136\169\230\143\144\229\141\135\232\135\179%d", newScaleLv + 1))
      else
        player:GetScript():ShowError("#W\229\177\177\229\186\132\229\187\186\232\174\190\228\187\187\229\138\161\229\183\178\231\187\143\229\174\140\230\136\144\228\186\134\227\128\130")
        return 
      end
      Guild:ChangeBuild(-Finish, 0)
    else
      Guild:ChangeBuild(change, Type)
      player:GetScript():ShowError(string.format("#W\229\189\147\229\137\141\229\187\186\231\173\145\232\191\155\229\186\166\229\162\158\229\138\160%d", change))
    end
    if round == 10 then
      if Guild:GetManorScale() == 1 then
        player:ChangeGDonateForScript(280, 4)
        ShowError("#W\229\174\140\230\136\14410\230\172\161\229\187\186\231\173\145\228\187\187\229\138\161\239\188\140\233\162\157\229\164\150\232\142\183\229\190\151\229\184\174\232\180\161280")
      else
        if Guild:GetManorScale() == 2 then
          player:ChangeGDonateForScript(220, 4)
          ShowError("#W\229\174\140\230\136\14410\230\172\161\229\187\186\231\173\145\228\187\187\229\138\161\239\188\140\233\162\157\229\164\150\232\142\183\229\190\151\229\184\174\232\180\161220")
        else
          if Guild:GetManorScale() == 3 then
            player:ChangeGDonateForScript(160, 4)
            ShowError("#W\229\174\140\230\136\14410\230\172\161\229\187\186\231\173\145\228\187\187\229\138\161\239\188\140\233\162\157\229\164\150\232\142\183\229\190\151\229\184\174\232\180\161160")
          else
            if Guild:GetManorScale() == 4 then
              player:ChangeGDonateForScript(100, 4)
              ShowError("#W\229\174\140\230\136\14410\230\172\161\229\187\186\231\173\145\228\187\187\229\138\161\239\188\140\233\162\157\229\164\150\232\142\183\229\190\151\229\184\174\232\180\161100")
            else
              if Guild:GetManorScale() == 5 then
                ShowError("#W\228\186\148\231\186\167\229\177\177\229\186\132\230\151\160\230\179\149\232\142\183\229\190\15110\230\172\161\229\187\186\232\174\190\228\187\187\229\138\161\229\165\150\229\138\177\231\154\132\233\162\157\229\164\150\229\184\174\232\180\161")
              end
            end
          end
        end
      end
      Guild:SendGuildMessage(string.format("#G %s #G\229\155\155\229\164\132\229\165\148\230\179\162\239\188\140\228\184\186\229\184\174\233\135\140\229\174\140\230\136\14410\230\172\161\229\187\186\232\174\190\228\187\187\229\138\161\227\128\130", player:GetCharNameLink()))
    end
    if qtype:GetMaxRound() <= round then
      qtype:SetRound(0)
    end
    player:ChangeProffer(0, 0, 1, 0, 0)
  end
end

l_0_0.Return = l_0_1
l_0_0 = AddQuestTable
l_0_1 = Quest55101
l_0_0(l_0_1)