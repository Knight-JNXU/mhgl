--高级反击(真·扭转乾坤)

function buff21033Active(buff, Char, Other, Type) 
	
	if Type == DO_HITTING then
		
		local reDam1 = -1 * Char:GetDHP();
		local reDam2 = -1 * Char:GetDSP();
		local reDam3 = -1 * Char:GetDMHP();
		
		if Char:GetTeam() ~= Other:GetTeam() then
			
			if (Other:GetAction() == LuaI.BATCMD_ATTACK or Other:GetAction() == LuaI.BATCMD_CRIT_ATTACK ) and 
				(reDam1 > 0 or reDam2 > 0 or reDam3 > 0) and 
				Char:GetReaction() ~= LuaI.BATCMD_MISS and Char:GetHP() ~= 0 and 
				Other:IsBuffExist(2002) ~= true and 
				Other:IsBuffExist(2035) ~= true and
				Other:IsBuffExist(21002) ~= true and 
				Other:IsBuffExist(21035) ~= true then
				
				local wDam = 1;		--是CBatActor类型 
				local wDam1 = 1;
				local ZPartnerOwner;			--是CBatActor类型
				local PartnerOwner;			--是CBatActor类型
				local battle = Char:GetBattle();
				if Char:IsParnter() then
					local ZpBatMob = Char:ToBatMob();
					if ZpBatMob ~= nil then
						for jj=0, battle:GetActorCount() - 1 do
							local ZpActor = battle:GetActor(jj);
							if ZpActor:IsPlayer() then
								local ZpBatChar = ZpActor:ToBatChar();
								if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
									ZPartnerOwner = ZpActor;
									wDam1 = 1.02 ^ ZPartnerOwner:GetOwner():GetSkillLv(382);
								end
							end
						end
					end
				else
					wDam1 = 1.02 ^ Char:GetSkillLv(376);
				end
				if Other:IsParnter() then
					local pBatMob = Other:ToBatMob();
					if pBatMob ~= nil then
						for ii=0, battle:GetActorCount() - 1 do
							local pActor = battle:GetActor(ii);
							if pActor:IsPlayer() then
								local pBatChar = pActor:ToBatChar();
								if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
									PartnerOwner = pActor;
									wDam = wDam1 * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
								end
							end
						end
					end
				else
					wDam = wDam1 * 0.98 ^ Other:GetSkillLv(377);
				end
				local randomDam = 1.2 - (math.random(100, 300) / 1000);
				local critDam = 2;
				local FinalDef = Other:GetDEF();
				if 0.8 * Char:GetATK() > Other:GetDEF() then
					if math.random(1, 100) <= 5 then
						FinalDef = Other:GetDEF() / 2;
					end
				end
				
				local FinalDam = 0;
				local CritHit = 0;
				if math.random(1,100) <= 5 then
					FinalDam = ((Char:GetATK() - FinalDef + 250) * wDam - 250)  * randomDam * critDam;
					CritHit = 1;
				else
					FinalDam = ((Char:GetATK() - FinalDef + 250) * wDam - 250) * randomDam;
				end
				
				if FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				if math.random(1, 100) <= 30 then
					if CritHit == 1 then
						Other:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
					end
					
					local reDam = Other:GetFinalValue(-FinalDam, Char, LuaI.BATCMD_ATTACK, 1);
					if -reDam < 1 then
						reDam = -1;
					end
				    Other:ChangeHp(reDam);
					
					--自身带魂飞魄散反击杀死龟息功
					if (Char:IsBuffExist(2019) or Char:IsBuffExist(2052)) and 
						(Other:IsBuffExist(2020) or Other:IsBuffExist(2053)) and 
						Other:GetHP() <= -reDam then
						Other:RemoveBuff(2020);
						Other:RemoveBuff(2053);
					end
					
					if Char:GetAction() == LuaI.BATCMD_DEFEND then
						Char:SetTempReaction(LuaI.BATCMD_COUNTER_ATTACK_DEF_HIT);
					else
					    Char:SetTempReaction(LuaI.BATCMD_COUNTER_ATTACK_HIT);
					end
					
					--反击杀死稀有同伴获取主人序号					
					if Char:IsBuffExist(3102) and Other:GetHP() <= -reDam then
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
end
