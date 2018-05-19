-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item61106.out 

Item61106 = {}
Item61106.MapUse = function(l_1_0, l_1_1)
  local Freeslot = player:GetItems():GetFreeSlot(0)
  local a = math.random(1, 100)
  if Freeslot < 1 then
    ShowHint("包裹空间不足，请留一个位置")
    ShowError("#W包裹空间不足，请留一个位置")
    return 
  end
  if player:GetMaxPartner() <= player:GetPartners():GetCount() then
    ShowHint("请在同伴栏留一个位置")
    ShowError("#W请在同伴栏留一个位置")
    return 
  end
  if not item:ReduceCount() then
    return 
  end
    local SecondP = math.random(1, 100)
	if SecondP <= 8 then
              local listmobid = {6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,6013,6014,6015,6016,6017,6018,6019, 7216, 7218, 7219, 7220}
              local mobid = RandTable(listmobid)
              local mobname = GetMobName(mobid)
              player:GetPartners():AddPartner(mobid)
              ShowError(string.format("#W获得%s", mobname))
              script:Rumor(string.format("#E%s 刚打开大侠福袋，只见#P%s#W从远处缓缓走来，原来是#P%s#W也是刚刚出山到江湖历练，于是对#E%s说道“不如我们一起结伴而行吧#29#29”", player:GetCharNameLink(), mobname, mobname, player:GetCharNameLink()), false)
   elseif SecondP <= 51 then
              local listmobid = {600, 601, 255, 256, 362, 600, 601, 600, 601, 6020, 6023, 255, 256, 362, 6024, 255, 256, 362, 7216, 7218, 7219, 255, 256, 362, 7220}
              local mobid = RandTable(listmobid)
              local mobname = GetMobName(mobid)
              player:GetPartners():AddPartner(mobid)
              ShowError(string.format("#W获得%s", mobname))
              script:Rumor(string.format("#E%s 刚打开大侠福袋，只见#P%s#W从远处缓缓走来，原来是#P%s#W也是刚刚出山到江湖历练，于是对#E%s说道“不如我们一起结伴而行吧#29#29”", player:GetCharNameLink(), mobname, mobname, player:GetCharNameLink()), false)
   elseif SecondP <= 100 then
              local listmobid = {5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,255,256,600,601}
              local mobid = RandTable(listmobid)
              local mobname = GetMobName(mobid)
              player:GetPartners():AddPartner(mobid)
              ShowError(string.format("#W获得%s", mobname))
              script:Rumor(string.format("#E%s 刚打开大侠福袋，只见#P%s#W从远处缓缓走来，原来是#P%s#W也是刚刚出山到江湖历练，于是对#E%s说道“不如我们一起结伴而行吧#29#29”", player:GetCharNameLink(), mobname, mobname, player:GetCharNameLink()), false)
  end
end

Item61106.CanUse = function(l_2_0, l_2_1, l_2_2)
end

Item61106.BattleUse = function(l_3_0, l_3_1, l_3_2)
end

AddItemTable(Item61106)
