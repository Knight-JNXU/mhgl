
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00284 = {							-- 杵官王
	npc_id = 284,						-- NPC ID
	name = GetNpcName(284),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00284:Talk(bProcess) 
  local wDay = LuaI.GetRealWDay()
  local hour = LuaI.GetRealHour()
  local rDay = LuaI.GetRealHour()
  local rYear = LuaI.GetRealYear()
  local rMonth = LuaI.GetRealMonth()
  local getTime = os.date("%d");
    if npc then
    local TotalRound610 = 0
    local type610 = player:GetQuests():GetType(9999)
	local flag = player:GetQuests():GetFlag(24567)
    if type610 ~= nil then
      TotalRound610 = type610:GetTotalRound()
    end
  local lv = player:GetLevel()
  NpcAsk("荟萃三界英雄，决战华山之巅！欢迎各位英雄前往华山论剑比试，胜利者，将成为万众瞩目的武林盟主！")
   if hour >= 21 and hour < 22 then
  SetAnswer(1,"我要前往参加")
  end
  SetAnswer(5,"查看比武积分")
  SetAnswer(4,"查看比武积分排行榜")
  --SetAnswer(3,"2积分换书包")
 -- SetAnswer(10,"10积分换翅膀碎片")
 -- SetAnswer(6,"10积分换宠物碎片")
  --SetAnswer(7,"10积分换神器碎片")
  --SetAnswer(8,"5积分换神秘宝盒")
  SetAnswer(9,"我就是来看看的")
  WaitAnswer(9)
    if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    if party then
      NpcSay("请一个一个来,不要组队~！")
      return false
    end
		if bProcess then
          if type610 == nil then
            player:GetQuests():SetRoundInfo(9999, 1, 1, 1)
            type610 = player:GetQuests():GetType(9999)
            type610:ChangeTotalRound(1)
          else
            type610:ChangeTotalRound(1)
          end
		   player:GetQuests():SetFlag(24567, flag + 1)
		  --if player:GetItems():GetItemCount(80085) > 0 then
		  --player:JumpMap(256,77,279)
      if lv >= 1 and lv <= 175 then-- 60,61,62,63,64,65,66,67,68,69
      player:JumpMap(253,77,279)
	  --elseif lv >= 145 and lv <= 175 then-- 60,61,62,63,64,65,66,67,68,69
      --player:JumpMap(254,77,279)
	  --elseif lv >= 140 and lv <= 149 then-- 60,61,62,63,64,65,66,67,68,69
      --player:JumpMap(255,77,279)
    end
	end
	end
    if GetAnswer() == 3 then 
	if player:GetPvPScoreSingle() < 2 then
	NpcSay("你的积分不足2")
	return
	end
     player:ChangePvPScoreSingle(-2)
	 player:GetItems():AddItem(600002, 1)
     ShowHint("书包给你了#46") 
	 end
    if GetAnswer() == 4 then
	  script:Rank(6)
	  end
	if GetAnswer() == 5 then		
		NpcSay(string.format("你现在的个人比武积分为\#P%d\#W分。",player:GetPvPScoreSingle()))
    end		
	if GetAnswer() == 6 then		
	if player:GetPvPScoreSingle() < 10 then
	NpcSay("你的积分不足10")
	return
	end
     player:ChangePvPScoreSingle(-10)
	 player:GetItems():AddItem(600000, 1)
     ShowHint("宠物碎片给你了#46") 
	 end
	if GetAnswer() == 7 then		
		if player:GetPvPScoreSingle() < 10 then
	NpcSay("你的积分不足10")
	return
	end
     player:ChangePvPScoreSingle(-10)
	 player:GetItems():AddItem(600001, 1)
     ShowHint("神器碎片给你了#46") 
	 end
	if GetAnswer() == 8 then		
		if player:GetPvPScoreSingle() < 5 then
	NpcSay("你的积分不足5")
	return
	end
     player:ChangePvPScoreSingle(-5)
	 player:GetItems():AddItem(600013, 1)
     ShowHint("神秘宝盒给你了#46") 
	 end
    if GetAnswer() == 10 then		
		if player:GetPvPScoreSingle() < 10 then
	    NpcSay("你的积分不足10")
	    return
	     end
     player:ChangePvPScoreSingle(-10)
	 player:GetItems():AddItem(444447, 1)
     ShowHint("翅膀碎片给你了#46") 
end
end
end
















-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00284)
