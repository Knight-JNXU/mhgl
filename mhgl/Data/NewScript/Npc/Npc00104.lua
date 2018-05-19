
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00105 = {							-- 孙小红
	npc_id = 105,						-- NPC ID
	name = GetNpcName(105),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00105:Talk(bProcess) 
  NpcAsk("我可以送你去#R北俱芦洲#W,你要不要去呢?"..RandomLine(10))
  SetAnswer(1,"是的,我要去")
  SetAnswer(2,"我还要逛逛")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    player:JumpMap(11,118,408)
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
AddNpcTable(Npc00105)
