-- 載入所需要任務腳本
Preload("Quest50000.lua")
Bat401111 = {
}

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat401111:OnInit()
battle:SetPunish(false)
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat401111:OnPreTurn(turn)
battle:DisableCmd(LuaI.BATCMD_HELP)
	if turn == 1 then
		local mob ={957,958,940,941,990,991,992,993,994,995,996,935,952,953,954,955}
		battle:AddMob(1121, 1)		
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))
		battle:AddMob(RandTable(mob), math.random(2,9))	
	end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat401111:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat401111:OnFinish(turn, result)
	local leader = battle:GetCharacter(0)
	if not leader:IsDead() then 				--若队长没有死亡
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local owner = actor:GetOwner()
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
			if owner then
				if result == LuaI.END_WIN and not actor:IsDead() then
					Quest50000:Win(owner, partnerAlive)		--战斗胜利的玩家奖励经验			
				end
				Quest50000:Return(owner)		--所有玩家更新任务
			end
		end
		if battle:GetCharacterCount() == 5 then
			script:Rumor(string.format("在\#W%s\#O的带领下，\#W%s\#O，\#W%s\#O，\#W%s\#O，\#W%s\#O齐心协力，成功的闯过十二大门派。",
			battle:GetCharacter(0):GetOwner():GetName(),
			battle:GetCharacter(1):GetOwner():GetName(),
			battle:GetCharacter(2):GetOwner():GetName(),
			battle:GetCharacter(3):GetOwner():GetName(),
			battle:GetCharacter(4):GetOwner():GetName()),false)
		elseif battle:GetCharacterCount() == 4 then
			script:Rumor(string.format("在\#W%s\#O的带领下，\#W%s\#O，\#W%s\#O，\#W%s\#O齐心协力，成功的闯过十二大门派。",
			battle:GetCharacter(0):GetOwner():GetName(),
			battle:GetCharacter(1):GetOwner():GetName(),
			battle:GetCharacter(2):GetOwner():GetName(),
			battle:GetCharacter(3):GetOwner():GetName()),false)
		elseif battle:GetCharacterCount() == 3 then
			script:Rumor(string.format("在\#W%s\#O的带领下，\#W%s\#O，\#W%s\#O齐心协力，成功的闯过十二大门派。",
			battle:GetCharacter(0):GetOwner():GetName(),
			battle:GetCharacter(1):GetOwner():GetName(),
			battle:GetCharacter(2):GetOwner():GetName()),false)	
		elseif battle:GetCharacterCount() == 2 then
			script:Rumor(string.format("在\#W%s\#O的带领下，\#W%s\#O成功的闯过十二大门派。",
			battle:GetCharacter(0):GetOwner():GetName(),
			battle:GetCharacter(1):GetOwner():GetName()),false)
		elseif battle:GetCharacterCount() == 1 then
			script:Rumor(string.format("\#W%s\#O成功的闯过十二大门派。",
			battle:GetCharacter(0):GetOwner():GetName()),false)
		end		
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat401111)
