--普度众生

function skill20041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需金刚经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill20041Use(Atk, Target, battle, skillLv)
	
	local buffid = {1201,1201};
	local j = 1;
	while buffid[j] ~= nil do
		Target:RemoveBuff(buffid[j]);
		j = j + 1;
	end
	
	local rec = 0.3 * Target:GetMaxHP() + Target:GetLevel() * (Atk:GetWC() / math.random(180, 250));
	if rec <= 1 then
		rec = 1;
	end
	if rec > Target:GetLevel() * 25 then
		rec = Target:GetLevel() * 25;
	end
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
end
