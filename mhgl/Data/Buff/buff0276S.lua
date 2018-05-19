--打坐增加经验

function buff0276Repeat(buff, Char, finish)
	if finish == 0 then
		local mapid = Char:GetMap_id();
		local x = 0;
		local lv = Char:GetLevel();
		local Exp = 0;
		if mapid == 57002 or mapid == 57102 or mapid == 57202
			or mapid == 57302 or mapid == 57402 then
			if mapid == 57002 then
				x = 1;
			elseif mapid == 57102 then
				x = 1.25;
			elseif mapid == 57202 then
				x = 1.5;
			elseif mapid == 57302 then
				x = 1.75;
			elseif mapid == 57402 then
				x = 2;
			end
			if Char:IsSit() then
				Exp = (4 * lv + 10) * 0.4 * 6.6 * 50 * x;   --20倍
				local energe = 8 * x;  --2倍
				Char:ChangeExpForScript(Exp, 8);
				Char:ChangeER(energe)
				local msg = string.format("#W闭关打坐，获得经验%d，精力%d", Exp, energe);
				Char:ShowAwardMsg(msg);
				ShowError(msg);
			else
				local msg = "没在打坐状态下无法获得打坐经验和精力。";
				Char:ShowAwardMsg(msg);
			end
		end
  	end
end
