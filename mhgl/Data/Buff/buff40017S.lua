
function buff40017Repeat(buff, Char, finish)
  local lv = Char:GetLevel()
  local dz = Char:GetQuests():GetFlag(787878);
  if lv < 5 then
    return
  end
     local Exp = (lv + lv + lv + lv) * 160;
     local Money = (lv + lv + lv + lv) * 50;
   	 Char:ChangeExpForScript(Exp, 8);
	 Char:ChangeMoneyForScript(Money, 8);
     local msg = string.format("#R[提示]:#W恭喜您获得在线奖励，#A获得经验%s，获得银两%s，#Y您目前的功德为：#Y%d",Exp,Money,dz + 1);
	 Char:GetQuests():SetFlag(787878, dz + math.random(1, 2))
     Char:ShowAwardMsg(msg);
	return
end
  
  

  
  
  
