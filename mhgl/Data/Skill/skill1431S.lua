--一元解穴

function skill1431CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需一元宝录修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill1431Use(Atk, Target, battle, skillLv)
	--Sp=0.4 * 技能等级 +10
	local consumeSp = 0.4 * skillLv + 10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展一元解穴", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local buffid = 1114;
	local rate = 0;
	local hitRate = 0;
	local rateMax = 0;
	local turnrateMax = 0;
	
	local turn = 1 + math.floor ((skillLv - 30) / 45);
	if turn < 1 then
		turn = 1;
	elseif turn > 2 then
		turn = 2;
	end
	
	if Target:IsBuffExist(buffid) then
		local buff = Target:FindBuff(buffid);
		rate = buff:GetBuffValue1();		
		rateMax = rate;
		turnrateMax = buff:GetBuffCoolDown();
	end
	
	if turnrateMax > 0 then
		
		local hitRate =  rateMax - skillLv; 	--中buff等级超过所用技能等级30 则命中=0 else 命中= 100
		
		if hitRate > 30 then
			hitRate = 0;
		else
			hitRate = 100;
		end
		
		local allfail = 1;
		if  hitRate == 100 then
			
			Target:RemoveBuff(buffid);
			Target:AddBuff(1602, skillLv, 0, 0, turn, 100);	
			allfail = 0;
		end
		
		if allfail == 1 then
			Atk:SkillFail("\#W[战斗讯息]：目标所中的点穴等级太高，解穴失败");
		end
	else
		Target:MissSkill();
	end
	
	battle:PushReactionActor(Target);
	
end

