--改良版VIP道具卡-QQ：572099097，欢迎探讨。

Item51402 = {}
Item51402.MapUse = function(l_1_0, l_1_1)
  local FreesLot = player:GetItems():GetFreeSlot(0)
  IAsk("#O欢迎使用#Y[VIP卡#Y]#W，#O本卡片包含各种福利，以及VIP专属功能，请选择：")
  SetAnswer(1, "VIP卡特殊功能")
  SetAnswer(2, "专属便捷功能")
  --SetAnswer(22, "粉碎VIP卡")
  SetAnswer(23, "离开")
  WaitAnswer(23)
    if GetAnswer() == 1 then
	  IAsk("欢迎使用至尊#Y[VIP卡]#W，请选择是否领取每日福利：\r#O每日福利\请注意整理包裹空间。")
      SetAnswer(1, "领取每日福利")
      SetAnswer(2, "领取世界双一小时")
      --SetAnswer(3, "领取VIP泡点")
	  --SetAnswer(4, "领取普通泡点")
	  SetAnswer(5, "领取VIP特效")
	  SetAnswer(6, "取消VIP特效")
	  SetAnswer(7, "移除所有修")
	  SetAnswer(8, "一键满修先点这个")
      SetAnswer(9, "一键满修")
      --SetAnswer(10, "转跳9层")	  
      SetAnswer(17, "离开")
	  WaitAnswer(20)
       if GetAnswer() == 1 then 
	    if IsProcess() then
         script:SetSaying(true)
         local TotalRound323 = 0
         local type323 = player:GetQuests():GetType(323)
          if type323 ~= nil then
             TotalRound323 = type323:GetTotalRound()
          end
          if TotalRound323 > 0 then
              ShowHint("对不起，您今天已经领取过了，请明日再来吧。")
             return 
           end
			if FreesLot < 3  then
			   ShowHint("背包剩余不足，请整理。。。")
              return 
             end
               if type323 == nil then
                 player:GetQuests():SetRoundInfo(323, 1, 1, 1)
            end
            player:GetItems():AddItem(402850, 2)--元宝票
			player:GetItems():AddItem(600013, 2)--高级秘籍宝盒x5			
        --    player:GetPartners():AddPartner(RandTable({374,375,376,397,390,391,63,68,76,394,393,79,83,396,395,392,301,16,308,389,309,310,311,312,388,313,314,315,316,317,318,319,252,254,5001,5002,5003,5004,5005,5006,5013,5016,5017,5011,5009,5007,5012,5015,5018,5010,5008,5014,256,255,600,601}), 1)
            player:GetQuests():GetType(323):ChangeTotalRound(1)--上面这行是随机同伴奖励
			ShowHint("恭喜领取#P每日福利")
            script:Rumor(string.format("%s #O领取了本日#P[VIP]#O专属福利，兴奋的围着长安跑了300大圈，真是一点都不低调。#46", player:GetCharNameLink()), false)
        end
       elseif GetAnswer() == 2 then 
         if IsProcess() then
            script:SetSaying(true)
          local TotalRound324 = 0
          local type324 = player:GetQuests():GetType(324)
           if type324 ~= nil then
               TotalRound324 = type324:GetTotalRound()
           end
            if TotalRound324 > 0 then
                ShowHint("对不起，您今日已经领取过了")
              return 
            end
            if type324 == nil then
               player:GetQuests():SetRoundInfo(324, 1, 1, 1)
            end
            player:AddBuff(254, 0, 0, 0, 60, 100)			
            player:GetQuests():GetType(324):ChangeTotalRound(1)
			ShowHint("领取成功，获得世界双一小时")
		  end
        elseif GetAnswer() == 3 then 
		    player:AddBuff(40006, 0, 2, 0, 3000, 100)		
			ShowHint("领取成功....")
		elseif GetAnswer() == 4 then 
		    player:AddBuff(40011, 0, 2, 0, 259200, 100)
			ShowHint("领取成功....")
		elseif GetAnswer() == 5 then 
		    player:AddBuff(8042, 0, 2, 0, 1440, 100)
			player:RemoveBuff(8023)
			player:RemoveBuff(8024)
		    player:RemoveBuff(8025)
            player:RemoveBuff(8026)
			player:RemoveBuff(8027)
			player:RemoveBuff(8028)
			player:RemoveBuff(8029)
			player:RemoveBuff(8030)
			player:RemoveBuff(8031)
			player:RemoveBuff(8032)
			player:RemoveBuff(8033)
			player:RemoveBuff(8034)
			player:RemoveBuff(8035)
			player:RemoveBuff(8036)
			player:RemoveBuff(8037)
			player:RemoveBuff(8038)
			player:RemoveBuff(8039)
			player:RemoveBuff(8040)
			player:RemoveBuff(8041)
	   player:AddBuff(40005, 0, 0, 0, 1440, 0)
						ShowHint("领取成功....")
        elseif GetAnswer() == 6 then 
		    player:RemoveBuff(302)
		    player:RemoveBuff(301)
			player:RemoveBuff(304)
		    player:RemoveBuff(305)
            player:RemoveBuff(8026)
			player:RemoveBuff(8027)
			player:RemoveBuff(8028)
			player:RemoveBuff(8029)
			player:RemoveBuff(8030)
			player:RemoveBuff(8031)
			player:RemoveBuff(8032)
			player:RemoveBuff(22007)
			player:RemoveBuff(8033)
			player:RemoveBuff(8034)
			player:RemoveBuff(8035)
			player:RemoveBuff(8036)
			player:RemoveBuff(8037)
			player:RemoveBuff(8038)
			player:RemoveBuff(8039)
			player:RemoveBuff(8040)
			player:RemoveBuff(8041)
			player:RemoveBuff(8042)
			player:RemoveBuff(8044)			
			player:RemoveBuff(257)
			player:RemoveBuff(277)			
			player:RemoveBuff(275)
			player:RemoveBuff(111)
			player:RemoveBuff(112)
			player:RemoveBuff(113)
			player:RemoveBuff(114)
			player:RemoveBuff(40006)
				   player:RemoveBuff(40007)			
			ShowHint("取消成功....")
		elseif GetAnswer() == 7 then 
	   if  player:HasSkill(376) then
          player:RemoveSkill(376)
		end
		if  player:HasSkill(377) then
          player:RemoveSkill(377)
		end
		if  player:HasSkill(378) then
          player:RemoveSkill(378)
		end
		if  player:HasSkill(379) then
          player:RemoveSkill(379)
		end
		if  player:HasSkill(382) then
          player:RemoveSkill(382)
		end
		if  player:HasSkill(383) then
          player:RemoveSkill(383)
		end
		if  player:HasSkill(384) then
          player:RemoveSkill(384)
		end
		if  player:HasSkill(385) then
          player:RemoveSkill(385)
	   end
	   ISay("#o已经安全移除#y所有修为，#O少侠再会")
		 elseif GetAnswer() == 8 then  
          player:AddSkill(376)
		  player:AddSkill(377)
		  player:AddSkill(378)
		  player:AddSkill(379)
		  player:AddSkill(382)
		  player:AddSkill(383)
		  player:AddSkill(384)
		  player:AddSkill(385)
          ISay("学习修为成功，请继续点击提升修为等级！")
		elseif GetAnswer() == 9 then
		if player:GetSkillLv(376) == 1 and player:GetSkillLv(377) == 1 and player:GetSkillLv(378) == 1 and player:GetSkillLv(379) == 1 then
	   player:ChangeSkillLv(376,24)
	   player:ChangeSkillLv(377,24)
	   player:ChangeSkillLv(378,24)
	   player:ChangeSkillLv(379,24)
	   player:ChangeSkillLv(382,24)
	   player:ChangeSkillLv(383,24)
	   player:ChangeSkillLv(384,24)
	   player:ChangeSkillLv(385,24)
       NpcSay("恭喜！你现在已经是8项修为25级的高手了！")
	 end
	  elseif GetAnswer() == 10 then  
          player:JumpMap(56630,50,100)
          ISay("学习技能成功看技能表查看=。=战斗感受一下！")
	 end
	elseif GetAnswer() == 2 then
	  IAsk("欢迎使用绿色版#Y[#PVIP卡#Y]#W，使用本功能可快速便捷享受到各类功能。")
    --SetAnswer(1, "购买师门道具")
      SetAnswer(2, "快捷修理装备")
      SetAnswer(3, "快捷解绑装备") 
      SetAnswer(4, "快捷打造装备")
      SetAnswer(5, "宝石镶嵌合成")
      --SetAnswer(6, "supermarket")
      --SetAnswer(17, "装备回收")
	  --SetAnswer(18, "环装任意兑换")
	  --SetAnswer(29, "元宝票合成")
	  --SetAnswer(20, "金装回收")
	  --SetAnswer(21, "少年绝学书回收")
	 -- SetAnswer(22, "兑换高级成长丹")	  
      SetAnswer(99, "离开")
	  WaitAnswer(99)
	   if GetAnswer() == 1 then
	    if IsProcess() then
           script:OpenInterface("shop", 1009)
		end
       elseif GetAnswer() == 2 then 
	     if IsProcess() then
           script:OpenInterface("mixshop", 1)--修理装备
		end
       elseif GetAnswer() == 3 then 
	     if IsProcess() then
           script:OpenInterface("mixshop", 21)--解绑装备
		end
	     elseif GetAnswer() == 4 then 
	        IAsk("请选择打造类型")
	        SetAnswer(1, "防具类型装备")
	        SetAnswer(2, "饰品类型装备")
	        SetAnswer(3, "武器类型装备")
			SetAnswer(4, "时装打造")
	        SetAnswer(5, "离开")
	        WaitAnswer(5)
			if GetAnswer() == 1 then
                if IsProcess() then
                  script:OpenInterface("mixshop", 10)--防具打造
                end
			elseif GetAnswer() == 2 then
                if IsProcess() then
                  script:OpenInterface("mixshop", 13)--饰品打造
                end
			elseif GetAnswer() == 3 then
                if IsProcess() then
                  script:OpenInterface("mixshop", 7)--武器打造
                end
			elseif GetAnswer() == 4 then
                if IsProcess() then
                  script:OpenInterface("mixshop", 48)--武器打造
                end				
            end 
	     elseif GetAnswer() == 5 then 
	     IAsk({"#Y[宝石综合功能]#W请选择您需要的项目："})
	     --SetAnswer(1, "宝石合成")
	     SetAnswer(2, "宝石镶嵌")
	     SetAnswer(3, "宝石摘除")
	     --SetAnswer(4, "宝石抛光")
	     SetAnswer(5, "离开")
	     WaitAnswer(5)
	      if GetAnswer() == 1 then
            if IsProcess() then
               script:OpenInterface("mixshop", 22)--宝石合成
            end
	      elseif GetAnswer() == 2 then
            if IsProcess() then
               script:OpenInterface("mixshop", 5)--宝石镶嵌
            end
          elseif GetAnswer() == 3 then
            if IsProcess() then
               script:OpenInterface("mixshop", 6)--宝石摘除
            end
          elseif GetAnswer() == 4 then
            if IsProcess() then
               script:OpenInterface("mixshop", 24)--宝石抛光
            end
		  end
	    elseif GetAnswer() == 6 then 
	        IAsk("欢迎来到由师太经营的#Y“supermarket”#W，本店的服务宗旨是#Y“您的满意，我的追求")
	        SetAnswer(1, "超级药店")
	        SetAnswer(2, "时装材料店")
	        SetAnswer(3, "同伴秘籍店")
	        SetAnswer(4, "装备模具店")
	        SetAnswer(5, "元宝店")
	        SetAnswer(7, "离开")
	        WaitAnswer(7)
	if GetAnswer() == 1 then
		script:OpenInterface("shop", 1009) 
	elseif GetAnswer() == 2 then
		script:OpenInterface("shop", 1010)
	elseif GetAnswer() == 3 then
		script:OpenInterface("shop", 1011)
	elseif GetAnswer() == 4 then
		script:OpenInterface("shop", 1012)
	elseif GetAnswer() == 5 then
		script:OpenInterface("shop", 1013)
	elseif GetAnswer() == 6 then
		script:OpenInterface("shop", 1005)	
	end	
end

   if GetAnswer() == 17 then
	  IAsk("多功能选择。")
      SetAnswer(1, "50级回收")
      SetAnswer(2, "60级回收")
      SetAnswer(3, "70级回收") 
      --SetAnswer(4, "超级秘籍合成")
      --SetAnswer(5, "各种铁合成")
      SetAnswer(4, "80级回收")
	  --SetAnswer(7, "花乐器回收")
	  SetAnswer(8, "元宝票合成")
	  --SetAnswer(9, "合成五福")	  
      SetAnswer(10, "离开")
	  WaitAnswer(10)
        if GetAnswer() == 1 then 
			local a = player:GetItems():GetUnlockItemCount(20450)
			local b = player:GetItems():GetUnlockItemCount(20459)
			local c = player:GetItems():GetUnlockItemCount(20468)
			local d = player:GetItems():GetUnlockItemCount(20477)
			local e = player:GetItems():GetUnlockItemCount(20486)
			local f = player:GetItems():GetUnlockItemCount(20495)
			local g = player:GetItems():GetUnlockItemCount(20504)
			local h = player:GetItems():GetUnlockItemCount(20513)
			local i = player:GetItems():GetUnlockItemCount(20522)
			local j = player:GetItems():GetUnlockItemCount(20531)
			local k = player:GetItems():GetUnlockItemCount(20540)
			local l = player:GetItems():GetUnlockItemCount(20549)
			local m = player:GetItems():GetUnlockItemCount(20558)
			local n = player:GetItems():GetUnlockItemCount(20567)
			local o = player:GetItems():GetUnlockItemCount(20576)
			local p = player:GetItems():GetUnlockItemCount(20588)
			local q = player:GetItems():GetUnlockItemCount(20600)
			local r = player:GetItems():GetUnlockItemCount(20612)	
			local s = player:GetItems():GetUnlockItemCount(20611)			
			jt = math.floor(1 * (a + b + c + e + f + g + h + i + j + k + l + m + n + o + p + q + r + d + s))
			if a > 0 or b > 0 or c > 0 or d > 0 or e > 0 or f > 0 or g > 0 or h > 0 or i > 0 or j > 0 or k > 0 or l > 0 or m > 0 or n > 0  or o > 0 or p > 0 or q > 0 or r > 0  or s > 0 then 
				player:GetItems():RemoveItem(20450,a)
				player:GetItems():RemoveItem(20459,b)
				player:GetItems():RemoveItem(20468,c)
				player:GetItems():RemoveItem(20477,d)
				player:GetItems():RemoveItem(20486,e)
				player:GetItems():RemoveItem(20495,f)
				player:GetItems():RemoveItem(20504,g)
				player:GetItems():RemoveItem(20513,h)
				player:GetItems():RemoveItem(20522,i)
				player:GetItems():RemoveItem(20531,j)
				player:GetItems():RemoveItem(20540,k)
				player:GetItems():RemoveItem(20549,l)
				player:GetItems():RemoveItem(20558,m)
				player:GetItems():RemoveItem(20567,n)
				player:GetItems():RemoveItem(20576,o)  
				player:GetItems():RemoveItem(20588,p)
				player:GetItems():RemoveItem(20600,q)
				player:GetItems():RemoveItem(20612,r)
				player:GetItems():RemoveItem(20611,s)				
				player:GetItems():AddItem(402002, jt)
				ShowHint(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				player:GetScript():ShowError(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				--script:Rumor(string.format("#Y[VIP]#V: %s #O回收装备成功,获得环装积分卷x#A%s#53", player:GetCharNameLink(),jt), false)
			else
				ShowHint("你的包裹里并没有可回收的装备")
end
       elseif GetAnswer() == 2 then 
				local a = player:GetItems():GetUnlockItemCount(20451)
			local b = player:GetItems():GetUnlockItemCount(20460)
			local c = player:GetItems():GetUnlockItemCount(20469)
			local d = player:GetItems():GetUnlockItemCount(20478)
			local e = player:GetItems():GetUnlockItemCount(20487)
			local f = player:GetItems():GetUnlockItemCount(20496)
			local g = player:GetItems():GetUnlockItemCount(20505)
			local h = player:GetItems():GetUnlockItemCount(20514)
			local i = player:GetItems():GetUnlockItemCount(20523)
			local j = player:GetItems():GetUnlockItemCount(20532)
			local k = player:GetItems():GetUnlockItemCount(20541)
			local l = player:GetItems():GetUnlockItemCount(20550)
			local m = player:GetItems():GetUnlockItemCount(20559)
			local n = player:GetItems():GetUnlockItemCount(20568)
			local o = player:GetItems():GetUnlockItemCount(20577)
			local p = player:GetItems():GetUnlockItemCount(20589)
			local q = player:GetItems():GetUnlockItemCount(20601)
			local r = player:GetItems():GetUnlockItemCount(20613)
			local s = player:GetItems():GetUnlockItemCount(20614)			
			
			jt = math.floor(2 * (a + b + c + e + f + g + h + i + j + k + l + m + n + o + p + q + r + d + s))
			if a > 0 or b > 0 or c > 0 or d > 0 or e > 0 or f > 0 or g > 0 or h > 0 or i > 0 or j > 0 or k > 0 or l > 0 or m > 0 or n > 0  or o > 0 or p > 0 or q > 0 or r > 0 or s > 0 then 
				player:GetItems():RemoveItem(20451,a)
				player:GetItems():RemoveItem(20460,b)
				player:GetItems():RemoveItem(20469,c)
				player:GetItems():RemoveItem(20478,d)
				player:GetItems():RemoveItem(20487,e)
				player:GetItems():RemoveItem(20496,f)
				player:GetItems():RemoveItem(20505,g)
				player:GetItems():RemoveItem(20514,h)
				player:GetItems():RemoveItem(20523,i)
				player:GetItems():RemoveItem(20532,j)
				player:GetItems():RemoveItem(20541,k)
				player:GetItems():RemoveItem(20550,l)
				player:GetItems():RemoveItem(20559,m)
				player:GetItems():RemoveItem(20568,n)
				player:GetItems():RemoveItem(20577,o)  
				player:GetItems():RemoveItem(20589,p)
				player:GetItems():RemoveItem(20601,q)
				player:GetItems():RemoveItem(20613,r)	
				player:GetItems():RemoveItem(20614,s)					
				player:GetItems():AddItem(402002, jt)
				ShowHint(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				player:GetScript():ShowError(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				--script:Rumor(string.format("#Y[VIP]#V: %s #O回收装备成功,获得环装积分卷x#A%s#53", player:GetCharNameLink(),jt), false)
			else
				ShowHint("你的包裹里并没有可回收的装备")
			end
		 elseif GetAnswer() == 2 then
			if player:GetLevel() < 0 then
				ShowHint("#W小朋友.#G0#W级以上才可以使用这个功能。")
				return 
end
       elseif GetAnswer() == 3 then 
				local a = player:GetItems():GetUnlockItemCount(20452)
			local b = player:GetItems():GetUnlockItemCount(20461)
			local c = player:GetItems():GetUnlockItemCount(20470)
			local d = player:GetItems():GetUnlockItemCount(20479)
			local e = player:GetItems():GetUnlockItemCount(20488)
			local f = player:GetItems():GetUnlockItemCount(20497)
			local g = player:GetItems():GetUnlockItemCount(20506)
			local h = player:GetItems():GetUnlockItemCount(20515)
			local i = player:GetItems():GetUnlockItemCount(20524)
			local j = player:GetItems():GetUnlockItemCount(20533)
			local k = player:GetItems():GetUnlockItemCount(20542)
			local l = player:GetItems():GetUnlockItemCount(20551)
			local m = player:GetItems():GetUnlockItemCount(20560)
			local n = player:GetItems():GetUnlockItemCount(20569)
			local o = player:GetItems():GetUnlockItemCount(20578)
			local p = player:GetItems():GetUnlockItemCount(20570)
			local q = player:GetItems():GetUnlockItemCount(20602)
			local r = player:GetItems():GetUnlockItemCount(20615)	
			local s = player:GetItems():GetUnlockItemCount(20616)				
			jt = math.floor(3 * (a + b + c + e + f + g + h + i + j + k + l + m + n + o + p + q + r + d + s))
			if a > 0 or b > 0 or c > 0 or d > 0 or e > 0 or f > 0 or g > 0 or h > 0 or i > 0 or j > 0 or k > 0 or l > 0 or m > 0 or n > 0  or o > 0 or p > 0 or q > 0 or r > 0  or s > 0 then 
				player:GetItems():RemoveItem(20452,a)
				player:GetItems():RemoveItem(20461,b)
				player:GetItems():RemoveItem(20470,c)
				player:GetItems():RemoveItem(20479,d)
				player:GetItems():RemoveItem(20488,e)
				player:GetItems():RemoveItem(20497,f)
				player:GetItems():RemoveItem(20506,g)
				player:GetItems():RemoveItem(20515,h)
				player:GetItems():RemoveItem(20524,i)
				player:GetItems():RemoveItem(20533,j)
				player:GetItems():RemoveItem(20542,k)
				player:GetItems():RemoveItem(20551,l)
				player:GetItems():RemoveItem(20560,m)
				player:GetItems():RemoveItem(20569,n)
				player:GetItems():RemoveItem(20578,o)  
				player:GetItems():RemoveItem(20570,p)
				player:GetItems():RemoveItem(20602,q)
				player:GetItems():RemoveItem(20615,r)
				player:GetItems():RemoveItem(20616,s)
				
				player:GetItems():AddItem(402002, jt)
				ShowHint(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				player:GetScript():ShowError(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				--script:Rumor(string.format("#Y[VIP]#V: %s #O回收装备成功,获得环装积分卷x#A%s#53", player:GetCharNameLink(),jt), false)
			else
				ShowHint("你的包裹里并没有可回收的装备")
			end
		 elseif GetAnswer() == 2 then
			if player:GetLevel() < 0 then
				ShowHint("#W小朋友.#G0#W级以上才可以使用这个功能。")
				return 
end
      elseif GetAnswer() == 4 then 
				local a = player:GetItems():GetUnlockItemCount(20453)
			local b = player:GetItems():GetUnlockItemCount(20462)
			local c = player:GetItems():GetUnlockItemCount(20471)
			local d = player:GetItems():GetUnlockItemCount(20480)
			local e = player:GetItems():GetUnlockItemCount(20489)
			local f = player:GetItems():GetUnlockItemCount(20498)
			local g = player:GetItems():GetUnlockItemCount(20507)
			local h = player:GetItems():GetUnlockItemCount(20516)
			local i = player:GetItems():GetUnlockItemCount(20525)
			local j = player:GetItems():GetUnlockItemCount(20534)
			local k = player:GetItems():GetUnlockItemCount(20543)
			local l = player:GetItems():GetUnlockItemCount(20552)
			local m = player:GetItems():GetUnlockItemCount(20561)
			local n = player:GetItems():GetUnlockItemCount(20570)
			local o = player:GetItems():GetUnlockItemCount(20579)
			local p = player:GetItems():GetUnlockItemCount(20571)
			local q = player:GetItems():GetUnlockItemCount(20603)
			local r = player:GetItems():GetUnlockItemCount(20617)	
			local s = player:GetItems():GetUnlockItemCount(20618)
			local t = player:GetItems():GetUnlockItemCount(20593)	
			local u = player:GetItems():GetUnlockItemCount(20594)			
			jt = math.floor(4 * (a + b + c + e + f + g + h + i + j + k + l + m + n + o + p + q + r + d + s + t + u))
			if a > 0 or b > 0 or c > 0 or d > 0 or e > 0 or f > 0 or g > 0 or h > 0 or i > 0 or j > 0 or k > 0 or l > 0 or m > 0 or n > 0  or o > 0 or p > 0 or q > 0 or r > 0 or s > 0 or t > 0 or u > 0 then 
				player:GetItems():RemoveItem(20453,a)
				player:GetItems():RemoveItem(20462,b)
				player:GetItems():RemoveItem(20471,c)
				player:GetItems():RemoveItem(20480,d)
				player:GetItems():RemoveItem(20489,e)
				player:GetItems():RemoveItem(20498,f)
				player:GetItems():RemoveItem(20507,g)
				player:GetItems():RemoveItem(20516,h)
				player:GetItems():RemoveItem(20525,i)
				player:GetItems():RemoveItem(20534,j)
				player:GetItems():RemoveItem(20543,k)
				player:GetItems():RemoveItem(20552,l)
				player:GetItems():RemoveItem(20561,m)
				player:GetItems():RemoveItem(20570,n)
				player:GetItems():RemoveItem(20579,o)  
				player:GetItems():RemoveItem(20571,p)
				player:GetItems():RemoveItem(20603,q)
				player:GetItems():RemoveItem(20617,r)					
					player:GetItems():RemoveItem(20618,s)	
				player:GetItems():RemoveItem(20593,t)
				player:GetItems():RemoveItem(20594,u)					
				player:GetItems():AddItem(402002, jt)
				ShowHint(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				player:GetScript():ShowError(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				--script:Rumor(string.format("#Y[VIP]#V: %s #O回收装备成功,获得环装积分卷x#A%s#53", player:GetCharNameLink(),jt), false)
			else
				ShowHint("你的包裹里并没有可回收的装备")
			end
		 elseif GetAnswer() == 2 then
			if player:GetLevel() < 0 then
				ShowHint("#W小朋友.#G0#W级以上才可以使用这个功能。")
				return 
end
      elseif GetAnswer() == 6 then 
				local a = player:GetItems():GetUnlockItemCount(30011)
			local b = player:GetItems():GetUnlockItemCount(30014)
			local c = player:GetItems():GetUnlockItemCount(30015)
			local d = player:GetItems():GetUnlockItemCount(30016)
			local e = player:GetItems():GetUnlockItemCount(30017)
			local f = player:GetItems():GetUnlockItemCount(30018)
			local h = player:GetItems():GetUnlockItemCount(30019)
			local i = player:GetItems():GetUnlockItemCount(30020)
			local j = player:GetItems():GetUnlockItemCount(30021)
			local k = player:GetItems():GetUnlockItemCount(30022)
			local l = player:GetItems():GetUnlockItemCount(30023)
			local m = player:GetItems():GetUnlockItemCount(30010)			
			jt = math.floor(1 * (a + b + c + e + f + g + h + i + j + k + l + m + d))
			if a > 0 or b > 0 or c > 0 or d > 0 or e > 0 or f > 0 or g > 0 or h > 0 or i > 0 or j > 0 or k > 0 or l > 0 or m > 0 then 
				player:GetItems():RemoveItem(30011,a)
				player:GetItems():RemoveItem(30014,b)
				player:GetItems():RemoveItem(30015,c)
				player:GetItems():RemoveItem(30016,d)
				player:GetItems():RemoveItem(30017,e)
				player:GetItems():RemoveItem(30018,f)
				player:GetItems():RemoveItem(30019,g)
				player:GetItems():RemoveItem(30020,h)
				player:GetItems():RemoveItem(30021,i)
				player:GetItems():RemoveItem(30022,j)
				player:GetItems():RemoveItem(30023,k)
				player:GetItems():RemoveItem(30010,l)
				player:GetItems():RemoveItem(20561,m)				
				player:GetItems():AddItem(402002, jt)
				ShowHint(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				player:GetScript():ShowError(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				--script:Rumor(string.format("#Y[VIP]#V: %s #O回收装备成功,获得环装积分卷x#A%s#53", player:GetCharNameLink(),jt), false)
			else
				ShowHint("你的包裹里并没有可回收的装备")
			end
		 elseif GetAnswer() == 2 then
			if player:GetLevel() < 0 then
				ShowHint("#W小朋友.#G0#W级以上才可以使用这个功能。")
				return 
     end
      elseif GetAnswer() == 7 then 
				local a = player:GetItems():GetUnlockItemCount(30011)
			local b = player:GetItems():GetUnlockItemCount(30014)
			local c = player:GetItems():GetUnlockItemCount(30015)
			local d = player:GetItems():GetUnlockItemCount(30016)
			local e = player:GetItems():GetUnlockItemCount(30017)
			local f = player:GetItems():GetUnlockItemCount(30018)
			local g = player:GetItems():GetUnlockItemCount(30018)
			local h = player:GetItems():GetUnlockItemCount(30019)
			local i = player:GetItems():GetUnlockItemCount(20525)
			local j = player:GetItems():GetUnlockItemCount(20534)
			local k = player:GetItems():GetUnlockItemCount(20543)
			local l = player:GetItems():GetUnlockItemCount(20552)
			local m = player:GetItems():GetUnlockItemCount(20561)
			local n = player:GetItems():GetUnlockItemCount(20570)
			local o = player:GetItems():GetUnlockItemCount(20579)
			local p = player:GetItems():GetUnlockItemCount(20571)
			local q = player:GetItems():GetUnlockItemCount(20603)
			local r = player:GetItems():GetUnlockItemCount(20617)	
			local s = player:GetItems():GetUnlockItemCount(20618)			
			jt = math.floor(4 * (a + b + c + e + f + g + h + i + j + k + l + m + n + o + p + q + r + d + s))
			if a > 0 or b > 0 or c > 0 or d > 0 or e > 0 or f > 0 or g > 0 or h > 0 or i > 0 or j > 0 or k > 0 or l > 0 or m > 0 or n > 0  or o > 0 or p > 0 or q > 0 or r > 0 or s > 0 then 
				player:GetItems():RemoveItem(20453,a)
				player:GetItems():RemoveItem(20462,b)
				player:GetItems():RemoveItem(20471,c)
				player:GetItems():RemoveItem(20480,d)
				player:GetItems():RemoveItem(20489,e)
				player:GetItems():RemoveItem(20498,f)
				player:GetItems():RemoveItem(20507,g)
				player:GetItems():RemoveItem(20516,h)
				player:GetItems():RemoveItem(20525,i)
				player:GetItems():RemoveItem(20534,j)
				player:GetItems():RemoveItem(20543,k)
				player:GetItems():RemoveItem(20552,l)
				player:GetItems():RemoveItem(20561,m)
				player:GetItems():RemoveItem(20570,n)
				player:GetItems():RemoveItem(20579,o)  
				player:GetItems():RemoveItem(20571,p)
				player:GetItems():RemoveItem(20603,q)
				player:GetItems():RemoveItem(20617,r)	
					player:GetItems():RemoveItem(20618,s)				
				player:GetItems():AddItem(402002, jt)
				ShowHint(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				player:GetScript():ShowError(string.format("#W回收装备成功，获得环装积分卷x%s",jt))
				--script:Rumor(string.format("#Y[VIP]#V: %s #O回收装备成功,获得环装积分卷x#A%s#53", player:GetCharNameLink(),jt), false)
			else
				ShowHint("你的包裹里并没有可回收的装备")
			end
		 elseif GetAnswer() == 2 then
			if player:GetLevel() < 0 then
				ShowHint("#W小朋友.#G0#W级以上才可以使用这个功能。")
				return 
end				
			
	 end
	 end
    if GetAnswer() == 18 then
   local flag = player:GetQuests():GetFlag(402002)  
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20450, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20459, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20468, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20477, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20486, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20495, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20504, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20513, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20522, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20531, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20549, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20558, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20567, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20576, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20588, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
      player:GetItems():AddItem(20600, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 3 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 3)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20451, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20460, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20469, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20478, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20487, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20496, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20505, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20514, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20523, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20532, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20550, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20559, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20568, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20577, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20589, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20590, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20601, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
      player:GetItems():AddItem(20613, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 5 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 5)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20452, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20461, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20470, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20479, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20488, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20497, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20506, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20515, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20524, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20533, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20551, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20560, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20569, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20578, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20591, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20592, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20602, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
      player:GetItems():AddItem(20615, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
      if flag < 8 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 8)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20453, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20462, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20471, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20480, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20489, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20498, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20507, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20516, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20525, 1)
        player:GetOwner()
    end		
			 if GetAnswer() == 10 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20534, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 11 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
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
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20552, 1)
        player:GetOwner()
    end
	       if GetAnswer() == 2 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20561, 1)
        player:GetOwner()
    end
	 if GetAnswer() == 3 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20570, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 4 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20579, 1)
        player:GetOwner()
    end
		 if GetAnswer() == 5 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20593, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 6 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20594, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 7 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20603, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 8 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20617, 1)
        player:GetOwner()
    end	
			 if GetAnswer() == 9 then
      local flag = player:GetQuests():GetFlag(402002)
      script:SetSaying(true)
     if flag < 12 then
        NpcSay("你的余额不足")
        return
      end
      player:GetQuests():SetFlag(402002, flag - 12)
      player:GetItems():AddItem(20618, 1)
        player:GetOwner()
    end		
end
	end		
	end	
	if GetAnswer() == 29 then 
	        IAsk("是不是觉得元宝票加得蛋疼，现在给你个机会给你换成大额元宝票#G(目前给你免费合成哟)")
	        SetAnswer(1, "100面额兑换成10000面额")
	        SetAnswer(2, "100面额兑换成2000面额")
	        SetAnswer(3, "100面额兑换成5000面额")
	        SetAnswer(4, "200面额兑换成10000面额")
	        SetAnswer(5, "200面额兑换成2000面额")
			SetAnswer(6, "200面额兑换成5000面额")
	        --SetAnswer(7, "500面额兑换成20000面额")
			--SetAnswer(8, "500面额兑换成5000面额")
	       -- SetAnswer(9, "100面额兑换成500面额")	
	        SetAnswer(10, "2000面额兑换成100000面额")
	        --SetAnswer(11, "5000面额兑换成300000面额")
	        SetAnswer(12, "5000面额兑换成50000面额")			
	        SetAnswer(120, "离开")
	        WaitAnswer(120)
	if GetAnswer() == 1 then
    if player:GetItems():GetItemCount(402800)< 100 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402800,100)
	   player:GetItems():AddItem(402833, 1)
	end	
	end
	if GetAnswer() == 2 then
    if player:GetItems():GetItemCount(402800)< 20 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402800,20)
	   player:GetItems():AddItem(402831, 1)
	end	
	end	
	if GetAnswer() == 3 then
    if player:GetItems():GetItemCount(402800)< 50 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402800,50)
	   player:GetItems():AddItem(402832, 1)
	end	
	end	
	if GetAnswer() == 4 then
    if player:GetItems():GetItemCount(402801)< 50 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402801,50)
	   player:GetItems():AddItem(402833, 1)
	end	
	end
	if GetAnswer() == 5 then
    if player:GetItems():GetItemCount(402801)< 10 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402801,10)
	   player:GetItems():AddItem(402831, 1)
	end	
	end	
	if GetAnswer() == 6 then
    if player:GetItems():GetItemCount(402801)< 25 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402801,25)
	   player:GetItems():AddItem(402832, 1)
	end	
	end		
	if GetAnswer() == 7 then
    if player:GetItems():GetItemCount(61021)< 40 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(61021,40)
	   player:GetItems():AddItem(402834, 1)
	end	
	end
	if GetAnswer() == 8 then
    if player:GetItems():GetItemCount(61021)< 10 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(61021,10)
	   player:GetItems():AddItem(402832, 1)
	end	
	end	
	if GetAnswer() == 9 then
    if player:GetItems():GetItemCount(402800)< 5 then
       NpcSayParty(string.format("你的数量不够", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402800,5)
	   player:GetItems():AddItem(61021, 1)
	end	
	end
	if GetAnswer() == 10 then
    if player:GetItems():GetItemCount(402831)< 50 then
       NpcSayParty(string.format("你的数量不够50", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402831,50)
	   player:GetItems():AddItem(402837, 1)
	end	
	end	
	if GetAnswer() == 11 then
    if player:GetItems():GetItemCount(402832)< 62 then
       NpcSayParty(string.format("你的数量不够62", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402832,62)
	   player:GetItems():AddItem(401676, 1)
	end		
	end	
	if GetAnswer() == 12 then
    if player:GetItems():GetItemCount(402832)< 10 then
       NpcSayParty(string.format("你的数量不够10", player:GetName()))
       return false
    end	
	 if l_1_1 then
       player:GetItems():RemoveItem(402832,10)
	   player:GetItems():AddItem(402838, 1)
	end		
	end		
	end	
end
end
AddItemTable(Item51402)