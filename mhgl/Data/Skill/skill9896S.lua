--饿虎出山

function skill9896CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需啸天诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1518) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在饿虎出山状态");
	end
end

function skill9896Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.1 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展饿虎出山", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local AttriAtk = 0.5 * (skillLv + Atk:GetLevel());
	Target:AddBuff(1518, skillLv, AttriAtk, 0, 6, 100);
	battle:PushReactionActor(Target);
end
