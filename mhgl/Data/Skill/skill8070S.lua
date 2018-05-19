--舒筋活血

function skill8070CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8070Use(Atk, Target, battle, skillLv)
	
	local Lv = Atk:GetLevel();
	local consumeSp = 1.5 * skillLv;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展舒筋活血", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec = 4.5 * Lv + 0.02 * Target:GetMaxHP();
	if rec <= 0 then
		rec = 1;
	end
	
	Target:ChangeHp(rec);
	battle:PushReactionActor(Target);
	
end

