
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00279 = {							-- 孙小红
	npc_id = 279,						-- NPC ID
	name = GetNpcName(279),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00279:Talk(bProcess) 
  NpcAsk("")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 604)
  elseif GetAnswer() == 2 then
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

   



 
 
 
 
 
 
 
 
 
 
 
 
 --[[
        
  NpcSay({"",
          "",
          "",
          ""})
        end

--]]







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00279)
