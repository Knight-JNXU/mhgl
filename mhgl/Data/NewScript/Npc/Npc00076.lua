Preload("Quest10040.lua")
Preload("Quest10041.lua")
Preload("Quest10042.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00076 = {							-- 孙小红
	npc_id = 76,						-- NPC ID
	name = GetNpcName(76),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00076:Talk(bProcess)
  local quest_ids = {10040}
  local Aquest_ids = {10041}
  if HasQuest(quest_ids) then
    NpcAsk("你找我有什么事情吗?")
    SetAnswer(1,"请问您这里有定神香吗?")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(10040) then
        if Quest10040:Return() then
          Quest10041:Take()
        end
      end
    end
  elseif HasQuest(Aquest_ids) then
    NpcAsk("你们找到了#Y餐风饮露#W了吗?")
    SetAnswer(1,"我找到了")
    SetAnswer(2,"还没有")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(10041) then
        if Quest10041:Return() then
          Quest10042:Take()
        end
      end
    end
  else
    NpcAsk({"百合固金二地黄,玄参贝母桔甘藏。麦东芍药当归配,喘咳痰肺家伤。唉，跟你说这个你也不明白。",
          "草药的功效要想发挥到极致,关键在于这用药之法。",
          "有很多怪病奇毒只有仙家灵丹可以医治。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
 
  end
end






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00076)
