
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00659 = {							-- 孙小红
	npc_id = 659,						-- NPC ID
	name = GetNpcName(659),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00659:Talk(bProcess) 
  NpcAsk("少侠还需要这点帮助么,还是把机会留给新人吧")
 	SetAnswer(1,"离开")
	WaitAnswer(1)
end

 
 --[[ 
  if bProcess then 
    script:SetSaying(true)

	  if player:GetLevel() >= 30 then 
	    NpcSay("少侠还需要这点帮助么,还是把机会留给新人吧")
	    return
	  end
    player:ChangeMoney(100)
    NpcSay("#Y你捡起了100两银子")
    if npc then
      npc:Destroy()
    end
  end
end
--]]











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00659)
