
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00456 = {							-- 孙小红
	npc_id = 456,						-- NPC ID
	name = GetNpcName(456),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00456:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"听说附近有座仙山，名叫“花果山”，山庄住着齐天大圣。",
            "社区建设如火如茶，我还得在坚持几年。",
            "傲来国地域广阔，物产丰富。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00456)
