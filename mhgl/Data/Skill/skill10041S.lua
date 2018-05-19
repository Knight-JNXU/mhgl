--龙吟

function skill10041CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需龙附修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill10041Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local consumeSp = 30;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展龙吟", consumeSp);
	
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
		local hpChange =  -(10+skillLv) ;
		local spChange = -0.8 * (skillLv+10);
		
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

