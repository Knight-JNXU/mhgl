--魅影(遁形)

function buff1701Attri(Char, buff, Attri) 
	Attri:SetAtk(Attri:GetAtk() * 1.05);
end

function buff1701Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		local consumeSp = 0.1 * buff:GetBuffValue1() + 5;
		if  Char:GetSP() < consumeSp then
			Char:RemoveBuff(1701);
			Char:BuffActive();
		else
			Char:ChangeSp(-1 * consumeSp, false);
		end
		Char:BuffActive();
	end	
	
	if Type == DO_ACTION then
		--判断DP有否增加      待程序suport
		
		local SkillForm = 0;
		local csv = Char:GetSkillCsvData(Char:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end
		
		if ((Char:GetAction() == LuaI.BATCMD_SKILL or Char:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			(SkillForm == 1 or SkillForm == 2 or SkillForm == 7 or SkillForm == 9 or SkillForm == 11 )) or 
			Char:GetAction() == LuaI.BATCMD_SPECIAL then
			Char:RemoveBuff(1701);
		end
	end
end

