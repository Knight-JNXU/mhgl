
Bat000582 = {
	npc_id = 582,						-- NPC ID
	name = GetNpcName(582),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat000582:OnInit()
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000582:OnPreTurn(turn)
	-- 在第一回合开始的时候
	battle:DisableCmd(LuaI.BATCMD_HELP)
	local actor = battle:GetCharacter(0)
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000582:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000582:OnFinish(turn, result)
	-- 玩家胜利处理
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000582)