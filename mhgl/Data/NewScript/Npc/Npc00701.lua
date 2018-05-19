
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00701 = {							-- 孙小红
	npc_id = 701,						-- NPC ID
	name = GetNpcName(701),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00701:Talk(bProcess) 
  NpcAsk("客观需要什么药,治病的灵药,强身的补药,小店都有。药有等级之分,不同的等级在道具栏内能叠加的数量也不一样。")
  SetAnswer(1,"购买")
  SetAnswer(2,"我要炼药")
  SetAnswer(3,"离开")
  WaitAnswer(3)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 500)
	    elseif GetAnswer() == 2 and bProcess then  
        script:SetSaying(true)
	      script:OpenInterface("mixshop", 17)	
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
AddNpcTable(Npc00701)
