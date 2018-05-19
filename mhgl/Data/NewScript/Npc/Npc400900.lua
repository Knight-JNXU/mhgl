Preload("Quest63528.lua")
Preload("Quest63527.lua")
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00470 = {							-- 杵官王
	npc_id = 470,						-- NPC ID
	name = GetNpcName(470)		-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00470:Talk(bProcess) 
 --[[ NpcSay("GM告诉我说等他睡醒了以后才能传送你们进入幻境,快去看看那个老B睡醒了没有吧")
end--]]

  local flag63528 = player:GetQuests():GetFlag(63528)
  local flag = player:GetQuests():GetFlag(63528)
  local lv = player:GetLevel()
  NpcAsk("目前来说以你的修为已经到头了，如果想百尺竿头，更上一步的话，除非能入于化境！!")
  SetAnswer(1,"飞升后领取称谓")
  if flag == 0 and lv > 143 then
    SetAnswer(2,"我想入于化境，请上仙指点一二。")
  end
  SetAnswer(3,"入于化境后有什么变化？")
  SetAnswer(4,"我已经通过考验，请带我入于化境。")
  SetAnswer(7,"我是随便看看的")
  WaitAnswer(7)
  if GetAnswer == 1 then
 if player:GetItems():GetItemCount(80085) < 1 then   --50级精铁
		    NpcAsk("还未飞升")
		    return
		  end
		     player:AddTitle(1021)
			 end
			 if GetAnswer() == 3 then
    NpcSay("进入幻境以后,少侠可获得等级提升。每次进入幻境后,都可以获得免费洗点的机会。")
	end
   if GetAnswer() == 2 then
    NpcAsk("少侠若是要突破幻境,那么接下来就要进入战斗#Y\r若是突破成功,要完成任务,请注意背包是否留有3个以上的物品格子领取奖励~！#P\r若是奖励未能领取,造成损失自行负责,少侠同意吗?")
    SetAnswer(1,"是的,我同意")
    SetAnswer(2,"我清理一下背包")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      if HasQuest(63528) then
        Quest63528:Return()
      else
        Quest63528:Take()
      end
      
    end
  end
end
        

    



    












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00470)
