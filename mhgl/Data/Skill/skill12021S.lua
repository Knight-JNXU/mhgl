--阎罗令

function skill12021CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需幽冥术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
	
end

function skill12021Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	
	local maxTargetCount = math.floor((skillLv - 25) / 25) + 2;
	
	if maxTargetCount > 7 then
		maxTargetCount = 7;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end

	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 25)/ 25) * 25 + 25;
	local consumeSp = 20 * count ;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展阎罗令",consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local i = 0;
	while targetlist[i] ~= nil do
		local hpChange = ((skillLv*1.5+30) * 2 + skillLv * 2) * 1.5;
		if targetlist[i]:IsParnter() or targetlist[i]:IsPlayer()  then
			hpChange = (skillLv*1.5+30) * 2 + skillLv * 2;
		end
		
		if LuaI.GetGameTime(0) == 1 then
			hpChange = hpChange * 1.3;
		end
		if hpChange <= 10 then
			hpChange = math.random(1, 10);
		end
		--法宝提升对怪物的结算
		if Atk:GetSkillLv(394) > 0 then
		   if targetlist[i]:IsMob() or targetlist[i]:IsBoss()  then
		   hpChange = hpChange + (hpChange * Atk:GetSkillLv(394)*0.05 )
           else
		   hpChange = hpChange + (hpChange * Atk:GetSkillLv(394)*0.02 )
		   end
		end

		--法宝提升对怪物的结算处理完毕
		--if hpChange > targetlist[i]:GetHP() then
		--	hpChange = targetlist[i]:GetHP();
		--end
		
		local result = skillCanHit(Atk, targetlist[i]);
		
		if result == 2 then
			targetlist[i]:MissSkill();
		else
			targetlist[i]:ChangeHp(-1 * hpChange);
			targetlist[i]:ChangeMHp(-1 * hpChange / 3);
		end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
end

