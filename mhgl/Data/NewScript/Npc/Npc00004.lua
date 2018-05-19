-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00004 = {							-- 孙小红
--	npc_id = 4,						-- NPC ID
--	name = GetNpcName(4),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00004:Talk(bProcess)
  NpcAsk("建业虽小,可也是样样齐全,什么都有,货栈边上那个王大嫂做的烤鸭真的好吃。")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不像做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 2)
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
AddNpcTable(Npc00004)
