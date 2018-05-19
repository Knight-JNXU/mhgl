
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00697 = {							-- 孙小红
	npc_id = 697,						-- NPC ID
	name = GetNpcName(697),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00697:Talk(bProcess) 
  local STY = player:GetItems():GetItemCount(60714)--四级无瑕太阳石
  local WTY = player:GetItems():GetItemCount(60715)--五级无瑕太阳石
  local LTY = player:GetItems():GetItemCount(60716)--六级无瑕太阳石
  local QTY = player:GetItems():GetItemCount(60717)--七级无瑕太阳石
  player:GetItems():RemoveItem(60714,STY)
  player:GetItems():AddItem(60714,STY)
  player:GetItems():RemoveItem(60715,WTY)
  player:GetItems():AddItem(60715,WTY)
  player:GetItems():RemoveItem(60716,LTY)
  player:GetItems():AddItem(60716,LTY)
  player:GetItems():RemoveItem(60717,QTY)
  player:GetItems():AddItem(60717,QTY)
  local SYL = player:GetItems():GetItemCount(60724)--四级无瑕月亮石
  local WYL = player:GetItems():GetItemCount(60725)--五级无瑕月亮石
  local LYL = player:GetItems():GetItemCount(60726)--六级无瑕月亮石
  local QYL = player:GetItems():GetItemCount(60727)--七级无瑕月亮石
  player:GetItems():RemoveItem(60724,SYL)
  player:GetItems():AddItem(60724,SYL)
  player:GetItems():RemoveItem(60725,WYL)
  player:GetItems():AddItem(60725,WYL)
  player:GetItems():RemoveItem(60726,LYL)
  player:GetItems():AddItem(60726,LYL)
  player:GetItems():RemoveItem(60727,QYL)
  player:GetItems():AddItem(60727,QYL)
  local SMN = player:GetItems():GetItemCount(60734)--四级无瑕玛瑙石
  local WMN = player:GetItems():GetItemCount(60735)--五级无瑕玛瑙石
  local LMN = player:GetItems():GetItemCount(60736)--六级无瑕玛瑙石
  local QMN = player:GetItems():GetItemCount(60737)--七级无瑕玛瑙石
  player:GetItems():RemoveItem(60734,SMN)
  player:GetItems():AddItem(60734,SMN)
  player:GetItems():RemoveItem(60735,WMN)
  player:GetItems():AddItem(60735,WMN)
  player:GetItems():RemoveItem(60736,LMN)
  player:GetItems():AddItem(60736,LMN)
  player:GetItems():RemoveItem(60737,QMN)
  player:GetItems():AddItem(60737,QMN)
  local SSM = player:GetItems():GetItemCount(60744)--四级无瑕神秘石
  local WSM = player:GetItems():GetItemCount(60745)--五级无瑕神秘石
  local LSM = player:GetItems():GetItemCount(60746)--六级无瑕神秘石
  local QSM = player:GetItems():GetItemCount(60747)--七级无瑕神秘石
  player:GetItems():RemoveItem(60744,SSM)
  player:GetItems():AddItem(60744,SSM)
  player:GetItems():RemoveItem(60745,WSM)
  player:GetItems():AddItem(60745,WSM)
  player:GetItems():RemoveItem(60746,LSM)
  player:GetItems():AddItem(60746,LSM)
  player:GetItems():RemoveItem(60747,QSM)
  player:GetItems():AddItem(60747,QSM)
  local SSL = player:GetItems():GetItemCount(60754)--四级无瑕舍利子
  local WSL = player:GetItems():GetItemCount(60755)--五级无瑕舍利子
  local LSL = player:GetItems():GetItemCount(60756)--六级无瑕舍利子
  local QSL = player:GetItems():GetItemCount(60757)--七级无瑕舍利子
  player:GetItems():RemoveItem(60754,SSL)
  player:GetItems():AddItem(60754,SSL)
  player:GetItems():RemoveItem(60755,WSL)
  player:GetItems():AddItem(60755,WSL)
  player:GetItems():RemoveItem(60756,LSL)
  player:GetItems():AddItem(60756,LSL)
  player:GetItems():RemoveItem(60757,QSL)
  player:GetItems():AddItem(60757,QSL)
  local SHB = player:GetItems():GetItemCount(60764)--四级无瑕黑宝石
  local WHB = player:GetItems():GetItemCount(60765)--五级无瑕黑宝石
  local LHB = player:GetItems():GetItemCount(60766)--六级无瑕黑宝石
  local QHB = player:GetItems():GetItemCount(60767)--七级无瑕黑宝石
  player:GetItems():RemoveItem(60764,SHB)
  player:GetItems():AddItem(60764,SHB)
  player:GetItems():RemoveItem(60765,WHB)
  player:GetItems():AddItem(60765,WHB)
  player:GetItems():RemoveItem(60766,LHB)
  player:GetItems():AddItem(60766,LHB)
  player:GetItems():RemoveItem(60767,QHB)
  player:GetItems():AddItem(60767,QHB)
  local SGM = player:GetItems():GetItemCount(60774)--四级无瑕光芒石
  local WGM = player:GetItems():GetItemCount(60775)--五级无瑕光芒石
  local LGM = player:GetItems():GetItemCount(60776)--六级无瑕光芒石
  local QGM = player:GetItems():GetItemCount(60777)--七级无瑕光芒石
  player:GetItems():RemoveItem(60774,SGM)
  player:GetItems():AddItem(60774,SGM)
  player:GetItems():RemoveItem(60775,WGM)
  player:GetItems():AddItem(60775,WGM)
  player:GetItems():RemoveItem(60776,LGM)
  player:GetItems():AddItem(60776,LGM)
  player:GetItems():RemoveItem(60777,QGM)
  player:GetItems():AddItem(60777,QGM)
  local SLB = player:GetItems():GetItemCount(60784)--四级无瑕蓝宝石
  local WLB = player:GetItems():GetItemCount(60785)--五级无瑕蓝宝石
  local LLB = player:GetItems():GetItemCount(60786)--六级无瑕蓝宝石
  local QLB = player:GetItems():GetItemCount(60787)--七级无瑕蓝宝石
  player:GetItems():RemoveItem(60784,SLB)
  player:GetItems():AddItem(60784,SLB)
  player:GetItems():RemoveItem(60785,WLB)
  player:GetItems():AddItem(60785,WLB)
  player:GetItems():RemoveItem(60786,LLB)
  player:GetItems():AddItem(60786,LLB)
  player:GetItems():RemoveItem(60787,QLB)
  player:GetItems():AddItem(60787,QLB)
  local SLB = player:GetItems():GetItemCount(60784)--四级无瑕蓝宝石
  local WLB = player:GetItems():GetItemCount(60785)--五级无瑕蓝宝石
  local LLB = player:GetItems():GetItemCount(60786)--六级无瑕蓝宝石
  local QLB = player:GetItems():GetItemCount(60787)--七级无瑕蓝宝石
  player:GetItems():RemoveItem(60784,SLB)
  player:GetItems():AddItem(60784,SLB)
  player:GetItems():RemoveItem(60785,WLB)
  player:GetItems():AddItem(60785,WLB)
  player:GetItems():RemoveItem(60786,LLB)
  player:GetItems():AddItem(60786,LLB)
  player:GetItems():RemoveItem(60787,QLB)
  player:GetItems():AddItem(60787,QLB)
  NpcAsk("听说有的帮派在研究打造之术,想通过神兵利器称霸武林。#Y若要制造,修理召唤兽装备及坐骑装饰品请在大铁炉哪里操作。\r#P【注意事项】由于本次接到线报,无暇宝石被修改,所以我会强制性的将少侠的需要调整的宝石从新修整！\r#O当少侠点击咨询打造方法的时候,我会强制性转换！")
  SetAnswer(1,"咨询打造方法")
  SetAnswer(2,"有什么需要帮忙的(打工增加熟练度)")
  SetAnswer(3,"精铁换取熟练度")
  SetAnswer(4,"查看熟练度")
  SetAnswer(5,"拆分宝石")
  
  SetAnswer(6,"我只是随便看看")
  WaitAnswer(6)
  if GetAnswer() == 1 then  
    NpcAsk("我这里可以打造武器,只需要有制造指南书和铁变可以。\r#Y【注意事项】由于本次接到线报,无暇宝石被修改,所以我会强制性的将少侠的需要调整的宝石从新修整！")
    SetAnswer(1,"我要打造")
    SetAnswer(2,"我要修理")
    SetAnswer(3,"镶嵌宝石")
    SetAnswer(4,"解绑装备")
    SetAnswer(5,"离开")
    WaitAnswer(5)
    if GetAnswer() == 1 then
      NpcAsk("请问需要打造多少级的武器?")
      SetAnswer(1,"0级-80级武器")
      SetAnswer(2,"90级-110级武器")
      SetAnswer(3,"120级-150级武器")
    SetAnswer(6,"90-140强化打造")	
    SetAnswer(7,"150-160强化打造")	  
      SetAnswer(14,"离开")
      WaitAnswer(14)
      if GetAnswer() == 1 and bProcess then  
        script:SetSaying(true)
        script:OpenInterface("mixshop", 7)
	    elseif GetAnswer() == 2 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 8)
	    elseif GetAnswer() == 3 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 9)
	    elseif GetAnswer() == 6 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 46)
	    elseif GetAnswer() == 7 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 50)		  
	    end
	  elseif GetAnswer() == 2 and bProcess then
	    script:OpenInterface("mixshop", 1)
	  elseif GetAnswer() == 3 and bProcess then 
	    script:OpenInterface("mixshop", 5)
	  elseif GetAnswer() == 4 and bProcess then 
	    script:OpenInterface("mixshop", 21)
	  end
	elseif GetAnswer() == 5 then
	  if IsProcess() then
	    script:OpenInterface("mixshop", 6)
	  end
	end
end
	  


 
 
 
 
 
 
 
 
 
 
 





-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00697)
