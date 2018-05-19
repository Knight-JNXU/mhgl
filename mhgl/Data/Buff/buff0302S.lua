--梦古出生奖励

function buff0302Repeat(buff, Char, finish)
	if finish == 0 then
		Char:RemoveBuff(302);
		Char:AddBuff(303, 0, 0, 0, 25, 100);
		local Exp = 1200;
		Char:ChangeExpForScript(Exp, 8);
		local msg = string.format("#W新手在线20分钟，获得经验%d",Exp);
		Char:ShowAwardMsg(msg);
  	end
end
