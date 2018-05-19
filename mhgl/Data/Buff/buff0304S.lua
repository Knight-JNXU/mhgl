--梦古出生奖励

function buff0304Repeat(buff, Char, finish)
	if finish == 0 then
		Char:RemoveBuff(304);
		local Exp = 1400;
		Char:ChangeExpForScript(Exp, 8);
		local msg = string.format("#W新手在线30分钟，获得经验%d",Exp);
		Char:ShowAwardMsg(msg);
  	end
end
