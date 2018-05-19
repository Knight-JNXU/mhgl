--BOSS大手印

function skill8069CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8069Use(Atk, Target, battle, skillLv)
	local Lv = Atk:GetLevel();
	local consumeSp = 0.4 * Lv + 10;
	
	--local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展大手印", consumeSp);
	
	--if Atk:GetSP() < consumeSp then
	--	Atk:SkillFail(Msg);
	--	do return end
	--end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 0;
	--local weaponDam = 0;
	local Dam = (Atk:GetPOW() - (1 - 0.1 * Lv /100) * Target:GetPOW() + Lv)  * 1.05 ^ nDam;
	
	if Dam <= 10 then
		Dam = math.random(Atk:GetLevel(), Atk:GetLevel() * 2 + 8);
	end
	
	local turn = 1 + math.floor(Lv / 50);
	Target:ChangeSp(-1 * Dam);
	Target:AddBuff(76, 0, 0, 0, turn, 100);
	battle:PushReactionActor(Target);	
end
