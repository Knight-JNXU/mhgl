
Bat300513 = {
	npc_id = 300513,						-- NPC ID
	name = GetNpcName(300513),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat300513:OnInit()

end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat300513:OnPreTurn(turn)
	-- 在第一回合开始的时候
 -- battle:SetBatEvent(LuaI.BSEVENT_ENDBATTLE)  -- 玩家投降。
 -- battle:SetBatEvent(LuaI.BSEVENT_SURRENDER) -- 逃跑。
	battle:BatSay("\#Y[石群]:\#W星魂兄，且让他们见识见识我们四大杀手的手段。", 0, true, 200501, 255)	
	
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat300513:OnPostTurn(turn)

end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat300513:OnFinish(turn, result)
	if result == LuaI.END_WIN then
		local Lv = player:GetLevel()
		local Exp = (4*Lv+10)*70*6.6/23
		player:ChangeExp(Exp)
		player:ChangeSMoney(Exp/5)
		player:GetScript():ShowError(string.format("\#W获得经验%d",Exp))
		player:GetScript():ShowError(string.format("\#W获得储备%d",Exp/5))
		npc:Destroy()
		npc:SetName()
	end
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat300513)