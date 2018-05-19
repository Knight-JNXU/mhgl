-- 載入所需要任務腳本
Preload("Quest65300.lua")
Bat000797 = {
}

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat000797:OnInit()

end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000797:OnPreTurn(turn)
    battle:DisableCmd(LuaI.BATCMD_HELP)
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000797:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000797:OnFinish(turn, result)
	if result == LuaI.END_WIN then
		for i = 0, battle:GetCharacterCount() - 1 do
			local actor = battle:GetCharacter(i)
			if actor ~= nil then
				if not actor:IsDead() and actor:GetOwner() then
					Quest65300:BossReturn(actor:GetOwner())
				end
			end	
		end
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000797)
