--化血凝神

function skill1832CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需万化心法修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1200) then
		Atk:SkillFail("\#W[战斗讯息]：已经处在化血凝神状态");
	end
end

function skill1832Use(Atk, Target, battle, skillLv)
	--Sp=0.3* 技能等级 +10
	local consumeHp = 0.7 * skillLv +10;
	if Atk:IsBuffExist(1702) then
		consumeHp = consumeHp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：气血不足\#G%d\#W，无法施展化血凝神", consumeHp);
	
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	--增加SP = 0.75 * 技能等级 +15                 
	--持续回合 = INT(技能等级/35) max = 3 
	local spChange = 1.1 * skillLv + 15;
	
	Target:ChangeSp(spChange);
	
	local turn = 1 + math.floor((skillLv - 30) / 35);
	if turn > 3 then
		turn = 3;
	elseif turn < 1 then
		turn = 1;
	end
	if Target:IsBuffExist(2014) then
		turn = turn * 2;
	end
	if Target:IsBuffExist(2047) then
		turn = turn * 4;
	end
	
	Target:AddBuff(1200, skillLv, spChange, 0, turn, 100);
	
	battle:PushReactionActor(Target);
	
end

