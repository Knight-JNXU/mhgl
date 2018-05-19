--wangzl
--打雪仗

Bat700021 = {
	
}

-- 战斗开始之前
function Bat700021:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]
	
	
	
	
	local base_lv = player:GetLevel() - 5
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(1104, 1, base_lv)
	battle:AddMob(1104, 1, base_lv)
	battle:AddMob(1105, 1, base_lv)	
	battle:AddMob(1105, 1, base_lv)	
	battle:AddMob(1105, 1, base_lv)	
	battle:AddMob(1003, 1, base_lv)	
	battle:AddMob(1002, 1, base_lv)	
	battle:AddMob(1003, 1, base_lv)	
	battle:AddMob(1145, 1)	
	
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat700021:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat700021:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat700021:OnFinish(turn,result)


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
				Money = math.random(3000,11000)
				Exp = math.floor(lvdiffModify *((6 * LvMob + 10) * 6.6 * 4) )* 1.53 * 50
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
				local i = math.random(1,100)
				local a = math.random(1,10)

        if i < 5 then
          if a == 1 then
				    item = RandTable({15000,15001,60330,60348})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O与看竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
          elseif a < 5 then
				    item = RandTable({15007,15006,15008,15009,20080,20096,20112,20128,20144,20160,20176,20192,20208,20224,20240,60036,60052,60085,60069,60101,60117,60311,20256})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O与#Y侠客#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
          else
            item = RandTable({15007,15006,15008,15009})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O与#Y侠客#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
          end
				elseif i < 5 then
				  item = RandTable({15007,15006,15008,15009,60318})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O与#Y侠客#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 15 then
          item = 60223
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O与#Y侠客#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 25 then
          item = 60230
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O与#Y侠客#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 50 then
          item = RandTable({20254,20255})--79级奖励
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O与#Y侠客#O大打出手中，趁他不注意从他身上抓过一个东西，仔细一看原来是竟然掉落了一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 100 then
				  item = RandTable({60034, 60035, 60050, 60051, 60067, 60068, 60083, 60084, 60100, 60115, 60116, 20078, 20079, 20094, 20095, 20110, 20111, 20127, 20126, 20142, 20143, 20158, 20159, 20174, 20175, 20190, 20191, 20206, 20207, 20222, 20223, 20238, 20239, 60318, 60309}) 
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的#Y侠客#O痛不欲生#O,逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
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
AddBattleTable(Bat700021)
