
Bat400901 = {
	npc_id = 400901,						-- NPC ID
	name = GetNpcName(400901),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat400901:OnInit()
  battle:AddMob(431,1,109)
  battle:AddMob(1130,2,65)
  battle:AddMob(1131,3,65)
  battle:AddMob(1130,4,69)
  battle:AddMob(1131,5,69)
  battle:AddMob(1130,6,69)
  battle:AddMob(1131,7,69)
  battle:AddMob(445,8,169)
  battle:AddMob(441,9,169)
  battle:GetActor(0):AddBuff(8025,1,1,0,10,100)
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat400901:OnPreTurn(turn)
	-- 在第一回合开始的时候
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat400901:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat400901:OnFinish(turn, result)
	-- 玩家胜利处理
	
	end
	
	
	
	
	
	

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat400901)