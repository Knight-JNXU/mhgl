--闪电追风

function skill0013CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	local reqHp = 0.2 * Atk:GetMaxHP();	
	if Atk:GetHP() < reqHp then
		local Msg = "\#W生命不足\#G20\%\#W，无法施展闪电追风";
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:HasParty() then
		local Msg = "\#W组队状态下无法施展闪电追风";
		Atk:SkillFail(Msg);
	end
end

function skill0013Use(Atk, Target, battle, skillLv)
	
	local consumeHp = 20;
	local consumeSp = 20;
	
	local Msg1 = string.format("\#W生命不足\#G%d\#W，无法施展闪电追风", consumeHp);
	if Atk:GetHP() < consumeHp then
		Atk:SkillFail(Msg1);
		do return end
	end
	
	local Msg2 = string.format("\#W内力不足\#G%d\#W，无法施展闪电追风", consumeSp);
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg2);
		do return end
	end
	
	Atk:ChangeHp(-1 * consumeHp, false);
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local Rate = 30 + skillLv;
	
	if Rate < 31 then
		Rate = 31;
	elseif Rate > 100 then
		Rate = 100;
	end
	
	if math.random(1, 100) <= Rate then
		Atk:JumpMap(30100, 28, 90);
	else
		Atk:SkillFail("\#W学艺不精，闪电追风施展失败");
	end
	
end
