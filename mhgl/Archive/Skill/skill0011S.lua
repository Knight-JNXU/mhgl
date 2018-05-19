--狮子吼

function skill0011CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需追捕技巧修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill0011Use(Atk, Target, battle, skillLv)
	if Target:IsMob() and Target:IsBoss() == false and Target:IsParnter() ==false then
		local consumeSp = 0.4 * skillLv;
		
		if consumeSp < 1 then
			consumeSp = 1;
		end
			
		local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展此招式", consumeSp);
		if  Atk:GetSP() < consumeSp then
			Atk:SkillFail(Msg);
			do return end
		end
		
		Atk:ChangeSp(-1 * consumeSp, false);
		
		local hitRate = 65 + 2 *(skillLv - Target:GetLevel()) + 1.5 *(Atk:GetSkillLv(378) - Target:GetSkillLv(379));
		
		if hitRate < 30 then
			hitRate = 30;
		elseif hitRate > 80 then
			hitRate = 80;
		end
		
		local rate = math.random(0, 100);
		if rate > hitRate then
			Target:MissSkill();
			battle:PushReactionActor(Target);
			do return end
		end
		
		local turn = 2 + math.floor((skillLv - Target:GetLevel()) / 10);
		
		if turn < 1 then
			turn = 1;
		elseif turn > 3 then
			turn = 3;
		end
		
		Target:AddBuff(26, 0, 0, 0, turn, 100);
		battle:PushReactionActor(Target);
		
	elseif Target:IsParnter() or Target:IsPlayer() then
	
		local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 5);
	
		if turn < 1 then
			turn = 0;
		elseif turn > 5 then
			turn = 5;
		end
	
		local SpdEffect = (1 - 0.15 * skillLv / 100) * Target:GetSPD();
		Target:AddBuff(59, skillLv, SpdEffect, 0, turn, 100);
		battle:PushReactionActor(Target);
	end
	
	
end
