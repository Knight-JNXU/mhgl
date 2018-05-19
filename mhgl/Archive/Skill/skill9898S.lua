--沉香千帆舞

function skill9898CanUse(Atk, skillLv, reqSkillLv, reqCharLv)

end

function skill9898Use(Atk, Target, battle, skillLv)
	
	local lv = Atk:GetLevel();
	local targetlist = {};
	local skill = Atk:GetSkillLv(5300);
	local nDamskill1 = 0;
	local DamBonus1 = {0.5,1,1.5,2,2.5,3,3.5,4,4.5,5,5.5,6,6.5,7,7.5,8,8.5,9,9.5,10,11,12,13,14,15,16,17,18,19,20};
	local nDamsBonus1 = 0;
	local i = 1;
	while i <= 30 do
	    nDamskill1 = Atk:GetSkillLv(5430 + i - 1);
		if nDamskill1 == 1 then 
            nDamsBonus1 = nDamsBonus1 + DamBonus1[i];
		end
		i = i + 1;
	end	

	local maxTargetCount = math.floor(lv / 30) + 1;
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 1 then
		maxTargetCount = 1;
	end
	
	if skill == 1 then
	    maxTargetCount = math.floor(lv / 30) + 2;
	    if maxTargetCount > 5 then
		    maxTargetCount = 5;
	    elseif maxTargetCount < 2 then
		    maxTargetCount = 2;
	    end
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 30 * count;
	
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展沉香千帆舞", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);

	local CritHit = 0;
	local CritRate = 5;
	local randomDam = 1.2 - math.random(150, 250) / 1000;

	local j = 0;		
	while targetlist[j] ~= nil do		
		local FinalDam = 1.1 * (4 - 0.2 * count) * lv * randomDam;
		
		if math.random(1, 100) <= CritRate then
			FinalDam = FinalDam * 2;
			CritHit = 1;
		end
		
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		
		targetlist[j]:ChangeHp(-1 * FinalDam);
		
		if CritHit == 1 then
			targetlist[j]:SetTempReaction(LuaI.BATCMD_CRIT_HIT);
		end
				
		if math.random(1,100) <= 5 and targetlist[j]:IsBuffExist(1112) ~= true and targetlist[j]:GetHP() ~= 0 then 
			targetlist[j]:AddBuff(1112, lv, 0, 0, 2, 100);
		end
		
		battle:PushReactionActor(targetlist[j]);
		j = j + 1;
	end
end