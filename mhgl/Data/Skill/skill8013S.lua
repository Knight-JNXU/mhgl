--锋芒傲世

function skill8013CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill8013Use(Atk, Target, battle, skillLv)

	local Lv = Atk:GetLevel();
	local targetlist = {};
	local consumeSp = 10 * (1.0 * Lv + 10);
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展锋芒傲世", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = (-2 * Lv - 20) * 10;
		local spChange = (-0.8 * Lv - 10) * 5;
		
		local result = skillCanHit(Atk, targetlist[i]);
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(hpChange);
			targetlist[i]:ChangeSp(spChange);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

