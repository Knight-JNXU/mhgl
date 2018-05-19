
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00485 = {							-- 杵官王
	npc_id = 485,						-- NPC ID
	name = GetNpcName(485),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00485:Talk(bProcess) 
  NpcAsk("是药三分毒，身体有恙，不可不吃药，也不可乱吃，一定要对症下药，方能药到病除。 !")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做  ")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if IsProcess() then
      script:OpenInterface("shop", 300);
    end
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00485)
