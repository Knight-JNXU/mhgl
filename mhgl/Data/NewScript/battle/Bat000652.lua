
Bat000652 = {
	npc_id = 652,						-- NPC ID
	name = GetNpcName(652),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat000652:OnInit()
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000652:OnPreTurn(turn)
	-- 在第一回合开始的时候
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000652:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000652:OnFinish(turn, result)
	-- 玩家胜利处理
  if result == LuaI.END_WIN then
	  if npc then
	    npc:Destroy()
	  end
	elseif result == LuaI.END_LOSE and npc then	
		npc:SetEnableBattle(true)	
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000652)