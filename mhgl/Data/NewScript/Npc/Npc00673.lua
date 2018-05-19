
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00673 = {							-- 孙小红
	npc_id = 673,						-- NPC ID
	name = GetNpcName(673),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00673:Talk(bProcess) 
 --[[ NpcAsk("音乐能陶冶人的情操")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

  NpcAsk({"人生在世不称意,可有哪位姑娘懂俺的心意？",
          "今宵有酒今宵醉,就让俺醉这一回吧！",
          "这里真是美女如云啊，看的我眼睛都花了。",
          "给我找最漂亮的姑娘出来，大爷我有的是钱！"})
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
AddNpcTable(Npc00673)
