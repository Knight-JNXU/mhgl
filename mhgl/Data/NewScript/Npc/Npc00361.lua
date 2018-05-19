
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00361 = {							-- 杵官王
	npc_id = 361,						-- NPC ID
	name = GetNpcName(361),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00361:Talk(bProcess) 
  NpcAsk("江湖的恩恩怨怨，谁又说的清呢。报仇雪恨的方法有很多种，但凡我大唐子民，应光明正大地与仇人决一死战！本统领愿作为决斗的公证人。在决斗中杀死对手不会受到任何惩罚，在这里下战书即可。在御林军右统领附近属于战斗区域！在此战斗区域允许决斗双方相互间发生战斗！ !")
  SetAnswer(1,"决斗规则")
  SetAnswer(2,"我要下战书  ")
  SetAnswer(3,"申请决斗权 ")
  SetAnswer(4,"我来应战 ")
  SetAnswer(5,"观看最近录像 ")
  SetAnswer(6,"妈妈说杀人是不对的 ")
  WaitAnswer(6)
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00361)
