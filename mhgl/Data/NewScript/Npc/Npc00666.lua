
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00666 = {							-- 孙小红
	npc_id = 666,						-- NPC ID
	name = GetNpcName(666),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00666:Talk(bProcess) 
  NpcAsk({"我的店里有好酒,保准让客观饮后忘却一切烦恼！\r\#Y炼药等级：最低55级才能炼药，金香玉、五龙丹需要炼药100级方能炼制。",
          "小店有干净舒适的厢房,正适合客观您好好休息。\r\#Y炼药等级：最低55级才能炼药，金香玉、五龙丹需要炼药100级方能炼制。",
          "我们店里的酒是天下一品,连皇上喝过都赞不绝口！\r\#Y炼药等级：最低55级才能炼药，金香玉、五龙丹需要炼药100级方能炼制。"
          })
  SetAnswer(1,"我要借用厨房炼药")
  SetAnswer(2,"我什么都不想做")
  WaitAnswer(2)
  if GetAnswer() == 1 and bProcess then
    script:SetSaying(true)
    script:OpenInterface("mixshop", 17)
  end
end












-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00666)
