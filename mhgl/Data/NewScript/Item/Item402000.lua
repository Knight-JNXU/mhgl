--改良版VIP道具卡-QQ：572099097，欢迎探讨。

Item51402 = {}
Item51402.MapUse = function(l_1_0, l_1_1)
  local FreesLot = player:GetItems():GetFreeSlot(0)
  IAsk("#E欢迎使用环装回收卡")
  --SetAnswer(1, "VIP卡特殊功能")
  SetAnswer(1, "一键回收")
  --SetAnswer(4, "粉碎VIP卡")
  SetAnswer(55, "离开")
  WaitAnswer(56)

   if GetAnswer() == 1 then
   local flag = player:GetQuests():GetFlag(402001)  
	  IAsk(string.format("请选择你需要的任意环装！你目前的环装积分为：#R %d", flag))
      SetAnswer(31, "兑换50级（积分3点）")
      SetAnswer(32, "兑换60级（积分5点）")
      SetAnswer(33, "兑换70级（积分8点）") 
      SetAnswer(34, "兑换80级（积分12点）")
	  --SetAnswer(6, "其它回收")
	  --SetAnswer(8, "元宝票合成")
	  --SetAnswer(9, "合成五福")	  
      SetAnswer(50, "离开")
	  WaitAnswer(50)
        if GetAnswer() == 31 then 
	     IAsk({"请选择您需要的50环装类型"})		
      SetAnswer(1, "兑换武器")
      SetAnswer(2, "兑换防具")	  
      SetAnswer(50, "离开")
	  WaitAnswer(50)	
	 if GetAnswer() == 1 then	  
	     IAsk({"请选择您需要的环装（需要3积分）"})
	     SetAnswer(1, "墨杆金钩")
		 SetAnswer(2, "劈水扇")
		 SetAnswer(3, "幽路引魂")
	     SetAnswer(4, "玄冰刺")
	     SetAnswer(5, "黄金钺")	
	     SetAnswer(6, "破甲战锤")
	     SetAnswer(7, "赤炎环")	
	     SetAnswer(8, "云龙绸带")	
	     SetAnswer(9, "黄金剑")		
	     SetAnswer(10, "破天宝刀")	
	     SetAnswer(11, "鱼骨双剑")			 
	     SetAnswer(15, "离开")
	     WaitAnswer(15)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20450, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20459, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20468, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20477, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20486, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20495, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20504, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20513, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20522, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20531, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20540, 1)
        player:GetOwner()
    end	
end	
	 if GetAnswer() == 2 then	  
	     IAsk({"请选择您需要的环装（需要3积分）"})
	     SetAnswer(1, "羊角盔")
		 SetAnswer(2, "媚狐头饰")
		 SetAnswer(3, "钢甲")
	     SetAnswer(4, "金缕羽衣")
	     SetAnswer(5, "魔童大牙")	
	     SetAnswer(6, "绿靴")
	     SetAnswer(7, "高速之星")	
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20549, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20558, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20567, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20576, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20588, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20600, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 3)
      player:GetItems():AddItem(20612, 1)
        player:GetOwner()
    end	
end
end
       if GetAnswer() == 32 then 
	     IAsk({"请选择您需要的环装类型"})		
      SetAnswer(1, "兑换武器")
      SetAnswer(2, "兑换防具")	  
      SetAnswer(50, "离开")
	  WaitAnswer(50)	
	 if GetAnswer() == 1 then	  
	     IAsk({"请选择您需要的60环装（需要5积分）"})
	     SetAnswer(1, "玄铁矛")
		 SetAnswer(2, "神火扇")
		 SetAnswer(3, "满天星")
	     SetAnswer(4, "青刚刺")
	     SetAnswer(5, "乌金鬼头镰")	
	     SetAnswer(6, "震天锤")
	     SetAnswer(7, "蛇形月")	
	     SetAnswer(8, "七彩罗刹")	
	     SetAnswer(9, "游龙剑")		
	     SetAnswer(10, "狼牙刀")	
	     SetAnswer(11, "赤焰双剑")			 
	     SetAnswer(15, "离开")
	     WaitAnswer(15)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20451, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20460, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20469, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20478, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20487, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20496, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20505, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20514, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20523, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20532, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20541, 1)
        player:GetOwner()
    end	
end	
	 if GetAnswer() == 2 then	  
	     IAsk({"请选择您需要的环装（需要5积分）"})
	     SetAnswer(1, "水晶帽")
		 SetAnswer(2, "玉女发冠")
		 SetAnswer(3, "夜魔披风")
	     SetAnswer(4, "霓裳羽衣")
	     SetAnswer(5, "攫魂铃")
	     SetAnswer(6, "双魂引")		 
	     SetAnswer(7, "追星踏月")
	     SetAnswer(8, "风月宝链")
	     SetAnswer(9, "八卦坠")		 
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20550, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20559, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20568, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20577, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20589, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20590, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20601, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20613, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 5)
      player:GetItems():AddItem(20614, 1)
        player:GetOwner()
    end		
end
end	
      if GetAnswer() == 33 then 
	     IAsk({"请选择您需要的70环装类型"})		
      SetAnswer(1, "兑换武器")
      SetAnswer(2, "兑换防具")	  
      SetAnswer(50, "离开")
	  WaitAnswer(50)	
	 if GetAnswer() == 1 then	  
	     IAsk({"请选择您需要的环装（需要8积分）"})
	     SetAnswer(1, "金蛇信")
		 SetAnswer(2, "阴风扇")
		 SetAnswer(3, "水晶棒")
	     SetAnswer(4, "华光刺")
	     SetAnswer(5, "乌金鬼头镰")	
	     SetAnswer(6, "巨灵神锤")
	     SetAnswer(7, "子母双月")	
	     SetAnswer(8, "缚神绫")	
	     SetAnswer(9, "北斗七星剑")		
	     SetAnswer(10, "龙鳞宝刀")	
	     SetAnswer(11, "墨玉双剑")			 
	     SetAnswer(15, "离开")
	     WaitAnswer(15)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20452, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20461, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20470, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20479, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20488, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20497, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20506, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20515, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20524, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20533, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20542, 1)
        player:GetOwner()
    end	
end	
	 if GetAnswer() == 2 then	  
	     IAsk({"请选择您需要的环装（需要5积分）"})
	     SetAnswer(1, "乾坤帽")
		 SetAnswer(2, "魔女发冠")
		 SetAnswer(3, "龙骨甲")
	     SetAnswer(4, "流云素裙")
	     SetAnswer(5, "兽王腰带")
	     SetAnswer(6, "百窜云")		 
	     SetAnswer(7, "九州履")
	     SetAnswer(8, "碧水青龙")
	     SetAnswer(9, "鬼牙攫魂")		 
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20551, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20560, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20569, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20578, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20591, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20592, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20602, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20615, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 8)
      player:GetItems():AddItem(20616, 1)
        player:GetOwner()
    end		
end
end
      if GetAnswer() == 34 then 
	     IAsk({"请选择您需要的80环装类型"})		
      SetAnswer(1, "兑换武器")
      SetAnswer(2, "兑换防具")	  
      SetAnswer(50, "离开")
	  WaitAnswer(50)	
	 if GetAnswer() == 1 then	  
	     IAsk({"请选择您需要的环装（需要8积分）"})
	     SetAnswer(1, "丈八点钢矛")
		 SetAnswer(2, "风云雷电")
		 SetAnswer(3, "日月光华")
	     SetAnswer(4, "龙鳞刺")
	     SetAnswer(5, "乌金鬼头镰")	
	     SetAnswer(6, "天崩地裂")
	     SetAnswer(7, "斜月狼牙")	
	     SetAnswer(8, "九天仙绫")	
	     SetAnswer(9, "碧玉剑")		
	     SetAnswer(10, "黑炎魔刀")	
	     SetAnswer(11, "梅花双剑")			 
	     SetAnswer(15, "离开")
	     WaitAnswer(15)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20453, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20462, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20471, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20480, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20489, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20498, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20507, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20516, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20525, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20534, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20543, 1)
        player:GetOwner()
    end	
end	
	 if GetAnswer() == 2 then	  
	     IAsk({"请选择您需要的环装（需要5积分）"})
	     SetAnswer(1, "黑魔冠")
		 SetAnswer(2, "七彩花环")
		 SetAnswer(3, "死亡斗篷")
	     SetAnswer(4, "七宝天衣")
	     SetAnswer(5, "八卦锻带")
	     SetAnswer(6, "圣王坠")		 
	     SetAnswer(7, "万里追云履")
	     SetAnswer(8, "万里卷云")
	     SetAnswer(9, "疾风之铃")		 
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
		 if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20552, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20561, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20570, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20579, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20593, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20594, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20603, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20617, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402001)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402001, flag - 12)
      player:GetItems():AddItem(20618, 1)
        player:GetOwner()
    end		
end
end
   if GetAnswer() == 7 then 
	        IAsk("欢迎来到菜市场，把你不需要的材料换成银两吧！#V(最少99才换,可换20W银两!)")
			SetAnswer(1, "紫铁回收500W")			
			SetAnswer(2, "时装碎片1")
			SetAnswer(3, "时装碎片2")		
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
	if GetAnswer() == 1 then
    if player:GetItems():GetItemCount(41403)< 99 then
       NpcSayParty(string.format("你的紫铁不够99", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(41403,99)
	   player:ChangeMoney(5000000)
	end	
	end		
		if GetAnswer() == 2 then
    if player:GetItems():GetItemCount(401651)< 99 then
       NpcSayParty(string.format("你的数量不够99", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(401651,99)
	   player:ChangeMoney(500000)
	end	
	end	
			if GetAnswer() == 3 then
    if player:GetItems():GetItemCount(401652)< 99 then
       NpcSayParty(string.format("你的数量不够99", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(401652,99)
	   player:ChangeMoney(500000)
	end	
	end

		elseif GetAnswer() == 8 then 
	        IAsk("是不是觉得元宝票加得蛋疼，现在给你个机会给你换成大额元宝票#G(目前给你免费合成哟)")
	        SetAnswer(1, "100面额兑换成1000面额")
	        SetAnswer(2, "100面额兑换成2000面额")
	        SetAnswer(3, "100面额兑换成5000面额")
	        SetAnswer(4, "200面额兑换成1000面额")
	        SetAnswer(5, "200面额兑换成2000面额")
			SetAnswer(6, "200面额兑换成5000面额")
	        SetAnswer(7, "500面额兑换成2000面额")
			SetAnswer(8, "500面额兑换成5000面额")
	        SetAnswer(9, "5000面额兑换成300000面额")	
	        SetAnswer(10, "100面额兑换成500面额")	
	        SetAnswer(11, "200面额兑换成100面额")				
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
	if GetAnswer() == 1 then
    if player:GetItems():GetItemCount(63042)< 10 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63042,10)
	   player:GetItems():AddItem(63047, 1)
	end	
	end
	if GetAnswer() == 2 then
    if player:GetItems():GetItemCount(63042)< 20 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63042,20)
	   player:GetItems():AddItem(63048, 1)
	end	
	end	
	if GetAnswer() == 3 then
    if player:GetItems():GetItemCount(63042)< 50 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63042,50)
	   player:GetItems():AddItem(63049, 1)
	end	
	end	
	if GetAnswer() == 4 then
    if player:GetItems():GetItemCount(63043)< 5 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63043,5)
	   player:GetItems():AddItem(63047, 1)
	end	
	end
	if GetAnswer() == 5 then
    if player:GetItems():GetItemCount(63043)< 10 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63043,10)
	   player:GetItems():AddItem(63048, 1)
	end	
	end	
	if GetAnswer() == 6 then
    if player:GetItems():GetItemCount(63043)< 25 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63043,25)
	   player:GetItems():AddItem(63049, 1)
	end	
	end		
	if GetAnswer() == 7 then
    if player:GetItems():GetItemCount(61021)< 4 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(61021,4)
	   player:GetItems():AddItem(63048, 1)
	end	
	end
	if GetAnswer() == 8 then
    if player:GetItems():GetItemCount(61021)< 10 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(61021,10)
	   player:GetItems():AddItem(63049, 1)
	end	
	end	
	if GetAnswer() == 9 then
    if player:GetItems():GetItemCount(63049)< 62 then
       NpcSayParty(string.format("你的数量不够62", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63049,62)
	   player:GetItems():AddItem(401676, 1)
	end		
	end
	if GetAnswer() == 10 then
    if player:GetItems():GetItemCount(63042)< 5 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63042,5)
	   player:GetItems():AddItem(61021, 1)
	end	
	end
	if GetAnswer() == 11 then
    if player:GetItems():GetItemCount(63043)< 1 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(63043,1)
	   player:GetItems():AddItem(63042, 2)
	end	
	end	
		elseif GetAnswer() == 9 then 
	        IAsk("合成五福)")
	        SetAnswer(1, "合成五福临门")	
	        SetAnswer(2, "合成敬业福")			
	        SetAnswer(20, "离开")
	        WaitAnswer(20)
	if GetAnswer() == 1 then
    if player:GetItems():GetItemCount(402840)< 1 then
       NpcSayParty(string.format("你的爱国福数量不够", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402841)< 1 then
       NpcSayParty(string.format("你的富强福数量不够", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402842)< 1 then
       NpcSayParty(string.format("你的和谐福数量不够", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402843)< 1 then
       NpcSayParty(string.format("你的友善福数量不够", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402844)< 1 then
       NpcSayParty(string.format("你的敬业福数量不够", player:GetName()))
       return false
    end		
	 if l_1_1 then
       player:GetItems():RemoveItem(402840,1)
	          player:GetItems():RemoveItem(402841,1)
			         player:GetItems():RemoveItem(402842,1)
					        player:GetItems():RemoveItem(402843,1)
							       player:GetItems():RemoveItem(402844,1)
	   player:GetItems():AddItem(402845, 1)
script:Rumor(string.format(" %s #E合成了#Y五福到#E，兴奋的把内裤都脱掉，真是不要脸#53#53#53", player:GetCharNameLink()), false)
	   end	
	end
	if GetAnswer() == 2 then
    if player:GetItems():GetItemCount(402840)< 20 then
       NpcSayParty(string.format("你的爱国福数量不够20", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402841)< 20 then
       NpcSayParty(string.format("你的富强福数量不够20", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402842)< 20 then
       NpcSayParty(string.format("你的和谐福数量不够20", player:GetName()))
       return false
    end	
    if player:GetItems():GetItemCount(402843)< 20 then
       NpcSayParty(string.format("你的友善福数量不够20", player:GetName()))
       return false
    end			
	 if l_1_1 then
       player:GetItems():RemoveItem(402840,20)
	          player:GetItems():RemoveItem(402841,20)
			         player:GetItems():RemoveItem(402842,20)
							       player:GetItems():RemoveItem(402843,20)
	   player:GetItems():AddItem(402844, 1)
script:Rumor(string.format(" %s #E合成了#Y敬业福#E，兴奋的把内裤都脱掉，真是不要脸#53#53#53", player:GetCharNameLink()), false)
	   end	
	end	
	elseif GetAnswer() == 11114 then
	  IAsk("#O请注意，粉碎#PVIP#O卡可获得10枚#Y四魂之玉#O，#Y四魂之玉#O可参加高级活动。")
      SetAnswer(1, "我确定要粉碎")
      SetAnswer(2, "离开")
	  WaitAnswer(2)
	  if GetAnswer() == 1 then
		if FreesLot < 3  then
		  ShowHint("背包剩余不足，请整理。。。")
          return 
        end
		player:GetItems():RemoveItem(51402, 1)
        player:GetItems():AddItem(401845, 0)
		ShowHint("粉碎成功...获得#P四魂之玉#Wx10")
		--script:Rumor(string.format("#O霸气四射#O %s #O哼哼道：有钱就是这么任性,然后直接粉碎VIP卡获得#P四魂之玉x10#O直接兑换神兽去了#O。#53", player:GetCharNameLink()), false)
	  end	
    end
end
end

AddItemTable(Item51402)