
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00444 = {							-- 孙小红
	npc_id = 444,						-- NPC ID
	name = GetNpcName(444),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00444:Talk(bProcess) 
  NpcAsk({"俗话说“对症下药”,这药可是不能乱吃的。",
          "药材好,药材好。",
          "佛手可以去长安、西梁女国和朱紫国的药店买哦",
          "拉肚子,选好药,选药也要有诀窍。"})
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 7)
  end
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00444)
