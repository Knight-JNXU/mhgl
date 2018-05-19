Preload("Quest10038.lua")
Preload("Quest10039.lua")
Preload("Quest10042.lua")
Preload("Quest10043.lua")
Preload("Quest10047.lua")
Preload("Quest10048.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00536 = {							-- 玄奘
	npc_id = 536,						-- NPC ID
	name = GetNpcName(536),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00536:Talk(bProcess)
  local quest_ids = {10038,10042,10047}
  if HasQuest(quest_ids) then
    NpcAsk("我的事情太多，忙不过来，请优先选择一件你最想做得事情吧。（如果你想做的事情不在列表中，请选择“我要做其他事情”）")
    SetAnswer(1,"主线任务")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(10038) then
        if Quest10038:Return() then
          Quest10039:Take()
        end
      elseif HasQuest(10042) then
        if Quest10042:Return() then
          Quest10043:Take()
        end
      elseif HasQuest(10047) then
        if Quest10047:Return() then
          Quest10048:Take()
        end
      end
    end
  else
    NpcAsk({"我想和你说四句话，包括已经讲了的一句，和现在这句，我讲完了！",
          "南无阿弥陀佛，南无是南无阿弥陀佛的南无，阿弥陀佛是南无阿弥陀佛的阿弥陀佛。施主，我明白了，你明白了么?",
          "万缘放下，便是不乱，净念相继，便是一心。",
          "施主，你有多帅兄弟姐妹，你父母尚在吗？你别这样看着我，贫僧只不过想在讲经之前多交一个朋友而已。"
          })
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end


-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00536)
