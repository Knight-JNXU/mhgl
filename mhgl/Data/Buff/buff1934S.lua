

function buff1934Active(buff, Char, Other, Type)
	
	if Type == TURN_END then
		
		local i = buff:GetBuffValue2();
		i = i + 1;
		buff:SetBuffValue2(i);
		if i >= 10 then
			Char:RemoveBuff(1934);
		end		
		Char:BuffActive();
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
				
		if ((Other:GetAction() == LuaI.BATCMD_SKILL or Other:GetAction() == LuaI.BATCMD_CRIT_SKILL or 
			Other:GetAction() == LuaI.BATCMD_SPECIAL) and skillForm == 2) and 
			(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
			Char:GetReaction() ~= LuaI.BATCMD_MISS then
			
             if math.random(1, 100) <= 100 then
					if reDam1 > 0 then
						reDam1 = math.max(1, reDam1 * 1.0);
						Other:ChangeHp(-1 * reDam1);
					end
					if reDam2 > 0 then
						reDam2 = math.max(1, reDam2 * 1.0);
						Other:ChangeSp(-1 * reDam2);
					end
					if reDam3 > 0 then
						reDam3 = math.max(1, reDam3 * 1.0);
						Other:ChangeMHp(-1 * reDam3);
					end
					if Char:IsBuffExist(3102) and Other:GetHP() <= reDam1 then
						local battle = Char:GetBattle();
						local ZpBatMob1 = Char:ToBatMob();
						local positionsign = 0;					
						for j = 0, battle:GetActorCount() - 1 do						
							local ZpActor1 = battle:GetActor(j);
							if ZpActor1:IsPlayer() then
								local ZpBatChar1 = ZpActor1:ToBatChar();
								if ZpBatChar1 ~= nil and ZpBatChar1:GetChar_id() == ZpBatMob1:GetOwner_id() then									
									positionsign = j;
									break
								end
							end							
						end						
						Other:AddBuff(3101, 1, positionsign, 0, 3, 100);
					end
				end	
			end			
		end		
	end	
