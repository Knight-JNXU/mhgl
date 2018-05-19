--梦古出生奖励

function buff0301Repeat(buff, Char, finish)
	if finish == 0 then
		Char:RemoveBuff(301);
		Char:AddBuff(302, 0, 0, 0, 20, 100);
		local Exp = 1100;
		Char:ChangeExpForScript(Exp, 8);
		local msg = string.format("#W新手在线15分钟，获得经验%d",Exp);
		Char:ShowAwardMsg(msg);
  	end
end
