
Bat000489 = {
	npc_id = 489,						-- NPC ID
	name = GetNpcName(489),			-- NPC 名称
}
-- 定义战斗表 : 战斗表是个 lua table, 名称要与脚本名称相同，
-- 暂为空表，但必需要定义
function Bat000489:OnInit()
end

-- 回合开始之前
-- turn : 第几回合，从 1 开始
function Bat000489:OnPreTurn(turn)
	-- 在第一回合开始的时候
	battle:DisableCmd(LuaI.BATCMD_HELP)
	local actor = battle:GetCharacter(0)
	if turn == 1 then
		-- 战斗中 NPC 与玩家说话
		actor:AddBuff(1631, 1, 0, 0, 15, 100)--给与一个buff
		battle:BatSay("\#Y[宠物仙子]:\#W鼠标点击“\#P指令条\#W”上的“\#P同伴\#W”按钮，然后选中一个待命中的同伴，点击同伴图像下的“\#P战斗\#W”按钮。这样就能呼出同伴来一起战斗哦。", 0, true, 1, 255)
	elseif turn == 2 then
		battle:BatSay("\#Y[宠物仙子]:\#W日后闯荡江湖必遇到不少打斗场面，有同伴并肩作战会顺利很多哦。下面我教你怎么使用“\#P技能\#W”：鼠标点击“\#P指令条\#W”上的“\#P技能\#W”按钮，然后在技能界面里选中一个“\#P技能\#W”，鼠标模样出现变化后移动鼠标到指定的目标上，就能发动此招技能了。", 0, true, 1, 255)
	elseif turn == 3 then
		battle:BatSay("\#Y[宠物仙子]:\#W还不好把握就多操作几次吧。鼠标点击“\#P指令条\#W”上的“\#P技能\#W”按钮，然后在技能界面里选中一个“\#P技能\#W”，鼠标模样出现变化后移动鼠标到指定的目标上就可以发动此招技能了。", 0, true, 1, 255)
	end
end

-- 回合结束以后
-- turn : 第几回合，从 1 开始
function Bat000489:OnPostTurn(turn)
end

-- 战斗结束之后
-- result : 玩家战斗结果, LuaI.END_WIN=玩家胜利，LuaI.END_LOSE=玩家战败，LuaI.END_DRAW=战斗平手
-- turn : 结束回合
function Bat000489:OnFinish(turn, result)
	-- 玩家胜利处理
end

-- 必需在脚本最後将战斗表加入系统中
AddBattleTable(Bat000489)