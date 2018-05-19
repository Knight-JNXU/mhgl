
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00371 = {							-- 杵官王
	npc_id = 371,						-- NPC ID
	name = GetNpcName(371),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00371:Talk(bProcess) 
  NpcAsk("客官要看看小人特制的烟花么？祖上流传下来的小手艺，一分钱一分货，端的是童叟无欺！组合烟花的制作额外需要消耗30体力和30活力哦")
  SetAnswer(1,"购买 ")
  SetAnswer(2,"我想看一下当前各种烟花的价格 ")
  SetAnswer(3,"购买组个烟花 ")
  SetAnswer(4,"什么是组合烟花 ")
  SetAnswer(5,"离开 ")
  WaitAnswer(5)
  if GetAnswer() == 1 then
    if IsProcess() then
      script:OpenInterface("shop", 611);
    end
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(1,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00371)
