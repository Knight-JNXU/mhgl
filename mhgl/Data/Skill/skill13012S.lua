--破釜沉舟

function skill13012CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此技能需十方无敌修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此技能需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end
end

function skill13012Use(Atk, Target, battle, skillLv)

	
	local targetlist = {};
	
	local maxTargetCount =3;
	
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, maxTargetCount, SelMulti, SPDDownSort, bufflist, 0);
	
	local count = 0;
	while targetlist[count] ~= nil do
		count = count + 1;
	end
	
	
	local consumeHp = 0.1 * Atk:GetHP() * math.random(9, 11) / 10;
	
	if consumeHp <= 1 then
		consumeHp = 1;
	end
	
	local reqHp = Atk:GetMaxHP() * 0.5;
	if Atk:GetHP() < reqHp then
		Atk:SkillFail("\#W[战斗讯息]：生命大于\#G50\%\#W，无法施展破釜沉舟");
		do return end
	end
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:GetIndex() ~= Atk:GetIndex() then			
			
			local wDam = 1;		--是CBatActor类型 
			local PartnerOwner;			--是CBatActor类型 
			if targetlist[i]:IsParnter() then
				local pBatMob = targetlist[i]:ToBatMob();
				if pBatMob ~= nil then
					for ii=0, battle:GetActorCount() - 1 do
						local pActor = battle:GetActor(ii);
						if pActor:IsPlayer() then
							local pBatChar = pActor:ToBatChar();
							if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
								PartnerOwner = pActor;
								wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(383);
							end
						end
					end
				end
			else
				wDam = 1.02 ^ Atk:GetSkillLv(376) * 0.98 ^ targetlist[i]:GetSkillLv(377);
			end
			local randomDam = 1.2 - math.random(100, 300) / 1000;
			local weaponDam = 0.25 * (Atk:GetHIT() - Atk:GetAGI() * 1.7 - 6);
			local critDam = 2.0;
			local FinalDef = targetlist[i]:GetDEF();
			--法宝提升忽视对方防御的结算
	        if Atk:GetSkillLv(394) > 0 then
		       FinalDef = FinalDef - (Atk:GetSkillLv(394) * 0.01 * FinalDef)
	        end
	        --法宝提升忽视对方防御的结算处理完毕
			if 0.8 * Atk:GetATK() > FinalDef then
				if math.random(1, 100) <= 5 then
					FinalDef = FinalDef / 2;
				end
			end
			
			local FinalDam = 0;
			local CritHit = 0;
			local CritRate =  math.floor(Atk:GetSkillLv(13010) / 10) + 2;
			if math.random(1,100) <= CritRate then
				FinalDam =  ((1.2 * Atk:GetATK() - FinalDef +250)*wDam-250) * randomDam *critDam;
				CritHit = 1;
			else
				FinalDam =  ((1.2 * Atk:GetATK() - FinalDef+250)*wDam-250) * randomDam;
				end
			
			--法宝提升对怪物的结算
			if Atk:GetSkillLv(394) > 0 then
			   fabao = Atk:GetSkillLv(394)*0.03 
			end
			if targetlist[i]:IsMob() or targetlist[i]:IsBoss()  then
			   FinalDam = FinalDam + (FinalDam * fabao)
			end
			--法宝提升对怪物的结算处理完毕
			if targetlist[i]:GetCommand() == LuaI.BATCMD_DEFEND then
				FinalDam = FinalDam / 1.5  ;
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-2 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-2 * FinalDam, 0, 0, 0, LuaI.BATCMD_DEFEND_HIT);
					end
				end
			else
				if  FinalDam <= 10 then
					FinalDam = math.random(1, 10);
				end
				
				local result = skillCanHit(Atk,targetlist[i]);
				if result == 2 then
					targetlist[i]:MissSkill();
				else
					--targetlist[i]:ChangeHp(-1 * FinalDam);
					if CritHit == 1 then
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_CRIT_HIT);
					else
						targetlist[i]:AddAttriChangeToLst(-1 * FinalDam, 0, 0, 0, LuaI.BATCMD_SKILL_HIT);
					end
				end
			end
			battle:PushReactionActor(targetlist[i]);
		end
		i = i + 1;
	end
	
	if Atk:GetHP() ~= 1 then
		Atk:ChangeHp(-1 * consumeHp, false);
	end
	
	local DefEffect = 0.8 + math.floor(Atk:GetSkillLv(13010) / 5) / 100;
	local PowEffect = 0.8 + math.floor(Atk:GetSkillLv(13010) / 5) / 100;
	
	Atk:AddBuff(1300, skillLv, 0, 0, 1, 100);
	Atk:AddBuff(1301, skillLv, DefEffect, PowEffect, 1, 100);
end

