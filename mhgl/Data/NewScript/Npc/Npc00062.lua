
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00061 = {							-- 孙小红
	npc_id = 61,						-- NPC ID
	name = GetNpcName(61),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00061:Talk(bProcess)
  NpcAsk("偷偷告诉你,我老爹可是山林里的大猎户,每天都捉到许多动物的宝宝窝哦！啊,你家里有牧场呀?想要一些动物宝宝吗?我这里可以出售哦,如果银两不够的话,帮我跑下腿,我也会赠与一些宝宝窝作为回礼哦！")
  SetAnswer(1,"购买宝宝窝")
  SetAnswer(2,"领取宝宝窝任务")
  SetAnswer(3,"我理过而已")
  WaitAnswer(3)
end




-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00061)
