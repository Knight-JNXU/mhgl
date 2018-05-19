--天罗地网

function skill15003CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需移形换影修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill15003Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};	
	
	local maxTargetCount = 0;
	if skillLv < 30 then
	maxTargetCount = 3;
	elseif skillLv > 29 and skillLv < 60 then
		maxTargetCount = 4;
	elseif skillLv > 59  then
		maxTargetCount = 7;
	end
	if Target:IsParnter() or Target:IsPlayer() then
	  maxTargetCount = 1
	end
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展天罗地网", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local weaponDam = 0.5 * Atk:GetWeaponATK();
		local etcDam = ((Atk:GetSkillLv(378)+15)*11)*1.1
	    local FinalDam = ((skillLv * 7+100)*1.2*(1-(count-1)*0.1)+weaponDam*1.2)*1.1; 
		
		if Atk:GetSkillLv(394) > 0 then
		   FinalDam = FinalDam + (FinalDam * Atk:GetSkillLv(394) * 0.02)
		end

	    if targetlist[i]:IsParnter() or targetlist[i]:IsPlayer() or skillLv < 120 then
	       FinalDam = FinalDam * 0.6 + etcDam
		else
		   FinalDam = FinalDam * 0.9 + weaponDam + etcDam
		   if count == 1 then
		      FinalDam = FinalDam * 1.5
		   end
	    end
		
		
		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		
		local duRate = math.floor (Atk:GetSkillLv(15000) / 5) + 25;
		if math.random(1, 100) < duRate then
			targetlist[i]:AddBuff(90002, skillLv, 0, 0, 3, 100);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

