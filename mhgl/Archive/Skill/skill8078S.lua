--BOSS起死回生

function skill8078CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
end

function skill8078Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();	
	local consumeSp = 2 * Lv;

	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local rec1 = 0;
	local rec2 = 0;
	if Target:GetHP() == 0 then
		rec1 = 6 * Lv + 0.02 * Target:GetMaxHP();
		if rec1 <= 1 then
			rec1 = 1;
		end
		
		rec2 = 7.2 * Lv ;
		if rec2 <= 0  then
			rec2 = 1;
		end
		
		Target:ChangeHp(rec1);
		Target:ChangeMHp(rec2);
		battle:PushReactionActor(Target);
		
	else
		Atk:UseSkillMsg("\#W[战斗讯息]：目标还未死亡");
	end
	
end
