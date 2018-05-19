-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: D:\Server\Data\NewScript\NPC00395.out 

Npc000395 = {npc_id = 395, name = GetNpcName(395)}
Npc000395.Talk = function(l_1_0, l_1_1)
  NpcAsk({"小子你赶紧给我滚开，小心干掉你"})
  SetAnswer(1, "我们来试试")
  SetAnswer(2, "我打酱油的")
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
        local qtype = member:GetQuests():GetType(700)
        local TotalRound700 = 0
        if qtype ~= nil then
          TotalRound700 = qtype:GetTotalRound()
        end
        if qtype == nil or TotalRound700 < 150 then
          if member:GetLevel() >= 110 then
            if member:GetItems():GetItemCount(402901) > 0 or member:GetItems():GetItemCount(402901) > 0 then
              cardnum = cardnum + 1
            else
              NpcSayParty(string.format("#W我看#P%s#W似乎不是本次的邀请人。", member:GetName()))
			  return
            end
          else
            NpcSayParty(string.format("#P%s#W,你连110级都不到，我实在不想出手打击你那颗脆弱而幼小的心啊！", member:GetName()))
            return 
          end
        else
          NpcSayParty(string.format("#P%s#W你烦不烦啊？我每天最多只能接受你150次挑战，明天请早吧。", member:GetName()))
          return 
        end
      end
if l_1_1 then
  for i = 0, party:GetCount() - 1 do
      local member = party:GetMember(i)
      if member:GetItems():GetItemCount(402901) > 0 then
         member:GetItems():RemoveItem(402901, 99)
      elseif member:GetItems():GetItemCount(402901) > 0 then
         member:GetItems():RemoveItem(402901, 99)
      end
  end
end



if l_1_1 then
  for i = 0, party:GetCount() - 1 do
    local member = party:GetMember(i)
    local type700 = member:GetQuests():GetType(700)
    if qtype == nil then
      member:GetQuests():SetRoundInfo(700, 1, 150, 1)
      type700 = member:GetQuests():GetType(700)
      type700:ChangeTotalRound(1)
    else
      type700:ChangeTotalRound(1)
    end
  end
  player:EncounterBattle(403011)
end
   end
end

AddNpcTable(Npc000395)

