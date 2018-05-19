
Bat000470 = {
	npc_id = 470,						-- NPC ID
	name = GetNpcName(470),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat000470:OnInit()
  local base_lv = player:GetLevel()
	local actorCount = battle:GetActorCount();	
	for i = 0, actorCount - 1 do
		local actor = battle:GetActor(i);							
	end
  battle:AddMob(2015, 1,255)
  battle:AddMob(2016, 2,255)
  battle:AddMob(2017, 3,255)
  battle:AddMob(2018, 4,255)  
  battle:AddMob(2019, 5,255)   
  battle:AddMob(2020, 6,255)
  battle:AddMob(2021, 7,255) 
  battle:AddMob(2022, 8,255) 
  battle:AddMob(2023, 9,255) 
  battle:AddMob(2024, 10,255) 
  battle:AddMob(2025, 11,255) 
  battle:AddMob(2026, 12,255)
  battle:AddMob(4003, 13,255)
  battle:AddMob(2026, 14,255)
  battle:AddMob(431, 15,255)
  battle:AddMob(431, 16,255)
  battle:AddMob(431, 17,255)
  battle:AddMob(431, 18,255)
  battle:AddMob(431, 19,255)
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000470:OnPreTurn(turn)
	-- 在第一回合开始的时候
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000470:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000470:OnFinish(turn, result)
	-- 玩家胜利处理
	
	end
	
	
	
	
	
	

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000470)