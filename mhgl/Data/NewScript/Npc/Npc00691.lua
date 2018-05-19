
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00691 = {							-- 孙小红
	npc_id = 691,						-- NPC ID
	name = GetNpcName(691),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00691:Talk(bProcess) 
  NpcAsk("这里出售供奉和祭祀用品。")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 612)
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
AddNpcTable(Npc00691)
