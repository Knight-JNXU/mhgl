-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\NPC00395.out 

Npc000395 = {npc_id = 395, name = GetNpcName(395)}
Npc000395.Talk = function(l_1_0, l_1_1)
  NpcAsk({"欢迎前来体验节奏感!我们兄弟一定会让大家欲仙欲死!兄弟们出来赏菊花咯!"})
  SetAnswer(1, "我们是来挑战你的")
  SetAnswer(2, "打酱油")
  WaitAnswer(2)
  local answer = GetAnswer()
  if answer == 1 then
    local cardnum = 0
    if not party then
       NpcSay(string.format("#W唉，#P%s#W，你个队都不组，我劝你还是别来挑战了，听哥一句话，早点回去，洗洗睡吧！", player:GetName()))
       return 
    end
      for i = 0, party:GetCount() - 1 do
        local member = party:GetMember(i)
        local qtype = member:GetQuests():GetType(79009)
        local TotalRound79009 = 0
        if qtype ~= nil then
          TotalRound79009 = qtype:GetTotalRound()
        end
        if qtype == nil or TotalRound79009 < 150 then
          if member:GetLevel() >= 119 then
	   if player:GetLevel() < 10 or player:HasTitle(908) == false then
		ShowHint("别他妈忽悠哥，你连我前面的兄弟都没打过，别跟我玩")
		return false
		end	
          else
            NpcSayParty(string.format("#P%s#W,你连120级都不到，我实在不想出手打击你那颗脆弱而幼小的心啊！", member:GetName()))
            return 
          end
        else
          NpcSayParty(string.format("#P%s#W你烦不烦啊？我每周最多只能接受你150次挑战，明天请早吧。", member:GetName()))
          return 
        end
      end
if l_1_1 then
  for i = 0, party:GetCount() - 1 do
      --[[local member = party:GetMember(i)
      if member:GetItems():GetItemCount() > 0 then
         member:GetItems():RemoveItem()
      elseif member:GetItems():GetItemCount() > 0 then
         member:GetItems():RemoveItem()
      end]]
  end
end



if l_1_1 then
  for i = 0, party:GetCount() - 1 do
    local member = party:GetMember(i)
    local type79009 = member:GetQuests():GetType(79009)
    if qtype == nil then
      member:GetQuests():SetRoundInfo(79009, 1, 150, 1)
      type79009 = member:GetQuests():GetType(79009)
      type79009:ChangeTotalRound(1)
    else
      type79009:ChangeTotalRound(1)
    end
  end
  player:EncounterBattle(402006)
end
   end
end

AddNpcTable(Npc000395)

