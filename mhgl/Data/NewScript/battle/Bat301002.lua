--wangzl
--打雪仗
Preload("Quest69001.lua")
Bat301001 = {
	
}

-- 战斗开始之前
function Bat301001:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]

	local base_lv = player:GetLevel()
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	base_lv = base_lv - 1
	if base_lv < 120 then
	   base_lv = 120
	end
	if base_lv > 120 then
	   base_lv = 120
	end
	battle:AddMob(4000,1,80)
	battle:AddMob(4000,2,80)
	battle:AddMob(4000,3,80)
	battle:AddMob(4002,4,80)
	battle:AddMob(4002,5,80)
	battle:AddMob(4002,6,80)
	battle:AddMob(4001,7,80)
	battle:AddMob(4001,8,80)
	battle:AddMob(4003,9,80)
	battle:AddMob(431,10,80)
	-- battle:AddMob(441,9,119)
 	--battle:GetActor(0):AddBuff(8025,1,1,0,10,100)
end
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat301001:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat301001:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat301001:OnFinish(turn,result)


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
	local ItemNum = 0
	local name
	local item = 0
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
				if LvPlayer > 110 then
				Money = math.random(500,1000)+LvPlayer*2000
				else
				Money = math.random(500,1000)+LvPlayer*500
				end
				Exp = math.floor(lvdiffModify *((4 * LvMob + 10) * 6.6 * 4) )* 1.3 * 50 * 60
				ExpPartner = math.floor(plvdiffModify * ((4 * LvMob + 10) * 6.6 * 4) )*600
				if owner:HasBuff(246) then
					ExpPartner = ExpPartner * 2
				end	
				if owner:HasBuff(247) then
					ExpPartner = ExpPartner * 3
				end	
				owner:ChangeExp(Exp,305)
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d",Exp))
				local i = math.random(1,100)
				local a = math.random(1,150)
                if LvPlayer > 99 then
				owner:ChangeMoney(Money,305)
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d",Money))
	               if i < 100 then
					 if a < 30 then
					    item = RandTable({600031}) -- 120书
				        name = GetItemName(item)
				        owner:GetItems():AddItem(item, 1)
					    owner:GetScript():ShowError(string.format("\#W获得%s",name))
                        script:Rumor(string.format(" %s #O与魔神蚩尤[第三阶段]大战三天三夜,#O魔神蚩尤精疲力尽，掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
					 else
					    item = 58002 --120铁
				        name = GetItemName(item)
				        owner:GetItems():AddItem(item, 1)
					    owner:GetScript():ShowError(string.format("\#W获得%s",name))
                        script:Rumor(string.format(" %s #O与魔神蚩尤[第三阶段]大战三天三夜,#O魔神蚩尤精疲力尽，掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
					 end
                   end
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
AddBattleTable(Bat301001)
