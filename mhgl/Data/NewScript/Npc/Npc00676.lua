
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00675 = {							-- 孙小红
	npc_id = 675,						-- NPC ID
	name = GetNpcName(675),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00675:Talk(bProcess) 
 --[[ NpcAsk("音乐能陶冶人的情操")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

  NpcAsk({"客人想听小曲儿还是看歌舞？",
          "醉看人间变色,青楼梦,诉与谁知?",
          "客观,你可否还记得当年濯垢泉边的惜玉姑娘？",
          "天已凉了,夜已深了,萧瑟的秋风掠过寂寞的双肩,难道你不觉得冷吗？"})
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
AddNpcTable(Npc00675)
