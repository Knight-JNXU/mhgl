--wangzl
--打雪仗
Preload("Quest69001.lua")
Bat000730 = {
	
}

-- 战斗开始之前
function Bat000730:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]
	
	
	
	
	local base_lv = player:GetLevel() / 2
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(2002, 1, base_lv)
	battle:AddMob(2002, 1, base_lv)
	battle:AddMob(266, 1, base_lv)	
	battle:AddMob(281, 1, base_lv)	
	battle:AddMob(277, 1, base_lv)	
	battle:AddMob(265, 1, base_lv)	
	battle:AddMob(257, 1, base_lv)	
	battle:AddMob(254, 1, base_lv)	
	battle:AddMob(1145, 1, base_lv)	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000730:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000730:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000730:OnFinish(turn,result)


	local LvMob = 10
	local LvPlayer = 0
	local lvdiffModify = 0
	local lvdiff = 0						
	local pLvPlayer = 0			 
	local plvdiffModify = 0
	local plvdiff = 0
	local Exp = 0
	local ExpPartner = 0	
	local Money = 0
	for i = 0, battle:GetCharacterCount() - 1 do
		local actor = battle:GetCharacter(i)
		local owner = actor:GetOwner()
		if owner then
			if result == LuaI.END_WIN and not actor:IsDead() then
				LvPlayer = owner:GetLevel()
				lvdiff = math.abs(LvPlayer-LvMob)
				if lvdiff <= 10 then
		            lvdiffModify = 1
		        elseif lvdiff <= 20 then
		            lvdiffModify = 0.9
		        elseif lvdiff <= 30 then
		            lvdiffModify = 0.8
				else
					lvdiffModify = 0.5
				end
		        if owner:GetCurPartner() then
		            pLvPlayer =owner:GetCurPartner():GetLevel()
		        end			 
				plvdiff = math.abs(pLvPlayer-LvMob)
				if plvdiff <= 10 then
		            plvdiffModify = 1
		        elseif plvdiff <= 20 then
		            plvdiffModify = 0.9
		        elseif plvdiff <= 30 then
		            plvdiffModify = 0.8
				else
					plvdiffModify = 0.5	
				end
				Money = math.random(3000,8000)
				Exp = math.floor(lvdiffModify *((14 * LvMob + 10) * 6.6 * 4) )* 1.3 * 50
				ExpPartner = math.floor(plvdiffModify * ((4 * LvMob + 10) * 6.6 * 4) )*1.3
				if owner:HasBuff(246) then
					ExpPartner = ExpPartner * 2
				end	
				if owner:HasBuff(247) then
					ExpPartner = ExpPartner * 3
				end	
				owner:ChangeExp(Exp,305)
				owner:ChangeMoney(Money,305)
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d",Exp))
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d",Money))
				local i = math.random(1,120)

        if i < 120 then
          item = RandTable({400017,400037,400042,400043,400047,400049,400025})--79级奖励
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O将夏日小分队#O打得落花流水，乖乖献出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        end
      end
    end
  end
	if result == LuaI.END_WIN then
		if npc then
			npc:Destroy()
		end
	elseif result == LuaI.END_LOSE and npc then	
		npc:SetEnableBattle(true)	
	end
end
-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000730)
