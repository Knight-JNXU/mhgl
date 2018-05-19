--飞贼小分队1
Preload("Quest69000.lua")

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
Bat300410 = {
addMob = true,
addMob2 = true,
X = 0,
Y = 0,
Z = 0,
}

-- 战斗开始之前
function Bat300410:OnInit()
	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	
	local round = player:GetQuests():GetType(690):GetRound()
	local level
	if party then
		level = party:GetAvgLevel()
	else
		level = player:GetLevel()
	end
	if round ~= nil then
		for i=0, 9 do
			if battle:GetMob(i) ~= nil and not battle:GetMob(i):IsParnter() then
				battle:GetMob(i):SetData(battle:GetMob(i):GetMob_id(), level + 1 * (round-1))	
			end
		end
	end
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat300410:OnPreTurn(turn)
	if (self.addMob == false and self.addMob2 and self.Z == 0) or (self.addMob == false and self.addMob2 == false and self.Z == 2) then		
		if self.addMob == false and self.addMob2 and self.Z == 0 then
			self.Z = 1
			if self.X == 0 then
				battle:BatSay("\#Y[疯狂的飞贼]:\#W真是一群废物，堂堂的一支正规军，居然输给了一支随意拼凑起来的队伍！", 0, true, 300410, 255)
				NpcAsk("\#Y[疯狂的飞贼]:\#W让你们见识一下精锐部队的厉害！", true, 300410, false)
			else
				battle:BatSay("\#Y[疯狂的飞贼]:\#W真是一群废物，堂堂的一支正规军，居然输给了一支随意拼凑起来的队伍！", 0, true, 300411, 255)
				NpcAsk("\#Y[疯狂的飞贼]:\#W让你们见识一下精锐部队的厉害！", true, 300411, false)
			end
			SetAnswer(1,"精锐？我们打的就是精锐")
			SetAnswer(2,"玩车轮战？懒的理你")
			WaitAnswer(2)	
		elseif self.addMob == false and self.addMob2 == false and self.Z == 2 then
			self.Z = 3
			if self.Y == 0 then
				battle:BatSay("\#Y[飞贼]:\#W长安武林果然卧虎藏龙，老子也来领教几招！", 0, true, 300411, 255)				
				NpcAsk("\#Y[飞贼]:\#W不知各位赏脸否？", true, 300411, false)
			elseif self.Y == 1 then
				battle:BatSay("\#Y[飞贼]:\#W长安武林果然卧虎藏龙，老子也来领教几招！", 0, true, 300410, 255)	
				NpcAsk("\#Y[飞贼]:\#W不知各位赏脸否？", true, 300410, false)
			else
				battle:BatSay("\#Y[飞贼]:\#W长安武林果然卧虎藏龙，老子也来领教几招！", 0, true, 300411, 255)	
				NpcAsk("\#Y[飞贼]:\#W不知各位赏脸否？", true, 300411, false)		
			end
			SetAnswer(1,"你就是飞贼的将领？我就让你们一败涂地，滚出长安")
			SetAnswer(2,"又玩车轮战？真是上梁不正下梁歪，不玩了")
			WaitAnswer(2)	
		end			
		if GetAnswer() == 1 then
			if self.Z == 1 then
				self.Z = 2
			elseif self.Z == 3 then
				self.Z = 4
			end
		else
			battle:SetBatEvent(LuaI.BSEVENT_ENDBATTLE)			
		end
	end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat300410:OnPostTurn(turn)
	local round = player:GetQuests():GetType(690):GetRound()
	if battle:GetTeamExist(0) == 0 then
		if self.addMob and self.addMob2 and self.Z == 0 then
			for i = 0, battle:GetCharacterCount() - 1 do
				local actor = battle:GetCharacter(i)				
				if not actor:IsDead() then	
					Quest69000:ReturnFirst(actor,i) 																							
				end
			end	
		elseif self.addMob == false and self.addMob2 and self.Z == 2 then
			for i = 0, battle:GetCharacterCount() - 1 do
				local actor = battle:GetCharacter(i)			
				if not actor:IsDead() then		
					Quest69000:ReturnSecond(actor,i)														
				end
			end			
		end
		local level
		if party then
			level = party:GetAvgLevel()
		else
			level = player:GetLevel()
		end		
		if math.random(1,100) < 20 and self.addMob and self.addMob2 and self.Z == 0 then							
			self.addMob = false
			if math.random(1,100) < 1 then
				battle:AddMob(462, 0, level + 1 * (round-1))	
			else
				battle:AddMob(463, 0, level + 1 * (round-1))
				self.X = 1
			end
			local j = math.random(4,8)
			for i = 0 , j do
				if math.random(1,100) < 51 then
					battle:AddMob(464, i+1, level + 1 * (round-1))
				else
					battle:AddMob(465, i+1, level + 1 * (round-1))
				end
			end
			battle:SetForceEnd(false)	--------强制延长一回合												
		elseif math.random(1,100) < 17 and self.addMob == false and self.addMob2 and self.Z == 2 then	
			self.addMob2 = false
			if math.random(1,100) < 34 then
				battle:AddMob(462, 0, level + 1 * (round-1))
				self.Y = 0
			elseif math.random(1,100) < 67 then
				battle:AddMob(462, 0, level + 1 * (round-1))
				self.Y = 1
			else
				battle:AddMob(463, 0, level + 1 * (round-1))
				self.Y = 2
			end
			local j = math.random(4,8)
			for i = 0 , j do
				if math.random(1,100) < 51 then
					battle:AddMob(463, i+1, level + 1 * (round-1))
				else
					battle:AddMob(462, i+1, level + 1 * (round-1))
				end
			end
			battle:SetForceEnd(false)	--------强制延长一回合			
		end
	end	   
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat300410:OnFinish(turn,result)
	if result == LuaI.END_WIN then				
		local t = battle:GetCharacterCount() - 1
		while t >= 0 do
			local actor = battle:GetCharacter(t)		
			if not actor:IsDead() then	
				local member = actor:GetOwner()		
				if member then		
					if self.addMob == false and self.addMob2 == false and self.Z == 4 then
						Quest69000:ReturnThird(actor,t)
					end
					Quest69000:ReturnInBat(actor) 																
				end
			end
			t = t - 1
		end	
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)	
			if not actor:IsDead() then		
				if actor:GetOwner() then						
					if not battle:GetCharacter(0):IsDead() then
						Quest69000:TakeInBat(actor,i)
					end												
				end
			end
		end		
	end
	if npc then
		npc: Destroy()
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat300410)