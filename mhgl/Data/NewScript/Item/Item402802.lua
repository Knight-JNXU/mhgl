-- Decompiled using luadec 2.0 standard by sztupy (http://luadec51.luaforge.net)
-- Command line was: D:\Server\Data\NewScript\Item\Item51402.out 

Item51402 = {}
Item51402.MapUse = function(l_1_0, l_1_1)
  ItemAsk("我就是传说中的潜能果，请问你确定要吃掉宝宝吗？")
  --SetAnswer(1, "VIP每日领取")
  --SetAnswer(2, "VIPBUFF领取")
  --SetAnswer(3, "VIP专属称号")
  SetAnswer(4, "确定吃掉")
  SetAnswer(5, "离开")
  WaitAnswer(5)
  if GetAnswer() == 1 and IsProcess() then
    script:SetSaying(true)
    local TotalRound323 = 0
    local type323 = player:GetQuests():GetType(323)
    if type323 ~= nil then
      TotalRound323 = type323:GetTotalRound()
    end
    if TotalRound323 > 0 then
      ShowHint("对不起，大侠今天已经领取过了,请明天赶早！")
      return 
    end
    if type323 == nil then
      player:GetQuests():SetRoundInfo(323, 1, 1, 1)
    end
    player:GetItems():AddItem(74000, 30)
    player:GetItems():AddItem(41405, 20)
    player:GetItems():AddItem(61021, 50)
    player:GetItems():AddItem(RandTable({81039,81040,81041,81042,81043,81044,81045,81046}), 50)
    player:GetItems():AddItem(61056, 25)
    player:GetPartners():AddPartner(RandTable({5001,5002,5003,5004,5005,5006,5007,5008,5009,5010,5011,5012,5013,5014,5015,5016,5017,5018,255,256,321,250,251,362,6000,6001,6002,6003,6004,6005,6006,6007,6008,6009,6010,6011,6012,6013,6014,6015,6016,6017,6018,6019,364,386,387,827,2421,2425,2430,2436,2440,2445,2449,2453,32041,32042,32043,32044,32045,32062,32063,32064,32065}), 1)
    player:GetQuests():GetType(323):ChangeTotalRound(1)
    script:Rumor(string.format("[VIP系统]#YVIP用户#P%s#G领取了VIP每日礼包，几率获得大侠和绝学哦！大家心动了没呢？心动了就赶紧买吧！#35", player:GetName()), false)
  else
    if GetAnswer() == 2 and IsProcess() then
      script:SetSaying(true)
       NpcSay("获得无敌效果2回合,请及时使用！")
       player:AddBuff(294, 0, 0, 0, 2, 100)
       player:ChangeMoney(-5000000)
     else
       if GetAnswer() == 3 and IsProcess() then
         script:SetSaying(true)
         if player:GetMoney() < 5000000 then
            NpcSay("需要银子500万！")
            return 
          end
          if player:HasTitle(669) then
            ShowHint("你已经是“#B霸气古龙VIP用户#W”了，无法再次领取")
            return 
          end
          player:AddTitle(669)
          ShowHint("恭喜你获得“#B梦古大人物#W”称号")
        else
          if GetAnswer() == 4 and IsProcess() then
            local Lvl = player:GetLevel()
            local FreesLot = player:GetItems():GetFreeSlot(0)
            local flag = player:GetQuests():GetFlag(6051)
            if flag < math.floor(Lvl / 1) + 99 then
              if flag < 101 then
                if FreesLot >= 0 then
				    script:SetSaying(true)    
    player:ChangeSPR(1)
    player:ChangeSTA(1)
    player:ChangeSTR(1)
    player:ChangeCON(1)
    player:ChangeAGI(1)
		  player:GetItems():RemoveItem(402802, 1)
          player:GetQuests():SetFlag(6051, flag + 1)
                 --script:Rumor(string.format("#Y[潜能果系统]#G%s#E使用了一个传说中的#A潜能果#E,大家都注意点，千万不要惹这位爷！#68#69", player:GetName()), false)
                else
                  ShowHint("你的潜能果次数达到上限")
                end
              end
            end
         end
       end
     end
   end
 end
eof
=
AddItemTable(Item51402)