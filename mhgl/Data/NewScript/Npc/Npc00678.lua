
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00678 = {							-- 孙小红
	npc_id = 678,						-- NPC ID
	name = GetNpcName(678),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00678:Talk(bProcess) 
 --[[ NpcAsk("音乐能陶冶人的情操")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

  NpcAsk({"作奸犯科可是要下大狱的！",
          "最近大唐国境总有强盗山贼出没,衙门里的人手快不够用了。",
          "告状的话先把状纸准备好了到堂外排队去，别乱闯。",
          "公堂禁地,闲杂人等不许乱闯。"})
	SetAnswer(1,"离开")
	WaitAnswer(1)
end        



--[[
  NpcSay({"",
          "",
          "",
          "",
          ""})
        end--]]









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00678)
