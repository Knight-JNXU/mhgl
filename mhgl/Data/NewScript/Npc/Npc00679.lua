
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00679 = {							-- 孙小红
	npc_id = 679,						-- NPC ID
	name = GetNpcName(679),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00679:Talk(bProcess) 
  NpcAsk("我是发放通缉令的师爷")
  SetAnswer(1,"我要查询在线的通缉犯")
  SetAnswer(2,"我要抓通缉犯")
  SetAnswer(3,"我还有事,再见")
  WaitAnswer(3)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end

        



--[[
  NpcSay({"",
          "",
          "",
          "",
          ""})
        end--]]









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00679)
