
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00699 = {							-- 孙小红
	npc_id = 699,						-- NPC ID
	name = GetNpcName(699),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00699:Talk(bProcess) 
  NpcAsk("读书破万卷,下笔如有神")
  SetAnswer(1,"选择我要做的事情")
  SetAnswer(2,"只是来看看")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    NpcAsk("选择要做的事情")
    SetAnswer(1,"打工赚钱")
    SetAnswer(2,"神兵图鉴")
    SetAnswer(3,"灵宝图鉴")
    SetAnswer(10,"防具图鉴")
    SetAnswer(4,"翰墨丹青")
    SetAnswer(5,"扩建图")
    SetAnswer(6,"风水符")
    SetAnswer(7,"修业点设置")
    SetAnswer(8,"灵饰图鉴")
    SetAnswer(9,"我什么都不想做")
    WaitAnswer(9)
    if GetAnswer() == 1 and bProcess then
      script:SetSaying(true)
      if player:GetVP() < 40 then
        NpcSay("体力不足40点")
        return
      end
      player:ChangeVP(-40)
      ShowHint("#W书店打工,获得3000两银子#89")	
      player:ChangeMoney(3000)	
    
    elseif GetAnswer() == 2 and bProcess then
      script:SetSaying(true)
      if player:GetVP() < 100 then
        NpcSay("体力不足100点")
        return
      end
      player:ChangeVP(-100)
      player:GetItems():AddItem(20619, 1)
      ShowHint("#W获得神兵图鉴")
    elseif GetAnswer() == 3 and bProcess then
      script:SetSaying(true)
      if player:GetVP() < 100 then
        NpcSay("体力不足100点")
        return
      end
      player:ChangeVP(-100)
      player:GetItems():AddItem(20621, 1)
      ShowHint("#W获得灵宝图鉴")
    elseif GetAnswer() == 8 and bProcess then
      script:SetSaying(true)
      if player:GetVP() < 100 then
        NpcSay("体力不足100点")
        return
      end
	  player:GetItems():AddItem(60261, 1)
      player:ChangeVP(-100)
      ShowHint("#W获得灵饰图鉴#89")	

   
    elseif GetAnswer() == 10 and bProcess then
      script:SetSaying(true)
      script:SetSaying(true)
      if player:GetVP() < 150 then
        NpcSay("体力不足150点")
        return
      end
      player:ChangeVP(-150)
      player:GetItems():AddItem(20620, 1)
      ShowHint("#W获得防具图鉴")
    end
  end
end

   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00699)
