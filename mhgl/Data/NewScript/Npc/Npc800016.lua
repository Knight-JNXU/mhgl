

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc800016 = {							-- 杵官王
	npc_id = 800016,						-- NPC ID
	name = GetNpcName(800016),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc800016:Talk(bProcess) 
  NpcAsk("我是唐王任命专门负责处理副本冒险相关事宜的官员，这方面有什么业务直接找我好了。")
  SetAnswer(1,"我想创建副本")
  SetAnswer(2,"进入锁妖塔")
  SetAnswer(6,"删除任务")
  SetAnswer(5,"离开")
  WaitAnswer(5)
   if GetAnswer() == 1 then
	   if player:GetQuests():HasQuest(63522) then
   	  local q = player:GetQuests():GetQuest(63522)
   	  if q:IsFailed() then 
   	    NpcSay("任务已失败，请删除任务后在领取~")
   	  else
   	    NpcSay("快去寻找伙伴一起闯关吧。")
   	  end
   	  return false
   	else
   	  Quest63522:Take()
   	end
		elseif GetAnswer() == 6 then
    player:GetQuests():RemoveQuest(63522)
  end
    if GetAnswer() == 2 then
	 player:JumpMap(2016,102,77)
    end
	end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc800016)

