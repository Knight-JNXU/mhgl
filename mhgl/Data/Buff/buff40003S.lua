--外挂检查脚本
function buff40003Repeat(buff, Char, finish)
  -- 检测人物属性
  local lv = Char:GetLevel();
  local A = Char:GetSTA();
  local B = Char:GetSPR(); 
  local C = Char:GetSTR();
  local D = Char:GetCON();
  local E = Char:GetAGI();
  local VV = A + B + C + D + E
  local F = 0
  if lv < 10 then
      F = 60 + (lv * 10) + 200 
  elseif lv < 30 then
      F = 60 + (lv * 10) + 500
  elseif lv < 50 then
      F = 60 + (lv * 10) + 800
  elseif lv < 60 then
      F = 60 + (lv * 10) + 1200
  elseif lv < 70 then
      F = 60 + (lv * 10) + 1800
  elseif lv < 80 then
      F = 60 + (lv * 10) + 2200
  elseif lv < 90 then
      F = 60 + (lv * 10) + 3200
  elseif lv < 100 then
      F = 60 + (lv * 10) + 4500
  elseif lv <= 110 then
      F = 60 + (lv * 10) + 6000
  elseif lv > 110 then
      F = 60 + (lv * 10) + 8000
  end
  local flag = Char:GetQuests():GetFlag(58585)
  local PKValue = Char:GetPK_Value()
  if flag ~= 0 then
    Char:ResetCharLevel(lv);
    Char:JumpMap(252, 30, 50);
    local pet = Char:GetCurPartner()
	pet:ResetLevel(pet:GetLevel());
    return
  end
  if F < VV then 
    local msg = ("#Y【反外挂模块:】#P系统检测出您的属性点不正常，现在将你传送牢狱。#G系统即将对您封号处理。")
    Char:ShowAwardMsg(msg);
    Char:JumpMap(252, 30, 50);
    Char:GetQuests():SetFlag(58585, 1)
    Char:AddBuff(275, 0, 0, 0, 60, 100)
    Char:SetPK_Value(PKValue + 10)
	Char:ResetCharLevel(lv);
    return
  end
  -- 检测人物最终属性
  local CAtk = Char:GetATK()
  local CDef = Char:GetDEF()
  local CSpd = Char:GetSPD()
  local CPow = Char:GetPOW()
  local CHp = Char:GetHP()
  local CMHp = Char:GetMHP()
  local CMaxHp = Char:GetMaxHP()
  local Ban = 0
  if CAtk > 120000 then Ban = 1 end
  if CDef > 80000 then Ban = 1 end
  if CSpd > 30000 then Ban = 1 end
  if CPow > 100000 then Ban = 1 end
  if CHp > 500000 then Ban = 1 end
  if CMHp > 300000 then Ban = 1 end
  if CMaxHp > 500000 then Ban = 1 end
  if Ban == 1 then
    local msg = ("#Y【反外挂模块:】#P系统检测出您的属性不正常，现在将你传送牢狱。#G系统即将对您封号处理。")
    Char:ShowAwardMsg(msg);
    Char:JumpMap(252, 30, 50);
    Char:GetQuests():SetFlag(58585, 1)
    Char:AddBuff(275, 0, 0, 0, 60, 100)
    Char:SetPK_Value(PKValue + 100)
	Char:ResetCharLevel(lv);
    return
  end
  -- 检测参战BB属性
  local p = Char:GetCurPartner()
  local mobid = p:GetMob_id()
  local LL = p:GetLevel();
  local AA = p:GetSTA();
  local BB = p:GetSPR(); 
  local CC = p:GetSTR();
  local DD = p:GetCON();
  local EE = p:GetAGI();
  local XX = AA + BB + CC + DD + EE
  local FF = 0
  if LL < 10 then
      FF = 100 + (LL * 10) + 50 
  elseif LL < 30 then
      FF = 100 + (LL * 10) + 150
  elseif LL < 50 then
      FF = 100 + (LL * 10) + 220
  elseif LL < 60 then
      FF = 100 + (LL * 10) + 280
  elseif LL < 70 then
      FF = 100 + (LL * 10) + 350
  elseif LL < 80 then
      FF = 100 + (LL * 10) + 450
  elseif LL < 90 then
      FF = 100 + (LL * 10) + 700
  elseif LL < 100 then
      FF = 100 + (LL * 10) + 880
  elseif LL <= 110 then
      FF = 100 + (LL * 10) + 1000
  elseif LL > 110 then
      FF = 100 + (LL * 10) + 1500
  end
  for i = 580, 601 do -- 检测进阶宝宝的点数提升
	if mobid == i then
	   FF = FF + 200
	   break
    end
  end
  if FF < XX then 
    local msg = ("#Y【反外挂模块:】#P系统检测出您的宝宝属性点不正常，现在将你传送牢狱。#G系统即将对您封号处理。")
    Char:ShowAwardMsg(msg);
    Char:JumpMap(252, 30, 50);
    Char:GetQuests():SetFlag(58585, 1)
   Char:AddBuff(275, 0, 0, 0, 60, 100)
	Char:SetPK_Value(PKValue + 100)
	p:ResetLevel(LL);
    return
  end
  -- 检测BB最终属性
  local PAtk = p:GetATK()
  local PDef = p:GetDEF()
  local PSpd = p:GetSPD()
  local PPow = p:GetPOW()
  local PHp = p:GetHP()
  local PMaxHp = p:GetMaxHP()
  local BBan = 0
  if PAtk > 130000 then BBan = 1 end
  if PDef > 100000 then BBan = 1 end
  if PSpd > 50000 then BBan = 1 end
  if PPow > 100000 then BBan = 1 end
  if PHp > 600000 then BBan = 1 end
  if PMaxHp > 600000 then BBan = 1 end
  if BBan == 1 then
    local msg = ("#Y【反外挂模块:】#P系统检测出您的宝宝属性不正常，现在将你传送牢狱。#G系统即将对您封号处理。")
    Char:ShowAwardMsg(msg);
    Char:JumpMap(252, 30, 50);
    Char:GetQuests():SetFlag(58585, 1)
    Char:AddBuff(275, 0, 0, 0, 60, 100)
	Char:SetPK_Value(PKValue + 100)
	p:ResetLevel(LL);
    return
  end
end