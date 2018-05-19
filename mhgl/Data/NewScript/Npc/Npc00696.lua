
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00696 = {							-- 孙小红
	npc_id = 696,						-- NPC ID
	name = GetNpcName(696),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00696:Talk(bProcess) 
  NpcAsk("老夫做的是小本买卖,只求薄利多销,便民利民。")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 100)
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
AddNpcTable(Npc00696)
