--wangzl
--打雪仗
Preload("Quest310400.lua")
Bat401500 = {
	
}

-- 战斗开始之前
function Bat401500:OnInit()
  battle:AddMob(1160, 1, 120)
  battle:AddMob(1161, 2, 110)
  battle:AddMob(1162, 3, 110)
  battle:AddMob(1163, 4, 120)
  battle:AddMob(1164, 5, 110)
  battle:AddMob(1165, 6, 110) 
   battle:AddMob(1167, 7, 110) 
    battle:AddMob(1150, 8, 80) 
  battle:AddMob(1151, 9, 90)	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat401500:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat401500:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat401500:OnFinish(turn,result)
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
            local play=actor:GetOwner()
            if play then
				if not actor:IsDead()  then
					Quest310400:Return(play,partnerAlive)
				end
            end
		end
	end	
	if npc then
		npc:Destroy()
	end	
end



-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat401500)
