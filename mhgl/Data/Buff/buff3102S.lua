--跳稀有同伴后玩家的状态

function buff3102Active(buff, Char, Other, Type)
	
	if Type == DO_HITTING_ATTACKER then		
		local Lv = Char:GetLevel();	
		local battle = Char:GetBattle();
		local positionsign = 0;
		if Other:GetHP() == 0 then
			for i = 0, battle:GetActorCount() - 1 do
				local actor = battle:GetActor(i)
				if actor:IsPlayer() then
					if actor:GetIndex() == Char:GetIndex() then
						positionsign = i;
						break
					end
				elseif actor:IsParnter() then					
					local ZpBatMob = Char:ToBatMob();
					if ZpBatMob ~= nil then
						for j = 0, battle:GetActorCount() - 1 do
							local ZpActor = battle:GetActor(j);
							if ZpActor:IsPlayer() then
								local ZpBatChar = ZpActor:ToBatChar();
								if ZpBatChar ~= nil and ZpBatChar:GetChar_id() == ZpBatMob:GetOwner_id() then									
									positionsign = j;									
								end
							end							
						end
					end
				end
			end
			Other:AddBuff(3101, Lv, positionsign, 0, 3, 100);	
		end				
	end						
end 