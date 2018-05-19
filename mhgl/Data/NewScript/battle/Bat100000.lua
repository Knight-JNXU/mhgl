-- 載入所需要任務腳本

Bat000583 = {
	npc_id = 583,						-- NPC ID
	name = GetNpcName(583),			-- NPC 名称
}

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat000583:OnInit()
	
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000583:OnPreTurn(turn)
	-- 在第一回合开始的时候
	battle:DisableCmd(LuaI.BATCMD_HELP)
	if turn == 1 then
		-- 战斗中 NPC 与玩家说话
	--	NpcSay("把鼠标移至目标即\#O野猪王\#W身上，鼠标会变成剑的模样，左键点击便可对目标进行普通攻击；或者直接使用快捷键\#PAlt+A\#W随机对其中一个敌人进行普通攻击。")
		local actor = battle:GetCharacter(0)
		actor:AddBuff(1631, 1, 0, 0, 15, 100)
		if IsProcess() then
			player:HandleGuideEvent(5);
		end
	else
	--	NpcSay("还不太好把握吧，我们再来一遍。把\#P鼠标\#W移至目标即\#O野猪王\#W身上，\#P鼠标\#W会变成剑的模样，左键点击\#O野猪王\#W便可对它进行普通攻击；或者直接使用快捷键\#PAlt+A\#W可直接对\#O野猪王\#W进行普通攻击。")
	end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000583:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000583:OnFinish(turn, result)
	-- 玩家胜利处理
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000583)