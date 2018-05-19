-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Npc000727.out 

Preload("Quest69205.lua")
Npc000727 = {npc_id = 000727, name = GetNpcName(000727)}
Npc000727.Talk = function(self, bProcess)
  if player:GetQuests():HasQuest(69205) then
    local quest69205 = player:GetQuests():GetQuest(69205)
    if quest69205 ~= nil and npc:GetCreaterCharId() == player:GetChar_id() then
      local tx = npc:GetCurPosX()
      local ty = npc:GetCurPosX()
      local x = player:GetCurPosX()
      local y = player:GetCurPosY()
      if PosInRange(tx, ty, x, y, 4) then
        NpcAsk("哼哼,打劫,把钱拿出来~~~~"..RandomLine(10))
        SetAnswer(1, "好，本大侠就替天行道了")
        SetAnswer(2, "我路过打酱油的~")
        WaitAnswer(2)
        if GetAnswer() == 1 and IsProcess() then
          player:EncounterBattle(727)
        end
      else
        NpcAsk("这么远对别人说话可是不礼貌的行为哟"..RandomLine(10))
        SetAnswer(1,"离开")
        WaitAnswer(1)
      end
	else
	  NpcAsk("你是什么人,敢来打扰我？"..RandomLine(10))
      SetAnswer(1,"离开")
      WaitAnswer(1)
    end
  else
    NpcAsk("你是什么人,敢来打扰我？"..RandomLine(10))
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end

AddNpcTable(Npc000727)

