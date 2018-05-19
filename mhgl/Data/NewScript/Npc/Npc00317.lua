Preload("Quest55101.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00317 = {							-- 杵官王
	npc_id = 317,						-- NPC ID
	name = GetNpcName(317),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00317:Talk(bProcess) 
  local quest55101 = player:GetQuests():GetQuest(55101)
  NpcAsk({"行个方便吧，我已经几天没吃饭了。",
         "穷人头上两把刀，租子重，利钱高，夹在当中吃不消。",
         "好心借钱给别人，他们却说我放高利贷......",
         "昨儿晚上梦见吃饼，那饼有脸盆一般大，门板一样厚。",
         "想当初我也是阔绰一时，野外地下赌庄真是害死人啊！",
         "叫花子命苦，行行好吧。"})
  if HasQuest(55101) and (quest55101:GetTargetNpcId(1) == self.npc_id or quest55101:GetTargetNpcId(2) == self.npc_id) then
    SetAnswer(1, "建设任务")
  end
  SetAnswer(2,"我只是路过")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    ISay("本帮山庄建设中，还请阁下多多帮忙。")
    NpcSay("没问题，回复你们总管就说包在我身上了。")
    if quest55101:GetTargetNpcId(1) == self.npc_id then
      quest55101:FindTargetNPC(1)
    else
      quest55101:FindTargetNPC(2)
    end
    quest55101:UpdateData()
  end
end
  









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00317)
