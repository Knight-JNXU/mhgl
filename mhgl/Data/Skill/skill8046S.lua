--料敌机先

function skill8046CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8046Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 10 * (0.2 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：内力不足\#G%d\#W，无法施展料敌机先", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	
	local DisplayHp = Target:GetHP();
	local DisplayMHp = Target:GetMHP();
	local DisplaySp = Target:GetSP();
	local DisplayMSp = Target:GetMSP();
	--Get target  atk element
	--Get target  def element	
	
	local Display = string.format("\#W目标当前生命\#Y%d\#W/当前生命上限\#Y%d\#W，当前内力\#Y%d\#W/当前内力上限\#Y%d"
	,DisplayHp, DisplayMHp, DisplaySp, DisplayMSp);
	
	if battle == 0 then
		Atk:UseSkillMsg(Display);
	else	
		Atk:UseSkillMsg(Display);
		battle:PushReactionActor(Target);
	end
	
end

