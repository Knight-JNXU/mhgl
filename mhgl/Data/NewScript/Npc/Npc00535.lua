Preload("Quest10039.lua")
Preload("Quest10040.lua")

-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00535 = {							-- 孙小红
	npc_id = 535,						-- NPC ID
	name = GetNpcName(535),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00535:Talk(bProcess)
  local quest_ids = {10039}
  if HasQuest(quest_ids) then
    NpcAsk("唉,前两天居然有个自称白琉璃的女子,抢走了寺中珍藏的佛光舍利子,还打伤了从金山寺来我寺交流佛法的法明长老,幸亏我空慈师父法术精神,才暂时将她驱走了……")
    SetAnswer(1,"什么,她还搭上了金山寺的法明长老,这可如何是好？")
    SetAnswer(2,"什么人敢来化生寺抢东西,太嚣张了,我去问问空慈方丈,看有什么可帮忙的！")
    SetAnswer(3,"离开")
    WaitAnswer(3)
    if GetAnswer() == 1 then
      if HasQuest(10039) then
        if Quest10039:Return() then
          Quest10040:Take()
        end
      end
    end
  else
    NpcAsk({"得即是失，失即是得，世事本事过眼云烟，不必太过看重。",
          "施主是来上香的吗？?",
          "一花一世界，一叶一如来。",
          "法明长老的病情越来越重了，这可如何是好......"
          })
    SetAnswer(1,"离开")
    WaitAnswer(1)
  end
end











-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00535)
