-- Decompiled using luadec 2.0 UNICODE by sztupy (http://winmo.sztupy.hu)
-- Command line was: Item61021.out 

Item61021 = {}
Item61021.MapUse = function(self, target)
  IAsk("【票号掌柜】:少侠确定要使用元宝票充值元宝吗？\r#P使用前请确保上一次使用元宝票充值的元宝已经到账,若未到账继续使用,将会覆盖上笔充值订单。出现损失本店概不负责！")
  SetAnswer(1, "使用元宝票充值")
--  SetAnswer(2, "flag值为0")自己测试flag为0 取消前面的--便可以使用
  SetAnswer(3, "我再想想")
  WaitAnswer(3)
  if GetAnswer() == 1 then
    local A = player:GetQuests():GetFlag(61024)
    if A ~= 0 then
      IAsk("【票号掌柜】充值提醒:\r#P请先检查上一次充值的元宝订单是否已到账,若未到账,请选择《取消》,若上次充值已到账,请选择继续充值！(若未到账继续使用,将会覆盖上笔充值订单,造成损失本店概不负责！)")
      SetAnswer(1, "继续充值")
      SetAnswer(2, "取消")
      WaitAnswer(2)
      if GetAnswer() == 1 then
        local A = player:GetQuests():GetFlag(61024)
        player:GetQuests():SetFlag(61024, 0)
        IAsk("【票号掌柜】:少侠,本张元宝票可以充值10000元宝,请您签下您的大名，确定使用。")
        SetAnswer(1, "签名并确定使用")
        SetAnswer(2, "取消")
        WaitAnswer(2)
        if GetAnswer() == 1 then
          player:GetQuests():SetFlag(61024, 10000)
          player:GetItems():RemoveItem(402833, 1)
          ShowError("#W充值元宝10000个 1分钟内到账 元宝商城刷新即可")
        end
      end
      return
    end
    player:GetQuests():SetFlag(61024, 10000)
    player:GetItems():RemoveItem(402833, 1)
    ShowError("#W充值元宝10000个 1分钟内到账 元宝商城刷新即可")
  else
    if GetAnswer() == 2 then
      ISay("SB")
      local A = player:GetQuests():GetFlag(61024)
      player:GetQuests():SetFlag(61024, 0)
    end
  end
end
  


AddItemTable(Item61021)