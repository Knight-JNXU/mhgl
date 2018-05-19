--Ê¥ÔôÕÙ»½CharµÄAI

function buff5000Active(buff, Char, Other, Type)
	
	if Type == DO_ACTION then
		--[[local Eflag = 0;
		local i = buff:GetBuffValue2();
		if Char:GetHP() > 0 then
			if i >= 5 then
				Eflag = 1;
				Char:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
			else
				i = i + 1;
				buff:SetBuffValue2(i);
			end
		end
		if Eflag == 0 then
			if not Char:IsBuffExist(1113) and not Char:IsBuffExist(1114) then
				local battle = Char:GetBattle();
				local actorCount = battle:GetActorCount();
				local actorList = {};
				local actorListCount = 0;
				local protectList = {};
				local protectListCount = 0;
				
				local atkActor = -1;
				local protectActor = -1;	
				
				local AtkRate = 25;
				local SkillRate = 100;
				local DefRate = 100;
				local ProtectRate = 100;
				local ExcapeRate = 100;
				
				if Char:IsMob() and not Char:IsParnter() then
					if Char:GetMob_id() == 1012 or Char:GetMob_id() == 1013 then
						AtkRate = 10;
						SkillRate = 100;
						DefRate = 100;
						ProtectRate = 100;
						ExcapeRate = 100;
					end
				end
				
				if Char:GetSP() == 0 then
					AtkRate = 100;
					SkillRate = 100;
					DefRate = 100;
					ProtectRate = 100;
					ExcapeRate = 100;
				end
				
				for i = 0, actorCount - 1 do
					local actor = battle:GetActor(i);
					if (actor ~= nil and actor:GetTeam() ~= Char:GetTeam() and actor:IsValidTarget()) then
						actorList[actorListCount] = actor:GetIndex();
						actorListCount = actorListCount + 1;
					end
					if (actor ~= nil and actor:GetTeam() == Char:GetTeam() and actor:IsValidTarget() --and 
						--actor:GetIndex() ~= Char:GetIndex()
						) then
						protectList[protectListCount] = actor:GetIndex();
						protectListCount = protectListCount + 1;
					end
				end
				
				local Rate = math.random(1, 100);
				if actorListCount > 0 then
					local R = math.random(0, actorListCount - 1);
					local S = math.random(0, protectListCount - 1);
					if Rate <= AtkRate then--atk 0%
						if atkActor ~= -1 then
							Char:InputCommand(LuaI.BATCMD_ATTACK, atkActor, 0, 0);
						else
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						end
					elseif Rate > AtkRate and Rate <= SkillRate then --skill 100%
						if Char:IsBuffExist(1103) or Char:IsBuffExist(1104) or Char:IsBuffExist(1105) or Char:IsBuffExist(1116) or Char:IsBuffExist(1809) then				
							if Skill == 1 then					
								Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
							end
						else
							local randomSkill = Char:GetRandomSkill();
							if randomSkill ~= 0 then
							    local csv = Char:GetSkillCsvData(randomSkill);
				                if csv ~= nil then
				               		if csv.targetType == 4 then
									    if protectActor ~= -1 then
				                            Char:InputCommand(LuaI.BATCMD_SKILL, protectActor, randomSkill, 0);
								        else
									        Char:InputCommand(LuaI.BATCMD_SKILL, protectList[S], randomSkill, 0);
									    end
									
							        elseif csv.targetType == 5 then
									    if atkActor ~= -1 then
									        Char:InputCommand(LuaI.BATCMD_SKILL, atkActor, randomSkill, 0);
								        else
									        Char:InputCommand(LuaI.BATCMD_SKILL, actorList[R], randomSkill, 0);
								        end		
							        end
								end	
							else
								Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
							end
						end
					elseif Rate > SkillRate and Rate <= DefRate then
						Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
					elseif Rate > DefRate and Rate <= ProtectRate then
						if protectListCount > 0 then
							if protectActor ~= -1 then
								Char:InputCommand(LuaI.BATCMD_PROTECT, protectActor, 0, 0);
							else
								local P = math.random(0, protectListCount - 1);
								Char:InputCommand(LuaI.BATCMD_PROTECT, protectList[P], 0, 0);
							end
						elseif protectListCount == 0 then
							Char:InputCommand(LuaI.BATCMD_ATTACK, actorList[R], 0, 0);
						end
					elseif Rate > ProtectRate and Rate <= ExcapeRate then
						Char:InputCommand(LuaI.BATCMD_ESCAPE, 0, 0, 0);
					end
				else
					Char:InputCommand(LuaI.BATCMD_DEFEND, 0, 0, 0);
				end
			end
		end]]
	end
end
