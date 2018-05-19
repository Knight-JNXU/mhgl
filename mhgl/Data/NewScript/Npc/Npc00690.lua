
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00690 = {							-- 孙小红
	npc_id = 690,						-- NPC ID
	name = GetNpcName(690),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00690:Talk(bProcess) 
  NpcAsk("我的事情太多了,忙不过来,请优先选择一件你最想做的事情吧。(如果你想做的事情不在列表中,请选择#Y“我要做其他事情”#W)")
  SetAnswer(1,"丹青之道")
  SetAnswer(2,"翰墨之道")
  SetAnswer(3,"我要做其他事情")
  SetAnswer(4,"我点错了")
  WaitAnswer(4)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
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
AddNpcTable(Npc00690)
