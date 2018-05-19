--无敌牛虱

function skill11022CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需牛虱阵修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:IsBuffExist(1305) then
		local Msg = ("\#W[战斗讯息]：调息期间不能再使用此技能");
		Atk:SkillFail(Msg);
	end
end

function skill11022Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.9 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展无敌牛虱", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	local actorCount = battle:GetActorCount();
	local amount = 0;
	
	for i = 0, actorCount - 1 do
		
		local actor = battle:GetActor(i);
		if actor:GetTeam() == Atk:GetTeam() and actor:IsBuffExist(1707) then
			amount = amount + 1;
		end
	end
	if amount > 1 then
		Atk:SkillFail("\#W[战斗讯息]：己方场上援助已满两个，不能再使用此技能");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local item = Atk:GetSkillUseItem();
	local itemid = item:GetItem_id();
	local team = Atk:GetTeam();
	local Pactor15 = battle:GetActorByPosition(0, team);
	local Pactor16 = battle:GetActorByPosition(1, team);
	local Pactor17 = battle:GetActorByPosition(2, team);
	local Pactor18 = battle:GetActorByPosition(3, team);
	local Pactor19 = battle:GetActorByPosition(4, team);
	
	Atk:AddBuff(1305, skillLv, 0, 0, 6, 100);
	if itemid == 28800 then
		if Pactor15 == nil then
			Atk:CallHelper(1011, skillLv, 15);
		elseif Pactor16 == nil then
			Atk:CallHelper(1011, skillLv, 16);
		elseif Pactor17 == nil then
			Atk:CallHelper(1011, skillLv, 17);
		elseif Pactor18 == nil then
			Atk:CallHelper(1011, skillLv, 18);
		elseif Pactor19 == nil then
			Atk:CallHelper(1011, skillLv, 19);
		else
			Atk:SkillFail("\#W[战斗讯息]：己方场上援助已满两个，不能再使用此技能");
			do return end
		end
	elseif itemid == 28801 then
		if Pactor15 == nil then
			Atk:CallHelper(1012, skillLv, 15);
		elseif Pactor16 == nil then
			Atk:CallHelper(1012, skillLv, 16);
		elseif Pactor17 == nil then
			Atk:CallHelper(1012, skillLv, 17);
		elseif Pactor18 == nil then
			Atk:CallHelper(1012, skillLv, 18);
		elseif Pactor19 == nil then
			Atk:CallHelper(1012, skillLv, 19);
		else
			Atk:SkillFail("\#W[战斗讯息]：己方场上援助已满两个，不能再使用此技能");
			do return end
		end
	elseif itemid == 28802 then
		if Pactor15 == nil then
			Atk:CallHelper(1013, skillLv, 15);
		elseif Pactor16 == nil then
			Atk:CallHelper(1013, skillLv, 16);
		elseif Pactor17 == nil then
			Atk:CallHelper(1013, skillLv, 17);
		elseif Pactor18 == nil then
			Atk:CallHelper(1013, skillLv, 18);
		elseif Pactor19 == nil then
			Atk:CallHelper(1013, skillLv, 19);
		else
			Atk:SkillFail("\#W[战斗讯息]：己方场上援助已满两个，不能再使用此技能");
			do return end
		end
	end

	--battle:PushReactionActor(Atk);
	
end

