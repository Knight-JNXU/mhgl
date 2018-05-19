
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00687 = {							-- 孙小红
	npc_id = 687,						-- NPC ID
	name = GetNpcName(687),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00687:Talk(bProcess) 
  NpcAsk("我的事情太多,忙不过来了,请优先选择一件你最想做的事情吧。")
  SetAnswer(1,"泾河龙王2副本")
  SetAnswer(2,"奖善罚恶活动")
  SetAnswer(3, "删除科举活动")
  SetAnswer(4,"我只是随便看看")
  WaitAnswer(4)
	if GetAnswer() == 3 then
		-- if player:GetQuests():HasQuest(50006) and quest50006:IsFailed() then
			-- player:GetQuests():RemoveQuest(50006) 
		-- elseif player:GetQuests():HasQuest(50007) and quest50007:IsFailed() then
			-- player:GetQuests():RemoveQuest(50007) 
			-- player:GetQuests():RemoveFlag(507)
		-- elseif player:GetQuests():HasQuest(50008) and quest50008:IsFailed() then
			-- player:GetQuests():RemoveQuest(50008) 
		-- end
		if bProcess then
			if player:GetQuests():TimeMarkOver(50006, 300) then --如果前次乡试未删除
				player:GetQuests():SetFlag(444,0)
				player:GetQuests():SetFlag(555,0)
			end
			player:GetQuests():RemoveQuest(50006)
			player:GetQuests():RemoveQuest(50007)
			player:GetQuests():RemoveQuest(50008)
			player:GetQuests():RemoveFlag(507)
		end
		NpcAsk("任务已删除。")
	  SetAnswer(1,"离开")
	  WaitAnswer(1)
  end
end

 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00687)
