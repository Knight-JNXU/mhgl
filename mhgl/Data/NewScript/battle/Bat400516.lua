--wangzl
--打雪仗
Preload("Quest69001.lua")
Bat400500 = {
	
}

-- 战斗开始之前
function Bat400500:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]
	
	
	
	
	local base_lv = player:GetLevel() / 2
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(270, 1, base_lv)
	battle:AddMob(270, 1, base_lv)
	battle:AddMob(270, 1, base_lv)	
	battle:AddMob(270, 1, base_lv)	
	battle:AddMob(270, 1, base_lv)
	battle:AddMob(270, 1, base_lv)
	battle:AddMob(270, 1, base_lv)	
	battle:AddMob(270, 1, base_lv)	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat400500:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat400500:OnPostTurn(turn)	
	
end




function Bat400500:OnFinish(turn,result)


	local LvMob = 20
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
				Money = math.random(50000,100000)
				Exp = math.floor(lvdiffModify *((4 * LvMob + 10) * 6.6 * 4) )* 1.3 * 12000
				ExpPartner = math.floor(plvdiffModify * ((4 * LvMob + 10) * 6.6 * 4) )*1.3 * 1200
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
				    item = RandTable({61041})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
          elseif a < 5 then
				    item = RandTable({61041})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
          else
            item = RandTable({60230,60231})
				    name = GetItemName(item)
				    owner:GetItems():AddItem(item, 1)
					  owner:GetScript():ShowError(string.format("\#W获得%s",name))
            script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
          end
				elseif i < 45 then
				  item = RandTable({60035,60051,60068,60084,60100,60116,20079,20095,20111,20127,20143,20159,20175,20191,20207,20223,20239,60318})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 55 then
          item = RandTable({10080,10081,10082,10083,10084,10085,10086,10087,10088,10089,10090,10091,10092,10093,10094,10095,10096,10097,10098,10099,10100,10101,10102,10103,10104,10105,10106,10107,10108,10109})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 65 then
          item = RandTable({20002,20003,20004,20005,20006})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 75 then
          item = RandTable({400030,400041,400025})
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O挑战28星宿获得胜利,#O28星宿奖励其一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
        elseif i < 85 then
				  item = RandTable({10049})--79级奖励
				  name = GetItemName(item)
				  owner:GetItems():AddItem(item, 1)
					owner:GetScript():ShowError(string.format("\#W获得%s",name))
          script:Rumor(string.format(" %s #O打得28星宿痛不欲生#O,逼不得已交出一个#Y[%s]#O！", owner:GetCharNameLink(), name), false)
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
AddBattleTable(Bat400500)
