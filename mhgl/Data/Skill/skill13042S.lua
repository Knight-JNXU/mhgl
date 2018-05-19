--干将莫邪

function skill13042CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		
	elseif Atk:IsBuffExist(1811) then
		Atk:SkillFail("\#W[战斗讯息]：连续使用干将莫邪容易伤身");
	end
	
end

function skill13042Use(Atk, Target, battle, skillLv)

	local consumeSp = 0;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展杀气诀", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(4708) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经处于干将莫邪状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 4;
	
	local fabao = Target:GetSkillLv(394)*0.025* Target:GetATK();
	
	
	
	
	Target:AddBuff(4708, skillLv, fabao, 0, turn, 100);
	Atk:AddBuff(1811,0,0,0,5,100);
	battle:PushReactionActor(Target);
	
end
