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
	
	
	
	
	local base_lv = player:GetLevel() * 5
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(1150, 1, 115)
	battle:AddMob(1151, 1, 115)
	battle:AddMob(1152, 1, 115)	
	battle:AddMob(1153, 1, 115)	
	battle:AddMob(1154, 1, 115)	
	battle:AddMob(1155, 1, 115)	
	battle:AddMob(1156, 1, 115)	
	battle:AddMob(986, 1, 115)	
	battle:AddMob(986, 1, 115)
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
				Money = math.random(5000,20000)
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
				local a = math.random(1,10)
          if a > 0 then
				    item = RandTable({60901,60902,60903,60905,60906,60907,60909,60910,60911,60913,60914,60915,60917,60918,60919,60921,60922,60923,60925,60926,60927,60929,60930,60931,60933,60934,60935,60937,60938,60939})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O与知了王大战300回合,#O知了王逃跑中竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
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
