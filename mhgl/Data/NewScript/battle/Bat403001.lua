--wangzl
--打雪仗
Preload("Quest690010.lua")
Bat403001 = {
	
}

-- 战斗开始之前
function Bat403001:OnInit()
--[[	battle:DisableCmd(LuaI.BATCMD_HELP)
	battle:SetPunish(false)
	battle:SetJumpReborn(false)	--]]
	
	
	
	
	local base_lv = player:GetLevel()
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
	battle:AddMob(1300,1,119)
	battle:AddMob(272,2,180)
	battle:AddMob(273,3,180)		
	battle:AddMob(279,4,189)	
	battle:AddMob(280,5,189)
	battle:AddMob(281,6,189)
	battle:AddMob(955,7,189)
	battle:AddMob(952,8,189)
	battle:AddMob(953,9,189)	
end
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat403001:OnPreTurn(turn)
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat403001:OnPostTurn(turn)	
	
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat403001:OnFinish(turn,result)
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			local partner = actor:GetCurPartner()
            local partnerAlive = partner and not partner:IsDead() or false
            local play=actor:GetOwner()
            if play then
				if not actor:IsDead()  then
					Quest690010:Return(play,partnerAlive)
				end
            end
		end
	end	
	if npc then
		npc:Destroy()
	end	
end



-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat403001)
