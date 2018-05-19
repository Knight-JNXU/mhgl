
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00703 = {							-- 孙小红
	npc_id = 703,						-- NPC ID
	name = GetNpcName(703),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00703:Talk(bProcess) 
--[[
  NpcAsk({"我的店里有好酒,保准让客观饮后忘却一切烦恼！",
          "小店有干净舒适的厢房,正适合客观您好好休息。",
          "我们店里的酒是天下一品,连皇上喝过都赞不绝口！"
          })
  SetAnswer(1,"购买")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("shop", 1)
  end
end--]]


  NpcAsk({"这位朋友天资不错,是个练武的好材料。拜师了没有？没有的话可以找门派传送人或者城门口的长安导游了解一下各门派的情况",
          "强身健体,保家卫国,年轻人多学点武艺没错的。Game里的技能不仅仅只限于师门技能,还有剧情技能、辅助技能等",
          "练武是为了强身健体,可不是用来恃强凌弱的！恶意PK会受到上天的惩罚哦~！",
          "一巧破十拙,一力破十巧,一会破十力,一精破十会,此乃习武之道也。",
          "未曾学艺先学礼,未曾习武先习德。要想练好武艺,先要学会做人。"})

  SetAnswer(1,"离开")
  WaitAnswer(1)
end







-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00703)
