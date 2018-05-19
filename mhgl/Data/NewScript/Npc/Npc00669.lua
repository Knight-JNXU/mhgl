
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00669 = {							-- 孙小红
	npc_id = 669,						-- NPC ID
	name = GetNpcName(669),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00669:Talk(bProcess) 
  NpcAsk("我裁缝的衣服,穿过的人没有不说好的！我这一眼看过去,不用尺,就知道你的三围是多少！")
  SetAnswer(1,"咨询打造方法")
  SetAnswer(2,"有什么需要帮忙的(打工增加熟练度")
  SetAnswer(3,"查看熟练度")
  SetAnswer(4,"我只是随便看看")
  WaitAnswer(4)
  if GetAnswer() == 1 then 
    NpcAsk("我这里可以打造防具,只需要有制造指南书和铁变可以。")
    SetAnswer(1,"我要打造")
    SetAnswer(2,"离开")
    WaitAnswer(2)
    if GetAnswer() == 1 then
      NpcAsk("请问需要打造多少级的防具?")
      SetAnswer(1,"0级-110级防具")
      SetAnswer(2,"110级-140级防具")
      SetAnswer(3,"强化打造防具")	  
      SetAnswer(13,"离开")
      WaitAnswer(13)
      if GetAnswer() == 1 and bProcess then  
        script:SetSaying(true)
        script:OpenInterface("mixshop", 10)
	    elseif GetAnswer() == 2 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 12)
	    elseif GetAnswer() == 3 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 47)		  
	    end
	  end
	end
end

    

 






-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00669)
