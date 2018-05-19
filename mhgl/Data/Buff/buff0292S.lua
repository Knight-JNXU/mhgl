--镇帮神器：剑侍回血（当前百分比）
function buff0292Active(buff, Char, Other, Type) 
	
	if Type == TURN_START then
		if Char:GetHP() ~= 0 then
			local rec = Char:GetHP() * 0.04
			if rec <= 1 then
				rec = 1;
			end
			
			local a = 0
			local battle = Char:GetBattle()
			local actorCount = battle:GetActorCount();
			local NpcId = 0
			if battle:GetMob(0) then
				if battle:GetMob(0):GetMob_id() == 10771 then
					NpcId = 780
				elseif battle:GetMob(0):GetMob_id() == 10786 then
					NpcId = 781
				elseif battle:GetMob(0):GetMob_id() == 10787 then
					NpcId = 782
				elseif battle:GetMob(0):GetMob_id() == 10788 then
					NpcId = 783
				elseif battle:GetMob(0):GetMob_id() == 10789 then
					NpcId = 784
				elseif battle:GetMob(0):GetMob_id() == 10790 then
					NpcId = 785
				elseif battle:GetMob(0):GetMob_id() == 10791 then
					NpcId = 786
				elseif battle:GetMob(0):GetMob_id() == 10792 then
					NpcId = 787
				elseif battle:GetMob(0):GetMob_id() == 10793 then
					NpcId = 788
				elseif battle:GetMob(0):GetMob_id() == 10794 then
					NpcId = 789
				end
			end
			for i = 0, actorCount - 1 do
				local actor = battle:GetActor(i);							
				if (actor ~= nil and actor:IsPlayer()) then
					a = actor:GetOwner():GetQuests():GetNpcFlag(1004,NpcId,1)
					
					break
				end					
			end
			
			if Char:GetHP() < Char:GetMaxHP() then
				Char:ChangeHp(rec*a);
				for t = 0, actorCount - 1 do
					local actor = battle:GetActor(t);							
					if (actor ~= nil and actor:IsPlayer()) then
						actor:GetOwner():GetQuests():SetNpcFlag(1004,NpcId,1,0)
						break
					end					
				end
			end		
			Char:BuffActive();
		end
	end
end
