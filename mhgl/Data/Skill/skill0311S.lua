--地狱烈火

function skill0311CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill0311Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	
	local maxTargetCount = math.floor( lv / 30) + 1;
	if maxTargetCount > 3 then
		maxTargetCount = 3;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展泰山压顶", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local RateDam = 1;
	local CritHit = {};
	local CritRate = 0;
	
	if Atk:IsBuffExist(2026) then
		CritRate = 10;
	end
	if Atk:IsBuffExist(2059) then
		CritRate = 20;
	end
	local lianji = 1;
	local Rate = 0;
	if Atk:IsBuffExist(2025) then
		Rate = 15;
	end
	if Atk:IsBuffExist(2058) then
		Rate = 25;
	end
	
	if math.random(1, 100) <= Rate then
		lianji = 2;
	end
	
	local i = 0;
	local j = 0;
	if lianji == 1 then
		
		while targetlist[j] ~= nil do
			
			local nDam = 1;		--是CBatActor类型 
			local nDam1 = 1;
			local nDam2 = 0;
			local nDam3 = 0;
			local nDam4 = 0;
			local ZPartnerOwner;			--是CBatActor类型
			local PartnerOwner;			--是CBatActor类型
			if Atk:IsParnter() then
				local ZpBatMob = Atk:ToBatMob();
				if ZpBatMob ~= nil then
					for jj=0, battle:GetActorCount() - 1 do
						local ZpActor = battle:GetActor(jj);
						if ZpActor:IsPlayer() then
							local ZpBatChar = ZpActor:ToBatChar();
							if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
								ZPartnerOwner = ZpActor;
								nDam1 = 1+0.02 * ZPartnerOwner:GetOwner():GetSkillLv(384);
								nDam2 = 5 * ZPartnerOwner:GetOwner():GetSkillLv(384);
							end
						end
					end
				end
			else
				nDam1 = 1+ 0.02 * Atk:GetSkillLv(378);
				nDam2 = 5 * Atk:GetSkillLv(378);
			end
			if targetlist[j]:IsParnter() then
				local pBatMob = targetlist[j]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								nDam3 = 0.02 * PartnerOwner:GetOwner():GetSkillLv(385);
								nDam4 = 5 * PartnerOwner:GetOwner():GetSkillLv(385);
							end
						end
					end
				end
			else
				nDam3 = 0.02 * targetlist[j]:GetSkillLv(379);
				nDam4 = 5 * targetlist[j]:GetSkillLv(379);
			end
			
			if Atk:IsBuffExist(2027) then
				RateDam =  math.random(80, 120) / 100;
			end
			if Atk:IsBuffExist(2060) then
				RateDam =  math.random(80, 130) / 100;
			end
			
			local FinalDam = (lv*3+Atk:GetATK()*0.1+99+(Atk:GetPOW() - targetlist[j]:GetPOW()))*(nDam1-nDam3)* (1.5-0.1*count)*RateDam+nDam2-nDam4 ;
			
			if math.random(1, 100) <= CritRate then
				FinalDam = FinalDam * 2;
				CritHit[j] = 1;
			end
			
			if FinalDam <= 10 then
				FinalDam = math.random(1, 10);
			end
			
		  local sh = 0;
		  if Atk:HasSkill(9779) then
			  sh = Atk:GetSPR() * 0.4
			 end
			
			
			
			
			targetlist[j]:ChangeHp(-1 * (FinalDam + sh + 100)*1.3);
			
			if CritHit[j] == 1 then
				targetlist[j]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
			end
			
			
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;
		end
	else		
		--local FinalDam = {0, 0};	
		local CritHit1 = {};
		while targetlist[j] ~= nil do
			
			i = 0;
			while i < lianji do
				
				local nDam = 1;		--是CBatActor类型 
				local nDam1 = 1;
				local ZPartnerOwner;			--是CBatActor类型
				local PartnerOwner;			--是CBatActor类型
				if Atk:IsParnter() then
					local ZpBatMob = Atk:ToBatMob();
					if ZpBatMob ~= nil then
						for jj=0, battle:GetActorCount() - 1 do
							local ZpActor = battle:GetActor(jj);
							if ZpActor:IsPlayer() then
								local ZpBatChar = ZpActor:ToBatChar();
								if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then
									ZPartnerOwner = ZpActor;
									nDam1 = 1+0.02 * ZPartnerOwner:GetOwner():GetSkillLv(384);
								nDam2 = 5 * ZPartnerOwner:GetOwner():GetSkillLv(384);
							end
						end
					end
				end
			else
				nDam1 = 1+ 0.02 * Atk:GetSkillLv(378);
				nDam2 = 5 * Atk:GetSkillLv(378);
				end
				if targetlist[j]:IsParnter() then
					local pBatMob = targetlist[j]:ToBatMob();
					if pBatMob ~= nil then
						for ii=0, battle:GetActorCount() - 1 do
							local pActor = battle:GetActor(ii);
							if pActor:IsPlayer() then
								local pBatChar = pActor:ToBatChar();
								if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
									PartnerOwner = pActor;
									nDam3 = 0.02 * PartnerOwner:GetOwner():GetSkillLv(385);
								nDam4 = 5 * PartnerOwner:GetOwner():GetSkillLv(385);
							end
						end
					end
				end
			else
				nDam3 = 0.02 * targetlist[j]:GetSkillLv(379);
				nDam4 = 5 * targetlist[j]:GetSkillLv(379);
			end
				
				if Atk:IsBuffExist(2027) then
					RateDam =  math.random(80, 120) / 100;
				end
				if Atk:IsBuffExist(2060) then
					RateDam =  math.random(80, 130) / 100;
				end
				
				local FinalDam = (lv*3+Atk:GetATK()*0.1+99+(Atk:GetPOW() - targetlist[j]:GetPOW()))*(nDam1-nDam3)* (1.5-0.1*count)*RateDam+nDam2-nDam4 ;
			
				CritHit1[j] = 0;
				if math.random(1, 100) <= CritRate then
					FinalDam = FinalDam * 2;
					CritHit1[j] = 1;
				end
				
				if FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end	
			
		    local sh = 0;
		    if Atk:HasSkill(9779) then
			    sh = Atk:GetSPR() * 0.4
			   end
			
			
				if CritHit1[j] == 1 then
					targetlist[j]:AddAttriChangeToLst(-1 * (FinalDam+sh+100)*1.3, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
				else
					targetlist[j]:AddAttriChangeToLst(-1 * (FinalDam+sh+100)*1.3, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
				end
				
				
				
				i = i + 1;
				
			end
			battle:PushReactionActor(targetlist[j]);
			j = j + 1;	
		end
	end
end

