
Bat300524 = {
	npc_id = 300524,						-- NPC ID
	name = GetNpcName(300524),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat300524:OnInit()
  battle:AddMob(531, 1)
	battle:AddMob(532, 2)
	battle:AddMob(533, 3)
	battle:AddMob(534, 4)
	battle:AddMob(535, 5)
	battle:AddMob(536, 6)
	battle:AddMob(537, 7)
	battle:AddMob(538, 8)
  battle:AddMob(533, 9)
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat300524:OnPreTurn(turn)
  if turn == 1 then
		battle:BatSay("\#Y[初出茅庐地煞星]:\#W初到人间,还请各位多多指教~！", 0, true, 300524, 255)
  elseif turn == 2 then
		battle:BatSay("\#Y[初出茅庐地煞星]:\#W忘了提示各位啦,铁血无边可是物理免疫的哟,当然,乾坤五行是法术免疫,还请各位多多配合才能挑战成功！", 0, true, 300524, 255)
  end
	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat300524:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat300524:OnFinish(turn, result)
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
AddBattleTable(Bat300524)