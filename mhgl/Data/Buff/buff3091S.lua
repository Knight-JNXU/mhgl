--免疫上一次的攻击类型

function buff3091Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local SkillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			SkillForm = csv.form;
		end					
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or 
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			SkillForm == 1)) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) then									
			--Char:ChangeHp(-1 * reDam1);
			--Char:ChangeSp(-1 * reDam2);
			--Char:ChangeMHp(-1 * reDam3);
			if not Char:IsBuffExist(3054) then
				Char:AddBuff(3054, 150, 0, 0, 120, 100);
			end
			if Char:IsBuffExist(3064) then
				Char:RemoveBuff(3064);
			end
			if Char:IsBuffExist(3090) then
				Char:RemoveBuff(3090);
			end
		elseif ((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			SkillForm == 2) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) then				
			if not Char:IsBuffExist(3064) then
				Char:AddBuff(3064, 150, 0, 0, 120, 100);
			end
			if Char:IsBuffExist(3054) then
				Char:RemoveBuff(3054);
			end
			if Char:IsBuffExist(3090) then
				Char:RemoveBuff(3090);
			end
		elseif ((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and 
			SkillForm == 4) and (reDam1 > 0 or reDam2 > 0 or reDam3 > 0) then
			if not Char:IsBuffExist(3090) then
				Char:AddBuff(3090, 150, 0, 0, 120, 100);
			end
			if Char:IsBuffExist(3054) then
				Char:RemoveBuff(3054);
			end
			if Char:IsBuffExist(3064) then
				Char:RemoveBuff(3064);
			end
		end			
	end	
end
