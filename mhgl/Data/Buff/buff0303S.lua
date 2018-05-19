--梦古出生奖励

function buff0303Repeat(buff, Char, finish)
	if finish == 0 then
		Char:RemoveBuff(303);
		Char:AddBuff(304, 0, 0, 0, 30, 100);
		local Exp = 1300;
		Char:ChangeExpForScript(Exp, 8);
		local msg = string.format("#W新手在线25分钟，获得经验%d",Exp);
		Char:ShowAwardMsg(msg);
  	end
end
