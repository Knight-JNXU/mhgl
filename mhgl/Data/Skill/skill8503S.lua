--识微之术

function skill8503CanUse(Atk, skillLv, reqSkillLv, reqCharLv)
	local buffData = Atk:FindBuff(22000)
	local WaitTime 
	if buffData ~= nil then 
		local CoolTime = buffData:GetBuffCoolDown()
		WaitTime = CoolTime/60 + 1
	end
	
	if Atk:IsBuffExist(22000) then
		Atk:SkillFail(string.format("\#W[技能讯息]：此招式处于冷却时间,剩余%d分钟。",WaitTime));
		do return end
	elseif not Atk:GetItems():HasItem(401020) and not Atk:GetItems():HasItem(401021) and not Atk:GetItems():HasItem(401022) then	
		Atk:SkillFail("\#W[技能讯息]：没有无根水，无法使用技能。");
		do return end
	end	
	
end

function skill8503Use(Atk, Target, battle, skillLv)
	local LZ = {400112,400113,400114,400127,400120,400146,400066,400155,
				400187,400131,400188,400158,400116,400057,400153,400151,
				400161,400222,400080,400081,400082}
	local PT = {400191,400118,400011,400012,400088,400154,400167,400139,
				400174,400162,400173,400159,400172,400175,400076,400063,
				400189,400190,400192,400193}
	local JZ = {400067,400073,400211,400219,400213,400215,400217,400212,
				400218,400216,400221,400071}
	local XY = {400033,400040,400028,400025,400205,400039,400210,400214}			
	local JS = {400000,400007,400027,400021,400006 }	

	local plz = 0
	local ppt = 0
	local pjz = 0
	local pxy = 0
	local pjs = 0
	local i = 0
			
	for i = 1 , 100 do
		if ( Target:GetMobID() == LZ[i] and skillLv >= 1 ) or (Target:GetMobID() == PT[i] and skillLv >= 2) or (Target:GetMobID() == JZ[i] and skillLv >= 3) or (Target:GetMobID() == XY[i] and skillLv >= 4) or (Target:GetMobID() == JS[i] and skillLv == 5) then
		
			if skillLv == 1 then
				plz = 50
			elseif skillLv == 2 then
				plz = 80
				ppt = 50
			elseif skillLv == 3 then
				plz = 100
				ppt = 80
				pjz = 50
			elseif skillLv == 4 then
				plz = 100
				ppt = 100
				pjz = 80
				pxy = 50
			elseif skillLv == 5 then
				plz = 100
				ppt = 100
				pjz = 100
				pxy = 80
				pjs = 50
			end
			local A = math.random(0,100)
			local B = math.random(0,100)
			local C = math.random(0,100)
			local D = math.random(0,100)
			local E = math.random(0,100)
			
			if Target:GetMobID() == LZ[i] then
				if Atk:GetItems():HasItem(401022) then
					Atk:GetItems():RemoveItem(401022,1)
					Atk:AddBuff(22000, 0, 0, 0, 5, 100)
				elseif Atk:GetItems():HasItem(401021) then
					Atk:GetItems():RemoveItem(401021,1)
					Atk:AddBuff(22000, 0, 0, 0, 15, 100)
				elseif Atk:GetItems():HasItem(401020) then
					Atk:GetItems():RemoveItem(401020,1)
					Atk:AddBuff(22000, 0, 0, 0, 30, 100)
				end
				if A < plz then
					for i = 21000, 21100 do
						Target:RemoveBuff(i)
					end
					Target:RemoveBuff(Target:GetMobID()-379990)
					Target:ChangeToMob(0,1)
					Atk:UseSkillMsg("\#W[技能讯息]：成功识破对方易容。")
					Target:UseSkillMsg(string.format("\#W[讯息]：你的易容效果被 %s 识破。",Atk:GetName()))
					do return end
				else 
					Atk:SkillFail("\#W[技能讯息]：识破对方易容失败。")
					do return end
				end
				
			elseif Target:GetMobID() == PT[i] and ppt > 0 then
				if Atk:GetItems():HasItem(401022) then
					Atk:GetItems():RemoveItem(401022,1)
					Atk:AddBuff(22000, 0, 0, 0, 5, 100)
				elseif Atk:GetItems():HasItem(401021) then
					Atk:GetItems():RemoveItem(401021,1)
					Atk:AddBuff(22000, 0, 0, 0, 15, 100)
				elseif Atk:GetItems():HasItem(401020) then
					Atk:GetItems():RemoveItem(401020,1)
					Atk:AddBuff(22000, 0, 0, 0, 30, 100)
				end
				if B < ppt then
					for i = 21000, 21100 do
						Target:RemoveBuff(i)
					end
					Target:RemoveBuff(Target:GetMobID()-379990)
					Target:ChangeToMob(0,1)
					Atk:UseSkillMsg("\#W[技能讯息]：成功识破对方易容。")
					Target:UseSkillMsg(string.format("\#W[讯息]：你的易容效果被 %s 识破。",Atk:GetName()))
					do return end
				else 
					Atk:SkillFail("\#W[技能讯息]：识破对方易容失败。")
					do return end
				end
				
			elseif Target:GetMobID() == JZ[i] and pjz > 0 then
				if Atk:GetItems():HasItem(401022) then
					Atk:GetItems():RemoveItem(401022,1)
					Atk:AddBuff(22000, 0, 0, 0, 5, 100)
				elseif Atk:GetItems():HasItem(401021) then
					Atk:GetItems():RemoveItem(401021,1)
					Atk:AddBuff(22000, 0, 0, 0, 15, 100)
				elseif Atk:GetItems():HasItem(401020) then
					Atk:GetItems():RemoveItem(401020,1)
					Atk:AddBuff(22000, 0, 0, 0, 30, 100)
				end
				if C < pjz then
					for i = 21000, 21100 do
						Target:RemoveBuff(i)
					end
					Target:RemoveBuff(Target:GetMobID()-379990)
					Target:ChangeToMob(0,1)
					Atk:UseSkillMsg("\#W[技能讯息]：成功识破对方易容。")
					Target:UseSkillMsg(string.format("\#W[讯息]：你的易容效果被 %s 识破。",Atk:GetName()))
					do return end
				else 
					Atk:SkillFail("\#W[技能讯息]：识破对方易容失败。")
					do return end
				end
			
			elseif Target:GetMobID() == XY[i] and pxy > 0 then
				if Atk:GetItems():HasItem(401022) then
					Atk:GetItems():RemoveItem(401022,1)
					Atk:AddBuff(22000, 0, 0, 0, 5, 100)
				elseif Atk:GetItems():HasItem(401021) then
					Atk:GetItems():RemoveItem(401021,1)
					Atk:AddBuff(22000, 0, 0, 0, 15, 100)
				elseif Atk:GetItems():HasItem(401020) then
					Atk:GetItems():RemoveItem(401020,1)
					Atk:AddBuff(22000, 0, 0, 0, 30, 100)
				end
				if D < pxy then
					for i = 21000, 21100 do
						Target:RemoveBuff(i)
					end
					Target:RemoveBuff(Target:GetMobID()-379990)
					Target:ChangeToMob(0,1)
					Atk:UseSkillMsg("\#W[技能讯息]：成功识破对方易容。")
					Target:UseSkillMsg(string.format("\#W[讯息]：你的易容效果被 %s 识破。",Atk:GetName()))
					do return end
				else 
					Atk:SkillFail("\#W[技能讯息]：识破对方易容失败。")
					do return end
				end
			
			elseif Target:GetMobID() == JS[i] and pjs > 0 then
				if Atk:GetItems():HasItem(401022) then
					Atk:GetItems():RemoveItem(401022,1)
					Atk:AddBuff(22000, 0, 0, 0, 5, 100)
				elseif Atk:GetItems():HasItem(401021) then
					Atk:GetItems():RemoveItem(401021,1)
					Atk:AddBuff(22000, 0, 0, 0, 15, 100)
				elseif Atk:GetItems():HasItem(401020) then
					Atk:GetItems():RemoveItem(401020,1)
					Atk:AddBuff(22000, 0, 0, 0, 30, 100)
				end
				if E < pjs then
					for i = 21000, 21100 do
						Target:RemoveBuff(i)
					end
					Target:RemoveBuff(Target:GetMobID()-379990)
					Target:ChangeToMob(0,1)
					Atk:UseSkillMsg("\#W[技能讯息]：成功识破对方易容。")
					Target:UseSkillMsg(string.format("\#W[讯息]：你的易容效果被 %s 识破。",Atk:GetName()))
					do return end
				else 
					Atk:SkillFail("\#W[技能讯息]：识破对方易容失败。")
					do return end
				end
			
			--[[elseif Target:GetMobID() == 0 then
				if Atk:GetItems():HasItem(401022) then
					Atk:GetItems():RemoveItem(401022,1)
					
				elseif Atk:GetItems():HasItem(401021) then
					Atk:GetItems():RemoveItem(401021,1)
					
				elseif Atk:GetItems():HasItem(401020) then
					Atk:GetItems():RemoveItem(401020,1)
					
				end
				Atk:SkillFail("\#W额...悲剧，你看走眼了，对方没有变身。")
				do return end]]
			
			elseif pjs < 50 then
				Atk:SkillFail("\#W[技能讯息]：技能等级不足，识破失败。")
				do return end
			end
		
		end
	end
	
	
		
	if Target:GetMobID() == 0 then
		if Atk:GetItems():HasItem(401022) then
			Atk:GetItems():RemoveItem(401022,1)
		elseif Atk:GetItems():HasItem(401021) then
			Atk:GetItems():RemoveItem(401021,1)
						
		elseif Atk:GetItems():HasItem(401020) then
			Atk:GetItems():RemoveItem(401020,1)
					
		end
		Atk:SkillFail("\#W[技能讯息]：你看走眼了，对方没有变身。")
		do return end
	
	elseif skillLv < 5  then
		if Atk:GetItems():HasItem(401022) then
			Atk:GetItems():RemoveItem(401022,1)
		elseif Atk:GetItems():HasItem(401021) then
			Atk:GetItems():RemoveItem(401021,1)
		elseif Atk:GetItems():HasItem(401020) then
			Atk:GetItems():RemoveItem(401020,1)		
		end
		Atk:SkillFail("\#W[技能讯息]：对方的面具品质大于你可以识破的面具品质，识破失败。")
		do return end
	end
	
end
						