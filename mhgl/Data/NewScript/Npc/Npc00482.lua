
-- 定义 NPC 表 : NPC 表是个 lua table, 名称要与脚本名称相同
Npc00482 = {							-- 杵官王
	npc_id = 482,						-- NPC ID
	name = GetNpcName(482),				-- NPC 名称
										-- NPC 会派出的任务表
}

-- Npc00019 对话方法，bProcess 为脚本处理阶段
function Npc00482:Talk(bProcess) 
  if npc then
    local TotalRound61000 = 0
    local type61000 = player:GetQuests():GetType(68888)
	local flag = player:GetQuests():GetFlag(198799)
    if type61000 ~= nil then
      TotalRound61000 = type61000:GetTotalRound()
    end
  NpcAsk("前知五百年，后面全不知，小老弟我看你天庭饱满，地格方圆，他日必有一番成就，今日遇上我是缘分，要不要来测一卦？")
   SetAnswer(1,"那我就要试试了") 
  SetAnswer(2,"开启秘宝")   
  SetAnswer(12,"离开")
  WaitAnswer(12)
  if GetAnswer() == 1 then
  NpcAsk("那我就给你好好算一算！听好了！")
   SetAnswer(1,"请说") 
  SetAnswer(2,"离开")
  WaitAnswer(2)	
    if GetAnswer() == 1 then
	if TotalRound61000 >= 1 then
          ShowHint("每天只能测算一次")
          return
        end
      if player:GetLevel() < 100 then
      ShowHint("没有100级我怕你受不起啊")
      return 
    end

          if type61000 == nil then
            player:GetQuests():SetRoundInfo(68888, 1, 1, 1)
            type61000 = player:GetQuests():GetType(68888)
            type61000:ChangeTotalRound(1)
          else
            type61000:ChangeTotalRound(1)
          end
    local r = math.random(1, 200)
    local itemId = 0
      if r <= 10 then
       NpcSay("困龙得水好运交，不由喜气上眉梢，一切谋望皆如意，向后时运渐渐高") 
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时诸事顺利掉宝机率+10%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
       elseif r <= 30 then
       NpcSay("心中有事犯猜疑，谋望从前不着实，幸遇明人来指引，诸般忧闷自消之") 	   
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时捉BB成功率+10%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)				  
       elseif r <= 50 then
       NpcSay("心中有事事难做，恰是二人争路走，雨下俱是要占先，谁肯让谁走一步") 	   
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时啥事也没变，该干嘛干嘛去") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
	   elseif r <= 80 then
       NpcSay("虎落陷坑不堪言，进前容易退后难，谋望不遂自己便，疾病口舌事牵连") 	   
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时遇BB机率+5%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
	   elseif r <= 100 then
       NpcSay("凤凰落在西歧山，去鸣几声出圣贤，天降文王开基业，富贵荣华八百年") 
 	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时遇BB机率+10%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
 elseif r <= 120 then
       NpcSay("苗逢旱天尽焦梢，水想云浓雨不浇，农人仰面长吁气，是从款来莫心高") 	   
 	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时打造极品率+5%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
 elseif r <= 140 then
       NpcSay("将帅领旨去出征，骑着烈马拉硬弓，百步穿杨去得准，箭中金钱喜气生") 
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时打造极品率+10%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
	   elseif r <= 160 then
       NpcSay("心中有事事难做，恰是二人争路走，雨下俱是要占先，谁肯让谁走一步") 
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时啥事也没变，该干嘛干嘛去") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
	   elseif r <= 180 then
       NpcSay("肥羊失群入山岗，饿虎逢之把口张，适口充肠心欢喜，卦若占之大吉昌") 	   
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时诸事大吉，所有机率提高5%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
	   elseif r <= 200 then
        NpcSay("风刮乱丝不见头，颠三倒四犯忧愁，慢从款来左顺遂，急促反惹不自由")
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时得阵机率提高5%") 
	   		      player:GetQuests():SetFlag(198799, flag + 1)
		else
        NpcSay("卦中爻象犯小耗，君子占之运不高，婚姻合伙有琐碎，做事必然受苦劳")
	   NpcSay("小老弟，你可听懂了吗？老夫给你解释一下，接下来的半个小时啥事也没变，该干嘛干嘛去") 
		      player:GetQuests():SetFlag(198799, flag + 1)	   
	  end
end

end
         
 
    if GetAnswer() == 2 then
	script:SetSaying(true)
  NpcAsk(string.format("#E%s#A虽然你丑，但是每测一次，老夫都为你记录下来了，当你的幸运值达到顶点的时候，老夫会为你打开一个绝世宝藏，具体能得到什么全看机缘，\\r你目前幸运值为：#Y%d#P",player:GetName(), flag))
   SetAnswer(1,"我来试试我的幸运") 
  SetAnswer(2,"离开")
  WaitAnswer(2)	
     if GetAnswer() == 1 then
      local flag = player:GetQuests():GetFlag(198799)
      script:SetSaying(true)
      if flag < 10 then
        NpcSay("你的余额不足#R10")
        return
      end
      player:GetQuests():SetFlag(198799, flag - 10)
      itemid = RandTable({402800, 402801, 402830, 20754, 30001, 15000, 15006, 15007, 15008, 15009, 20001, 80091, 60136, 61226, 40039, 80056, 80053})
	player:GetItems():AddItem(itemid, 2)
    ShowError(string.format("#W獲得%s", GetItemName(itemid)))
    script:Rumor(string.format("#Y[绑完元宝商城]#E%s #O在积分使者那里抽奖中了#B%sX2#O。", player:GetCharNameLink(), GetItemName(itemid)), false)
      player:GetOwner()
    end	
	end			
end
end




-- 必需在脚本最后将 NPC 表加入系统中
AddNpcTable(Npc00482)
