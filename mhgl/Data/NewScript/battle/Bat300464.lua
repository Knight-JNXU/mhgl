--[[

]] 

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
Preload("Quest69203.lua")
Bat300464 = {
	sign = 0
}

-- 战斗开始之前
function Bat300464:OnInit()
	battle:SetPunish(false)
	battle:SetJumpReborn(false)		
	
	battle:AddMob(447, 1)
	battle:AddMob(453, 8)
	battle:AddMob(450, math.random(2,9))
	battle:AddMob(450, math.random(2,9))
	battle:AddMob(451, math.random(2,9))
	battle:AddMob(451, math.random(2,9))
	battle:AddMob(451, math.random(2,9))
	battle:AddMob(452, math.random(2,9))
	battle:AddMob(452, math.random(2,9))
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat300464:OnPreTurn(turn)
	if turn == 1 then
	--	battle:BatSay("\#Y[蟾蜍]:\#W你们什么人，竟然敢挡路？")
	end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat300464:OnPostTurn(turn)
	if battle:GetTeamExist(1) ==0 then
	--	battle:BatSay("\#Y[蟾蜍]:\#W哪里来的小屁孩，也不掂量掂量自己的分量。")
	end
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat300464:OnFinish(turn,result)
	if result == LuaI.END_LOSE then
		
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local member = actor:GetOwner()
			member:GetQuests():SetTimeMark(697)
		end
	end
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local member = actor:GetOwner()
			local LvPlayer = member:GetLevel()
			local Exp = (4*LvPlayer+10)*6.6*70*4*1.5*2/5
			
			member:GetQuests():SetFlag(6956,3)
	       
			if not actor:IsDead() and member then
				local lv = member:GetLevel()
				local round = 10
				local Exp = (4*lv+10)*6.6*70*30*(5+round)/125
				local Money = 1000*lv*round/12
				member:ChangeExpForScript(Exp,5)
				member:ChangeMoneyForScript(Money,11008)
				ShowMessage(string.format("\#W获得经验值%d", Exp), member)							
				ShowMessage(string.format("\#W获得金钱%d", Money), member)
		--[[		if member:GetItems():GetFreeSlot(0) >0 then
					local r = math.random(1,100)
					local ItemId = 0
					local sign = 0
					if r <= 3 then
						sign = 1
						ItemId = RandTable({60014,60024,60034,60044,60054,60064,60074,60084,63032})
					elseif r<= 10 then
						sign = 1
						ItemId = 63028
					elseif r <= 15 then
						ItemId = 70023
					elseif r <= 20 then
						ItemId = 61082
					elseif r <= 25 then
						sign = 1
						ItemId = 61083
					elseif r <= 30 then
						sign = 1
						ItemId = 41403
					elseif r <= 35 then
						ItemId = 41402
					elseif r <= 50 then
						sign = 1
						ItemId = RandTable({60013,60023,60033,60043,60053,60063,60073,60083,53000,53038})
					end
					if ItemId ~= 0 then
						member:GetItems():AddItemForScript(ItemId,1)
						ShowMessage(string.format("\#W获得物品%s", GetItemName(ItemId)), member)
						if sign == 0 then
							
							if math.random(1,2) == 1 then
								script:Rumor(string.format("%s \#O积极参与群侠龙舟大赛赛，接引人奖励其\#B%s\#O一个。",member:GetCharNameLink(),GetItemName(ItemId)),false)
							else
								script:Rumor(string.format("%s \#O群侠龙舟大赛赛表现神勇，接引人被其表现所折服，决定奖励其\#B%s\#O一个。",member:GetCharNameLink(),GetItemName(ItemId)),false)
							end
						end
					end
				end--]]
	    end
		end
		Quest69203:Take()
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat300464)