
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00357 = {							-- 杵官王
	npc_id = 357,						-- NPC ID
	name = GetNpcName(357),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00357:Talk(bProcess) 
  NpcAsk({"整天站岗我都烦了，我也渴望过点冒险刺激的生活，有谁愿意雇佣我呢？想雇佣我的人请找边门的总管大人。",
         "皇宫是我家，安全靠大家",
         "可别小看我们哦，当年我们也是跟着皇上从死人堆里爬出来的。",
         "我虽然没有御林军高大威猛，但也算是身体强壮了。可以找边门的总管大人雇佣护卫保护玩家的安全。 ",})
  SetAnswer(1,"神秘副本")
  SetAnswer(2,"离开")
  WaitAnswer(2)
   if GetAnswer() == 1 and bProcess then 
     script:SetSaying(true)
		  player:JumpMap(34,250,250)
		  NpcSay("感觉#120")
		end
end
         
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00357)
