
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00357 = {							-- 杵官王
	npc_id = 357,						-- NPC ID
	name = GetNpcName(357),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00357:Talk(bProcess) 

  NpcAsk({"整天站岗我都烦了，我也渴望过点冒险刺激的生活，有谁愿意雇佣我呢？想雇佣我的人请找边门的总管大人。",
         "皇宫是我家，安全靠大家",
         "可别小看我们哦，当年我们也是跟着皇上从死人堆里爬出来的。",
         "我虽然没有御林军高大威猛，但也算是身体强壮了。可以找边门的总管大人雇佣护卫保护玩家的安全。 ",})
  SetAnswer(5,"删除神秘副本任务")
  SetAnswer(1,"领取神秘副本任务并进入")
  SetAnswer(3,"VIP专属地")
  SetAnswer(4,"长安1居")
  SetAnswer(6,"长安2居")
  SetAnswer(2,"离开")
  WaitAnswer(2)
   if GetAnswer() == 1 then 
    if player:GetQuests():HasQuest(63526) then
   	  local q = player:GetQuests():GetQuest(63526)
   	  if q:IsFailed() then 
   	    NpcSay("任务已失败，请删除任务后在领取~")
   	  else
   	    NpcSay("快去寻找伙伴一起闯关吧。")
   	  end
   	  return false
   	else
   	  Quest63526:Take()
    player:JumpMap(60300,50,100)
	ShowHint("感觉周围有神秘的邪恶气息...#120")
	    end
   
   end
    if GetAnswer() == 3 and bProcess then 
   script:SetSaying(true)
      if party then
    NpcSay("请一个一个来,不要组队~！")
    return false
    end
   	 if player:GetItems():GetItemCount(51403) < 1 then	    
                NpcSay("你不是VIP")
                return
				end
 player:JumpMap(500,50,100)
end    
   if GetAnswer() == 4 then 
   player:JumpMap(56300,50,100)
end
   if GetAnswer() == 6 then 
   player:JumpMap(53800,20,66)
end
  if GetAnswer() == 5 then
    player:GetQuests():RemoveQuest(63526)
end
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00357)
