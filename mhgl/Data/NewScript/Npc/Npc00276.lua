
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00276 = {							-- 孙小红
	npc_id = 276,						-- NPC ID
	name = GetNpcName(276),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00276:Talk(bProcess) 
  NpcAsk("我没事就去长安书店给颜如玉打工,出体力赚钱一点都不难。")
  SetAnswer(1,"离开")
  WaitAnswer(1)
end
   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00276)
