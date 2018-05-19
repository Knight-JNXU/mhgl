
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00284 = {							-- 杵官王
	npc_id = 284,						-- NPC ID
	name = GetNpcName(284),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00284:Talk(bProcess) 
  local lv = player:GetLevel()
  NpcAsk("荟萃三界英雄，决战华山之巅！欢迎各位英雄前往华山论剑比试，胜利者，将成为万众瞩目的武林盟主！")
  SetAnswer(1,"我要前往参加[20万费用]")
  SetAnswer(2,"我要寻找华山队友")
  SetAnswer(3,"兑换奖励")
  SetAnswer(4,"查看排行榜")
  SetAnswer(5,"查看比武积分")
  SetAnswer(6,"回购华山礼物 ")
  SetAnswer(7,"我想知道这是怎么回事")
  SetAnswer(8,"查看录像")
  SetAnswer(9,"我就是来看看的")
  WaitAnswer(9)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    if party then
      NpcSay("请一个一个来,不要组队~！")
      return false
    end
    if player:GetMoney() < 200000 then
      NpcSay("传送神武坛需要消耗20万金钱")
      return
    end
    ShowError("\#W消耗了200000银两")
    if lv >= 60 and lv <= 69 then-- 60,61,62,63,64,65,66,67,68,69
      player:JumpMap(253,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 70 and lv <= 79 then--70,71,72,73,74,75,76,77,78,79
      player:JumpMap(254,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 80 and lv <= 89 then--80,81,82,83,84,85,86,87,88,89
      player:JumpMap(255,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 90 and lv <= 99 then--90,91,92,93,94,95,96,97,98,99,
      player:JumpMap(256,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 100 and lv <= 109 then--100,101,102,103,104,105,106,107,108,109
      player:JumpMap(257,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 110 and lv <= 119 then--110,111,112,113,114,115,116,117,118,119
      player:JumpMap(258,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 120 and lv <= 129 then--120,121,122,123,124,125,126,127,128,129
      player:JumpMap(259,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 130 and lv <= 139 then--130,131,132,133,134,135,136,137,138,139
      player:JumpMap(260,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 140 and lv <= 149 then--140,141,142,143,144,145,146,147,148,149
      player:JumpMap(261,77,279)
      player:ChangeMoney(-200000)
    elseif lv >= 150 and lv <= 159 then--150,151,152,153,154,155,156,157,158,159
      player:JumpMap(262,77,279)
      player:ChangeMoney(-200000)
    end
  elseif GetAnswer() == 2 then
    NpcSay("请传送进地图后请少侠自己寻找队友！")
  elseif GetAnswer() == 3 then
    NpcSay("礼物兑换即将开启~！")
  elseif GetAnswer() == 4 then
	  script:Rank(6)
	elseif GetAnswer() == 5 then		
		NpcSay(string.format("你现在的个人比武积分为\#P%d\#W分。",player:GetPvPScoreSingle()))	
	elseif GetAnswer() == 6 then		
		NpcSay("暂未开放")
	elseif GetAnswer() == 7 then		
		NpcSay("玩家可传送进入武神坛,寻找队友或者对手,每次进入决斗会消耗50万金钱,胜利可获得失败者40万,胜利可获得比武积分,失败直接传送出地图")
	elseif GetAnswer() == 8 then		
		NpcSay("嘿嘿")
  end
end
















-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00284)
