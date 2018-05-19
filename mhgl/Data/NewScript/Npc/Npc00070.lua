
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00070 = {							-- 孙小红
	npc_id = 70,						-- NPC ID
	name = GetNpcName(70),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00070:Talk(bProcess)
  NpcAsk("掌上星初满,盘中月弧~我就是精通宝石工艺的蝴蝶妹妹")
  SetAnswer(1,"学习技能")
  SetAnswer(2,"2-5级宝石合成")
  SetAnswer(5,"5-10宝石合成")
  --SetAnswer(3,"合成无暇宝石")
  --SetAnswer(4,"合成强化宝石")
  SetAnswer(6,"路过啦")
  WaitAnswer(6)
  
  if GetAnswer() == 1 then
    NpcAsk("你确定要花费100万银子和200万经验来学习宝石工艺吗?")
    SetAnswer(1,"银两学习") 
    SetAnswer(2,"储备金学习") 
    SetAnswer(3,"离开") 
    WaitAnswer(3)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 1000000 then
        NpcSay("少侠银两不足100万,不能进行学习")
        return
      end
      if player:GetExp() < 2000000 then
        NpcSay("少侠经验不足200万,不能进行学习")
        return
      end
      if player:GetSkillLv(9777) >= 10 then
        NpcSay("宝石工艺最高技能只能到达10级")
        return
      end
      if player:HasSkill(9777) then
        player:ChangeSkillLv(9777,1)
        player:ChangeMoney(-1000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      else
        player:AddSkill(9777)
        player:ChangeMoney(-1000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      end
  
  
    elseif GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      if player:GetSMoney() < 1000000 then
        NpcSay("少侠储备金不足100万,不能进行学习")
        return
      end
      if player:GetExp() < 2000000 then
        NpcSay("少侠经验不足200万,不能进行学习")
        return
      end
      if player:GetSkillLv(9777) >= 10 then
        NpcSay("宝石工艺最高技能只能到达10级")
        return
      end
      if player:HasSkill(9777) then
        player:ChangeSkillLv(9777,1)
        player:ChangeSMoney(-1000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      else
        player:AddSkill(9777)
        player:ChangeSMoney(-1000000)
        player:ChangeExp(-2000000)
        NpcSay("学习成功")
      end
    end
  
  
  
  elseif GetAnswer() == 2 then
    if player:GetSkillLv(9777) < 10 then
      NpcSay("宝石工艺小于10级不能使用合成系统")
      return
    end
    NpcAsk("少侠要进行宝石合成吗?")
    SetAnswer(1,"太阳石")
    SetAnswer(2,"月亮石")
    SetAnswer(3,"玛瑙石")
    SetAnswer(4,"神秘石")
    SetAnswer(5,"舍利子")
    SetAnswer(6,"黑宝石")
    SetAnswer(7,"光芒石")
    SetAnswer(8,"蓝宝石")
    SetAnswer(9,"离开")
    WaitAnswer(9)
		if GetAnswer() == 1 then
      NpcAsk("少侠要合成几级的太阳石?")
      SetAnswer(1,"二级太阳石")
      SetAnswer(2,"三级太阳石")
      SetAnswer(3,"四级太阳石")
      SetAnswer(4,"五级太阳石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60401) < 2 then
          NpcSay("合成二级太阳石需要两个2级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60401,2)
        player:GetItems():AddItem(60402,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60402) < 2 then
          NpcSay("合成三级太阳石需要两个2级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60402,2)
        player:GetItems():AddItem(60403,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60403) < 2 then
          NpcSay("合成四级太阳石需要两个3级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60403,2)
        player:GetItems():AddItem(60404,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60404) < 2 then
          NpcSay("合成五级太阳石需要两个4级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60404,2)
        player:GetItems():AddItem(60405,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
          end
    elseif GetAnswer() == 2 then
      NpcAsk("需要合成几级月亮石?")
      SetAnswer(1,"二级月亮石")
      SetAnswer(2,"三级月亮石")
      SetAnswer(3,"四级月亮石")
      SetAnswer(4,"五级月亮石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60411) < 2 then
          NpcSay("合成二级月亮石需要两个2级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60411,2)
        player:GetItems():AddItem(60412,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60412) < 2 then
          NpcSay("合成三级月亮石需要两个2级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60412,2)
        player:GetItems():AddItem(60413,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60413) < 2 then
          NpcSay("合成四级月亮石需要两个3级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60413,2)
        player:GetItems():AddItem(60414,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60414) < 2 then
          NpcSay("合成五级月亮石需要两个4级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60414,2)
        player:GetItems():AddItem(60415,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 3 then
      NpcAsk("需要合成几级玛瑙石?")
      SetAnswer(1,"二级玛瑙石")
      SetAnswer(2,"三级玛瑙石")
      SetAnswer(3,"四级玛瑙石")
      SetAnswer(4,"五级玛瑙石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60421) < 2 then
          NpcSay("合成二级玛瑙石需要两个2级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60421,2)
        player:GetItems():AddItem(60422,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60422) < 2 then
          NpcSay("合成三级玛瑙石需要两个2级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60422,2)
        player:GetItems():AddItem(60423,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60423) < 2 then
          NpcSay("合成四级玛瑙石需要两个3级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60423,2)
        player:GetItems():AddItem(60424,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60424) < 2 then
          NpcSay("合成五级玛瑙石需要两个4级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60424,2)
        player:GetItems():AddItem(60425,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      
      end
    elseif GetAnswer() == 4 then
      NpcAsk("需要合成几级神秘石?")
      SetAnswer(1,"二级神秘石")
      SetAnswer(2,"三级神秘石")
      SetAnswer(3,"四级神秘石")
      SetAnswer(4,"五级神秘石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60431) < 2 then
          NpcSay("合成二级神秘石需要两个2级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60431,2)
        player:GetItems():AddItem(60432,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60432) < 2 then
          NpcSay("合成三级神秘石需要两个2级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60432,2)
        player:GetItems():AddItem(60433,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60433) < 2 then
          NpcSay("合成四级神秘石需要两个3级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60433,2)
        player:GetItems():AddItem(60434,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60434) < 2 then
          NpcSay("合成五级神秘石需要两个4级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60434,2)
        player:GetItems():AddItem(60435,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      
      end
    elseif GetAnswer() == 5 then
      NpcAsk("需要合成几级舍利子?")
      SetAnswer(1,"二级舍利子")
      SetAnswer(2,"三级舍利子")
      SetAnswer(3,"四级舍利子")
      SetAnswer(4,"五级舍利子")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60441) < 2 then
          NpcSay("合成二级舍利子需要两个2级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60441,2)
        player:GetItems():AddItem(60442,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60442) < 2 then
          NpcSay("合成三级舍利子需要两个2级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60442,2)
        player:GetItems():AddItem(60443,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60443) < 2 then
          NpcSay("合成四级舍利子需要两个3级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60443,2)
        player:GetItems():AddItem(60444,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60444) < 2 then
          NpcSay("合成五级舍利子需要两个4级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60444,2)
        player:GetItems():AddItem(60445,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      
      end
    elseif GetAnswer() == 6 then
      NpcAsk("需要合成几级黑宝石?")
      SetAnswer(1,"二级黑宝石")
      SetAnswer(2,"三级黑宝石")
      SetAnswer(3,"四级黑宝石")
      SetAnswer(4,"五级黑宝石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60451) < 2 then
          NpcSay("合成二级黑宝石需要两个2级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60451,2)
        player:GetItems():AddItem(60452,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60452) < 2 then
          NpcSay("合成三级黑宝石需要两个2级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60452,2)
        player:GetItems():AddItem(60453,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60453) < 2 then
          NpcSay("合成四级黑宝石需要两个3级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60453,2)
        player:GetItems():AddItem(60454,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60454) < 2 then
          NpcSay("合成五级黑宝石需要两个4级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60454,2)
        player:GetItems():AddItem(60455,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
     
      end
    elseif GetAnswer() == 7 then
      NpcAsk("需要合成几级光芒石?")
      SetAnswer(1,"二级光芒石")
      SetAnswer(2,"三级光芒石")
      SetAnswer(3,"四级光芒石")
      SetAnswer(4,"五级光芒石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60461) < 2 then
          NpcSay("合成二级光芒石需要两个2级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60461,2)
        player:GetItems():AddItem(60462,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60462) < 2 then
          NpcSay("合成三级光芒石需要两个2级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60462,2)
        player:GetItems():AddItem(60463,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60463) < 2 then
          NpcSay("合成四级光芒石需要两个3级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60463,2)
        player:GetItems():AddItem(60464,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60464) < 2 then
          NpcSay("合成五级光芒石需要两个4级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60464,2)
        player:GetItems():AddItem(60465,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      
      end


    elseif GetAnswer() == 8 then
      NpcAsk("需要合成几级蓝宝石?")
      SetAnswer(1,"二级蓝宝石")
      SetAnswer(2,"三级蓝宝石")
      SetAnswer(3,"四级蓝宝石")
      SetAnswer(4,"五级蓝宝石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要2万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60471) < 2 then
          NpcSay("合成二级蓝宝石需要两个2级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60471,2)
        player:GetItems():AddItem(60472,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成3级宝石需要3万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60472) < 2 then
          NpcSay("合成三级蓝宝石需要两个2级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60472,2)
        player:GetItems():AddItem(60473,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成4级宝石需要4万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60473) < 2 then
          NpcSay("合成四级蓝宝石需要两个3级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60473,2)
        player:GetItems():AddItem(60474,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")


      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成2级宝石需要5万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60474) < 2 then
          NpcSay("合成五级蓝宝石需要两个4级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60474,2)
        player:GetItems():AddItem(60475,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
    
      end
    end
  
  
  elseif GetAnswer() == 5 then
    if player:GetSkillLv(9777) < 10 then
      NpcSay("宝石工艺小于10级不能使用合成系统")
      return
    end
    NpcAsk("少侠要进行宝石合成吗?")
    SetAnswer(1,"太阳石")
    SetAnswer(2,"月亮石")
    SetAnswer(3,"玛瑙石")
    SetAnswer(4,"神秘石")
    SetAnswer(5,"舍利子")
    SetAnswer(6,"黑宝石")
    SetAnswer(7,"光芒石")
    SetAnswer(8,"蓝宝石")
    SetAnswer(9,"离开")
    WaitAnswer(9)
    if GetAnswer() == 1 then
      NpcAsk("少侠要合成几级的太阳石?")
      SetAnswer(1,"六级太阳石")
      SetAnswer(2,"七级太阳石")
      SetAnswer(3,"八级太阳石")
      SetAnswer(4,"九级太阳石")
      SetAnswer(5,"十级太阳石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60405) < 2 then
          NpcSay("合成六级太阳石需要两个5级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60405,2)
        player:GetItems():AddItem(60406,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60406) < 2 then
          NpcSay("合成七级太阳石需要两个6级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60406,2)
        player:GetItems():AddItem(60407,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60407) < 2 then
          NpcSay("合成八级太阳石需要两个7级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60407,2)
        player:GetItems():AddItem(60408,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60408) < 2 then
          NpcSay("合成九级太阳石需要两个8级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60408,2)
        player:GetItems():AddItem(60409,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60409) < 2 then
          NpcSay("合成十级太阳石需要两个9级太阳石！")
          return
        end
        player:GetItems():RemoveItem(60409,2)
        player:GetItems():AddItem(60410,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 2 then
      NpcAsk("需要合成几级月亮石?")
      SetAnswer(1,"六级月亮石")
      SetAnswer(2,"七级月亮石")
      SetAnswer(3,"八级月亮石")
      SetAnswer(4,"九级月亮石")
      SetAnswer(5,"十级月亮石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60415) < 2 then
          NpcSay("合成六级月亮石需要两个5级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60415,2)
        player:GetItems():AddItem(60416,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60416) < 2 then
          NpcSay("合成七级月亮石需要两个6级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60416,2)
        player:GetItems():AddItem(60417,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60417) < 2 then
          NpcSay("合成八级月亮石需要两个7级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60417,2)
        player:GetItems():AddItem(60418,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60418) < 2 then
          NpcSay("合成九级月亮石需要两个8级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60418,2)
        player:GetItems():AddItem(60419,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60419) < 2 then
          NpcSay("合成十级月亮石需要两个9级月亮石！")
          return
        end
        player:GetItems():RemoveItem(60419,2)
        player:GetItems():AddItem(60420,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 3 then
      NpcAsk("需要合成几级玛瑙石?")
      SetAnswer(1,"六级玛瑙石")
      SetAnswer(2,"七级玛瑙石")
      SetAnswer(3,"八级玛瑙石")
      SetAnswer(4,"九级玛瑙石")
      SetAnswer(5,"十级玛瑙石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60425) < 2 then
          NpcSay("合成六级玛瑙石需要两个5级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60425,2)
        player:GetItems():AddItem(60426,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60426) < 2 then
          NpcSay("合成七级玛瑙石需要两个6级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60426,2)
        player:GetItems():AddItem(60427,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60427) < 2 then
          NpcSay("合成八级玛瑙石需要两个7级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60427,2)
        player:GetItems():AddItem(60428,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60428) < 2 then
          NpcSay("合成九级玛瑙石需要两个8级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60428,2)
        player:GetItems():AddItem(60429,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60429) < 2 then
          NpcSay("合成十级玛瑙石需要两个9级玛瑙石！")
          return
        end
        player:GetItems():RemoveItem(60429,2)
        player:GetItems():AddItem(60430,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 4 then
      NpcAsk("需要合成几级神秘石?")
      SetAnswer(1,"六级神秘石")
      SetAnswer(2,"七级神秘石")
      SetAnswer(3,"八级神秘石")
      SetAnswer(4,"九级神秘石")
      SetAnswer(5,"十级神秘石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60435) < 2 then
          NpcSay("合成六级神秘石需要两个5级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60435,2)
        player:GetItems():AddItem(60436,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60436) < 2 then
          NpcSay("合成七级神秘石需要两个6级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60436,2)
        player:GetItems():AddItem(60437,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60437) < 2 then
          NpcSay("合成八级神秘石需要两个7级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60437,2)
        player:GetItems():AddItem(60438,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60438) < 2 then
          NpcSay("合成九级神秘石需要两个8级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60438,2)
        player:GetItems():AddItem(60439,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60439) < 2 then
          NpcSay("合成十级神秘石需要两个9级神秘石！")
          return
        end
        player:GetItems():RemoveItem(60439,2)
        player:GetItems():AddItem(60440,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 5 then
      NpcAsk("需要合成几级舍利子?")
      SetAnswer(1,"六级舍利子")
      SetAnswer(2,"七级舍利子")
      SetAnswer(3,"八级舍利子")
      SetAnswer(4,"九级舍利子")
      SetAnswer(5,"十级舍利子")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60445) < 2 then
          NpcSay("合成六级舍利子需要两个5级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60445,2)
        player:GetItems():AddItem(60446,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60446) < 2 then
          NpcSay("合成七级舍利子需要两个6级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60446,2)
        player:GetItems():AddItem(60447,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60447) < 2 then
          NpcSay("合成八级舍利子需要两个7级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60447,2)
        player:GetItems():AddItem(60448,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60448) < 2 then
          NpcSay("合成九级舍利子需要两个8级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60448,2)
        player:GetItems():AddItem(60449,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60449) < 2 then
          NpcSay("合成十级舍利子需要两个9级舍利子！")
          return
        end
        player:GetItems():RemoveItem(60449,2)
        player:GetItems():AddItem(60450,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 6 then
      NpcAsk("需要合成几级黑宝石?")
      SetAnswer(1,"六级黑宝石")
      SetAnswer(2,"七级黑宝石")
      SetAnswer(3,"八级黑宝石")
      SetAnswer(4,"九级黑宝石")
      SetAnswer(5,"十级黑宝石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60455) < 2 then
          NpcSay("合成六级黑宝石需要两个5级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60455,2)
        player:GetItems():AddItem(60456,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60456) < 2 then
          NpcSay("合成七级黑宝石需要两个6级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60456,2)
        player:GetItems():AddItem(60457,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60457) < 2 then
          NpcSay("合成八级黑宝石需要两个7级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60457,2)
        player:GetItems():AddItem(60458,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60458) < 2 then
          NpcSay("合成九级黑宝石需要两个8级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60458,2)
        player:GetItems():AddItem(60459,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60459) < 2 then
          NpcSay("合成十级黑宝石需要两个9级黑宝石！")
          return
        end
        player:GetItems():RemoveItem(60459,2)
        player:GetItems():AddItem(60460,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    elseif GetAnswer() == 7 then
      NpcAsk("需要合成几级光芒石?")
      SetAnswer(1,"六级光芒石")
      SetAnswer(2,"七级光芒石")
      SetAnswer(3,"八级光芒石")
      SetAnswer(4,"九级光芒石")
      SetAnswer(5,"十级光芒石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60465) < 2 then
          NpcSay("合成六级光芒石需要两个5级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60465,2)
        player:GetItems():AddItem(60466,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60466) < 2 then
          NpcSay("合成七级光芒石需要两个6级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60466,2)
        player:GetItems():AddItem(60467,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60467) < 2 then
          NpcSay("合成八级光芒石需要两个7级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60467,2)
        player:GetItems():AddItem(60468,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60468) < 2 then
          NpcSay("合成九级光芒石需要两个8级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60468,2)
        player:GetItems():AddItem(60469,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60469) < 2 then
          NpcSay("合成十级光芒石需要两个9级光芒石！")
          return
        end
        player:GetItems():RemoveItem(60469,2)
        player:GetItems():AddItem(60470,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end


    elseif GetAnswer() == 8 then
      NpcAsk("需要合成几级蓝宝石?")
      SetAnswer(1,"六级蓝宝石")
      SetAnswer(2,"七级蓝宝石")
      SetAnswer(3,"八级蓝宝石")
      SetAnswer(4,"九级蓝宝石")
      SetAnswer(5,"十级蓝宝石")
      SetAnswer(6,"离开")
      WaitAnswer(6)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成6级宝石需要6万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60475) < 2 then
          NpcSay("合成六级蓝宝石需要两个5级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60475,2)
        player:GetItems():AddItem(60476,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成7级宝石需要7万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60476) < 2 then
          NpcSay("合成七级蓝宝石需要两个6级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60476,2)
        player:GetItems():AddItem(60477,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成8级宝石需要8万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60477) < 2 then
          NpcSay("合成八级蓝宝石需要两个7级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60477,2)
        player:GetItems():AddItem(60478,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")


      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成9级宝石需要9万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60478) < 2 then
          NpcSay("合成九级蓝宝石需要两个8级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60478,2)
        player:GetItems():AddItem(60479,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 10000 then
          NpcSay("合成10级宝石需要10万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60479) < 2 then
          NpcSay("合成十级蓝宝石需要两个9级蓝宝石！")
          return
        end
        player:GetItems():RemoveItem(60479,2)
        player:GetItems():AddItem(60480,1)
        player:ChangeMoney(-10000)
        NpcSay("恭喜少侠合成成功！~")
      end
    end
   elseif GetAnswer() == 3 then
    if player:GetSkillLv(9777) < 10 then
      NpcSay("宝石工艺小于10级不能使用合成系统")
      return
    end
    NpcAsk("少侠要进行宝石合成吗?")
    SetAnswer(1,"太阳石")
    SetAnswer(2,"月亮石")
    SetAnswer(3,"玛瑙石")
    SetAnswer(4,"神秘石")
    SetAnswer(5,"舍利子")
    SetAnswer(6,"黑宝石")
    SetAnswer(7,"光芒石")
    SetAnswer(8,"蓝宝石")
    SetAnswer(9,"离开")
    WaitAnswer(9)
		if GetAnswer() == 1 then
      NpcAsk("少侠要合成几级的太阳石?")
      SetAnswer(1,"一级无暇太阳石")
      SetAnswer(2,"二级无暇太阳石")
      SetAnswer(3,"三级无暇太阳石")
      SetAnswer(4,"四级无暇太阳石")
	  SetAnswer(5,"五级无暇太阳石")
	  SetAnswer(6,"六级无暇太阳石")
	  SetAnswer(7,"七级无暇太阳石")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60410) < 1  or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成1级无暇太阳石需要1个10级太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60410,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60801,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60801) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成2级无暇太阳石需要1个1级无暇太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60801,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60802,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60802) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成3级无暇太阳石需要1个2级无暇太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60802,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60803,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60803) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成4级无暇太阳石需要1个3级无暇太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60803,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60804,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60804) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成5级无暇太阳石需要1个4级无暇太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60804,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60805,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60805) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成6级无暇太阳石需要1个5级无暇太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60805,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60806,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60806) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成7级无暇太阳石需要1个6级无暇太阳石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60806,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60807,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
    elseif GetAnswer() == 2 then
      NpcAsk("少侠要合成几级的月亮石?")
      SetAnswer(1,"一级无暇月亮石")
      SetAnswer(2,"二级无暇月亮石")
      SetAnswer(3,"三级无暇月亮石")
      SetAnswer(4,"四级无暇月亮石")
	  SetAnswer(5,"五级无暇月亮石")
	  SetAnswer(6,"六级无暇月亮石")
	  SetAnswer(7,"七级无暇月亮石")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60420) < 1  or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成1级无暇月亮石需要1个10级月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60420,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60811,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60811) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成2级无暇月亮石需要1个1级无暇月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60811,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60812,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60812) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成3级无暇月亮石需要1个2级无暇月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60812,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60813,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60813) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成4级无暇月亮石需要1个3级无暇月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60813,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60814,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60814) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成5级无暇月亮石需要1个4级无暇月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60814,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60815,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60815) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成6级无暇月亮石需要1个5级无暇月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60815,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60816,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60816) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成7级无暇月亮石需要1个6级无暇月亮石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60816,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60817,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
    		elseif GetAnswer() == 3 then
      NpcAsk("少侠要合成几级的玛瑙？")
      SetAnswer(1,"一级无暇玛瑙")
      SetAnswer(2,"二级无暇玛瑙")
      SetAnswer(3,"三级无暇玛瑙")
      SetAnswer(4,"四级无暇玛瑙")
	  SetAnswer(5,"五级无暇玛瑙")
	  SetAnswer(6,"六级无暇玛瑙")
	  SetAnswer(7,"七级无暇玛瑙")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60430) < 1  or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成1级无暇玛瑙需要1个10级玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60430,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60821,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60821) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成2级无暇玛瑙需要1个1级无暇玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60821,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60822,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60822) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成3级无暇玛瑙需要1个2级无暇玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60822,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60823,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60823) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成4级无暇玛瑙需要1个3级无暇玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60823,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60824,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60824) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成5级无暇玛瑙需要1个4级无暇玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60824,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60825,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60825) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成6级无暇玛瑙需要1个5级无暇玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60825,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60826,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60826) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成7级无暇玛瑙需要1个6级无暇玛瑙和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60826,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60827,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
    		elseif GetAnswer() == 4 then
      NpcAsk("少侠要合成几级的神秘石？")
      SetAnswer(1,"一级无暇神秘石")
      SetAnswer(2,"二级无暇神秘石")
      SetAnswer(3,"三级无暇神秘石")
      SetAnswer(4,"四级无暇神秘石")
	  SetAnswer(5,"五级无暇神秘石")
	  SetAnswer(6,"六级无暇神秘石")
	  SetAnswer(7,"七级无暇神秘石")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60440) < 1  or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成1级无暇神秘石需要1个10级神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60440,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60831,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60831) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成2级无暇神秘石需要1个1级无暇神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60831,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60832,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60832) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成3级无暇神秘石需要1个2级无暇神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60832,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60833,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60833) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成4级无暇神秘石需要1个3级无暇神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60833,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60834,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60834) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成5级无暇神秘石需要1个4级无暇神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60834,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60835,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60835) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成6级无暇神秘石需要1个5级无暇神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60835,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60836,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60836) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成7级无暇神秘石需要1个6级无暇神秘石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60836,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60837,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
    		elseif GetAnswer() == 5 then
      NpcAsk("少侠要合成几级的舍利子？")
      SetAnswer(1,"一级无暇舍利子")
      SetAnswer(2,"二级无暇舍利子")
      SetAnswer(3,"三级无暇舍利子")
      SetAnswer(4,"四级无暇舍利子")
	  SetAnswer(5,"五级无暇舍利子")
	  SetAnswer(6,"六级无暇舍利子")
	  SetAnswer(7,"七级无暇舍利子")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60450) < 1  or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成1级无暇舍利子需要1个10级舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60450,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60841,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60841) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成2级无暇舍利子需要1个1级无暇舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60841,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60842,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60842) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成3级无暇舍利子需要1个2级无暇舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60842,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60843,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60843) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成4级无暇舍利子需要1个3级无暇舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60843,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60844,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60844) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成5级无暇舍利子需要1个4级无暇舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60844,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60845,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60845) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成6级无暇舍利子需要1个5级无暇舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60845,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60846,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60846) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成7级无暇舍利子需要1个6级无暇舍利子和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60846,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60847,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
		elseif GetAnswer() == 6 then
      NpcAsk("少侠要合成几级的黑宝石？")
      SetAnswer(1,"一级无暇黑宝石")
      SetAnswer(2,"二级无暇黑宝石")
      SetAnswer(3,"三级无暇黑宝石")
      SetAnswer(4,"四级无暇黑宝石")
	  SetAnswer(5,"五级无暇黑宝石")
	  SetAnswer(6,"六级无暇黑宝石")
	  SetAnswer(7,"七级无暇黑宝石")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60460) < 1  or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成1级无暇黑宝石需要1个10级黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60460,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60851,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60851) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成2级无暇黑宝石需要1个1级无暇黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60851,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60852,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60852) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成3级无暇黑宝石需要1个2级无暇黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60852,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60853,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60853) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成4级无暇黑宝石需要1个3级无暇黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60853,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60854,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60854) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成5级无暇黑宝石需要1个4级无暇黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60854,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60855,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60855) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成6级无暇黑宝石需要1个5级无暇黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60855,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60856,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60856) < 1 or player:GetItems():GetItemCount(60321) < 1 then
          NpcSay("合成7级无暇黑宝石需要1个6级无暇黑宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60856,1)
		player:GetItems():RemoveItem(60321,1)
        player:GetItems():AddItem(60857,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
    		elseif GetAnswer() == 7 then
      NpcAsk("少侠要合成几级的光芒石？")
      SetAnswer(1,"一级无暇光芒石")
      SetAnswer(2,"二级无暇光芒石")
      SetAnswer(3,"三级无暇光芒石")
      SetAnswer(4,"四级无暇光芒石")
	  SetAnswer(5,"五级无暇光芒石")
	  SetAnswer(6,"六级无暇光芒石")
	  SetAnswer(7,"七级无暇光芒石")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60470) < 1  or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成1级无暇光芒石需要1个10级光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60470,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60861,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60861) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成2级无暇光芒石需要1个1级无暇光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60861,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60862,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60862) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成3级无暇光芒石需要1个2级无暇光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60862,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60863,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60863) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成4级无暇光芒石需要1个3级无暇光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60863,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60864,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60864) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成5级无暇光芒石需要1个4级无暇光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60864,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60865,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60865) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成6级无暇光芒石需要1个5级无暇光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60865,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60866,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60866) < 1 or player:GetItems():GetItemCount(60322) < 1 then
          NpcSay("合成7级无暇光芒石需要1个6级无暇光芒石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60866,1)
		player:GetItems():RemoveItem(60322,1)
        player:GetItems():AddItem(60867,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end

   		elseif GetAnswer() == 8 then
      NpcAsk("少侠要合成几级的蓝宝石？")
      SetAnswer(1,"一级无暇蓝宝石")
      SetAnswer(2,"二级无暇蓝宝石")
      SetAnswer(3,"三级无暇蓝宝石")
      SetAnswer(4,"四级无暇蓝宝石")
	  SetAnswer(5,"五级无暇蓝宝石")
	  SetAnswer(6,"六级无暇蓝宝石")
	  SetAnswer(7,"七级无暇蓝宝石")
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60480) < 1  or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成1级无暇蓝宝石需要1个10级蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60480,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60871,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60871) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成2级无暇蓝宝石需要1个1级无暇蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60871,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60872,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 3 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60872) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成3级无暇蓝宝石需要1个2级无暇蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60872,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60873,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
      elseif GetAnswer() == 4 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60873) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成4级无暇蓝宝石需要1个3级无暇蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60873,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60874,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 5 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60874) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成5级无暇蓝宝石需要1个4级无暇蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60874,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60875,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 6 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60875) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成6级无暇蓝宝石需要1个5级无暇蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60875,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60876,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
		elseif GetAnswer() == 7 and bProcess then 
        script:SetSaying(true)
         if player:GetMoney() < 1000000 then
          NpcSay("合成宝石需要100万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60876) < 1 or player:GetItems():GetItemCount(60323) < 1 then
          NpcSay("合成7级无暇蓝宝石需要1个6级无暇蓝宝石和1个熔炼石！")
          return
        end
        player:GetItems():RemoveItem(60876,1)
		player:GetItems():RemoveItem(60323,1)
        player:GetItems():AddItem(60877,1)
        player:ChangeMoney(-1000000)
        NpcSay("恭喜少侠合成成功！~")
        end
    end
	elseif GetAnswer() == 4 then
    NpcAsk("\#R我这里“只能”合成“强化光芒石”，我永远都不会帮你合成其他强化宝石！\r\#Y合成需求：任意等级无暇宝石一颗+四象石各20颗+1000万银两\r合成概率：20%（失败不损耗宝石，只损耗材料和银两）\r脸黑福利：前10次合成都失败的话，第11次必成！\r合成结果：7级无暇合成成功变为7级强化，强化合成为对等合成！")
    SetAnswer(1,"合成强化光芒石") 
	SetAnswer(2,"合成强化光芒石[绑定]") 
    SetAnswer(3,"离开") 
    WaitAnswer(3)
	 if GetAnswer() == 1 then
	  local GemFlagH = player:GetQuests():GetFlag(55217) -- 一级合成计次
      local GemFlagI = player:GetQuests():GetFlag(55218) -- 二级合成计次
      local GemFlagJ = player:GetQuests():GetFlag(55219) -- 三级合成计次
      local GemFlagK = player:GetQuests():GetFlag(55220) -- 四级合成计次
      local GemFlagL = player:GetQuests():GetFlag(55221) -- 五级合成计次
	  local GemFlagM = player:GetQuests():GetFlag(55222) -- 六级合成计次
	  local GemFlagN = player:GetQuests():GetFlag(55223) -- 七级合成计次
      NpcAsk("少侠要合成几级的强化光芒石？")
      SetAnswer(1,string.format("一级强化光芒石 合成必成%d/11",GemFlagH))
      SetAnswer(2,string.format("二级强化光芒石 合成必成%d/11",GemFlagI))
      SetAnswer(3,string.format("三级强化光芒石 合成必成%d/11",GemFlagJ))
      SetAnswer(4,string.format("四级强化光芒石 合成必成%d/11",GemFlagK))
	  SetAnswer(5,string.format("五级强化光芒石 合成必成%d/11",GemFlagL))
	  SetAnswer(6,string.format("六级强化光芒石 合成必成%d/11",GemFlagM))
	  SetAnswer(7,string.format("七级强化光芒石 合成必成%d/11",GemFlagN))
      SetAnswer(8,"离开")
      WaitAnswer(8)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60861) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成1级强化光芒石需要1个1级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagH = GemFlagH + 1 -- 合成计次
		player:GetQuests():SetFlag(55217, GemFlagH) -- 合成计次
		if GemFlagH >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55217, 0)
		   player:GetQuests():RemoveFlag(55217)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60861,1)
		   player:GetItems():AddItem(92001,1)
		   script:Rumor(string.format("\#W%s\#O成功将1级无暇光芒石合成为1级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 2 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60862) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成2级强化光芒石需要1个2级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagI = GemFlagI + 1 -- 合成计次
		player:GetQuests():SetFlag(55218, GemFlagI) -- 合成计次
		if GemFlagI >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55218, 0)
		   player:GetQuests():RemoveFlag(55218)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60862,1)
		   player:GetItems():AddItem(92002,1)
		   script:Rumor(string.format("\#W%s\#O成功将2级无暇光芒石合成为2级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 3 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60863) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成3级强化光芒石需要1个3级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagJ = GemFlagJ + 1 -- 合成计次
		player:GetQuests():SetFlag(55219, GemFlagJ) -- 合成计次
		if GemFlagJ >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55219, 0)
		   player:GetQuests():RemoveFlag(55219)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60863,1)
		   player:GetItems():AddItem(92003,1)
		   script:Rumor(string.format("\#W%s\#O成功将3级无暇光芒石合成为3级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 4 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60864) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成4级强化光芒石需要1个4级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagK = GemFlagK + 1 -- 合成计次
		player:GetQuests():SetFlag(55220, GemFlagK) -- 合成计次
		if GemFlagK >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55220, 0)
		   player:GetQuests():RemoveFlag(55220)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60864,1)
		   player:GetItems():AddItem(92004,1)
		   script:Rumor(string.format("\#W%s\#O成功将4级无暇光芒石合成为4级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 5 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60865) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成5级强化光芒石需要1个5级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagL = GemFlagL + 1 -- 合成计次
		player:GetQuests():SetFlag(55221, GemFlagL) -- 合成计次
		if GemFlagL >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55221, 0)
		   player:GetQuests():RemoveFlag(55221)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60865,1)
		   player:GetItems():AddItem(92005,1)
		   script:Rumor(string.format("\#W%s\#O成功将5级无暇光芒石合成为5级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 6 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60866) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成6级强化光芒石需要1个6级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagM = GemFlagM + 1 -- 合成计次
		player:GetQuests():SetFlag(55222, GemFlagM) -- 合成计次
		if GemFlagM >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55222, 0)
		   player:GetQuests():RemoveFlag(55222)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60866,1)
		   player:GetItems():AddItem(92006,1)
		   script:Rumor(string.format("\#W%s\#O成功将6级无暇光芒石合成为6级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 7 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60867) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成7级强化光芒石需要1个7级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagN = GemFlagN + 1 -- 合成计次
		player:GetQuests():SetFlag(55223, GemFlagN) -- 合成计次
		if GemFlagN >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55223, 0)
		   player:GetQuests():RemoveFlag(55223)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60867,1)
		   player:GetItems():AddItem(92007,1)
		   script:Rumor(string.format("\#W%s\#O成功将7级无暇光芒石合成为7级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  end
	 elseif GetAnswer() == 2 then
	  local GemFlagA = player:GetQuests():GetFlag(55210) -- 一级合成计次
      local GemFlagB = player:GetQuests():GetFlag(55211) -- 二级合成计次
      local GemFlagC = player:GetQuests():GetFlag(55212) -- 三级合成计次
      local GemFlagD = player:GetQuests():GetFlag(55213) -- 四级合成计次
      local GemFlagE = player:GetQuests():GetFlag(55214) -- 五级合成计次
	  local GemFlagF = player:GetQuests():GetFlag(55215) -- 六级合成计次
	  local GemFlagG = player:GetQuests():GetFlag(55216) -- 七级合成计次
      NpcAsk("少侠要合成几级的强化光芒石？\r\#R这个合成需要绑定宝石，合成出的也是绑定的！")
      SetAnswer(1,string.format("一级强化光芒石（绑定）合成必成%d/11",GemFlagA))
      SetAnswer(2,string.format("二级强化光芒石（绑定）合成必成%d/11",GemFlagB))
      SetAnswer(3,string.format("三级强化光芒石（绑定）合成必成%d/11",GemFlagC))
      SetAnswer(4,string.format("四级强化光芒石（绑定）合成必成%d/11",GemFlagD))
	  SetAnswer(5,string.format("五级强化光芒石（绑定）合成必成%d/11",GemFlagE))
	  SetAnswer(6,string.format("六级强化光芒石（绑定）合成必成%d/11",GemFlagF))
	  SetAnswer(7,string.format("七级强化光芒石（绑定）合成必成%d/11",GemFlagG))
      SetAnswer(8,"离开")
      WaitAnswer(8)
	   if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60861) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成1级强化光芒石需要1个1级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagA = GemFlagA + 1 -- 合成计次
		player:GetQuests():SetFlag(55210, GemFlagA) -- 合成计次
		if GemFlagA >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55210, 0)
		   player:GetQuests():RemoveFlag(55210)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60861,1)
		   player:GetItems():AddItem(92011,1)
		   script:Rumor(string.format("\#W%s\#O成功将1级无暇光芒石合成为1级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 2 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60862) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成2级强化光芒石需要1个2级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagB = GemFlagB + 1 -- 合成计次
		player:GetQuests():SetFlag(55211, GemFlagB) -- 合成计次
		if GemFlagB >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55211, 0)
		   player:GetQuests():RemoveFlag(55211)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60862,1)
		   player:GetItems():AddItem(92012,1)
		   script:Rumor(string.format("\#W%s\#O成功将2级无暇光芒石合成为2级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 3 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60863) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成3级强化光芒石需要1个3级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagC = GemFlagC + 1 -- 合成计次
		player:GetQuests():SetFlag(55212, GemFlagC) -- 合成计次
		if GemFlagC >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55212, 0)
		   player:GetQuests():RemoveFlag(55212)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60863,1)
		   player:GetItems():AddItem(92013,1)
		   script:Rumor(string.format("\#W%s\#O成功将3级无暇光芒石合成为3级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 4 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60864) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成4级强化光芒石需要1个4级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagD = GemFlagD + 1 -- 合成计次
		player:GetQuests():SetFlag(55213, GemFlagD) -- 合成计次
		if GemFlagD >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55213, 0)
		   player:GetQuests():RemoveFlag(55213)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60864,1)
		   player:GetItems():AddItem(92014,1)
		   script:Rumor(string.format("\#W%s\#O成功将4级无暇光芒石合成为4级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 5 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60865) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成5级强化光芒石需要1个5级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagE = GemFlagE + 1 -- 合成计次
		player:GetQuests():SetFlag(55214, GemFlagE) -- 合成计次
		if GemFlagE >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55214, 0)
		   player:GetQuests():RemoveFlag(55214)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60865,1)
		   player:GetItems():AddItem(92015,1)
		   script:Rumor(string.format("\#W%s\#O成功将5级无暇光芒石合成为5级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 6 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60866) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成6级强化光芒石需要1个6级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagF = GemFlagF + 1 -- 合成计次
		player:GetQuests():SetFlag(55215, GemFlagF) -- 合成计次
		if GemFlagF >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55215, 0)
		   player:GetQuests():RemoveFlag(55215)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60866,1)
		   player:GetItems():AddItem(92016,1)
		   script:Rumor(string.format("\#W%s\#O成功将6级无暇光芒石合成为6级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  elseif GetAnswer() == 7 and bProcess then 
	    script:SetSaying(true)
		if player:GetMoney() < 10000000 then
          NpcSay("合成强化宝石需要1000万两银子,少侠银两不足！")
          return
        end
        if player:GetItems():GetItemCount(60867) < 1 or player:GetItems():GetItemCount(15006) < 20 
		or player:GetItems():GetItemCount(15007) < 20 or player:GetItems():GetItemCount(15008) < 20 
		or player:GetItems():GetItemCount(15009) < 20 then
          NpcSay("合成7级强化光芒石需要1个7级无暇光芒石和四象石各20颗！")
          return
        end
        player:GetItems():RemoveItem(15006,20)
		player:GetItems():RemoveItem(15007,20)
		player:GetItems():RemoveItem(15008,20)
		player:GetItems():RemoveItem(15009,20)
		player:ChangeMoney(-10000000)
		local RR = math.random(1,100)
		GemFlagG = GemFlagG + 1 -- 合成计次
		player:GetQuests():SetFlag(55216, GemFlagG) -- 合成计次
		if GemFlagG >= 11 then --第11次必成
		   player:GetQuests():SetFlag(55216, 0)
		   player:GetQuests():RemoveFlag(55216)
		   RR = 1
		end
		if RR < 20 then
		   player:GetItems():RemoveItem(60867,1)
		   player:GetItems():AddItem(92017,1)
		   script:Rumor(string.format("\#W%s\#O成功将7级无暇光芒石合成为7级强化光芒石。", player:GetName()), false)
		   NpcSay("恭喜少侠合成成功！~")
		else
		   NpcSay("非常抱歉，合成失败了！~")
        end
	  end
	 end
  end
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00070)
