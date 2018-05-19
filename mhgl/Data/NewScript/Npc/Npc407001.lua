-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\NPC00395.out 

Npc000395 = {npc_id = 395, name = GetNpcName(395)}
Npc000395.Talk = function(l_1_0, l_1_1)
  NpcAsk({"身手不错，让你三招"})
  SetAnswer(1, "来吧")
  SetAnswer(2, "打酱油")
  WaitAnswer(2)
  local answer = GetAnswer()
  if answer == 1 then
    local cardnum = 0
    if not party then
       NpcSay(string.format("#W唉，#P%s#W，你队都不组，我劝你还是别来挑战了，早点回去，洗洗睡吧！", player:GetName()))
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
          if member:GetLevel() >= 69 then
            if member:GetItems():GetItemCount(402910) > 0 or member:GetItems():GetItemCount(402910) > 0 then
              cardnum = cardnum + 1
            else
              NpcSayParty(string.format("#W先去找芭蕉树妖玩一把再来,#P%s#W似乎没有去吧。", member:GetName()))
			  return
            end
          else
            NpcSayParty(string.format("#P%s#W,你连69级都不到，我实在不想出手打击你那颗脆弱而幼小的心啊", member:GetName()))
            return 
          end
        else
          NpcSayParty(string.format("#P%s#W你烦不烦啊？我每天最多只能接受你1次挑战，明天请早吧。", member:GetName()))
          return 
        end
      end
if l_1_1 then
  for i = 0, party:GetCount() - 1 do
      local member = party:GetMember(i)
      if member:GetItems():GetItemCount(402910) > 0 then
         member:GetItems():RemoveItem(402910)
      elseif member:GetItems():GetItemCount(402910) > 0 then
         member:GetItems():RemoveItem(402910)
      end
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
  player:EncounterBattle(407001)
end
   end
end

AddNpcTable(Npc000395)

