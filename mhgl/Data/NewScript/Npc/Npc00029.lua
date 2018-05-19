-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Npc00029.out 
Npc00029 = {npc_id = 29, name = GetNpcName(29)}
Npc00029.Talk = function(self, bProcess)
  NpcAsk("我可以送你去#R东海岩洞#W,你要不要去呢?"..RandomLine(10))
  SetAnswer(1,"是的,我要去")
  SetAnswer(2,"我还要逛逛")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    player:JumpMap(9,7,188)
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
    










AddNpcTable(Npc00029)

