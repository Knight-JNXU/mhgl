--含沙射影

function skill2211CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需秘掷宝典修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill2211Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor( math.random(15, 35) / 10);
	if skillLv > 80 then
		maxTargetCount = maxTargetCount + 1;
	end
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, RandomSort, bufflist, 0);
	
	local count = 0;
	local countDam = 1;
	while targetlist[count] ~= nil do
		count = count + 1;
	end	
	if count == 1 then
		countDam = 1.52  ;
	elseif count == 2 then
		countDam = 1.44  ;
	elseif count == 3 then
		countDam = 1.36 ;
	else
		countDam = 1.28 ;
	end
	
	local consumeSp = 0.3 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展含沙射影", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do 
	
		local nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ targetlist[i]:GetSkillLv(379);
		local HitRate = 0;

		if skillLv > targetlist[i]:GetLevel() then
			HitRate = (54 + 2 * (skillLv - targetlist[i]:GetLevel()) ^ 0.5) * nDam;
		else
			HitRate = (54 + 2.2 * (skillLv - targetlist[i]:GetLevel())) * nDam;
		end
		if HitRate < 1 then
			HitRate = 1;
		elseif HitRate > 95 then
			HitRate = 95;
		end	
		
		local hpChange = 0;
		if math.random(1, 100) > HitRate then
			hpChange = countDam * (Atk:GetSkillItemATK() + 2.7 * skillLv);
		else
			hpChange = Atk:GetSkillItemATK() + 2.7 * skillLv;
		end
		
		if hpChange <= 1 then
			hpChange = 1;
		end
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

