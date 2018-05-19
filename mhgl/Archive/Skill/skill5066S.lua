--MOB洞悉

function skill5066CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill5066Use(Atk, Target, battle, skillLv)

	local DisplayHp = Target:GetHP();
	local DisplayMHp = Target:GetMHP();
	local DisplaySp = Target:GetSP();
	local DisplayMSp = Target:GetMSP();
	local DisplayDp = Target:GetDP();
	--Get target  atk element
	--Get target  def element	
	
	local Display = string.format("目标当前生命\#Y%d\#W/当前生命上限\#Y%d\#W，当前内力\#Y%d\#W/当前内力上限\#Y%d\#W，当前酒意\#Y%d"
	,DisplayHp, DisplayMHp, DisplaySp, DisplayMSp, DisplayDp);
	
	if battle == 0 then
		Atk:UseSkillMsg(Display);
	else	
		Atk:UseSkillMsg(Display);
		battle:PushReactionActor(Target);
	end
	
end

