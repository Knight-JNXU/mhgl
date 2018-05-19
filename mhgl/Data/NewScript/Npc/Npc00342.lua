

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00342 = {							-- 杵官王
	npc_id = 00342,						-- NPC ID
	name = GetNpcName(00342),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00342:Talk(bProcess) 
  NpcAsk("新年好呀，领取任务要找找#Y看恭喜发财，红包拿来在哪里哦")
  SetAnswer(1,"春节元宵活动")
  SetAnswer(6,"删除任务")
  SetAnswer(5,"离开")
  WaitAnswer(5)
   if GetAnswer() == 1 then
	   if player:GetQuests():HasQuest(63527) then
   	  local q = player:GetQuests():GetQuest(63527)
   	  if q:IsFailed() then 
   	    NpcSay("任务已失败，请删除任务后在领取~")
   	  else
   	    NpcSay("快去寻找伙伴一起闯关吧。")
   	  end
   	  return false
   	else
   	  Quest63527:Take()
   	end
		elseif GetAnswer() == 6 then
    player:GetQuests():RemoveQuest(63527)
  end
	end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00342)

