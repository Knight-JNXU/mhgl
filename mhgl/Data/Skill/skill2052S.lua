--离心大禁制

function skill2052CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需幽灵秘谱修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1816) then
		Atk:SkillFail("\#W[战斗讯息]：调息期间不能使用该技能");
	end
end

function skill2052Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展离心大禁制", consumeSp);
	
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
		local HitRate = 0;
		local baseRate = math.random(32, 48)
		if skillLv > targetlist[i]:GetLevel() then
			HitRate = baseRate + 2 * (skillLv - targetlist[i]:GetLevel()) ^ 0.5;
		else
			HitRate = baseRate + 2.2 * (skillLv - targetlist[i]:GetLevel());
		end
		if math.random(1, 100) > HitRate and not targetlist[i]:IsBuffExist(1126) then
			targetlist[i]:AddBuff(1126, skillLv, 0, 0, 3, 100);
		end
		Atk:AddBuff(1816, skillLv, 0, 0, 2, 100);
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

