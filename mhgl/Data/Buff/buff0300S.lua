--梦古出生奖励

function buff0300Repeat(buff, Char, finish)
	if finish == 0 then
		Char:RemoveBuff(300);
		Char:AddBuff(301, 0, 0, 0, 15, 100);
		local Exp = 1000;
		Char:ChangeExpForScript(Exp, 8);
		local msg = string.format("#W新手在线5分钟，获得经验%d",Exp);
		Char:ShowAwardMsg(msg);
  	end
end
