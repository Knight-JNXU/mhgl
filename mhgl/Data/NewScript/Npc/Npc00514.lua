Preload("Quest10035.lua")
Preload("Quest10036.lua")
Preload("Quest10049.lua")
Preload("Quest10050.lua")
Preload("Quest10051.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00514 = {							-- 业释和尚
	npc_id = 514,						-- NPC ID
	name = GetNpcName(514),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00514:Talk(bProcess)
  local quest_ids = {10035,10036,10049,10050}
  if HasQuest(quest_ids) then
    NpcAsk("如果是来上香的,直接把香交给我就可以了。")
    SetAnswer(1,"主线任务")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then 
      if HasQuest(10035) then
        if Quest10035:Return() then
          Quest10036:Take()
        end
      elseif HasQuest(10036) then
        if Quest10036:Return() then 
          Quest10037:Take()
        end
      elseif HasQuest(10049) then
        if Quest10049:Return() then 
          Quest10050:Take()
        end
      elseif HasQuest(10050) then
        if Quest10050:Return() then 
          Quest10051:Take()
        end
      end
    end
  else
     NpcAsk({"趁着法明去化生寺的空当，我的整整这玄奘和尚，以泄心中之恨。",
          "在洒家看来，佛法就是喝酒吃肉！",
          "俗话说的好“酒肉穿肠过，佛祖心中留”嘛。",
          "要不是法明那老和尚偏心，玄奘那小子怎能到尽头的地步？"
          })
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00514)
