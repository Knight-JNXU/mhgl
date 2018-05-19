--推气过宫

function skill19043CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需岐黄之术修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill19043Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local maxTargetCount = math.floor((skillLv - 20) / 25) + 2;
	
	if maxTargetCount > 6 then
		maxTargetCount = 6;
	elseif maxTargetCount < 2 then
		maxTargetCount = 2;
	end
	
	if Atk:GetSkillLv(394) > 0 then --法宝 +1
	   maxTargetCount = maxTargetCount + 1
	end
	
	local bufflist = {2020, 1112};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, HPUpSort, bufflist, 2);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	local MSSLv = math.floor((skillLv - 20)/ 25) * 25 + 20;
	local consumeSp = ((0.8 * MSSLv + 20) / maxTargetCount) * count;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展推气过宫", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	if Target:IsBuffExist(2020) then
		Atk:SkillFail("\#W[战斗讯息]：选中的目标不能接收治疗,技能施展失败");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local weaponDam = Atk:GetWeaponATK();
	local skillDam = (Atk:GetSkillLv(2800) + Atk:GetSkillLv(2810) + Atk:GetSkillLv(2820) 
					+ Atk:GetSkillLv(2830) + Atk:GetSkillLv(2840)) * 0.48 + (Atk:GetSkillLv(2800) ^ 2 
					+ Atk:GetSkillLv(2810) ^ 2 + Atk:GetSkillLv(2820) ^ 2 + Atk:GetSkillLv(2830) ^ 2 
					+ Atk:GetSkillLv(2840) ^ 2 ) * 0.0016 + 20 ;
	local i = 0;
	while targetlist[i] ~= nil do
		local rec = (3 - 0.2 * count) * skillLv + 0.1 * skillDam + ((Atk:GetSkillLv(378)+10)*10) + 
					0.01 * targetlist[i]:GetMaxHP() + 0.15 * (Atk:GetPOW() + weaponDam);
		if rec <= 1 then
			rec = 1;
		end
		rec = rec*1.9
		local CritRate = math.random(1,100)
		if Atk:GetSkillLv(394) > 0 then --法宝
		   rec = rec + (rec * Atk:GetSkillLv(394) * 0.02)
		end
		if CritRate <= 15 then
		   rec = rec*1.6
		end
		if rec > targetlist[i]:GetMHP() then
			rec = targetlist[i]:GetMHP();
		end
		
		
		targetlist[i]:ChangeHp(rec);
		-- if Crit == 1 then
		   -- targetlist[i]:AddAttriChangeToLst(hpChange, 0, 0, 0, LuaI.BATCMD_CRIT_HIT); --暴击效果  BATCMD_CRIT_HIT暴击效果 BATCMD_SKILL_HIT普通效果  BATCMD_DEFEND_CRIT_HIT防御暴击效果  BATCMD_DEFEND_HIT防御效果
		-- else
		   -- targetlist[i]:AddAttriChangeToLst(hpChange, 0, 0, 0, LuaI.BATCMD_SKILL_HIT); --普通效果
		-- end
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

