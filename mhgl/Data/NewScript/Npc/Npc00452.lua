
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00452 = {							-- 孙小红
	npc_id = 452,						-- NPC ID
	name = GetNpcName(452),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00452:Talk(bProcess) 
  local tx = npc:GetCurPosX()
  local ty = npc:GetCurPosX()
  local x = player:GetCurPosX()
  local y = player:GetCurPosY()
  if PosInRange(tx, ty, x, y, 5) then
    NpcAsk({"识人如同品茶,观色闻香尚不够,还需切身细细体会和感受。",
            "春茶苦,夏茶涩,品茶当品秋白露，",
            "夏季宜饮绿,冬季宜饮红,春秋两季宜饮花,此乃养生之道也。"})
    SetAnswer(1,"离开")
    WaitAnswer(1)
  else
    NpcAsk("这么远对别人说话可是不礼貌的行为哟")
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end


   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00452)
