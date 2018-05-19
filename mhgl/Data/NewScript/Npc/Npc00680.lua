
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00680 = {							-- 孙小红
	npc_id = 680,						-- NPC ID
	name = GetNpcName(680),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00680:Talk(bProcess) 
  NpcAsk("如今大唐盛世,各地本该安居乐业,一片祥和,但是最近各地突然出现了一些作乱的贼人,扰乱大唐安宁,少侠可愿出一份力,帮我抓住贼人,调查清楚事情的真相？")
  SetAnswer(1,"维护大唐和平,人人有责,快给我安排任务吧！")
  SetAnswer(2,"我来领取种族命盘")
  SetAnswer(3,"贼人可都是亡命之徒啊,我还是保命要紧")
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
AddNpcTable(Npc00680)
