-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Npc00032.out 
Npc00032 = {npc_id = 32, name = GetNpcName(32)}
Npc00032.Talk = function(self, bProcess)
  NpcAsk("我可以送你去#R东海龙宫#W,你要不要去呢?"..RandomLine(10))
  SetAnswer(1,"是的,我要去")
  SetAnswer(2,"我还要逛逛")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if player:GetLevel() < 10 then
      NpcSay("低于10级,不敢传送")
      return
    end
    player:JumpMap(21,12,260)
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end




    










AddNpcTable(Npc00032)

