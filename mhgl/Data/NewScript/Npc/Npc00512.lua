
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00512 = {							-- 孙小红
	npc_id = 512,						-- NPC ID
	name = GetNpcName(512),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00512:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"本来我女儿和村里的张小二挺好的，那小伙子人也挺踏实，我们全家都看得顺眼，不知怎么突然变成这样，唉。",
            "那猪头去取经也有些时日了，也不知可曾对我女儿变心？",
            "那猪头总来骚扰我家女儿，这可如何是好。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end
-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00512)
