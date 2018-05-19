-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00024 = {							-- 孙小红
	npc_id = 24,						-- NPC ID
	name = GetNpcName(24),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00024:Talk(bProcess)
  NpcAsk("我鉴定一切武器,按物品收费,只要直接给我就好了")
  SetAnswer(1,"鉴定")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    NpcSay("鉴定装备系统已经关闭,请使用神兵鉴赏鉴定武器")
  else
    NpcAsk("少侠后会有期！"..RandomLine(10))
    SetAnswer(1, "再见")
    WaitAnswer(1)
  end
end

function RandomLine(MaxLine)
    local r = math.random(3,MaxLine)
	local t = ""
    for i=1, r do
		t = tostring(t)..tostring("\r.")
	end
	return t
end


-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00024)
