--逆鳞

function skill1061CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需龙附\#G%d\#W级以上才能使用", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(50000) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在逆鳞状态");
	end
end

function skill1061Use(Atk, Target, battle, skillLv)
	local consumeSp = 40
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展逆鳞", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	Atk:ChangeSp(-1 * consumeSp, false);
	


	local AttriAtk = 0.5 * (skillLv + Atk:GetLevel());
	
	Target:AddBuff(60000, skillLv, AttriAtk, 0, 6, 100);
	
	battle:PushReactionActor(Target);





	
end
