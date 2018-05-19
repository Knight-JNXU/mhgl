-- 載入所需要任務腳本

Bat00038 = {
	npc_id = 38,						-- NPC ID
	name = GetNpcName(38),			-- NPC 名称
}

-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat00038:OnInit()

end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat00038:OnPreTurn(turn)
  if turn == 1 then
    NpcSay("当年他不搭救我,一口怨气一直在心,如今往事已过,这口怨气始终让我无法去投胎转世,我从来没有怪罪过他,少侠今日也算是搭救我了,我也可以安心去投胎转世了,少侠替我转告他,谢谢他这些来替我照顾我的家人,少侠你也一路保重。")

  end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat00038:OnPostTurn(turn)


end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat00038:OnFinish(turn, result)
	 
	 -- 玩家胜利处理
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat00038)