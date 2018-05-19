--天佑苍生·改

function skill6209CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	
end

function skill6209Use(Atk, Target, battle, skillLv)

	local targetlist = {};
	--[[local consumeDp = 150;
	if Atk:IsBuffExist(1702) then
		consumeDp = consumeDp * 2;
	end
	local Msg = string.format("\#W[战斗讯息]：酒意不足\#G%d\#W，无法施展天佑苍生", consumeDp);
	
	if Atk:GetDP() < consumeDp then
		Atk:SkillFail(Msg);
		do return end
	end
	
	Atk:ChangeDp(-1 * consumeDp, false);]]
	
	local bufflist = {};
	targetlist = BattleSort(battle, Atk, Target, 100, SelAllSameTeam, 0, bufflist, 0);
	local listCount = 0;
	local pBattle = Atk:GetBattle();
	local actorCount = pBattle:GetActorCount();
	for i = 0,   actorCount - 1 do
		local pActor = pBattle:GetActor(i);
		if pActor and pActor:GetHP() == 0 and not pActor:GetLeftBattle() and 
			pActor:GetTeam() == Atk:GetTeam() then
			targetlist[listCount] = pActor;
			listCount = listCount + 1;
		end
	end
	
	--[[local hpdam = Atk:GetHP() * 0.9;
	local spdam = Atk:GetSP();
	Atk:ChangeHp(-1 * hpdam, false)
	Atk:ChangeSp(-1 * spdam, false)]]
	
	local i = 0;
	while targetlist[i] ~= nil do
		if targetlist[i]:IsPlayer() and targetlist[i]:GetHP() == 0 then
			
			local rec = targetlist[i]:GetMaxHP();
			--rec = 1;
			targetlist[i]:ChangeMHp(rec);
			targetlist[i]:ChangeHp(rec);
			if Atk:IsMob() then
				if Atk:GetMob_id() == 32057 then
					targetlist[i]:AddBuff(1117, 0, 0, 0, 3, 100);
				end
			end
		elseif targetlist[i]:IsMob() and not targetlist[i]:IsParnter() and targetlist[i]:GetHP() == 0 then
			local rec = targetlist[i]:GetMaxHP();
			targetlist[i]:ChangeHp(rec);
		end
		
		battle:PushReactionActor(targetlist[i]);
		i = i + 1;
	end
	
end

