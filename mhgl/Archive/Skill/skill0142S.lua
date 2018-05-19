--起死回生

function skill0142CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需六阳手修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0142Use(Atk, Target, battle, skillLv)

	local consumeSp = 2 * skillLv;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展起死回生", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec1 = 0;
	local rec2 = 0;
	if Target:GetHP() == 0 then
		rec1 = 6 * skillLv + 0.25 * Atk:GetWeaponATK() + 0.02 * Target:GetMaxHP();
		if rec1 <= 1 then
			rec1 = 1;
		end
		
		rec2 = 7.2 * skillLv + 0.25 * Atk:GetWeaponATK();
		if rec2 <= 0  then
			rec2 = 1;
		end
		
		Target:ChangeHp(rec1);
		Target:ChangeMHp(rec2);
		battle:PushReactionActor(Target);
		
	else
		Atk:UseSkillMsg("\#W[战斗讯息]：目标还未死亡");
	end
	
end
