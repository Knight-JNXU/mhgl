
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00702 = {							-- 孙小红
	npc_id = 702,						-- NPC ID
	name = GetNpcName(702),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00702:Talk(bProcess)
  NpcAsk("听闻江湖中有许多奇珍异宝,老夫有有幸获得一些,来看看需要购买一些什么?")
  SetAnswer(1,"消耗品")
  SetAnswer(2,"辅助品")
  SetAnswer(3,"游戏猜大小")
  SetAnswer(4,"修炼果")
  SetAnswer(9,"妖兽历练任务")
  --if player:GetChar_id() == 1 then
    SetAnswer(7,"请上仙（限时活动：2017.5.1~9日）")
  --end
  if  player:HasSkill(394) then
    SetAnswer(6,"法宝升级")
  end
  SetAnswer(8,"仙人幻境（活动）")
  SetAnswer(5,"不用")
  
  WaitAnswer(5)
  if GetAnswer() == 1 then
  
    NpcAsk("请看看需要购买什么?")
    SetAnswer(1,"50W购买魔兽要诀宝盒")
    SetAnswer(2,"70W购买百炼精铁礼盒")
    SetAnswer(3,"70W购买制造指南书礼盒")
   
 --   SetAnswer(4,"初级品质鉴定符x30(15万)在帮派鉴定装备属性")
 --   SetAnswer(5,"中级品质鉴定符x30(24万)在帮派鉴定装备属性")
   --SetAnswer(6,"高级品质鉴定符x30(30万)在帮派鉴定装备属性")
    SetAnswer(7,"离开")
    WaitAnswer(7)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 500000 then
        NpcSay("低级兽决盒子需要50万银子才可以购买")
        return
      end
      player:ChangeMoney(-500000)	
      player:GetItems():AddItem(60222,1)
      ShowHint("购买成功,获得魔兽要诀宝盒#89")
    elseif GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 700000 then
        NpcSay("百炼精铁礼盒需要70万银子才可以购买")
        return
      end
      player:ChangeMoney(-700000)	
      player:GetItems():AddItem(60231,1)
      ShowHint("购买成功,获得百炼精铁礼盒#89")
    elseif GetAnswer() == 3 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 700000 then
        NpcSay("制造指南书礼盒需要70万银子才可以购买")
        return
      end
      player:ChangeMoney(-700000)	
      player:GetItems():AddItem(60230,1)
      ShowHint("购买成功,获得制造指南书礼盒#89")

    elseif GetAnswer() == 4 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 150000 then
        NpcSay("初级品质鉴定符需要15万银子才可以购买30个")
        return
      end
      player:ChangeMoney(-150000)	
      player:GetItems():AddItem(60280,30)
      ShowHint("购买成功,获得初级品质鉴定符x30#89")
    elseif GetAnswer() == 5 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 240000 then
        NpcSay("中级品质鉴定符需要24万银子才可以购买30个")
        return
      end
      player:ChangeMoney(-240000)	
      player:GetItems():AddItem(60281,30)
      ShowHint("购买成功,获得中级品质鉴定符x30#89")
    elseif GetAnswer() == 6 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 300000 then
        NpcSay("高级品质鉴定符需要30万银子才可以购买30个")
        return
      end
      player:ChangeMoney(-300000)	
      player:GetItems():AddItem(60282,30)
      ShowHint("购买成功,获得高级品质鉴定符x30#89")
    end
  elseif GetAnswer() == 2 then
    NpcAsk("请问需要什么消耗品?")
  --  SetAnswer(1,"极乐之星(188888银两x10)")
    SetAnswer(2,"金柳露礼盒(35万银两)")
    SetAnswer(3,"十步一杀(45万银两)")
--    SetAnswer(4,"自定义导标旗(30万银两)")
    SetAnswer(7,"离开")
    WaitAnswer(7)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetMoney() < 188888 then
        NpcSay("极乐之星需要188888万银子才可以购买")
        return
      end
      player:ChangeMoney(-188888)	
      player:GetItems():AddItem(60134,10)
      ShowHint("购买成功,获得极乐之星x10#18")
    elseif GetAnswer() == 2 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 350000 then
        NpcSay("金柳露礼盒需要35万银子才可以购买")
        return
      end
      player:ChangeMoney(-350000)	
      player:GetItems():AddItem(60221,1)
      ShowHint("购买成功,获得金柳露礼盒#97")
    elseif GetAnswer() == 3 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 450000 then
        NpcSay("十步一杀需要45万银子才可以购买")
        return
      end
      player:ChangeMoney(-450000)	
      player:GetItems():AddItem(60136,1)
      ShowHint("购买成功,获得十步一杀#97")
    elseif GetAnswer() == 4 and bProcess then 
      script:SetSaying(true)
      if player:GetMoney() < 450000 then
        NpcSay("自定义导标旗需要45万银子才可以购买")
        return
      end
      player:ChangeMoney(-450000)	
      player:GetItems():AddItem(30003,1)
      ShowHint("购买成功,获得自定义导标旗#97")
    end
  elseif GetAnswer() == 3 then
    NpcAsk("欢迎进行数字猜大小的玩法,在玩之前建议您看看游戏规则")
    SetAnswer(1,"游戏规则")
    SetAnswer(2,"游戏开始")
    SetAnswer(3,"无聊")
    WaitAnswer(3)
    if GetAnswer() == 1 then
      NpcSay("游戏开始前,请各位玩家进行选择开出的数字是大还是小,若是数字678910,那么本次开出的便是大,若是12345,那么便是小,每次下注为10万")
    elseif GetAnswer() == 2 then
      local i = math.random(1,10)
      NpcAsk("请进行下注吧")
      SetAnswer(1,"大")
      SetAnswer(2,"小")
      SetAnswer(3,"等等")
      WaitAnswer(3)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 100000 then
          NpcSay("没钱玩什么?")
          return
        end
        if i >= 7 then
          NpcSay("真是财神附体,本次开出的是大,赢得了10万")
          player:ChangeMoney(100000)	
        else
          NpcSay("本次开出的是小,输掉了10万")
          player:ChangeMoney(-100000)
        end	
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 100000 then
          NpcSay("没钱玩什么?")
          return
        end
        if i <= 4 then
          NpcSay("真是财神附体,本次开出的是小,赢得了10万")
          player:ChangeMoney(100000)	
        else
          NpcSay("本次开出的是大,输掉了10万")
          player:ChangeMoney(-100000)
        end	
      end
    end
  elseif GetAnswer() == 4 then
    NpcAsk("老夫近日获得了一种可将修炼果点化到召唤兽的方法,少侠可愿意尝试?")
    SetAnswer(1,"点化方法")
    SetAnswer(2,"我要点化")
    SetAnswer(3,"离开")
    WaitAnswer(3)
    if GetAnswer() == 1 then
      NpcSay("少侠身上若有#Y修炼果#W,可携带前来让老夫将它点化到召唤兽身上,点化后召唤兽资质可大幅度增加\r点化时,请首先将需要点化的召唤兽设置为参战,\r点化有一定几率失败,若是召唤兽对修炼果产生不适感,修为有较小几率降低1级,且修为最高不能超过10级。\r这点化需要老夫消耗一些法力,七七四十九天才可补回来,每次点化都会收取你#P四十九万#W银两。")
    elseif GetAnswer() == 2 and bProcess then 
      script:SetSaying(true)
      local p = player:GetCurPartner()
      if player:GetMoney() < 490000 then
        NpcSay("点化这#Y修炼果#W可是需要消耗我很多法力,少侠可不能白让我帮你点化,需要银两#P四十九万")
        return
      end
      if player:GetItems():GetItemCount(80084) < 1 then
        NpcSay("少侠身上没有#Y修炼果#W,让老夫如何帮你点化?")
        return
      end
      local lv = p:GetCultivation()
      local r = math.random(1,100)
      local a = math.random(1,100)
      local i = 0
      if lv == 0 then
        i = 100
      elseif lv == 1 then
        i = 80
      elseif lv == 2 then
        i = 70
      elseif lv == 3 then
        i = 60
      elseif lv == 4 then
        i = 50
      elseif lv == 5 then 
        i = 40
      elseif lv == 6 then
        i = 30
      elseif lv == 7 then 
        i = 20
      elseif lv == 8 then
        i = 10
      elseif lv == 9 then
        i = 5
      elseif lv == 10 then
        i = 0
      end
      if r <= i then
        NpcSay("少侠的召唤兽天资聪慧,成功将修炼果融入进召唤兽的修为中。可喜可贺~！")
        p:ChangeCultivation(1)
        player:GetItems():RemoveItem(80084,1)	
        player:ChangeMoney(-490000)
        if lv == 6 then
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y修炼果#O点化到#P%s#O上,当前修为已经到达了#G七级#O,真是所向披靡,无人能挡！#46", player:GetCharNameLink(),p:GetName()), false)
        elseif lv == 7 then  
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y修炼果#O点化到#P%s#O上,当前修为已经到达了#G八级#O,真是所向披靡,无人能挡！#24", player:GetCharNameLink(),p:GetName()), false)
        elseif lv == 8 then  
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y修炼果#O点化到#P%s#O上,当前修为已经到达了#G九级#O,真是所向披靡,无人能挡！#97", player:GetCharNameLink(),p:GetName()), false)
        elseif lv == 9 then  
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y修炼果#O点化到#P%s#O上,当前修为已经到达了#G十级#O,已经所向披靡,天下无敌！#28", player:GetCharNameLink(),p:GetName()), false)
        end
      else
        if a < 10 then
          NpcSay("少侠召唤兽对修炼果产生了不适感,修为降低了1级~")
          p:ChangeCultivation(-1)
          player:GetItems():RemoveItem(80084,1)	
          player:ChangeMoney(-490000)
        else
          NpcSay("少侠召唤兽似乎对修炼果不感兴趣。")
          player:GetItems():RemoveItem(80084,1)	
          player:ChangeMoney(-490000)
        end
      end
    end
  elseif GetAnswer() == 6 then
    local FBMoney = player:GetSkillLv(394) * 200
	local FBExp = player:GetSkillLv(394) * 1000
    NpcAsk(string.format("法宝提升一级法宝需要\#Y%d\#W W银两和\#Y%d\#W W经验",FBMoney,FBExp))
    SetAnswer(1,"确定提升")
    SetAnswer(7,"离开")
    WaitAnswer(7)
	FBMoney = player:GetSkillLv(394) * 1000000
	FBExp = player:GetSkillLv(394) * 10000000
	if GetAnswer() == 1 and bProcess then
        script:SetSaying(true)
         if player:GetSkillLv(394) >= 15 then
          NpcSay("法宝技能最高15级")
          return
        end
		if player:GetSkillLv(394) >= 10 and player:GetLevel() < 120 then
          NpcSay("低于120级只能学习10级法宝")
          return
        end
        if player:GetMoney() < FBMoney then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W两银子",FBMoney))
          return
        end
        if player:GetExp() < FBExp then
          NpcSay(string.format("本次学习技能需要消耗#P%s#W经验",FBExp))
          return
        end
        
          player:ChangeSkillLv(394,1)
          player:ChangeMoney(-FBMoney)
          player:ChangeExp(-FBExp)
          NpcSay("学习成功")
        
         end
	elseif GetAnswer() == 7 then
	   NpcAsk("老夫近来与众仙家攀谈，有三位仙家愿下凡与少侠一起行走江湖。\r\#Y分别是（斗战胜佛、九天灵雀、九尾妖狐）\r\#A只要少侠拿出一个神兜兜和88万银两#O或者五个神兜兜5万银两\r\#A就可以尝试召唤上仙，但上仙是否愿意与少侠携手，还要看少侠仙缘如何！")
       SetAnswer(1,"我要请斗战胜佛助我，不知上仙愿与我携手江湖")
	   SetAnswer(2,"我要请九天灵雀助我，不知上仙愿与我携手江湖")
	   SetAnswer(3,"我要请九尾妖狐助我，不知上仙愿与我携手江湖")
       SetAnswer(4,"离开")
       WaitAnswer(4)
	   local PartnerGetState = player:GetQuests():GetFlag(55206)
	   local r = math.random(1,150)
	   if PartnerGetState > 0 then
	      r = math.random(20,150)
	   end
	   local MPartner = player:GetPartners():GetCount()
	   local MaxPartner = player:GetMaxPartner()
	   if GetAnswer() == 1 then
	      NpcAsk("#A少侠请选择你要供奉给上仙的贡品！")
          SetAnswer(1,"我要给“斗战胜佛”供奉1个神兜兜和88万银两")
	      SetAnswer(2,"我要给“斗战胜佛”供奉5个神兜兜和5万银两")
          SetAnswer(3,"离开")
          WaitAnswer(3)
		  if GetAnswer() == 1 and bProcess then
		     script:SetSaying(true)
			 if player:GetItems():GetItemCount(40039) < 1 then	    
                NpcSay("没有1个神兜兜,上仙不会跟你回家哟")
                return
             end
		     if MaxPartner <= MPartner then
                NpcSay("召唤兽携带数量已满,请留住一个位置迎接上仙回家吧~！")
			    return
	         end
		     if player:GetMoney() < 880000 then
                NpcSay(string.format("本次召唤上仙需要供奉银两#P%s#W两银子",880000))
                return
             end
			player:ChangeMoney(-880000)
			player:GetItems():RemoveItem(40039,1)
			r = math.random(1,150)
	        if PartnerGetState > 0 then
	           r = math.random(20,150)
	        end
			if r < 2 then
				player:GetPartners():AddPartner(564)
				player:GetQuests():SetFlag(55206, 1)
				script:Rumor(string.format("#23#1#23 %s #O潜心供奉上仙，赢得了#P斗战胜佛#W青睐，愿与这位少侠携手江湖，让我们为他的仙缘鼓掌！", player:GetCharNameLink()), true)
				NpcSay("恭喜少侠，斗战胜佛已同意与少侠携手江湖~！")
			elseif r <= 50 then
				player:GetItems():AddItem(40039,1)
				NpcSay("很遗憾，斗战胜佛很忙，没有收到您的召唤，上仙的家丁把您的一个神兜兜退了回来~！")
			elseif r > 50 then
				player:GetItems():AddItem(61226,1)
				NpcSay("很遗憾，斗战胜佛很忙，没有收到您的召唤，上仙的家丁为了安慰你，给了你一个节日礼包以表歉意~！")
			end
		  elseif GetAnswer() == 2 and bProcess then
		     script:SetSaying(true)
			 if player:GetItems():GetItemCount(40039) < 5 then	    
                NpcSay("没有5个神兜兜,上仙不会跟你回家哟")
                return
             end
		     if MaxPartner <= MPartner then
                NpcSay("召唤兽携带数量已满,请留住一个位置迎接上仙回家吧~！")
			    return
	         end
		     if player:GetMoney() < 50000 then
                NpcSay(string.format("本次召唤上仙需要供奉银两#P%s#W两银子",50000))
                return
             end
			player:ChangeMoney(-50000)
			player:GetItems():RemoveItem(40039,5)
			r = math.random(1,150)
	        if PartnerGetState > 0 then
	           r = math.random(20,150)
	        end
			if r < 3 then
				player:GetPartners():AddPartner(564)
				player:GetQuests():SetFlag(55206, 1)
				script:Rumor(string.format("#23#1#23 %s #O潜心供奉上仙，赢得了#P斗战胜佛#W青睐，愿与这位少侠携手江湖，让我们为他的仙缘鼓掌！", player:GetCharNameLink()), true)
				NpcSay("恭喜少侠，斗战胜佛已同意与少侠携手江湖~！")
			elseif r <= 50 then
				player:GetItems():AddItem(40039,1)
				NpcSay("很遗憾，斗战胜佛很忙，没有收到您的召唤，上仙的家丁把您的1个神兜兜退了回来~！")
			elseif r > 50 then
				player:GetItems():AddItem(61226,3)
				NpcSay("很遗憾，斗战胜佛很忙，没有收到您的召唤，上仙的家丁为了安慰你，给了你3个节日礼包以表歉意~！")
			end
		  end
	   elseif GetAnswer() == 2 then
	      NpcAsk("#A少侠请选择你要供奉给上仙的贡品！")
          SetAnswer(1,"我要给“九天灵雀”供奉1个神兜兜和88万银两")
	      SetAnswer(2,"我要给“九天灵雀”供奉5个神兜兜和5万银两")
          SetAnswer(3,"离开")
          WaitAnswer(3)
		  if GetAnswer() == 1 and bProcess then
		    script:SetSaying(true)
			if player:GetItems():GetItemCount(40039) < 1 then	    
				NpcSay("没有1个神兜兜,上仙不会跟你回家哟")
				return
			end
			if MaxPartner <= MPartner then
				NpcSay("召唤兽携带数量已满,请留住一个位置迎接上仙回家吧~！")
				return
			end
			if player:GetMoney() < 880000 then
				NpcSay(string.format("本次召唤上仙需要供奉银两#P%s#W两银子",880000))
				return
			end
			player:ChangeMoney(-880000)
			player:GetItems():RemoveItem(40039,1)
			r = math.random(1,150)
	        if PartnerGetState > 0 then
	           r = math.random(20,150)
	        end
			if r < 3 then
				player:GetPartners():AddPartner(565)
				player:GetQuests():SetFlag(55206, 1)
				script:Rumor(string.format("#23#1#23 %s #O潜心供奉上仙，赢得了#P九天灵雀#W青睐，愿与这位少侠携手江湖，让我们为他的仙缘鼓掌！", player:GetCharNameLink()), true)
				NpcSay("恭喜少侠，九天灵雀已同意与少侠携手江湖~！")
			elseif r <= 50 then
				player:GetItems():AddItem(40039,1)
				NpcSay("很遗憾，九天灵雀很忙，没有收到您的召唤，上仙的家丁把您的一个神兜兜退了回来~！")
			elseif r > 50 then
				player:GetItems():AddItem(61226,1)
				NpcSay("很遗憾，九天灵雀很忙，没有收到您的召唤，上仙的家丁为了安慰你，给了你一个节日礼包以表歉意~！")
			end
		  elseif GetAnswer() == 2 and bProcess then
		    script:SetSaying(true)
			if player:GetItems():GetItemCount(40039) < 5 then	    
				NpcSay("没有5个神兜兜,上仙不会跟你回家哟")
				return
			end
			if MaxPartner <= MPartner then
				NpcSay("召唤兽携带数量已满,请留住一个位置迎接上仙回家吧~！")
				return
			end
			if player:GetMoney() < 50000 then
				NpcSay(string.format("本次召唤上仙需要供奉银两#P%s#W两银子",50000))
				return
			end
			player:ChangeMoney(-50000)
			player:GetItems():RemoveItem(40039,5)
			r = math.random(1,150)
	        if PartnerGetState > 0 then
	           r = math.random(20,150)
	        end
			if r < 3 then
				player:GetPartners():AddPartner(565)
				player:GetQuests():SetFlag(55206, 1)
				script:Rumor(string.format("#23#1#23 %s #O潜心供奉上仙，赢得了#P九天灵雀#W青睐，愿与这位少侠携手江湖，让我们为他的仙缘鼓掌！", player:GetCharNameLink()), true)
				NpcSay("恭喜少侠，九天灵雀已同意与少侠携手江湖~！")
			elseif r <= 50 then
				player:GetItems():AddItem(40039,1)
				NpcSay("很遗憾，九天灵雀很忙，没有收到您的召唤，上仙的家丁把您的1个神兜兜退了回来~！")
			elseif r > 50 then
				player:GetItems():AddItem(61226,3)
				NpcSay("很遗憾，九天灵雀很忙，没有收到您的召唤，上仙的家丁为了安慰你，给了你3个节日礼包以表歉意~！")
			end
		  end
	   elseif GetAnswer() == 3 then
	      NpcAsk("#A少侠请选择你要供奉给上仙的贡品！")
          SetAnswer(1,"我要给“九尾妖狐”供奉1个神兜兜和88万银两")
	      SetAnswer(2,"我要给“九尾妖狐”供奉5个神兜兜和5万银两")
          SetAnswer(3,"离开")
          WaitAnswer(3)
		  if GetAnswer() == 1 and bProcess then
		    script:SetSaying(true)
			if player:GetItems():GetItemCount(40039) < 1 then	    
				NpcSay("没有1个神兜兜,上仙不会跟你回家哟")
				return
			end
			if MaxPartner <= MPartner then
				NpcSay("召唤兽携带数量已满,请留住一个位置迎接上仙回家吧~！")
				return
			end
			if player:GetMoney() < 880000 then
				NpcSay(string.format("本次召唤上仙需要供奉银两#P%s#W两银子",880000))
				return
			end
			player:ChangeMoney(-880000)
			player:GetItems():RemoveItem(40039,1)
			r = math.random(1,150)
	        if PartnerGetState > 0 then
	           r = math.random(20,150)
	        end
			if r < 3 then
				player:GetPartners():AddPartner(566)
				player:GetQuests():SetFlag(55206, 1)
				script:Rumor(string.format("#23#1#23 %s #O潜心供奉上仙，赢得了#P九尾妖狐#W青睐，愿与这位少侠携手江湖，让我们为他的仙缘鼓掌！", player:GetCharNameLink()), true)
				NpcSay("恭喜少侠，九尾妖狐已同意与少侠携手江湖~！")
			elseif r <= 50 then
				player:GetItems():AddItem(40039,1)
				NpcSay("很遗憾，九尾妖狐很忙，没有收到您的召唤，上仙的家丁把您的一个神兜兜退了回来~！")
			elseif r > 50 then
				player:GetItems():AddItem(61226,1)
				NpcSay("很遗憾，九尾妖狐很忙，没有收到您的召唤，上仙的家丁为了安慰你，给了你一个节日礼包以表歉意~！")
			end
		  elseif GetAnswer() == 2 and bProcess then
		    script:SetSaying(true)
			if player:GetItems():GetItemCount(40039) < 5 then	    
				NpcSay("没有5个神兜兜,上仙不会跟你回家哟")
				return
			end
			if MaxPartner <= MPartner then
				NpcSay("召唤兽携带数量已满,请留住一个位置迎接上仙回家吧~！")
				return
			end
			if player:GetMoney() < 50000 then
				NpcSay(string.format("本次召唤上仙需要供奉银两#P%s#W两银子",50000))
				return
			end
			player:ChangeMoney(-50000)
			player:GetItems():RemoveItem(40039,5)
			r = math.random(1,150)
	        if PartnerGetState > 0 then
	           r = math.random(20,150)
	        end
			if r < 3 then
				player:GetPartners():AddPartner(566)
				player:GetQuests():SetFlag(55206, 1)
				script:Rumor(string.format("#23#1#23 %s #O潜心供奉上仙，赢得了#P九尾妖狐#W青睐，愿与这位少侠携手江湖，让我们为他的仙缘鼓掌！", player:GetCharNameLink()), true)
				NpcSay("恭喜少侠，九尾妖狐已同意与少侠携手江湖~！")
			elseif r <= 50 then
				player:GetItems():AddItem(40039,1)
				NpcSay("很遗憾，九尾妖狐很忙，没有收到您的召唤，上仙的家丁把您的1个神兜兜退了回来~！")
			elseif r > 50 then
				player:GetItems():AddItem(61226,3)
				NpcSay("很遗憾，九尾妖狐很忙，没有收到您的召唤，上仙的家丁为了安慰你，给了你3个节日礼包以表歉意~！")
			end
		  end
	   end
	elseif GetAnswer() == 8 then
	   NpcAsk("老夫听闻近来仙魔两界纷争再起，真是令人唏嘘，听说那魔神蚩尤创造出了蓬莱幻境\r\#R少侠如若冒险赴死前去迎战，老夫可耗费法力把你传送过去，不过每次传送需要给我一个神兜兜作为好处！")
       SetAnswer(1,"我要前去迎战")
       SetAnswer(2,"离开")
       WaitAnswer(2)
	   if GetAnswer() == 1 and bProcess then 
	   script:SetSaying(true)
          if player:GetItems():GetItemCount(40039) < 1 then	    
             NpcSay("没有1个神兜兜,我才不要把你传送过去！")
             return
          end
		  player:GetItems():RemoveItem(40039,1)
		  player:JumpMap(500,6,278)
		  ShowHint("少侠一路走好！逢年过节我会给你烧纸的...#120")
		end
	elseif GetAnswer() == 9 then
	   local QuestFlagA = player:GetQuests():GetFlag(55201) -- 任务链计数
	   local p = player:GetCurPartner()
	   local lv = p:GetPractice()
	   local grow = p:GetGrow()
	   local PracticeUp = GetNativeUpByPractice(lv);
	   local mobid = p:GetMob_id()
	   grow = grow + PracticeUp
	   NpcAsk(string.format("老夫近日获得了一种可将#Y万年灵兽内丹#W点化到召唤兽的方法，使召唤兽的历练提升,少侠可愿意尝试?\r当前任务链已完成：%d/100\r当前参战宠物历练等级：%d\r受历练影响成长最终为：%f\r#O点化成功后，需要让BB进入一次战斗，属性才会变化\r#R注意：目前召唤兽历练仅对RMB宝宝开放！",QuestFlagA,lv,grow))
		SetAnswer(1,"点化方法")
		SetAnswer(2,"我要点化")
		SetAnswer(3,"离开")
		WaitAnswer(3)
		if GetAnswer() == 1 then
			NpcSay("少侠身上若有#Y万年灵兽内丹#W,可携带前来让老夫将它点化到召唤兽身上,点化后召唤兽#A成长#W可大幅度增加\r召唤兽历练点化需求：每次需完成100次任务链。\r点化时,请首先将需要点化的召唤兽设置为参战,\r且历练最高不能超过10级。\r这点化需要老夫消耗一些法力,七七四十九天才可补回来,每次点化都会收取你#P四十九万#W银两。")
		elseif GetAnswer() == 2 and bProcess then 
			script:SetSaying(true)
			
			if player:GetMoney() < 490000 then
				NpcSay("点化这#Y万年灵兽内丹#W可是需要消耗我很多法力,少侠可不能白让我帮你点化,需要银两#P四十九万")
				return
			end
			if player:GetItems():GetItemCount(93000) < 1 then
				NpcSay("少侠身上没有#Y万年灵兽内丹#W,让老夫如何帮你点化?")
				return
			end
			if QuestFlagA < 100 and not(player:GetChar_id() == 1) then
				NpcSay("#A你任务链的历练还不够啊，要加油喔！你的小好伙伴的春天就靠你啦！")
				return
			end
			local Find = 0
			for x = 430, 434 do -- 检测是否RMB 宝宝
	            if mobid == x then
	               Find = 1
	               break
                end
            end
			if Find == 0 then
				 for x = 564, 566 do -- 检测是否限量版 宝宝
	               if mobid == x then
	                  Find = 2
	                  break
                   end
                 end
				 if Find == 2 then
					NpcSay("#A您的召唤兽还不够提升历练的资格！")
					return
				 end
			end
			if Find == 0 then
				 for x = 597, 599 do -- 检测是否限量版 宝宝
	               if mobid == x then
	                  Find = 2
	                  break
                   end
                 end
				 if Find == 2 then
					NpcSay("#A您的召唤兽还不够提升历练的资格！")
					return
				 end
			end
			if Find == 0 then
			   for x = 580, 600 do -- 检测是否限量版 宝宝
	               if mobid == x and p:GetGrow() > 1.299 then
	                  Find = 1
	                  break
                   end
               end
			end
			if Find ~= 1 then
			   NpcSay("#A您的召唤兽还不够提升历练的资格！")
			   return
			end
			
      local r = math.random(1,100)
      local a = math.random(1,100)
      local i = 0
      if lv == 0 then
        i = 100
      elseif lv == 1 then
        i = 95
      elseif lv == 2 then
        i = 90
      elseif lv == 3 then
        i = 85
      elseif lv == 4 then
        i = 80
      elseif lv == 5 then 
        i = 75
      elseif lv == 6 then
        i = 70
      elseif lv == 7 then 
        i = 65
      elseif lv == 8 then
        i = 60
      elseif lv == 9 then
        i = 50
      elseif lv == 10 then
        i = 0
      end
	  if player:GetChar_id() > 1 then
	  player:GetQuests():SetFlag(55201, QuestFlagA - 100)
	  end
      if r <= i then
        NpcSay("少侠的召唤兽天资聪慧,成功将万年灵兽内丹融入进召唤兽的历练中。可喜可贺~！")
        p:ChangePractice(1)
        player:GetItems():RemoveItem(93000,1)	
        player:ChangeMoney(-490000)
        if lv == 6 then
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y万年灵兽内丹#O点化到#P%s#O上,当前历练已经到达了#G七级#O,真是所向披靡,无人能挡！#46", player:GetCharNameLink(),p:GetName()), false)
        elseif lv == 7 then  
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y万年灵兽内丹#O点化到#P%s#O上,当前历练已经到达了#G八级#O,真是所向披靡,无人能挡！#24", player:GetCharNameLink(),p:GetName()), false)
        elseif lv == 8 then  
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y万年灵兽内丹#O点化到#P%s#O上,当前历练已经到达了#G九级#O,真是所向披靡,无人能挡！#97", player:GetCharNameLink(),p:GetName()), false)
        elseif lv == 9 then  
          script:Rumor(string.format("%s #O在仙人袁天罡的帮助下,成功将#Y万年灵兽内丹#O点化到#P%s#O上,当前历练已经到达了#G十级#O,已经所向披靡,天下无敌！#28", player:GetCharNameLink(),p:GetName()), false)
        end
      else
          NpcSay("少侠召唤兽似乎对万年灵兽内丹不感兴趣。")
          player:GetItems():RemoveItem(93000,1)	
          player:ChangeMoney(-490000)
      end
    end
  end
  
  
end
        
    
function GetNativeUpByPractice(Practice)
	if Practice < 1 or Practice > 10 then
		return 0;
	end

	local NativeUpByPractice = {0.1, 0.15, 0.2, 0.25, 0.3, 0.35, 0.4, 0.45, 0.5, 0.6};
	return NativeUpByPractice[Practice];
end










-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00702)
