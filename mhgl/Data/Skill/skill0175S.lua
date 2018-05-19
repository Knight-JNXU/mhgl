--无忧散

function skill0175CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需禁方秘药修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0175Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 0.4 * skillLv + 10;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施放无忧散", consumeSp);
	
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);	
	
	local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 10);
	
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end	
	
	local value1 = math.floor((skillLv + 20) / 50);
	local skillcount = 0;
	local skilllist = {};
	while value1 > 0 do
		local RandomSkill = Atk:GetRandomSkill();
		
		if RandomSkill == 0 then
			break;
		else
			local i = 0;
			local exist = 0;
			while i < skillcount do
				if RandomSkill == skilllist[i] then
					exist = 1;
					break;
				end
				
				i = i + 1;
			end
				
			if exist == 0 then
				table.insert(skilllist, RandomSkill);
				skillcount = skillcount + 1;
			end
		end
		
		value1 = value1 - 1;
	end
		
	local buffvalue1 = 0;
	local buffvalue2 = 0;
	local buffvalue3 = 0;
	if skillcount > 0 then
		local i = 0;
		while i < skillcount do
			if i == 0 then
				buffvalue1 = skilllist[i];
			elseif i == 1 then
				buffvalue2 = skilllist[i];
			elseif i == 2 then
				buffvalue3 = skilllist[i];
			end
			
			i = i + 1;
		end
	end
	
	Target:AddBuff(48, 62, buffvalue2, buffvalue3, turn, 100);
	battle:PushReactionActor(Target);
end

