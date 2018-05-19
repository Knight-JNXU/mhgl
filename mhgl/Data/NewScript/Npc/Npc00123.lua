
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00123 = {							-- 孙小红
	npc_id = 123,						-- NPC ID
	name = GetNpcName(123),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00123:Talk(bProcess) 
  NpcAsk({"掌管十万水兵虽然威风,但不知什么时候我也会被玉帝找个理由打入天牢,真是伴君如伴虎",
          "除了王母娘娘和玉皇大帝,所有的天神都不许谈恋爱,五百年前有个紫霞仙子竟然爱上了一个下界的妖怪,后来连尸骨都没有剩下,真是悲惨……",
          "天蓬元帅因罪遭遣,我就得以升迁,天庭里升官全都要凭运气。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end














-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00123)
