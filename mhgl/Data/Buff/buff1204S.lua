--血强化抗性

function buff1204Attri(Char, buff, Attri) 
	
	Attri:SetAtk(Attri:GetAtk() * 1.3);
	Attri:SetDef(Attri:GetDef() * 1.3);
	Attri:SetHit(Attri:GetHit() * 1.3);
	Attri:SetPow(Attri:GetPow() * 1.3);
	Attri:SetSpd(Attri:GetSpd() * 1.3);
	Attri:SetEva(Attri:GetEva() * 2);
	
end


function buff1204Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			if Char:IsBuffExist(1112) then
				do return end
			end
			if Char:GetMHP() < Char:GetMaxHP() then
				Char:ChangeMHp(buff:GetBuffValue3());
			end
			if Char:GetHP() < Char:GetMaxHP() then
				Char:ChangeHp(buff:GetBuffValue2());
			end
			Char:BuffActive();
		end
	end
	if Type == DO_HITTING then		
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		local skillForm = 0;
		local csv = Other:GetSkillCsvData(Other:GetSubType());
		if csv ~= nil then
			skillForm = csv.form;
		end
		
		if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK or
			((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or Other:GetAction() == LuaI.BATCMD_SPECIAL) and
			skillForm == 1 )) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and				
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			--Char:ResetHP();
			if reDam1 > 0 then
				Char:ResetHP();	
				if (Char:IsBuffExist(1102) or Char:IsBuffExist(1105)) and not Char:IsBuffExist(1410) then
					reDam1 = reDam1 * 0.7;
				elseif Char:IsBuffExist(1410) then
					reDam1 = reDam1 * 0.675;
				else	
					reDam1 = reDam1 * 0.6;
				end
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				if (Char:IsBuffExist(1102) or Char:IsBuffExist(1105)) and not Char:IsBuffExist(1410) then
					reDam2 = reDam2 * 0.7;
				elseif Char:IsBuffExist(1410) then
					reDam2 = reDam2 * 0.675;
				else	
					reDam2 = reDam2 * 0.6;
				end
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				if (Char:IsBuffExist(1102) or Char:IsBuffExist(1105)) and not Char:IsBuffExist(1410) then
					reDam3 = reDam3 * 0.7;
				elseif Char:IsBuffExist(1410) then
					reDam3 = reDam3 * 0.675;
				else	
					reDam3 = reDam3 * 0.6;
				end
				Char:ChangeMHp(-1 * reDam3);
			end
		elseif ((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL) and
			skillForm == 2) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
			--Char:ResetHP();
			if reDam1 > 0 then
				Char:ResetHP();	
				if (Char:IsBuffExist(1115) or Char:IsBuffExist(1116)) and not Char:IsBuffExist(1409) then
					reDam1 = reDam1 * 0.7;
				elseif Char:IsBuffExist(1409) then
					reDam1 = reDam1 * 0.675;
				else	
					reDam1 = reDam1 * 0.6;
				end	
				Char:ChangeHp(-1 * reDam1);
			end
			if reDam2 > 0 then
				Char:ResetSP();
				if (Char:IsBuffExist(1115) or Char:IsBuffExist(1116)) and not Char:IsBuffExist(1409) then
					reDam2 = reDam2 * 0.7;
				elseif Char:IsBuffExist(1409) then
					reDam2 = reDam2 * 0.675;
				else	
					reDam2 = reDam2 * 0.6;
				end
				Char:ChangeSp(-1 * reDam2);
			end
			if reDam3 > 0 then
				Char:ResetMHP();
				if (Char:IsBuffExist(1115) or Char:IsBuffExist(1116)) and not Char:IsBuffExist(1409) then
					reDam3 = reDam3 * 0.7;
				elseif Char:IsBuffExist(1409) then
					reDam3 = reDam3 * 0.675;
				else	
					reDam3 = reDam3 * 0.6;
				end
				Char:ChangeMHp(-1 * reDam3);
			end
		end
	end
end
