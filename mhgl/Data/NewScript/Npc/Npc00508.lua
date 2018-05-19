
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00508 = {							-- 孙小红
	npc_id = 508,						-- NPC ID
	name = GetNpcName(508),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00508:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"小白龙估计已经被天谴了吧，哈哈哈哈。",
            "别想在我背后做坏事，我有十八只眼睛盯着你呢。",
            "只要我成为天命取经人取得真经，将来就能由魔转仙，哈哈哈"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00508)
