
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00667 = {							-- 孙小红
	npc_id = 667,						-- NPC ID
	name = GetNpcName(667),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00667:Talk(bProcess) 
  NpcAsk({"珍珠链,买三条,美过翡翠与玛瑙,锦绣饰品店欢迎你！",
          "价格很公道,随便挑几样吧。",
          "送些精致饰品给意中人,表示一下心意嘛。",
          "既然来长安旅游,何不在本店买一件护身符留作纪念？"
          })
  SetAnswer(4,"购买首饰")
  SetAnswer(1,"打造装备")
  SetAnswer(2,"购买灵饰魂魄")
  SetAnswer(3,"打造灵饰")
  SetAnswer(5,"我什么都不想做")
  WaitAnswer(5)
  if GetAnswer() == 1 then 
    NpcAsk("我这里可以打造饰品,只需要有制造指南书和铁变可以。")
    SetAnswer(1,"我要打造")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      NpcAsk("请问需要打造多少级的饰品?")
      SetAnswer(1,"0级-110级饰品")
      SetAnswer(2,"110级-150级饰品") 
      SetAnswer(3,"强化打造饰品")	  
      SetAnswer(13,"离开")
      WaitAnswer(13)
      if GetAnswer() == 1 and bProcess then  
        script:SetSaying(true)
        script:OpenInterface("mixshop", 13)
	    elseif GetAnswer() == 2 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 15)
	    elseif GetAnswer() == 3 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 48)		  
	    end
	  end
	elseif GetAnswer() == 2 then
	  NpcAsk("请问少侠要购买什么呢?\r#P【100级】购买魂魄价格1000万\r【110级】购买魂魄价格2000万\r【120级】购买魂魄价格3000万\r【130级】购买魂魄价格4000万\r【140级】购买魂魄价格5000万\r【150级】购买魂魄价格6000万\r#O每次购买需要消耗银两,购买的魂魄附加的灵饰为随机")
	  SetAnswer(1,"购买灵饰魂魄")
	  SetAnswer(2,"购买灵饰精铁")
	  SetAnswer(3,"购买强化石")
	  --SetAnswer(4,"回收灵饰魂魄")
	  SetAnswer(5,"离开")
	  WaitAnswer(4)
	  if GetAnswer() == 1 then
	    NpcAsk("请问少侠要购买多少级的灵饰魂魄呢?")
	    SetAnswer(1,"100级灵饰魂魄")
	    SetAnswer(2,"110级灵饰魂魄")
	    SetAnswer(3,"120级灵饰魂魄")
	    SetAnswer(4,"130级灵饰魂魄")
	    SetAnswer(5,"140级灵饰魂魄")
	    SetAnswer(6,"150级灵饰魂魄")
	    SetAnswer(7,"离开")
	    WaitAnswer(7)
	    if GetAnswer() == 1 and bProcess then  
	      script:SetSaying(true)
	      if player:GetMoney() < 10000000 then
	        NpcSay("这东西可不好搞，没钱可不行！")
	        return
	      end
	      local A = math.random(1,120)
	      if A == 1 then
	        player:GetItems():AddItem(60338, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 3 then
	        player:GetItems():AddItem(60337, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 5 then
	        player:GetItems():AddItem(60336, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 7 then
	        player:GetItems():AddItem(60335, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 9 then
	        player:GetItems():AddItem(60334, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 25 then
	        player:GetItems():AddItem(60333, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 30 then
	        player:GetItems():AddItem(60332, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 35 then
	        player:GetItems():AddItem(60331, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 40 then
	        player:GetItems():AddItem(60330, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 45 then
	        player:GetItems():AddItem(60329, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 50 then
	        player:GetItems():AddItem(60328, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 55 then
	        player:GetItems():AddItem(60327, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 60 then
	        player:GetItems():AddItem(60326, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A < 65 then
	        player:GetItems():AddItem(60325, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      elseif A <= 120 then
	        player:GetItems():AddItem(60324, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-10000000)
	      end
	    elseif GetAnswer() == 2 and bProcess then  
	      script:SetSaying(true)
	      if player:GetMoney() < 20000000 then
	        NpcSay("这东西可不好搞，没钱可不行！")
	        return
	      end
	      local A = math.random(1,120)
	      if A == 1 then
	        player:GetItems():AddItem(60353, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 3 then
	        player:GetItems():AddItem(60352, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 5 then
	        player:GetItems():AddItem(60351, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 7 then
	        player:GetItems():AddItem(60350, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 9 then
	        player:GetItems():AddItem(60349, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 25 then
	        player:GetItems():AddItem(60348, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 30 then
	        player:GetItems():AddItem(60347, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 35 then
	        player:GetItems():AddItem(60346, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 40 then
	        player:GetItems():AddItem(60345, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 45 then
	        player:GetItems():AddItem(60344, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 50 then
	        player:GetItems():AddItem(60343, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 55 then
	        player:GetItems():AddItem(60342, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 60 then
	        player:GetItems():AddItem(60341, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A < 65 then
	        player:GetItems():AddItem(60340, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      elseif A <= 120 then
	        player:GetItems():AddItem(60339, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-20000000)
	      end
	    elseif GetAnswer() == 3 and bProcess then  
	      script:SetSaying(true)
	      if player:GetMoney() < 30000000 then
	        NpcSay("这东西可不好搞，没钱可不行！")
	        return
	      end
	      local A = math.random(1,120)
	      if A == 1 then
	        player:GetItems():AddItem(60368, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 3 then
	        player:GetItems():AddItem(60367, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 5 then
	        player:GetItems():AddItem(60366, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 7 then
	        player:GetItems():AddItem(60365, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 9 then
	        player:GetItems():AddItem(60364, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 25 then
	        player:GetItems():AddItem(60363, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 30 then
	        player:GetItems():AddItem(60362, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 35 then
	        player:GetItems():AddItem(60361, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 40 then
	        player:GetItems():AddItem(60360, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 45 then
	        player:GetItems():AddItem(60359, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 50 then
	        player:GetItems():AddItem(60358, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 55 then
	        player:GetItems():AddItem(60357, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 60 then
	        player:GetItems():AddItem(60356, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A < 65 then
	        player:GetItems():AddItem(60355, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      elseif A <= 120 then
	        player:GetItems():AddItem(60354, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-30000000)
	      end
	    elseif GetAnswer() == 4 and bProcess then  
	      script:SetSaying(true)
	      if player:GetMoney() < 40000000 then
	        NpcSay("这东西可不好搞，没钱可不行！")
	        return
	      end
	      local A = math.random(1,120)
	      if A == 1 then
	        player:GetItems():AddItem(60383, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 3 then
	        player:GetItems():AddItem(60382, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 5 then
	        player:GetItems():AddItem(60381, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 7 then
	        player:GetItems():AddItem(60380, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 9 then
	        player:GetItems():AddItem(60379, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 25 then
	        player:GetItems():AddItem(60378, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 30 then
	        player:GetItems():AddItem(60377, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 35 then
	        player:GetItems():AddItem(60376, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 40 then
	        player:GetItems():AddItem(60375, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 45 then
	        player:GetItems():AddItem(60374, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 50 then
	        player:GetItems():AddItem(60373, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 55 then
	        player:GetItems():AddItem(60372, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 60 then
	        player:GetItems():AddItem(60371, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A < 65 then
	        player:GetItems():AddItem(60370, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      elseif A <= 120 then
	        player:GetItems():AddItem(60369, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-40000000)
	      end
	    elseif GetAnswer() == 5 and bProcess then  
	      script:SetSaying(true)
	      if player:GetMoney() < 50000000 then
	        NpcSay("这东西可不好搞，没钱可不行！")
	        return
	      end
	      local A = math.random(1,120)
	      if A == 1 then
	        player:GetItems():AddItem(60398, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 3 then
	        player:GetItems():AddItem(60397, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 5 then
	        player:GetItems():AddItem(60396, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 7 then
	        player:GetItems():AddItem(60395, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 9 then
	        player:GetItems():AddItem(60394, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 25 then
	        player:GetItems():AddItem(60393, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 30 then
	        player:GetItems():AddItem(60392, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 35 then
	        player:GetItems():AddItem(60391, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 40 then
	        player:GetItems():AddItem(60390, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 45 then
	        player:GetItems():AddItem(60389, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 50 then
	        player:GetItems():AddItem(60388, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 55 then
	        player:GetItems():AddItem(60387, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 60 then
	        player:GetItems():AddItem(60386, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A < 65 then
	        player:GetItems():AddItem(60385, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      elseif A <= 120 then
	        player:GetItems():AddItem(60384, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-50000000)
	      end
	    elseif GetAnswer() == 6 and bProcess then  
	      script:SetSaying(true)
	      if player:GetMoney() < 60000000 then
	        NpcSay("这东西可不好搞，没钱可不行！")
	        return
	      end
	      local A = math.random(1,120)
	      if A == 1 then
	        player:GetItems():AddItem(60513, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 3 then
	        player:GetItems():AddItem(60512, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 5 then
	        player:GetItems():AddItem(60511, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 7 then
	        player:GetItems():AddItem(60510, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 9 then
	        player:GetItems():AddItem(60509, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 25 then
	        player:GetItems():AddItem(60508, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 30 then
	        player:GetItems():AddItem(60507, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 35 then
	        player:GetItems():AddItem(60506, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 40 then
	        player:GetItems():AddItem(60505, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 45 then
	        player:GetItems():AddItem(60504, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 50 then
	        player:GetItems():AddItem(60503, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 55 then
	        player:GetItems():AddItem(60502, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 60 then
	        player:GetItems():AddItem(60501, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A < 65 then
	        player:GetItems():AddItem(60500, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      elseif A <= 120 then
	        player:GetItems():AddItem(60399, 1)
	        ShowHint("\#W获得灵饰魂魄#89")
	        player:ChangeMoney(-60000000)
	      end
	    end
	  elseif GetAnswer() == 2 then
	    NpcAsk("购买精铁的价格下面可以看到哟,少侠要购买多少级的精铁呢?\r#Y【100级精铁】1000万\r【110级精铁】2000万\r【120级精铁】3000万\r【130级精铁】4000万\r【140级精铁】5000万\r【150级精铁】6000万")
      SetAnswer(1,"购买100级战魄精铁")
      SetAnswer(2,"购买110级战魄精铁")
      SetAnswer(3,"购买120级战魄精铁")
      SetAnswer(4,"购买130级战魄精铁")
      SetAnswer(5,"购买140级战魄精铁")
      SetAnswer(6,"购买150级战魄精铁")
      SetAnswer(7,"离开")
      WaitAnswer(7)
      if GetAnswer() == 1 and bProcess then  
        script:SetSaying(true)
        if player:GetMoney() < 10000000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-10000000)
        player:GetItems():AddItem(15000, 1)
        ShowHint("\#W获得战魄精铁#89")
      elseif GetAnswer() == 2 and bProcess then  
        script:SetSaying(true)
        if player:GetMoney() < 20000000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-20000000)
        player:GetItems():AddItem(15001, 1)
        ShowHint("\#W获得战魄精铁#89")
      elseif GetAnswer() == 3 and bProcess then  
        script:SetSaying(true)
        if player:GetMoney() < 30000000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-30000000)
        player:GetItems():AddItem(15002, 1)
        ShowHint("\#W获得战魄精铁#89")
      elseif GetAnswer() == 4 and bProcess then  
        script:SetSaying(true)
        if player:GetMoney() < 40000000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-40000000)
        player:GetItems():AddItem(15003, 1)
        ShowHint("\#W获得战魄精铁#89")
      elseif GetAnswer() == 5 and bProcess then  
        script:SetSaying(true)
        if player:GetMoney() < 50000000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-50000000)
        player:GetItems():AddItem(15004, 1)
        ShowHint("\#W获得战魄精铁#89")
      elseif GetAnswer() == 6 and bProcess then  
        script:SetSaying(true)
        if player:GetMoney() < 60000000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-60000000)
        player:GetItems():AddItem(15005, 1)
        ShowHint("\#W获得战魄精铁#89")
      end
	  elseif GetAnswer() == 3 then
	    NpcSay("我这里暂时缺少这种东西,少侠还是去在江湖中找找吧")
--[[	    NpcAsk("请问少侠要购买什么强化石,购买价格在下面可以看到哟！#O\r【白虎石】40万\r【青龙石】30万\r【玄武石】20万\r【朱雀石】10万")
	    SetAnswer(1,"购买白虎石")
	    SetAnswer(2,"购买青龙石")
	    SetAnswer(3,"购买玄武石")
	    SetAnswer(4,"购买朱雀石")
	    SetAnswer(5,"离开")
	    WaitAnswer(5)
	    if GetAnswer() == 1 and bProcess then  
	      script:SetSaying(true)
        if player:GetMoney() < 400000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-400000)
        player:GetItems():AddItem(15006, 1)
        ShowHint("\#W获得白虎石#89")
	    elseif GetAnswer() == 2 and bProcess then  
	      script:SetSaying(true)
        if player:GetMoney() < 300000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-300000)
        player:GetItems():AddItem(15008, 1)
        ShowHint("\#W获得青龙石#89")
	    elseif GetAnswer() == 3 and bProcess then  
	      script:SetSaying(true)
        if player:GetMoney() < 200000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-200000)
        player:GetItems():AddItem(15009, 1)
        ShowHint("\#W获得玄武石#89")
	    elseif GetAnswer() == 4 and bProcess then  
	      script:SetSaying(true)
        if player:GetMoney() < 100000 then
          NpcSay("这东西可不好搞,没钱可不行！")
          return
        end
        player:ChangeMoney(-100000)
        player:GetItems():AddItem(15007, 1)
        ShowHint("\#W获得朱雀石#89")
      end--]]
      elseif GetAnswer() == 4 then
	    NpcAsk("#R灵饰魂魄在我这里回收价值为50%，并有一定几率获得安慰小礼物。\r#O注意：本回收选项将会回收包裹内所有灵饰魂魄，所以请提前把不想被回收的灵饰魂魄保存到仓库再来！或者一个一个的回收，避免出问题，因此造成的损失，本店概不负责！")
	    SetAnswer(1,"回收包裹内所有灵饰魂魄")
	    SetAnswer(2,"离开")
	    WaitAnswer(2)
		local LSItemIDSt = 60324
		local LSItemIDEd = 60513
		local NowID = 60324
		local idx = 1
		local Mvalue = 0
		local Gmoeny = 0
		local Tmoney = 0
		local ItemR = 0
		local itemRid = 0
		local Error = 0
		if GetAnswer() == 1 and bProcess then
		   script:SetSaying(true)
		   while NowID >= LSItemIDSt and NowID <= LSItemIDEd do
		      Error = Error + 1 -- 运行计次
		      Mvalue = math.ceil(idx / 15) -- 每15个为一个点 1除15 为1初始，所以不需要 单独 +1
			  ItemR = math.random(1,100)
		      if player:GetItems():GetItemCount(NowID) > 0 then
			     if ItemR < 20 then
			        itemRid = RandTable({15006,15007,15008,15009,80091,80084,80053,20001,30001})
				    ItemName = GetItemName(itemRid)
					script:Rumor(string.format(" %s #P在回收灵饰魂魄时，意外获得了#Y[%s]#O！", player:GetCharNameLink(), ItemName), false)
			     end
			     Gmoeny = Mvalue * 5000000
				 Tmoney = Tmoney + Gmoeny
			     player:ChangeMoney(Gmoeny,305)
                 player:GetItems():RemoveItem(NowID,1)
				 player:GetItems():AddItem(itemRid, 1)
			  else
			     NowID = NowID + 1
				 idx = idx + 1
				 if NowID == 60400 then --修正ID不连贯问题
				    NowID = 60500
			     end
			  end
			  if Error > 1000 then
			     ShowError("错误：回收循环超出限制！")
			     break --强制跳出循环
			  end
		   end
		   NpcSay(string.format("本次总共回收了%d银两",Tmoney))
		end
	end
	elseif GetAnswer() == 3 then
	  NpcAsk("请选择要打造灵饰的等级")
	  SetAnswer(1,"100级灵饰")
	  SetAnswer(2,"110级灵饰")
	  SetAnswer(3,"120级灵饰")
	  SetAnswer(4,"130级灵饰")
	  SetAnswer(5,"140级灵饰")
	  SetAnswer(6,"150级灵饰")
	  SetAnswer(7,"灵饰打造方法")
	  SetAnswer(8,"离开")
	  WaitAnswer(8)
	  if GetAnswer() == 7 then
	    NpcSay("打造灵饰需要的材料有#Y灵饰魂魄#W、#P战魄精铁#W、#O白虎石#W、#O朱雀石#W、#O玄武石#W、#O青龙石#W、#W4种强化石头分别#R30#W个,然后根据#Y灵饰魂魄#W的等级和#P战魄精铁#W的#G等级#W来进行选择需要打造的#O灵饰等级#W。")
	    NpcSay("打造后的灵饰附加的#P血饰效果#W是根据打造时用的#O灵饰魂魄#W附加的百分别有关系,最高可附加#G15%#W的血饰效果。")
    elseif GetAnswer() == 1 then
      NpcAsk("请少侠根据自己拥有的材料进行打造灵饰")
      SetAnswer(1,"一级灵饰")
      SetAnswer(2,"二级灵饰")
      SetAnswer(3,"三级灵饰")
      SetAnswer(4,"四级灵饰")
      SetAnswer(5,"五级灵饰")
      SetAnswer(6,"六级灵饰")
      SetAnswer(7,"七级灵饰")
      SetAnswer(8,"八级灵饰")
      SetAnswer(9,"九级灵饰")
      SetAnswer(10,"十级灵饰")
      SetAnswer(11,"十一级灵饰")
      SetAnswer(12,"十二级灵饰")
      SetAnswer(13,"十三级灵饰")
      SetAnswer(14,"十四级灵饰")
      SetAnswer(15,"十五级灵饰")
      SetAnswer(16,"离开")
      WaitAnswer(16)
      if GetAnswer() == 1 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60324) < 1 then
          NpcSay("请少侠注意是否拥有一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27535,27536,27537,27538,27539})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60324,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 2 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60325) < 1 then
          NpcSay("请少侠注意是否拥有二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27565,27566,27567,27568,27569})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60325,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 3 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60326) < 1 then
          NpcSay("请少侠注意是否拥有三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27595,27596,27597,27598,27599})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60326,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60327) < 1 then
          NpcSay("请少侠注意是否拥有四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27625,27626,27627,27628,27629})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60327,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 5 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60328) < 1 then
          NpcSay("请少侠注意是否拥有五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27655,27656,27657,27658,27659})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60328,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 6 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60329) < 1 then
          NpcSay("请少侠注意是否拥有六段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27685,27686,27687,27688,27689})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60329,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 7 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60330) < 1 then
          NpcSay("请少侠注意是否拥有七段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27715,27716,27717,27718,27719})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60330,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 8 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60331) < 1 then
          NpcSay("请少侠注意是否拥有八段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27745,27746,27747,27748,27749})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60331,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 9 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60332) < 1 then
          NpcSay("请少侠注意是否拥有九段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27775,27776,27777,27778,27779})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60332,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 10 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60333) < 1 then
          NpcSay("请少侠注意是否拥有十段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27805,27806,27807,27808,27809})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60333,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 11 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60334) < 1 then
          NpcSay("请少侠注意是否拥有十一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27835,27836,27837,27838,27839})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60334,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 12 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60335) < 1 then
          NpcSay("请少侠注意是否拥有十二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27865,27866,27867,27868,27869})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60335,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 13 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60336) < 1 then
          NpcSay("请少侠注意是否拥有十三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27895,27896,27897,27898,27899})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60336,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 14 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60337) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27925,27926,27927,27928,27929})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60337,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 15 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60338) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15000) < 1 then
          NpcSay("请少侠注意是否拥有100级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27955,27956,27957,27958,27959})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60338,1)
        player:GetItems():RemoveItem(15000,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      end
    
    
    
    elseif GetAnswer() == 2 then
      NpcAsk("请少侠根据自己拥有的材料进行打造灵饰")
      SetAnswer(1,"一级灵饰")
      SetAnswer(2,"二级灵饰")
      SetAnswer(3,"三级灵饰")
      SetAnswer(4,"四级灵饰")
      SetAnswer(5,"五级灵饰")
      SetAnswer(6,"六级灵饰")
      SetAnswer(7,"七级灵饰")
      SetAnswer(8,"八级灵饰")
      SetAnswer(9,"九级灵饰")
      SetAnswer(10,"十级灵饰")
      SetAnswer(11,"十一级灵饰")
      SetAnswer(12,"十二级灵饰")
      SetAnswer(13,"十三级灵饰")
      SetAnswer(14,"十四级灵饰")
      SetAnswer(15,"十五级灵饰")
      SetAnswer(16,"离开")
      WaitAnswer(16)
      if GetAnswer() == 1 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60339) < 1 then
          NpcSay("请少侠注意是否拥有一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27540,27541,27542,27543,27544})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60339,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 2 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60340) < 1 then
          NpcSay("请少侠注意是否拥有二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27570,27571,27572,27573,27574})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60340,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 3 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60341) < 1 then
          NpcSay("请少侠注意是否拥有三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27600,27601,27602,27603,27604})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60341,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60342) < 1 then
          NpcSay("请少侠注意是否拥有四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27630,27631,27632,27634})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60342,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 5 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60343) < 1 then
          NpcSay("请少侠注意是否拥有五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27660,27661,27662,27663,27664})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60343,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 6 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60344) < 1 then
          NpcSay("请少侠注意是否拥有六段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27690,27691,27692,27693,27694})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60344,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 7 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60345) < 1 then
          NpcSay("请少侠注意是否拥有七段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27720,27721,27722,27723,27724})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60345,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 8 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60346) < 1 then
          NpcSay("请少侠注意是否拥有八段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27750,27751,27752,27753,27754})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60346,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 9 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60347) < 1 then
          NpcSay("请少侠注意是否拥有九段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27780,27781,27782,27783,27784})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60347,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 10 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60348) < 1 then
          NpcSay("请少侠注意是否拥有十段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27810,27811,27812,27813,27814})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60348,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 11 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60349) < 1 then
          NpcSay("请少侠注意是否拥有十一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27840,27841,27842,27843,27844})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60349,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 12 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60350) < 1 then
          NpcSay("请少侠注意是否拥有十二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27870,27871,27872,27873,27874})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60350,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 13 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60351) < 1 then
          NpcSay("请少侠注意是否拥有十三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27900,27901,27902,27903,27904})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60351,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 14 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60352) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27930,27931,27932,27933,27934})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60352,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 15 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60353) < 1 then
          NpcSay("请少侠注意是否拥有十五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15001) < 1 then
          NpcSay("请少侠注意是否拥有110级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27960,27961,27962,27963,27964})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60353,1)
        player:GetItems():RemoveItem(15001,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      end
    elseif GetAnswer() == 3 then
      NpcAsk("请少侠根据自己拥有的材料进行打造灵饰")
      SetAnswer(1,"一级灵饰")
      SetAnswer(2,"二级灵饰")
      SetAnswer(3,"三级灵饰")
      SetAnswer(4,"四级灵饰")
      SetAnswer(5,"五级灵饰")
      SetAnswer(6,"六级灵饰")
      SetAnswer(7,"七级灵饰")
      SetAnswer(8,"八级灵饰")
      SetAnswer(9,"九级灵饰")
      SetAnswer(10,"十级灵饰")
      SetAnswer(11,"十一级灵饰")
      SetAnswer(12,"十二级灵饰")
      SetAnswer(13,"十三级灵饰")
      SetAnswer(14,"十四级灵饰")
      SetAnswer(15,"十五级灵饰")
      SetAnswer(16,"离开")
      WaitAnswer(16)
      if GetAnswer() == 1 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60354) < 1 then
          NpcSay("请少侠注意是否拥有一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27545,27546,27547,27548,27549})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60354,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 2 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60355) < 1 then
          NpcSay("请少侠注意是否拥有二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27575,27576,27577,27578,27579})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60355,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 3 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60356) < 1 then
          NpcSay("请少侠注意是否拥有三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27605,27606,27607,27608,27609})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60356,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60357) < 1 then
          NpcSay("请少侠注意是否拥有四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27635,27636,27637,27638,27639})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60357,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 5 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60358) < 1 then
          NpcSay("请少侠注意是否拥有五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27665,27666,27667,27668,27669})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60358,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 6 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60359) < 1 then
          NpcSay("请少侠注意是否拥有六段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27695,27696,27697,27698,27699})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60359,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 7 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60360) < 1 then
          NpcSay("请少侠注意是否拥有七段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27725,27726,27727,27728,27729})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60360,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 8 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60361) < 1 then
          NpcSay("请少侠注意是否拥有八段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27755,27756,27757,27758,27759})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60361,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 9 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60362) < 1 then
          NpcSay("请少侠注意是否拥有九段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27785,27786,27787,27788,27789})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60362,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 10 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60363) < 1 then
          NpcSay("请少侠注意是否拥有十段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27815,27816,27817,27818,27819})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60363,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 11 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60364) < 1 then
          NpcSay("请少侠注意是否拥有十一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27845,27846,27847,27848,27849})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60364,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 12 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60365) < 1 then
          NpcSay("请少侠注意是否拥有十二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27875,27876,27877,27878,27879})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60365,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 13 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60366) < 1 then
          NpcSay("请少侠注意是否拥有十三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27905,27906,27907,27908,27909})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60366,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 14 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60367) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27935,27936,27937,27938,27939})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60367,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 15 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60368) < 1 then
          NpcSay("请少侠注意是否拥有十五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15002) < 1 then
          NpcSay("请少侠注意是否拥有120级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27965,27966,27967,27968,27969})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60368,1)
        player:GetItems():RemoveItem(15002,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      end
    elseif GetAnswer() == 4 then
      NpcAsk("请少侠根据自己拥有的材料进行打造灵饰")
      SetAnswer(1,"一级灵饰")
      SetAnswer(2,"二级灵饰")
      SetAnswer(3,"三级灵饰")
      SetAnswer(4,"四级灵饰")
      SetAnswer(5,"五级灵饰")
      SetAnswer(6,"六级灵饰")
      SetAnswer(7,"七级灵饰")
      SetAnswer(8,"八级灵饰")
      SetAnswer(9,"九级灵饰")
      SetAnswer(10,"十级灵饰")
      SetAnswer(11,"十一级灵饰")
      SetAnswer(12,"十二级灵饰")
      SetAnswer(13,"十三级灵饰")
      SetAnswer(14,"十四级灵饰")
      SetAnswer(15,"十五级灵饰")
      SetAnswer(16,"离开")
      WaitAnswer(16)
      if GetAnswer() == 1 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60369) < 1 then
          NpcSay("请少侠注意是否拥有一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27550,27551,27552,27553,27554})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60369,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 2 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60370) < 1 then
          NpcSay("请少侠注意是否拥有二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27580,27581,27582,27583,27584})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60370,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 3 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60371) < 1 then
          NpcSay("请少侠注意是否拥有三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27610,27611,27612,27613,27614})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60371,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60372) < 1 then
          NpcSay("请少侠注意是否拥有四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27640,27641,27642,27643,27644})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60372,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 5 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60373) < 1 then
          NpcSay("请少侠注意是否拥有五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27670,27671,27672,27673,27674})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60373,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 6 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60374) < 1 then
          NpcSay("请少侠注意是否拥有六段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27700,27701,27702,27703,27704})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60374,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 7 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60375) < 1 then
          NpcSay("请少侠注意是否拥有七段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27730,27731,27732,27733,27734})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60375,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 8 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60376) < 1 then
          NpcSay("请少侠注意是否拥有八段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27760,27761,27762,27763,27764})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60376,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 9 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60377) < 1 then
          NpcSay("请少侠注意是否拥有九段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27790,27791,27792,27793,27794})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60377,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 10 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60378) < 1 then
          NpcSay("请少侠注意是否拥有十段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27820,27821,27822,27823,27824})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60378,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 11 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60379) < 1 then
          NpcSay("请少侠注意是否拥有十一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27850,27581,27852,27853,27854})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60379,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 12 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60380) < 1 then
          NpcSay("请少侠注意是否拥有十二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27880,27881,27882,27883,27884})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60380,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 13 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60381) < 1 then
          NpcSay("请少侠注意是否拥有十三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27910,27911,27912,27913,27914})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60381,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 14 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60382) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27940,27941,27942,27943,27944})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60382,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 15 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60383) < 1 then
          NpcSay("请少侠注意是否拥有十五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15003) < 1 then
          NpcSay("请少侠注意是否拥有130级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27970,27971,27972,27973,27974})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60383,1)
        player:GetItems():RemoveItem(15003,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      end
    elseif GetAnswer() == 5 then
      NpcAsk("请少侠根据自己拥有的材料进行打造灵饰")
      SetAnswer(1,"一级灵饰")
      SetAnswer(2,"二级灵饰")
      SetAnswer(3,"三级灵饰")
      SetAnswer(4,"四级灵饰")
      SetAnswer(5,"五级灵饰")
      SetAnswer(6,"六级灵饰")
      SetAnswer(7,"七级灵饰")
      SetAnswer(8,"八级灵饰")
      SetAnswer(9,"九级灵饰")
      SetAnswer(10,"十级灵饰")
      SetAnswer(11,"十一级灵饰")
      SetAnswer(12,"十二级灵饰")
      SetAnswer(13,"十三级灵饰")
      SetAnswer(14,"十四级灵饰")
      SetAnswer(15,"十五级灵饰")
      SetAnswer(16,"离开")
      WaitAnswer(16)
      if GetAnswer() == 1 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60384) < 1 then
          NpcSay("请少侠注意是否拥有一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27555,27556,27557,27558,27559})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60384,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 2 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60385) < 1 then
          NpcSay("请少侠注意是否拥有二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27585,27586,27587,27588,27589})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60385,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 3 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60386) < 1 then
          NpcSay("请少侠注意是否拥有三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27615,27616,27617,27618,27619})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60386,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60387) < 1 then
          NpcSay("请少侠注意是否拥有四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27645,27646,27647,27648,27649})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60387,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 5 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60388) < 1 then
          NpcSay("请少侠注意是否拥有五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27675,27676,27677,27678,27679})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60388,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 6 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60389) < 1 then
          NpcSay("请少侠注意是否拥有六段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27705,27706,27707,27708,27709})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60389,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 7 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60390) < 1 then
          NpcSay("请少侠注意是否拥有七段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27735,27736,27737,27738,27739})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60390,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 8 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60391) < 1 then
          NpcSay("请少侠注意是否拥有八段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27765,27766,27767,27768,27769})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60391,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 9 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60392) < 1 then
          NpcSay("请少侠注意是否拥有九段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27795,27796,27797,27798,27799})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60392,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 10 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60393) < 1 then
          NpcSay("请少侠注意是否拥有十段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27825,27826,27827,27828,27829})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60393,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 11 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60394) < 1 then
          NpcSay("请少侠注意是否拥有十一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27855,27856,27857,27858,27859})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60394,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 12 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60395) < 1 then
          NpcSay("请少侠注意是否拥有十二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27885,27886,27887,27888,27889})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60395,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 13 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60396) < 1 then
          NpcSay("请少侠注意是否拥有十三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27915,27916,27917,27918,27919})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60396,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 14 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60397) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27945,27946,27947,27948,27949})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60397,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 15 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60398) < 1 then
          NpcSay("请少侠注意是否拥有十五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15004) < 1 then
          NpcSay("请少侠注意是否拥有140级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27975,27976,27977,27978,27979})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60398,1)
        player:GetItems():RemoveItem(15004,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      end
    elseif GetAnswer() == 6 then
      NpcAsk("请少侠根据自己拥有的材料进行打造灵饰")
      SetAnswer(1,"一级灵饰")
      SetAnswer(2,"二级灵饰")
      SetAnswer(3,"三级灵饰")
      SetAnswer(4,"四级灵饰")
      SetAnswer(5,"五级灵饰")
      SetAnswer(6,"六级灵饰")
      SetAnswer(7,"七级灵饰")
      SetAnswer(8,"八级灵饰")
      SetAnswer(9,"九级灵饰")
      SetAnswer(10,"十级灵饰")
      SetAnswer(11,"十一级灵饰")
      SetAnswer(12,"十二级灵饰")
      SetAnswer(13,"十三级灵饰")
      SetAnswer(14,"十四级灵饰")
      SetAnswer(15,"十五级灵饰")
      SetAnswer(16,"离开")
      WaitAnswer(16)
      if GetAnswer() == 1 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60399) < 1 then
          NpcSay("请少侠注意是否拥有一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27560,27561,27562,27563,27564})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60399,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 2 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60500) < 1 then
          NpcSay("请少侠注意是否拥有二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27590,27591,27592,27593,27594})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60500,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 3 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60501) < 1 then
          NpcSay("请少侠注意是否拥有三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27620,27621,27622,27623,27624})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60501,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60502) < 1 then
          NpcSay("请少侠注意是否拥有四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27650,27651,27652,27653,27654})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60502,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 5 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60503) < 1 then
          NpcSay("请少侠注意是否拥有五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27680,27681,27682,27683,27684})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60503,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 6 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60504) < 1 then
          NpcSay("请少侠注意是否拥有六段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27710,27711,27712,27713,27714})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60504,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 7 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60505) < 1 then
          NpcSay("请少侠注意是否拥有七段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27740,27741,27742,27743,27744})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60505,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 8 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60506) < 1 then
          NpcSay("请少侠注意是否拥有八段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27770,27771,27772,27773,27774})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60506,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 9 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60507) < 1 then
          NpcSay("请少侠注意是否拥有九段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27800,27801,27802,27803,27804})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60507,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 10 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60508) < 1 then
          NpcSay("请少侠注意是否拥有十段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27830,27831,27832,27833,27834})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60508,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 11 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60509) < 1 then
          NpcSay("请少侠注意是否拥有十一段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27860,27861,27862,27863,27864})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60509,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 12 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60510) < 1 then
          NpcSay("请少侠注意是否拥有十二段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27890,27891,27892,27893,27894})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60510,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 13 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60511) < 1 then
          NpcSay("请少侠注意是否拥有十三段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27920,27921,27922,27923,27924})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60511,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 14 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60512) < 1 then
          NpcSay("请少侠注意是否拥有十四段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27950,27951,27952,27953,27954})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60512,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      elseif GetAnswer() == 15 and bProcess then   
        script:SetSaying(true)
        if player:GetMoney() < 500000 then
          NpcSay("打造费用需要50万,少侠银两不足")
          return
        end
        if player:GetItems():GetItemCount(60513) < 1 then
          NpcSay("请少侠注意是否拥有十五段灵饰魂魄")
          return
        end
        if player:GetItems():GetItemCount(15005) < 1 then
          NpcSay("请少侠注意是否拥有150级战魄精铁")
          return
        end
        if player:GetItems():GetItemCount(15006) < 30 then
          NpcSay("请少侠注意是否拥有30个白虎石")
          return
        end
        if player:GetItems():GetItemCount(15007) < 30 then
          NpcSay("请少侠注意是否拥有30个朱雀石")
          return
        end
        if player:GetItems():GetItemCount(15008) < 30 then
          NpcSay("请少侠注意是否拥有30个青龙石")
          return
        end
        if player:GetItems():GetItemCount(15009) < 30 then
          NpcSay("请少侠注意是否拥有30个玄武石")
          return
        end
        local item = RandTable({27980,27981,27982,27983,27984})
        player:GetItems():AddItem(item, 1)
        player:GetItems():RemoveItem(60513,1)
        player:GetItems():RemoveItem(15005,1)
        player:GetItems():RemoveItem(15006,30)
        player:GetItems():RemoveItem(15007,30)
        player:GetItems():RemoveItem(15008,30)
        player:GetItems():RemoveItem(15009,30)
        player:ChangeMoney(-500000)
        NpcSay("打造成功,获得灵饰")
      end
    end
  elseif GetAnswer() == 4 and bProcess then   
        script:SetSaying(true)
		script:OpenInterface("shop", 604)
  end
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00667)
