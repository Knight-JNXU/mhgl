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
	
	
	
	
	local base_lv = player:GetLevel() + 100
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(982, 1, base_lv)
	battle:AddMob(953, 1, base_lv)
	battle:AddMob(952, 1, base_lv)	
	battle:AddMob(271, 1, base_lv)	
	battle:AddMob(270, 1, base_lv)	
	battle:AddMob(284, 1, base_lv)	
	battle:AddMob(267, 1, base_lv)	
	battle:AddMob(266, 1, base_lv)	
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
				Money = math.random(5000,10000)
				Exp = math.floor(lvdiffModify *((4 * LvMob + 10) * 6.6 * 4) )* 1.3 * 50
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
				local i = math.random(1,180)
				local a = math.random(1,50)

        if i < 5 then
          if a == 1 then
				    item = 51392
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
          elseif a < 5 then
				    item = RandTable({51393})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
          else
            item = RandTable({51394, 51395})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
          end
				elseif i < 10 then
				  item = RandTable({51396, 60199})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
        elseif i < 20 then
          item = 60198
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
        elseif i < 30 then
          item = RandTable({40043, 40044, 40045, 40046, 40047, 40048})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
        elseif i < 65 then
          item = RandTable({60204, 60205, 60206, 60207})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
        elseif i < 110 then
				  item = RandTable({40000, 40001, 40002, 40003, 40004, 40005, 40006, 40007, 40008, 40009, 40010, 40011, 40012, 40013, 40014, 40015, 40016, 40017, 40018, 40019, 40020, 40021, 40022, 40023, 40024, 40025, 40026, 40027, 40028, 40029})--79级奖励
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的老妖分身痛不欲生#O,逼不得已把珍藏多年的#Y[%s]交出来#O！", owner:GetCharNameLink(), name), false)
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
