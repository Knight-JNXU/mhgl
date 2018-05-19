
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00671 = {							-- 孙小红
	npc_id = 671,						-- NPC ID
	name = GetNpcName(671),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00671:Talk(bProcess) 
  NpcAsk("别小看猜拳这小小技能,要想常胜,可是要揣摩对手心里的,你能胜得了我么？")
  SetAnswer(1,"让我挑战你看看")
  SetAnswer(2,"路过,点错了")
  WaitAnswer(2)
  if GetAnswer() == 1 then
    NpcAsk("欢迎进行数字猜大小的玩法,在玩之前建议您看看游戏规则")
    SetAnswer(1,"游戏规则")
    SetAnswer(2,"游戏开始")
    SetAnswer(3,"无聊")
    WaitAnswer(3)
    if GetAnswer() == 1 then
      NpcSay("游戏开始前,请各位玩家进行选择开出的数字是大还是小,若是数字678910,那么本次开出的便是大,若是12345,那么便是小,每次下注为10万")
    elseif GetAnswer() == 2 then
      local i = math.random(1,10)
      NpcAsk("请进行下注吧")
      SetAnswer(1,"大")
      SetAnswer(2,"小")
      SetAnswer(3,"等等")
      WaitAnswer(3)
      if GetAnswer() == 1 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 100000 then
          NpcSay("没钱玩什么?")
          return
        end
        if i >= 7 then
          NpcSay("真是财神附体,本次开出的是大,赢得了10万")
          player:ChangeMoney(100000)	
        else
          NpcSay("本次开出的是小,输掉了10万")
          player:ChangeMoney(-100000)
        end	
      elseif GetAnswer() == 2 and bProcess then 
        script:SetSaying(true)
        if player:GetMoney() < 100000 then
          NpcSay("没钱玩什么?")
          return
        end
        if i <= 4 then
          NpcSay("真是财神附体,本次开出的是小,赢得了10万")
          player:ChangeMoney(100000)	
        else
          NpcSay("本次开出的是大,输掉了10万")
          player:ChangeMoney(-100000)
        end	
      end
    end
  end
end


--[[  NpcSay({"这位朋友天资不错,是个练武的好材料。拜师了没有？没有的话可以找门派传送人或者城门口的长安导游了解一下各门派的情况",
          "强身健体,保家卫国,年轻人多学点武艺没错的。Game里的技能不仅仅只限于师门技能,还有剧情技能、辅助技能等",
          "练武是为了强身健体,可不是用来恃强凌弱的！恶意PK会受到上天的惩罚哦~！",
          "一巧破十拙,一力破十巧,一会破十力,一精破十会,此乃习武之道也。",
          "未曾学艺先学礼,未曾习武先习德。要想练好武艺,先要学会做人。"})
        end--]]









-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00671)
