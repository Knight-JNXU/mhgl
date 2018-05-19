--天女散花

function skill17011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需沉鱼落雁修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill17011Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = 1;
	
	if skillLv >25 and skillLv <50 then
	maxTargetCount = 2
	elseif skillLv >49 and skillLv <75 then
	maxTargetCount = 3
	elseif skillLv >74 and skillLv <100 then
	maxTargetCount = 4
	elseif skillLv >99 and skillLv <125 then
	maxTargetCount = 5
	elseif skillLv >124 and skillLv <150 then
	maxTargetCount = 6
	elseif skillLv >149  then
	maxTargetCount = 7
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	local consumeSp = 0;
	
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展满天花雨", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
		
	local i = 0;
	while targetlist[i] ~= nil do 
		
		local nDam = Atk:GetSkillLv(17010);
		local FinalDam = nDam + nDam*nDam/150 + Atk:GetSkillItemATK() + 50;
		if FinalDam <= 1 then
			FinalDam = 1;
		end
		if Atk:GetSkillLv(394) > 0 then
		   FinalDam = FinalDam + (FinalDam*Atk:GetSkillLv(394)*0.05)
		end
		if targetlist[i]:IsMob() or targetlist[i]:IsBoss() then
		FinalDam= FinalDam * 4
		else
		FinalDam= FinalDam * 2
		end
		
		targetlist[i]:ChangeHp(-1 * FinalDam);
		
		local fabao = 0
		
		if Atk:GetSkillLv(394) > 0 then
		fabao = (Atk:GetSkillLv(394)+12)/100
		end
		 
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();		
		elseif math.random(1, 100) <= 30 then
			if (targetlist[i]:IsBuffExist(1001) or targetlist[i]:IsBuffExist(1002) or targetlist[i]:IsBuffExist(1540)or targetlist[i]:IsBuffExist(1541)) ==  false then
			   if Atk:GetSkillLv(394) > 0 then	
				targetlist[i]:AddBuff(1541, skillLv, fabao, 0, 5, 100);
				else
				targetlist[i]:AddBuff(1540, skillLv, fabao, 0, 3, 100);
				end
			end
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

