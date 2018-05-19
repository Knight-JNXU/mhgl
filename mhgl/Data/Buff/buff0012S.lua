--受到内功伤害-10%，10%几率闪避(阵法)

function buff0012Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
	
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		local HitRate = math.random(1, 100);
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end

		if ((Other:GetAction() == LuaI.BATCMD_SKILL or
			Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and SkillForm == 2 ) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			if HitRate <= 10 then
				Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:MissSkill();
			else
				if 0 < reDam1 and 0.9 * reDam1 < 1 then
					reDam1 = 1 / 0.9;
				end
				if 0 < reDam2 and 0.9 * reDam2 < 1 then
					reDam2 = 1 / 0.9;
				end
				if 0 < reDam3 and 0.9 * reDam3 < 1 then
					reDam3 = 1 / 0.9;
				end
				Char:ResetMHP();
				Char:ResetHP();
				Char:ResetSP();
				Char:ChangeHp(-0.9 * reDam1);
				Char:ChangeSp(-0.9 * reDam2);
				Char:ChangeMHp(-0.9 * reDam3);
			end
		end
	end
end
