
function buff40006Repeat(buff, Char, finish)
  local lv = Char:GetLevel()
  local dz = Char:GetQuests():GetFlag(820);
  if lv < 5 then
    return
  end
     local Exp = (lv + lv + lv + lv) * 60;
     local Money = (lv + lv + lv + lv) * 5;
   	 Char:ChangeExpForScript(Exp, 8);
	 Char:ChangeMoneyForScript(Money, 8);
     local msg = string.format("#R[提示]:#W恭喜获得VIP在线奖励，#A获得经验%s，获得银两%s，#Y绑定元宝+10,您目前的绑定元宝为：#Y%d",Exp,Money,dz + 10);
	 Char:GetQuests():SetFlag(820, dz + 10)
     Char:ShowAwardMsg(msg);
	return
end
