
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00458 = {							-- 孙小红
	npc_id = 458,						-- NPC ID
	name = GetNpcName(458),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00458:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"听傲来国向右上走可以到花果山,据说最近还有人见过齐天大圣呢。",
            "傲来境内风景秀丽，物产丰富。",
            "我是来这里祈求娘娘保佑傲来国风调雨顺的。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00458)
