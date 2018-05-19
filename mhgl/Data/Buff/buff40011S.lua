
function buff40011Repeat(buff, Char, finish)
  local lv = Char:GetLevel()
  local dz = Char:GetQuests():GetFlag(820);
  if lv < 5 then
    return
  end
     local Exp = (lv + lv + lv + lv) * 60;
     local Money = (lv + lv + lv + lv) * 2;
   	 Char:ChangeExpForScript(Exp, 8);
	 Char:ChangeMoneyForScript(Money, 8);
     local msg = ("#R[提示]:#W恭喜您#A获得经验%s，获得银两%s，#Y绑定元宝+15,您目前的绑定元宝为：#Y%d",Exp,Money,dz + 15);
	 Char:GetQuests():SetFlag(820, dz + 15)
     Char:ShowAwardMsg(msg);
	return
end
  
  

  
  
  
