--wangzl
--打雪仗
Preload("Quest304100.lua")
Bat401404 = {
	
}

-- 战斗开始之前
function Bat401404:OnInit()
  battle:AddMob(1150, 1, 120)
  battle:AddMob(1151, 2, 120)
  battle:AddMob(1152, 3, 120)
  battle:AddMob(1153, 4, 120)
  battle:AddMob(1154, 5, 120)
  battle:AddMob(1155, 6, 120) 
   battle:AddMob(957, 7, 120) 
    battle:AddMob(958, 8, 120) 
  battle:AddMob(959, 9, 120)	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat401404:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat401404:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat401404:OnFinish(turn,result)
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
            local play=actor:GetOwner()
            if play then
				if not actor:IsDead()  then
					Quest304100:Return(play,partnerAlive)
				end
            end
		end
	end	
	if npc then
		npc:Destroy()
	end	
end



-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat401404)
