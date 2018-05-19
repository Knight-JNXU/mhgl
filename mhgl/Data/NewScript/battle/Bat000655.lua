--10级邪教护法
--北方
-- 載入所需要任務腳本
Bat00655 = {
}

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat00655:OnInit()
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat00655:OnPreTurn(turn)
  battle:DisableCmd(LuaI.BATCMD_HELP)
	if turn == 1 then
		local mob ={254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285}
		local mobid ={286,287,288,289,290,291,292,293,294,295,296,297}
		battle:AddMob(RandTable(mobid), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
		battle:AddMob(RandTable(mob), math.random(1,9))
	end
end






-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat00655:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat00655:OnFinish(turn, result)

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
				
				local A = math.random(1000,3000)
				Exp = math.floor(lvdiffModify *((4 * LvMob + 10) * 6.6 * 4) )*1.3 * 20 + A 
				ExpPartner = math.floor(plvdiffModify * ((4 * LvMob + 10) * 6.6 * 4) )*1.3 * 10 + A 
				if owner:HasBuff(218) then
					Exp = Exp * 2
				end
				if owner:HasBuff(219) then
					Exp = Exp * 3
				end
				if owner:HasBuff(246) then
					ExpPartner = ExpPartner * 2
				end	
				if owner:HasBuff(247) then
					ExpPartner = ExpPartner * 3
				end	
				
				owner:ChangeExp(Exp,305)
				owner:ChangeMoney(Money,305)
				local SMoney = LvPlayer * 150
				owner:ChangeSMoney(SMoney,305)
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得储备金%d",SMoney))
				
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得经验值%d",Exp))
				owner:GetScript():ShowError(string.format("\#W战斗胜利，获得银两%d",Money))
				local i = math.random(1,130)
				local x = math.random(1,100)
				if i < 10 then     -- 1-4级宝石
				  item = RandTable({60401,60402,60403,60404,60411,60412,60413,60414,60421,60422,60423,60424,60431,60432,60433,60434,60441,60442,60443,60444,60451,60452,60453,60454,60461,60462,60463,60464,60471,60472,60473,60474})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的远古老妖痛不欲生#O,1逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 15 then   --十步一杀
			    item = 60136    -- 十步一杀 
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的远古老妖痛不欲生#O,2逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 30 then   --环装
				  item = RandTable({20452,20461,20470,20488,20497,20506,20515,20524,20533,20560,20569,20578,20591,20590,20602,20614,20615,20453,20462,20471,20489,20498,20507,20516,20525,20534,20561,20570,20579,20592,20591,20603,20615,20616,20451,20460,20469,20487,20496,20505,20514,20523,205332,20559,20568,20577,20590,20589,20601,20613,20614})--79级奖励
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打的远古老妖痛不欲生#O,3逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 35 then
		        if x < 10 then
				item = 20001    -- 高宝图 
				name = GetItemName(item)
				owner:GetItems():AddItem(item, 1)
				ShowError(string.format("\#W获得%s",name))
                script:Rumor(string.format(" %s #O打的远古老妖痛不欲生#O,2逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
				elseif x < 15 then
				item = 30001    -- C6666 
				name = GetItemName(item)
				owner:GetItems():AddItem(item, 1)
				ShowError(string.format("\#W获得%s",name))
                script:Rumor(string.format(" %s #O打的远古老妖痛不欲生#O,2逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
				else
				item = 30000    -- 6666 
				name = GetItemName(item)
				owner:GetItems():AddItem(item, 1)
				ShowError(string.format("\#W获得%s",name))
                script:Rumor(string.format(" %s #O打的远古老妖痛不欲生#O,2逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
				end
			    
        end
				if owner:GetCurPartner() and pLvPlayer - owner:GetLevel() < 5 then
					owner:GetCurPartner():ChangeExp(ExpPartner,305)
					owner:GetScript():ShowError(string.format("\#W同伴获得经验值%d",ExpPartner))
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

function Bat00655:OnEscape(turn, actor)
	if battle:GetCharacterCount() == 0 and npc then
		npc:SetEnableBattle(true)
	end
end
-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat00655)
