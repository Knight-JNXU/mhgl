
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00677 = {							-- 孙小红
	npc_id = 677,						-- NPC ID
	name = GetNpcName(677),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00677:Talk(bProcess) 
 --[[ NpcAsk("音乐能陶冶人的情操")
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]

  NpcAsk({"本楼可是正规娱乐场所,客观您是要品茶还是饮酒啊？",
          "这位大爷一看就知道是怜香惜玉之人。我这儿的怜香惜玉两位姑娘能歌善舞,你去楼上看看？",
          "我这儿有怜香惜玉两位当红姑娘,琴棋书画样样都会,您去楼上看看？",
          "良辰美景，花好月圆，这位客官喜欢哪位姑娘呀？我这儿的怜香惜玉两位姑娘能歌善舞，您去楼上看看？"})
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
AddNpcTable(Npc00677)
