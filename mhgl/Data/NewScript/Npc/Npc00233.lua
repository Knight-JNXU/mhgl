
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00233 = {							-- 杵官王
	npc_id = 233,						-- NPC ID
	name = GetNpcName(233),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00233:Talk(bProcess) 
  NpcAsk({"我家兄弟当初与老爷并肩作战，现如今也不知身在何处？",
         "听说老爷最近要远征奸杀突厥，真担心他的身子。",
         "现在是太平盛世，百姓安居乐业。",
         "我家老程的三板斧据说是在梦中学会的，我才不信呢。",})
		SetAnswer(2, "离开")
		WaitAnswer(2)
       end

         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00233)
