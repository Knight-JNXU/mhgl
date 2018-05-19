--万胜连环

function skill0022CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天凤无极修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);	
		do return end
	elseif Atk:IsBuffExist(36) == false then
		Atk:SkillFail("\#W[战斗讯息]：此招式需先气聚丹田后才能施展");
	end	
end

function skill0022Use(Atk, Target, battle, skillLv)
	
	local maxAtkTime =  math.floor((skillLv - 35 )/ 25) + 2;
	if maxAtkTime > 6 then
		maxAtkTime = 6;
	elseif maxAtkTime < 2 then
		maxAtkTime = 2;
	end
	
	local consumeSp = (0.2 * skillLv + 20) * maxAtkTime;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展万胜连环", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local hpChange = ((1.2 - 0.1 * math.floor((skillLv - 35) / 25)) * Atk:GetPOW() - Target:GetPOW() + 1.5 * skillLv + 0.25 * Atk:GetWeaponATK())* 1.05 ^ (Atk:GetSkillLv(378) - Target:GetSkillLv(379));
	
	if hpChange <= 10 then
		hpChange = math.random(1, 10);
	end	
	
	local i = 1;
	local KillFlag = 0;
	while i <= maxAtkTime and KillFlag == 0 do
		
		if hpChange >= Target:GetHP() - hpChange * (i - 1) then
			KillFlag = 1;
		end	
		Target:AddAttriChangeToLst(-1 * hpChange, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);	
		i = i + 1;
	end
	battle:PushReactionActor(Target);
	
	Atk:AddBuff(22, 0, 0, 0, 1, 100);
	Atk:RemoveBuff(36);
	
end
