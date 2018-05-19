Preload("Quest10044.lua")
Preload("Quest10045.lua")
Preload("Quest10046.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00116 = {							-- 孙小红
	npc_id = 116,						-- NPC ID
	name = GetNpcName(116),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00116:Talk(bProcess) 
  local quest_ids = {10044,10045}
  local Aquest_ids = {10045}
  if HasQuest(quest_ids) then
    NpcAsk("你是要去西牛贺洲吗?嘿嘿,我可以带你一程哟,免费不要钱~！")
    SetAnswer(1,"主线任务")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(10044) then
        if Quest10044:Return() then 
          Quest10045:Take()
        end
      elseif HasQuest(10045) then
        if Quest10045:Return() then 
          Quest10046:Take()
        end
      end
    end
  else
    NpcAsk("我可以送你去#R西牛贺洲#W,你要不要去呢？")
    SetAnswer(1,"是的,我要去")
    SetAnswer(2,"我还要逛逛")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      player:JumpMap(12,13,275)
    end
  end
end





-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00116)
