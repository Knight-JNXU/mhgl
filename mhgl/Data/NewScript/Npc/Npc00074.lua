
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00074 = {							-- 孙小红
	npc_id = 74,						-- NPC ID
	name = GetNpcName(74),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00074:Talk(bProcess)
  NpcAsk("身体越来越不好,现在也只能做一些认证技能的事情来维持生活了,唉！~~~~~~\\r请将召唤兽出战，不然我不会搭理你\\r并且每个召唤兽只能认证一个初级和高级技能")
  SetAnswer(1,"认证介绍")
  SetAnswer(2,"我要初级认证")
  SetAnswer(3,"我要高级认证")  
  SetAnswer(13,"离开")
  WaitAnswer(13)
  if GetAnswer() == 1 then
    NpcSay("在我这里可以认证四大法系技能,认证后,技能将会成为#P主动技能#W,而被动技能将会删除掉原本的技能,少侠就可以多一个格子让心爱的召唤兽学习更多的技能啦")
  elseif GetAnswer() == 2 then
    local p = player:GetCurPartner()
    NpcAsk("少侠需要认证的召唤兽可以认证如下的技能,请问需要认证什么技能呢？\r#P认证召唤兽技能每次需要108万银两。")
    if p:HasSkill(311) then
      SetAnswer(1,"地狱烈火")
    end
    if p:HasSkill(312) then
      SetAnswer(2,"泰山压顶")
    end
    if p:HasSkill(313) then
      SetAnswer(3,"奔雷咒")
    end
    if p:HasSkill(314) then
      SetAnswer(4,"水漫金山")
    end
    SetAnswer(5,"离开")
    WaitAnswer(5)
    if GetAnswer() == 1 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 1088888 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-1088888)
      p:RemoveSkill(311)
      p:RemoveSkill(9781)
      p:RemoveSkill(9782)
      p:RemoveSkill(9783)
      p:AddSkill(9780)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 2 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 1088888 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-1088888)
      p:RemoveSkill(312)
      p:RemoveSkill(9780)
      p:RemoveSkill(9782)
      p:RemoveSkill(9783)
      p:AddSkill(9781)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 3 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 1088888 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-1088888)
      p:RemoveSkill(313)
      p:RemoveSkill(9780)
      p:RemoveSkill(9781)
      p:RemoveSkill(9783)
      p:AddSkill(9782)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 4 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 1088888 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-1088888)
      p:RemoveSkill(314)
      p:RemoveSkill(9780)
      p:RemoveSkill(9781)
      p:RemoveSkill(9782)
      p:AddSkill(9783)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
	  end
  elseif GetAnswer() == 3 then
    local p = player:GetCurPartner()
    NpcAsk("少侠需要认证的召唤兽可以认证如下的技能,请问需要认证什么技能呢？\r#P认证召唤兽技能每次需要666万银两。")
    if p:HasSkill(4499) then
      SetAnswer(1,"壁垒击破")
    end
    if p:HasSkill(4500) then
      SetAnswer(2,"舍身一搏")
    end
    if p:HasSkill(4501) then
      SetAnswer(3,"惊心一剑")
    end
    if p:HasSkill(4502) then
      SetAnswer(4,"善恶有报")
    end
    if p:HasSkill(4503) then
      SetAnswer(5,"嗜血追击")
    end	
    if p:HasSkill(4505) then
      SetAnswer(6,"死亡禁锢")
    end
    if p:HasSkill(4506) then
      SetAnswer(7,"力劈华山")
    end	
    if p:HasSkill(4510) then
      SetAnswer(8,"上古灵符")
    end
    if p:HasSkill(4511) then
      SetAnswer(9,"剑荡四方")
    end	
    if p:HasSkill(4555) then
      SetAnswer(10,"八凶法阵")
    end		
    if p:HasSkill(216) then
      SetAnswer(11,"夜舞倾城")
    end		
    if p:HasSkill(212) then
      SetAnswer(12,"法力陷阱")
    end		
    if p:HasSkill(220) then
      SetAnswer(13,"釜底抽薪")
    end	
    if p:HasSkill(218) then
      SetAnswer(14,"翻江倒海")
    end		
    SetAnswer(15,"离开")
    WaitAnswer(15)
    if GetAnswer() == 1 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4499)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
      p:AddSkill(4557)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 2 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4500)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4544)	 
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 3 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4501)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4545)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 4 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4502)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4546)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	 
    elseif GetAnswer() == 5 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4503)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4547)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 6 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4505)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4549)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	
    elseif GetAnswer() == 7 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4506)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4550)
      NpcSay("恭喜少侠的召唤兽技能认证成功")
    elseif GetAnswer() == 8 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4510)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4551)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	
    elseif GetAnswer() == 9 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4511)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(4552)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	
    elseif GetAnswer() == 10 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(4555)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(217)
     p:RemoveSkill(213)	
       p:RemoveSkill(219)
      p:RemoveSkill(221)
	  p:AddSkill(4556)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	  
    elseif GetAnswer() == 11 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(216)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)	  	
     p:RemoveSkill(213)	
      p:RemoveSkill(219)
      p:RemoveSkill(221)	 
     p:AddSkill(217)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	
    elseif GetAnswer() == 12 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(217)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)
      p:RemoveSkill(219)
      p:RemoveSkill(221)	  
     p:AddSkill(213)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	
    elseif GetAnswer() == 13 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(217)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)
      p:RemoveSkill(219)
      p:RemoveSkill(220)	  
     p:AddSkill(221)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	
    elseif GetAnswer() == 14 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 6666666 then
        NpcSay("看我这一把老骨头也不容易,少侠还是给我点劳务费吧")
        return
      end
      player:ChangeMoney(-6666666)
      p:RemoveSkill(217)
      p:RemoveSkill(4544)
      p:RemoveSkill(4541)
      p:RemoveSkill(4542)
      p:RemoveSkill(4543)
      p:RemoveSkill(4545)
      p:RemoveSkill(4546)
      p:RemoveSkill(4547)
      p:RemoveSkill(4549)
      p:RemoveSkill(4550)
      p:RemoveSkill(4551)
      p:RemoveSkill(4552)
      p:RemoveSkill(4556)
      p:RemoveSkill(4557)
      p:RemoveSkill(221)
      p:RemoveSkill(218)	  
     p:AddSkill(219)
      NpcSay("恭喜少侠的召唤兽技能认证成功")	  
    end
  end
end
      











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00074)
