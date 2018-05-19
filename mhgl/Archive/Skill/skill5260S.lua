--MOB回龙克敌术

function skill5260CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	if  Atk:IsBuffExist(1808) then
		Atk:SkillFail("\#W[战斗讯息]：一次战斗只能施展一次该技能"); 
	end
end

function skill5260Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	--if Target:IsPlayer() == true then
		local hpChange = 0.25 * Target:GetHP();
	--else
		--hpChange = 1;
	--end

	if hpChange <= 1 then
		hpChange = 1;
	end

	if hpChange > 10 * (Lv + 10) then
		hpChange = 10 * (Lv + 10);
	end
	
	Target:ChangeHp(-1 * hpChange);
	Atk:AddBuff(1808,0,0,0,255,100);

	battle:PushReactionActor(Target);
	
end

