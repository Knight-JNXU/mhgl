
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00661 = {							-- 孙小红
	npc_id = 661,						-- NPC ID
	name = GetNpcName(661),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00661:Talk(bProcess) 
  NpcAsk("少侠还需要这点帮助么,还是把机会留给新人吧")
 	SetAnswer(1,"离开")
	WaitAnswer(1)
end
 --[[
  if bProcess then 
    script:SetSaying(true)
	  if player:GetLevel() >= 30 then 
	    NpcAsk("少侠还需要这点帮助么,还是把机会留给新人吧")
	    SetAnswer(1,"离开")
	    WaitAnswer(1)
	    return
	  end
    local item = RandTable({10000,10006,10009,10010})
    local name = GetItemName(item)
    NpcSay(string.format("#Y你获得了%s",name))
    player:GetItems():AddItem(item,1)
    if npc then
      npc:Destroy()
    end
  end
end

--]]










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00661)
