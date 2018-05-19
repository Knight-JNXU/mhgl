
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00105 = {							-- 孙小红
	npc_id = 105,						-- NPC ID
	name = GetNpcName(105),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00105:Talk(bProcess) 
  NpcAsk("我就是鬼谷道术如今三界最牛逼的传人,专职负责降妖除魔。每逢周六15:00-17:00,黄昏将至,妖孽现形之时,法力高深之辈挣脱了符咒的束缚,出来危害三界,也是我道人最忙碌的时候。少侠们也一起来降妖伏魔吧。")
  SetAnswer(1,"领取降妖伏魔任务")
  SetAnswer(2,"来此炼化镇妖拘魂铃")
  SetAnswer(3,"了解新的降妖伏魔活动")
  SetAnswer(4,"了解炼化镇妖拘魂铃")
  SetAnswer(5,"关于假宝图")
  SetAnswer(6,"取消降妖伏魔任务")
  SetAnswer(7,"我只是路过")
  WaitAnswer(7)
end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00105)
