
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00344 = {							-- 杵官王
	npc_id = 344,						-- NPC ID
	name = GetNpcName(344),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00344:Talk(bProcess) 
  NpcAsk({"小喜鹊，尾巴长，娶了媳妇忘了娘......",
         "叔叔阿姨我们来玩丢沙包吧！",
         "来和我一起玩好不好。",
         "我和哥哥弟弟玩做迷藏，你要是看到他们告诉我一下。 ",})
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00344)
