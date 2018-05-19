
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00013 = {							-- 孙小红
	npc_id = 13,						-- NPC ID
	name = GetNpcName(13),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00013:Talk(bProcess)
  NpcAsk("各位观众看过来,老夫擅长土木之术,制造的仓库坚固耐用又便宜,为促销现在可赠送你一个免费仓库,还可以租借召唤兽仓库,用过觉得好再来光顾老夫,多租借几个吧.")
  SetAnswer(1,"我要进行仓库操作")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    if bProcess then  
      player:OpenWareHouse()
    end
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
AddNpcTable(Npc00013)
