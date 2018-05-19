
Preload("Quest63529.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00400901 = {							-- 杵官王
	npc_id = 400901,						-- NPC ID
	name = GetNpcName(400901)		-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00400901:Talk(bProcess) 
 --[[ NpcSay("GM告诉我说等他睡醒了以后才能传送你们进入幻境,快去看看那个老B睡醒了没有吧")
end--]]
  local lv = player:GetLevel()
  NpcAsk("目前来说以你的修为已经到头了，如果想百尺竿头，更上一步的话，除非能够渡劫！!")
  if player:GetQuests():GetFlag(63529) == 0 and lv == 155 then
   SetAnswer(1,"渡劫？")
   end
  SetAnswer(4,"取消任务")
  SetAnswer(7,"我是随便看看的")
  WaitAnswer(7)
  if GetAnswer() == 1 then
    NpcAsk("接下来就要进入战斗#Y\r若是渡劫成功,要完成任务,请注意背包是否留有3个以上的物品格子领取奖励~！#P\r若是奖励未能领取,造成损失自行负责,少侠同意吗?")
    SetAnswer(1,"是的,我同意")
    SetAnswer(2,"我清理一下背包")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(63529) then
        Quest63529:Return()
      else
        Quest63529:Take()
      end
      
    end
  elseif GetAnswer() == 3 then
    NpcSay("接下来就要进入战斗#Y\r若是渡劫成功,要完成任务,请注意背包是否留有3个以上的物品格子领取奖励~！#P\r若是奖励未能领取,造成损失自行负责,少侠同意吗?")
   end
   
	    if GetAnswer() == 4 then
	    NpcAsk("删除任务")
    SetAnswer(1,"是的")
    SetAnswer(2,"我清理一下")
    WaitAnswer(2)	
	if GetAnswer() == 1 then	
	player:GetQuests():RemoveQuest(63529)
	player:GetQuests():RemoveQuest(63530)
        
end
    
end
end

    












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00400901)
