Preload("Quest10037.lua")
Preload("Quest10038.lua")
Preload("Quest10048.lua")
Preload("Quest10049.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00516 = {							-- 玄奘
	npc_id = 516,						-- NPC ID
	name = GetNpcName(516),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00516:Talk(bProcess)
  local quest_ids = {10037,10048}
  if HasQuest(quest_ids) then
    NpcAsk({"我想和你说四句话，包括已经讲了的一句，和现在这句，我讲完了！",
          "南无阿弥陀佛，南无是南无阿弥陀佛的南无，阿弥陀佛是南无阿弥陀佛的阿弥陀佛。施主，我明白了，你明白了么?",
          "万缘放下，便是不乱，净念相继，便是一心。",
          "施主，你有多帅兄弟姐妹，你父母尚在吗？你别这样看着我，贫僧只不过想在讲经之前多交一个朋友而已。"
          })
    SetAnswer(1,"主线任务")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(10037) then
        if Quest10037:Return() then
          Quest10038:Take()
        end
      elseif HasQuest(10048) then
        if Quest10048:Return() then
          Quest10049:Take()
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
AddNpcTable(Npc00516)
