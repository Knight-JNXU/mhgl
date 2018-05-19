--毒云弥散

function skill3052CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需乾天罡气修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill3052Use(Atk, Target, battle, skillLv)
	
	local targetlist = {};
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	
	--Sp=0.3 * 技能等级 +10
	local consumeSp = 0.7 * skillLv +10;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：內力不足\#G%d\#W，无法施展毒云弥散", consumeSp);
	
	if Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	--local skillid = {2041,2411,3031};
	local buffid = {1000,1001,1002,1003,1004,1005,3098,3099};--对应skillid
	local rate = {0, 0, 0, 0, 0, 0, 0, 0};
	local hitRate = 0;
	local rateMax = 0;
	
	local j = 0;
	while targetlist[j] ~= nil do
		
		
		local i = 1;
		while buffid[i] ~= nil do
			if targetlist[j]:IsBuffExist(buffid[i]) then
				local buff = targetlist[j]:FindBuff(buffid[i]);
				rate[i] = buff:GetBuffCoolDown();
				if rate[i] > rateMax then
					rateMax = rate[i];
				end
			end
			i = i + 1;
		end
		
		if rateMax > 0 then
			i= 1;
			while buffid[i] ~= nil do
				targetlist[j]:RemoveBuff(buffid[i]);
				i = i + 1;
			end
			local skillDam = (Atk:GetSkillLv(3000) + Atk:GetSkillLv(3010) + Atk:GetSkillLv(3020) 
							+ Atk:GetSkillLv(3030) + Atk:GetSkillLv(3040)) * 0.48 + (Atk:GetSkillLv(3000) ^ 2 
							+ Atk:GetSkillLv(3010) ^ 2 + Atk:GetSkillLv(3020) ^ 2 + Atk:GetSkillLv(3030) ^ 2 
							+ Atk:GetSkillLv(3040) ^ 2 ) * 0.0016 + 20 ;
			local rec = 1.6 * skillLv + 0.5 * skillDam + 0.01 * targetlist[j]:GetMaxHP() + 0.1 * (Atk:GetPOW() + Atk:GetWeaponATK());
			targetlist[j]:ChangeHp(rec)
		end
		
		battle:PushReactionActor(targetlist[j]);
		j = j + 1;
	end
end


