
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00464 = {							-- 孙小红
	npc_id = 464,						-- NPC ID
	name = GetNpcName(464),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00464:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"道生一，一生二，二生三，三生万物。",
            "难！难！难！道最玄，莫把金丹做等闲。",
            "当年有志学长生，今日方知道行精，运动乾坤颠倒理，转移日月互为明。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00464)
