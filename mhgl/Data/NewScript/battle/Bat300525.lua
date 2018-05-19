--wangzl
--打雪仗
Preload("Quest69202.lua")
Bat300525 = {
	
}

-- 战斗开始之前
function Bat300525:OnInit()
	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	
	
  battle:AddMob(564, 1)	
  battle:AddMob(565, 2)	
  battle:AddMob(566, 3)	
  battle:AddMob(567, 4)	
  battle:AddMob(568, 5)	
  battle:AddMob(569, 6)	
  battle:AddMob(570, 7)	
  battle:AddMob(571, 8)	
  battle:AddMob(572, 9)	

end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat300525:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat300525:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat300525:OnFinish(turn,result)
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
            local play=actor:GetOwner()
            if play then
				if not actor:IsDead()  then
					Quest69202:Return(play,partnerAlive)
				end
            end
		end
	end	
	if npc then
		npc:Destroy()
	end	
end



-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat300525)
