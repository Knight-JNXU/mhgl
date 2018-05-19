Preload("Quest63531.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00349 = {							-- 杵官王
	npc_id = 349,						-- NPC ID
	name = GetNpcName(349)		-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00349:Talk(bProcess) 
  NpcAsk("是否迎战单人副本只能单人通过哦")
  SetAnswer(1,"进入副本")
  SetAnswer(4,"取消任务")
  SetAnswer(7,"我是随便看看的")
  WaitAnswer(7)
  if GetAnswer() == 1 then
    NpcAsk("#Y接下来就要进入副本少侠同意吗?#G他们都在说谎哦")
    SetAnswer(1,"是的,我同意")
    SetAnswer(2,"我清理一下背包")
    WaitAnswer(2)
    if GetAnswer() == 1 then
	player:JumpMap(30902, 6, 82) 
      if HasQuest(63531) then
        Quest63531:Return()
      else
        Quest63531:Take()
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
	player:GetQuests():RemoveQuest(63531)       
end
 end   
end

    












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00349)
