--靛沧海

function skill20012CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需五行学说修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill20012Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};	
	
	local maxTargetCount = 0;
	maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	if maxTargetCount > 5 then
		maxTargetCount = 5;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	if Target:IsParnter() or Target:IsPlayer() then
	  maxTargetCount = 1
	end
	
	if Atk:GetSkillLv(394) > 0 and not(Target:IsParnter() or Target:IsPlayer())then --法宝对怪秒数+1
	   maxTargetCount = maxTargetCount + 1
	end
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 50;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展靛沧海", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local weaponDam = 0.75 * Atk:GetWeaponATK();
		local A = math.random(1,100)
		local FinalDam = (skillLv * 10+100)*1.4*(1-(count-1)*0.1) +Atk:GetSkillLv(378)*10+weaponDam;
		if skillLv < 120 then
		FinalDam =(skillLv * 5+100)*1.4*(1-(count-1)*0.1) ;
		end
 		if FinalDam <= 10 then
			FinalDam = math.random(1, 10);
		end
		if targetlist[i]:IsParnter() or targetlist[i]:IsPlayer()  then
		FinalDam = ((skillLv * 10+100)*1.4*(1-(count-1)*0.1) +Atk:GetSkillLv(378)*10+weaponDam)*0.5;
		end
		
		local SSFinalDam = 0.15 * FinalDam;
		--法宝结算
		if Atk:GetSkillLv(394) > 0 then
		   FinalDam = FinalDam + (FinalDam * Atk:GetSkillLv(394) * 0.03)
		end
		--法宝结算
		if targetlist[i]:IsMob() or targetlist[i]:IsBoss() then
		   FinalDam = FinalDam * 1.2
		end
		targetlist[i]:ChangeHp(-1 * FinalDam);
		targetlist[i]:ChangeMHp(-1 * SSFinalDam);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end

	
end