--BOSS长歌飞虹

function skill8036CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8036Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();		
	local consumeSp = 0.3 * Lv + 10;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	Atk:AddBuff(25, 0, 0, 0, 0, 100);
	battle:PushReactionActor(Target);	
end

