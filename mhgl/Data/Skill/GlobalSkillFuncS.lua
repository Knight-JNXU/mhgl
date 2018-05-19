HPUpSort = 1;
HPDownSort = 2;
SPUpSort = 3;
SPDownSort = 4;
SPDUpSort = 5;
SPDDownSort = 6;
DEFUpSort = 7;
DEFDownSort = 8;
POWUpSort = 9;
POWDownSort = 10;
ATKUpSort = 11;
ATKDownSort = 12;
RandomSort = 255;

SelSingle = 0;
SelMulti = 1;
SelAllSameTeam = 2;
SelVec = 3;
SelHor = 4;
SelAll = 5

function SortCompare(Src, Target, method)
	if method == HPUpSort then
		return (Src:GetHP() / Src:GetMaxHP()) < (Target:GetHP() / Target:GetMaxHP());
	elseif method == HPDownSort then
		return (Src:GetHP() / Src:GetMaxHP()) < (Target:GetHP() / Target:GetMaxHP());
	elseif method == SPUpSort then
		return (Src:GetSP() / Src:GetMaxSP()) < (Target:GetSP() / Target:GetMaxSP());
	elseif method == SPDownSort then
		return (Src:GetSP() / Src:GetMaxSP()) < (Target:GetSP() / Target:GetMaxSP());
	elseif method == SPDUpSort then
		return Src:GetSPD() < Target:GetSPD();
	elseif method == SPDDownSort then
		return Src:GetSPD() > Target:GetSPD();
	elseif method == DEFUpSort then
		return Src:GetDEF() < Target:GetDEF();
	elseif method == DEFDownSort then
		return Src:GetDEF() > Target:GetDEF();
	elseif method == POWUpSort then
		return Src:GetPOW() < Target:GetPOW();
	elseif method == POWDownSort then
		return Src:GetPOW() > Target:GetPOW();
	elseif method == ATKUpSort then
		return Src:GetATK() < Target:GetATK();
	elseif method == ATKDownSort then
		return Src:GetATK() > Target:GetATK();
	elseif method == RandomSort then
		local num = math.random(0, 1);
		return num == 1;
	end
	return true;
end

function SelCompare(Src, Target, method)
	if method == SelAll then
		return true;
	elseif Src:GetTeam() ~= Target:GetTeam() then
		return false;
	end
	
	if method == SelVec then
		return math.fmod(Src:GetPosition() , 5) == math.fmod(Target:GetPosition() , 5);
	elseif method == SelHor then
		return math.floor(Src:GetPosition() / 5) == math.floor(Target:GetPosition() / 5);
	end
	return true;
end

function BattleSort(battle, Atk, Target, maxTargetCount, selMethod, sortMethod, buffIDList, buffIDCount)
	local targetlist = {};
	local targetcounter = 0;

	local sellist = {};	
	local sellistcounter = 0;
	
	local listIndex = 0;
	local actor = battle:GetActor(listIndex);
	listIndex = listIndex + 1;
	
	while actor ~= nil do
		if actor:GetIndex() ~= Target:GetIndex() and
			not actor:GetLeftBattle() and
			actor:IsValidTarget()  and
			SelCompare(actor, Target, selMethod) then
			ValidActionTarget(Atk, actor);
			if LuaI.GetTempResult() > 0 then
				sellist[sellistcounter] = actor;
				sellistcounter = sellistcounter + 1;
			end
		end
		
		actor = battle:GetActor(listIndex);
		listIndex = listIndex + 1;
	end
	
	
	--form the list first
	for k = 0, 	sellistcounter -1 do
		if targetcounter == 0 then
			targetlist[targetcounter] = sellist[k];
			targetcounter = targetcounter + 1;
		else
			for i = 0, targetcounter do
				if i == targetcounter then
					targetlist[targetcounter] = sellist[k];
					targetcounter = targetcounter + 1;
				elseif SortCompare(sellist[k] ,  targetlist[i], sortMethod) then
					local j = targetcounter;
					while j > i do
						targetlist[j] = targetlist[j - 1];
						j = j - 1;
					end
					
				--	for j = targetcounter, i + 1 do
				--		targetlist[j] = targetlist[j - 1];
				--	end
					targetlist[i] = sellist[k];
					targetcounter = targetcounter + 1;
					i = targetcounter + 1;
					break;
				end
			end
		end
	end

	
	local finalCount = 0;
	local finallist = {};
	local remainlist = {};
	
	finallist[finalCount] = Target;
	
	finalCount = finalCount + 1;
	
	local remainCount = 0;
	
	for i = 0, targetcounter - 1 do
		if finalCount >= maxTargetCount then
			break;
		elseif targetlist[i] == nil then
			break;
  		end
		--elseif buffID > 0 and targetlist[i]:IsBuffExist(buffID) then
		--	remainlist[remainCount] = targetlist[i];
		--	remainCount = remainCount + 1;
		local found = false;
		for k = 1, buffIDCount do
		    if targetlist[i]:IsBuffExist(buffIDList[k]) then
		        remainlist[remainCount] = targetlist[i];
				remainCount = remainCount + 1;
				found  = true;
		        break;
		    end
		end

		if not found then
			finallist[finalCount] = targetlist[i];
			finalCount = finalCount + 1;
		end

	end
	
	--[[if finalCount < maxTargetCount and 
		remainCount > 0 then
		for i = 0, remainCount - 1 do
			finallist[finalCount] = remainlist[i];
			finalCount = finalCount + 1;
			if finalCount >= maxTargetCount then
				break;
			end
		end
	end]]
	
	return finallist;
end

function skillCanHit(Atk, Def)  --用來判定此 skill 會否100%命中, 或100%迴避, 此function需在各skill的Use function時呼叫來檢查會否出現100%命中等情況
	local result = 0; -- 0 依照本來skill的命中法則, 1 : 100命中t, 2 100% 迴避
	local csv = Atk:GetSkillCsvData(Atk:GetSubType());
	if csv ~= nil then
		if Atk:GetFaction() == 1 and csv.form == 2 then
			result = 1;
		elseif Def:GetFaction() == 2 and csv.form == 1 and math.random(1, 100) <= 0 then
			result = 2;
		elseif Def:GetFaction() == 4 and csv.form == 2 and math.random(1, 100) <= 0 then
			result = 2;
		elseif Def:GetFaction() == 5 and csv.form == 8 and math.random(1, 100) <= 0 then
			result = 2;
		elseif Def:GetFaction() == 3 and csv.form == 6 and math.random(1, 100) <= 0 then
			result = 2;
		else
			result = 0;
		end
	else
		result = 0;
	end
	return result;
end
