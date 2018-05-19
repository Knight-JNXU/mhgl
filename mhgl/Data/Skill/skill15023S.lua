--瘴气

function skill15023CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需催情大法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill15023Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};	
	
	local maxTargetCount = 0;
	
	if skillLv > 120 and skillLv <130 then
		maxTargetCount = 3;
	elseif skillLv > 129  then
		maxTargetCount = 4;
	end
	
	local bufflist = {90003,2024, 2057};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展瘴气", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	local fabaoLv = Atk:GetSkillLv(394)
	while targetlist[i] ~= nil do
	
	local nDam = 1;		--是CBatActor类型 
		local PartnerOwner;			--是CBatActor类型 
		if targetlist[i]:IsParnter() then
			local pBatMob = targetlist[i]:ToBatMob();
			if pBatMob ~= nil then
				for ii=0, battle:GetActorCount() - 1 do
					local pActor = battle:GetActor(ii);
					if pActor:IsPlayer() then
						local pBatChar = pActor:ToBatChar();
						if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
							PartnerOwner = pActor;
							nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
						end
					end
				end
			end
		else
			nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		end
		
	if skillLv > targetlist[i]:GetLevel() then
		HitRate = (60 + 2 * (skillLv - targetlist[i]:GetLevel()) ^ 0.5) * nDam;
	else
		HitRate = (60 + 2.2 * (skillLv - targetlist[i]:GetLevel())) * nDam;
	end
	if targetlist[i]:IsBuffExist(1807) then
		HitRate = HitRate * 0.9;
	end
	if HitRate < 1 then
		HitRate = 1;
	elseif HitRate > 95 then
		HitRate = 95;
	end	
	
		if math.random(1, 100) > HitRate then
		targetlist[i]:MissSkill();
		battle:PushReactionActor(targetlist[i]);
		do return end
	end
	
	local turn = 3 + math.floor((skillLv - targetlist[i]:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	targetlist[i]:AddBuff(90003, skillLv, fabaoLv, 0, turn, 100);
	battle:PushReactionActor(targetlist[i]);
	
	i = i + 1;
	end
end

