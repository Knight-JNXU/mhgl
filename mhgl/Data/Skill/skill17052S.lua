--楚楚可怜

function skill17052CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需倾国倾城修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end	
	elseif Atk:IsBuffExist(1701) or Atk:IsBuffExist(1700) then
		Atk:SkillFail("\#W[战斗讯息]：已经处于隐形状态");
	end
	
end

function skill17052Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 30;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展楚楚可怜", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local turn = 2 + math.floor((skillLv - 15) / 35);
	if turn < 2 then 
		turn = 2;
	elseif turn > 5 then
		turn = 5;
	end	
	
	local effectAtk = 1.075 * Target:GetATK();
		
	if effectAtk <= 1 then
		effectAtk = 1;
	end
	
--	Target:AddBuff(1701, skillLv, effectAtk, 0, turn, 100);
	Target:AddBuff(1701, skillLv, 0, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

