--尸腐毒

function skill12051CanUse(Atk, skillLv, reqSkillLv, reqCharLv)	
	if skillLv < reqSkillLv then 
		local Msg = string.format("\#W[战斗讯息]：此招式需尸腐恶修炼到\#G%d\#W级以上才能施展", reqSkillLv);
		Atk:SkillFail(Msg);
		do return end
	elseif Atk:GetLevel() < reqCharLv then
		local Msg = string.format("\#W[战斗讯息]：此招式需人物等级\#G%d\#W以上才能施展", reqCharLv);
		Atk:SkillFail(Msg);
	end	
end

function skill12051Use(Atk, Target, battle, skillLv)
    
	local consumeSp = 40;
	if Atk:IsBuffExist(1702) then
		consumeSp = consumeSp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：魔法不足\#G%d\#W，无法施展尸腐毒", consumeSp);
	if  Atk:GetSP() < consumeSp then
		Atk:SkillFail(Msg);
		do return end
	end

	if Target:IsBuffExist(1001) then
		Atk:SkillFail("\#W[战斗讯息]：目标已经中了尸腐毒");
		do return end
	end
	
	Atk:ChangeSp(-1 * consumeSp, false);
	
	local nDam = 1;		--是CBatActor类型 
	local PartnerOwner;			--是CBatActor类型 
	if Target:IsParnter() then
		local pBatMob = Target:ToBatMob();
		if pBatMob ~= nil then
			for ii=0, battle:GetActorCount() - 1 do
				local pActor = battle:GetActor(ii);
				if pActor:IsPlayer() then
					local pBatChar = pActor:ToBatChar();
					if pBatChar ~= nil and pBatChar:GetChar_id() == pBatMob:GetOwner_id() then
						PartnerOwner = pActor;
						nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ PartnerOwner:GetOwner():GetSkillLv(385);
					end
				end
			end
		end
	else
		nDam = 1.02 ^ Atk:GetSkillLv(378) * 0.98 ^ Target:GetSkillLv(379);
	end
	
	local BuffRate = 100;
	local LvDif = skillLv - Target:GetLevel();
	
	
	if math.random(1, 100) > BuffRate then
		Target:MissSkill();
		battle:PushReactionActor(Target);
		do return end
	end
	
	local turn = 3 + math.floor((skillLv - Target:GetLevel()) / 10);
	if turn < 1 then
		turn = 1;
	elseif turn > 5 then
		turn = 5;
	end
	
	local hpChange = Target:GetHP() * 0.1;
	local spChange = Target:GetSP() * 0.05;
	local mhpChange = Target:GetMHP() * 0.1;
	local dulv =  skillLv + 25;
	local dusxlv =  skillLv + 10;
	local result = skillCanHit(Atk, Target);	
	if result == 2 then
		Target:MissSkill();
	else	
		local targetlist = {};
		local bufflist = {2020, 1112};
	    targetlist = BattleSort(battle, Atk, Atk, 10, SelMulti, HPUpSort, bufflist, 2);
		
		--Target:ChangeHp(-1 * dulv * 2);
		local ChangeHpTarget = 0
		local ChangeHpSelf = 0
		local fabaoLv = Atk:GetSkillLv(394);
		if fabaoLv == 0 then
		   fabaoLv = 1
		end
		if fabaoLv > 0 then --法宝
		   ChangeHpTarget = (fabaoLv * 0.2 + 1) * dulv * 2.5
		   ChangeHpSelf = (fabaoLv * 0.1 + 1) * dulv * 2.5
		else
		   ChangeHpTarget = fabaoLv * dulv * 2
		   ChangeHpSelf = fabaoLv * dulv * 2 * 0.8
		end
		Target:ChangeHp(-1 * ChangeHpTarget); --目标扣血
		
		local i = 0
		while targetlist[i] ~= nil do -- 给本队回血
		   if targetlist[i]:GetTeam() == Atk:GetTeam() then
		      if ChangeHpSelf <= 1 then
			     ChangeHpSelf = 1;
		      end
			  if ChangeHpSelf > targetlist[i]:GetMHP() then
			     ChangeHpSelf = targetlist[i]:GetMHP();
		      end
		      targetlist[i]:ChangeHp(ChangeHpSelf);
		   end
		   battle:PushReactionActor(targetlist[i]);
		   i = i + 1;
		end
		Target:ChangeMHp(-1 * dusxlv);
		Target:ChangeSp(-1 * spChange);
		Target:AddBuff(1001, skillLv, 0, 0, turn, 100);
	end
	battle:PushReactionActor(Target);	
end

