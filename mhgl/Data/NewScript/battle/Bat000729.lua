--wangzl
--打雪仗
Preload("Quest69001.lua")
Bat000729 = {
	
}

-- 战斗开始之前
function Bat000729:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]
	
	
	
	
	local base_lv = player:GetLevel()
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(376, 1)
	battle:AddMob(377, 2)
	battle:AddMob(378, 3)	
	battle:AddMob(379, 4)	
	battle:AddMob(380, 5)	
	battle:AddMob(381, 6)	
	battle:AddMob(382, 7)	
	battle:AddMob(383, 8)	
	battle:AddMob(384, 9)	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000729:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000729:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000729:OnFinish(turn,result)
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
            local play=actor:GetOwner()
            if play then
				if not actor:IsDead()  then
					Quest69001:Return(play,partnerAlive)
				end
            end
		end
	end	
	if npc then
		npc:Destroy()
	end	
end



-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000729)
