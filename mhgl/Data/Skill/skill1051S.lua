--螺旋九影

function skill1051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需天罡正气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1051Use(Atk, Target, battle, skillLv)

	local consumeSp = 0.8 * skillLv + 5;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足%d，无法施展螺旋九影", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	if Target:IsBuffExist(1632) then
		Atk:SkillFail("\#W[战斗讯息]：对方已经处于螺旋九影状态");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local targetlist = {};
	local bufflist = {1632};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local turn = 3;
		if targetlist[i]:IsBuffExist(2014) then
			turn = turn * 2;
		end
		if targetlist[i]:IsBuffExist(2047) then
			turn = turn * 4;
		end
		
		local effectEva = 1.15 * targetlist[i]:GetEVA();
			
		if effectEva <= 1 then
			effectEva = 1;
		end
		
		targetlist[i]:AddBuff(1632, skillLv, effectEva, 0, turn, 100);
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end
