--探花截脉手

function skill2851CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需玄元要诀修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1307) then
		local Msg = "\#W[战斗讯息]：调息状态下无法使用探花截脉手";
		Atk:SkillFail(Msg);	
	end	
end

function skill2851Use(Atk, Target, battle, skillLv)

	local consumeSp = 1.2 * skillLv + 40;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展探花截脉手", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1709) then
		Atk:SkillFail("\#W[战斗讯息]：对方已经处于探花截脉手状态");
		do return end
	end
	
	if Target:IsBuffExist(1641) then
		Atk:SkillFail("\#W[战斗讯息]：对方正在调理命脉，在此期间不能再接受探花截脉手状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2;
	
	Target:AddBuff(1709, skillLv, 0, 0, turn, 100);
	Target:AddBuff(1641, skillLv, 0, 0, 4, 100);
	Atk:AddBuff(1307, skillLv, 0, 0, turn, 100);
	
	battle:PushReactionActor(Target);
	
end
