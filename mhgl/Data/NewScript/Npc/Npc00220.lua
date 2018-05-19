
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00220 = {							-- 孙小红
	npc_id = 220,						-- NPC ID
	name = GetNpcName(220),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00220:Talk(bProcess)
  NpcAsk({"没事别老找我说话,找那老龟吧,他喜欢侃。",
          "真的蛤蟆勇士,敢于直面先天的缺钱。",
          "嘿哟嘿哟！强身健体,为我龙宫健康工作一万年。",
          "有志的青年应该投奔我龙宫,及早某个好前程啊。"})
		SetAnswer(2, "离开")
		WaitAnswer(2)
        end








-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00220)
