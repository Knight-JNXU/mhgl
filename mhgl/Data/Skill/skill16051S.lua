--知己知彼

function skill16051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需清明自在修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill16051Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.2 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展知己知彼", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	
	local DisplayHp = Target:GetHP();
	local DisplayMHp = Target:GetMHP();
	local DisplaySp = Target:GetSP();
	local DisplayMSp = Target:GetMSP();
	local DisplayDp = Target:GetDP();
	--Get target  atk element
	--Get target  def element	
	
	local Display = string.format("\#W目标当前生命\#Y%d\#W/当前生命上限\#Y%d\#W，当前魔法\#Y%d\#W/当前魔法上限\#Y%d\#W，当前愤怒\#Y%d"
	,DisplayHp, DisplayMHp, DisplaySp, DisplayMSp, DisplayDp);
	
	if battle == 0 then
		Atk:UseSkillMsg(Display);
	else	
		Atk:UseSkillMsg(Display);
		battle:PushReactionActor(Target);
	end
	
end

