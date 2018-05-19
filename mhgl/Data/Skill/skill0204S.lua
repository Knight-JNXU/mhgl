function skill0204CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需长河落日修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill0204Use(Atk, Target, battle, skillLv)
	
	local consumeSp = 1.5 * skillLv ;
	
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施放含烟扶柳", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	

	local rec = 2 * skillLv + 0.2 * Atk:GetWeaponATK()  + 0.15 * Atk:GetPOW();
	if rec <= 1 then
		rec = 1;
	end
			
	local turn = 2 + math.floor((skillLv - 30) / 60);
	if turn > 4 then
		turn = 4;
	elseif turn < 2 then
		turn = 2;
	end
			
	Target:ChangeSp(rec);
	battle:PushReactionActor(Target);
	Target:AddBuff(44, rec, 0, 0, turn, 100);		
end
