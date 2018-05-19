
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc200012 = {							-- 杵官王
	npc_id = 200012,						-- NPC ID
	name = GetNpcName(200012)		-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc200012:Talk(bProcess) 
  NpcAsk("么么哒")
  SetAnswer(1,"领取称谓")
  SetAnswer(7,"我是随便看看的")
  WaitAnswer(7)
  if GetAnswer == 1 and bProcess then
		     player:AddTitle(724)
			 end
end
        

    



    












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc200012)
