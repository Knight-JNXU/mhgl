Preload("Quest55101.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00303 = {							-- 杵官王
	npc_id = 303,						-- NPC ID
	name = GetNpcName(303),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00303:Talk(bProcess) 
  local quest55101 = player:GetQuests():GetQuest(55101)
  NpcAsk("想玩牌吗？让我看看你的资质如何，如果你能胜我我就叫你打牌技巧，以后你就可以和别人切磋竞技了。")
  SetAnswer(1,"还请大师多多指点。 ")
  SetAnswer(2,"梦幻卡牌风云赛 ")
  SetAnswer(3,"我想了解梦幻牌的基本玩法")
  if HasQuest(55101) and (quest55101:GetTargetNpcId(1) == self.npc_id or quest55101:GetTargetNpcId(2) == self.npc_id) then
    SetAnswer(4, "建设任务")
  end
 
  SetAnswer(5,"我对棋牌之类的没有什么兴趣，多谢你的好意")
  WaitAnswer(5)
  if GetAnswer() == 4 then
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
AddNpcTable(Npc00303)
