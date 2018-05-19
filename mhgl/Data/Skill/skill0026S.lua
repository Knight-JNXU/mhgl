--百念归一

function skill0026CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需云游四海修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0026Use(Atk, Target, battle, skillLv)
	local consumeSp = 0.7 *skillLv + 15;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法使用百念归一", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local Level = Atk:GetLevel() + math.floor(skillLv / 30) + math.random(0, 5);
	--local CallRate = math.random(0, 100)
	--if CallRate <= 50 then
	--	Atk:CallHelper(10000, Level, math.random(0, 3));
	--else
	--	Atk:CallHelper(10001, Level, math.random(0, 3));
	--end
	local turn = 2 + math.floor((skillLv - 35) / 25);
	
	if turn < 2 then 
		turn = 2;
	elseif turn > 6 then
		turn = 6;
	end
	
	
	local effectPow = (1 + (0.15 - 0.02 * math.floor((skillLv - 35) / 25)) * skillLv / 100) * Atk:GetPOW();
		
	if effectPow <= 1 then
		effectPow = 1;
	end
		
	Target:AddBuff(34, skillLv, effectPow, 0, turn, 100);
	--Atk:AddBuff(34, skillLv, effectPow, 0, turn, 100);
		
	battle:PushReactionActor(Target);
	
end
