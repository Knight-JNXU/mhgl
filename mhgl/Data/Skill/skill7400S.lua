--MOB魅影

function skill7400CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if Atk:IsBuffExist(1701) or Atk:IsBuffExist(1700) then
		Atk:SkillFail("\#W[战斗讯息]：已经处于隐形状态");
	end
	
end

function skill7400Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local turn = 2 + math.floor((Lv + 10 - 10) / 40);
	if turn < 2 then 
		turn = 2;
	elseif turn > 4 then
		turn = 4;
	end	
	
	local effectAtk = 1.055 * Target:GetATK();
		
	if effectAtk <= 1 then
		effectAtk = 1;
	end
	
	local Lv2 = Lv + 10;
	
	Target:AddBuff(1701, Lv2, effectAtk, 0, turn, 100);
	battle:PushReactionActor(Target);
	
end

