--飞龙探云手

function skill2251CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需煞气经修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill2251Use(Atk, Target, battle, skillLv)
	--Sp=0.2 * 技能等级 +10
	local consumeSp = 0.5 * skillLv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展飞龙探云手", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);

	--local skillid = {2041,2411,3031};
	local buffid = {1201,1202,1203,1500,1501,1503,1504,1505,1506,1507,1514,1518,1519,1632,1634,1803,1804,1806,1807,1815};		--对应skillid
	local rate1 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	local rate2 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	local rate3 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	local rate4 = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
	
	local i = 1;
	while buffid[i] ~= nil do
		if Target:IsBuffExist(buffid[i]) then
			local buff = Target:FindBuff(buffid[i]);
			rate1[i] = buff:GetBuffValue1();
			rate2[i] = buff:GetBuffValue2();
			rate3[i] = buff:GetBuffValue3();
			rate4[i] = buff:GetBuffCoolDown();
			Atk:AddBuff(buffid[i], rate1[i], rate2[i], rate3[i], rate4[i], 100);
		end
		i = i + 1;
	end
	
	battle:PushReactionActor(Target);
	
end


