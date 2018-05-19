--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60222 = {
}

function Item60222:MapUse(target)
local Item3 = {
  {itemid = 60035, itemname = "100级腰带制造书"}, 
  {itemid = 60051, itemname = "100级项链制造书"}, 
  {itemid = 60068, itemname = "100级女衣制造书"}, 
  {itemid = 60084, itemname = "100级男头制造书"}, 
  {itemid = 60100, itemname = "100级女头制造书"}, 
  {itemid = 60116, itemname = "100级鞋子制造书"}, 
  {itemid = 60318, itemname = "100级铠甲制造书"}, 
  {itemid = 20079, itemname = "100级枪制造指南书"}, 
  {itemid = 20095, itemname = "100级扇制造指南书"}, 
  {itemid = 20111, itemname = "100级魔棒制造指南书"}, 
  {itemid = 20127, itemname = "100级爪刺制造指南书"}, 
  {itemid = 20143, itemname = "100级锤子制造指南书"}, 
   {itemid = 20191, itemname = "100级双环制造指南书"}, 
  {itemid = 20207, itemname = "100级剑制造指南书"}, 
  {itemid = 20239, itemname = "100级双剑制造指南书"}, 
  {itemid = 20159, itemname = "100级斧钺制造指南书"}, 
  {itemid = 20175, itemname = "100级飘带制造指南书"}}

local Item2 = {
  {itemid = 60050, itemname = "90级项链制造指南书"}, 
  {itemid = 60067, itemname = "90级女衣制造指南书"}, 
  {itemid = 60034, itemname = "90级腰带制造指南书"}, 
  {itemid = 60309, itemname = "90级铠甲制造指南书"}, 
  {itemid = 60083, itemname = "90级男头制造指南书"}, 
  {itemid = 60115, itemname = "90级鞋子制造指南书"}, 
  {itemid = 60099, itemname = "90级女头制造指南书"}, 
  {itemid = 20078, itemname = "90级枪制造指南书"}, 
  {itemid = 20094, itemname = "90级扇制造指南书"}, 
  {itemid = 20110, itemname = "90级魔棒制造指南书"}, 
  {itemid = 20126, itemname = "90级爪刺制造指南书"}, 
  {itemid = 20142, itemname = "90级锤子制造指南书"}, 
   {itemid = 20190, itemname = "90级双环制造指南书"}, 
  {itemid = 20206, itemname = "90级剑制造指南书"}, 
  {itemid = 20238, itemname = "90级双剑制造指南书"}, 
  {itemid = 20158, itemname = "90级斧钺制造指南书"}, 
  {itemid = 20174, itemname = "90级飘带制造指南书"}}
 
local ItemListZ = {
  {itemid = 60047, itemname = "60级项链制造指南书"}, 
  {itemid = 60048, itemname = "70级项链制造指南书"}, 
  {itemid = 60049, itemname = "80级项链制造指南书"}, 
  {itemid = 60064, itemname = "60级女衣制造指南书"}, 
  {itemid = 60065, itemname = "70级女衣制造指南书"}, 
  {itemid = 60066, itemname = "80级女衣制造指南书"}, 
  {itemid = 60031, itemname = "60级腰带制造指南书"}, 
  {itemid = 60032, itemname = "70级腰带制造指南书"}, 
  {itemid = 60033, itemname = "80级腰带制造指南书"}, 
  {itemid = 60306, itemname = "60级铠甲制造指南书"}, 
  {itemid = 60307, itemname = "70级铠甲制造指南书"}, 
  {itemid = 60308, itemname = "80级铠甲制造指南书"}, 
  {itemid = 60080, itemname = "60级男头制造指南书"}, 
  {itemid = 60081, itemname = "70级男头制造指南书"}, 
  {itemid = 60082, itemname = "80级男头制造指南书"}, 
  {itemid = 60112, itemname = "60级鞋子制造指南书"}, 
  {itemid = 60113, itemname = "70级鞋子制造指南书"}, 
  {itemid = 60114, itemname = "80级鞋子制造指南书"}, 
  {itemid = 60096, itemname = "60级女头制造指南书"}, 
  {itemid = 60097, itemname = "70级女头制造指南书"}, 
  {itemid = 60098, itemname = "80级女头制造指南书"}, 
  {itemid = 20075, itemname = "60级枪制造指南书"}, 
  {itemid = 20076, itemname = "70级枪制造指南书"}, 
  {itemid = 20077, itemname = "80级枪制造指南书"}, 
  {itemid = 20091, itemname = "60级扇制造指南书"}, 
  {itemid = 20092, itemname = "70级扇制造指南书"}, 
  {itemid = 20093, itemname = "80级扇制造指南书"}, 
  {itemid = 20107, itemname = "60级魔棒制造指南书"}, 
  {itemid = 20108, itemname = "70级魔棒制造指南书"}, 
  {itemid = 20109, itemname = "80级魔棒制造指南书"}, 
  {itemid = 20123, itemname = "60级爪刺制造指南书"}, 
  {itemid = 20124, itemname = "70级爪刺制造指南书"}, 
  {itemid = 20125, itemname = "80级爪刺制造指南书"}, 
  {itemid = 20139, itemname = "60级锤子制造指南书"}, 
  {itemid = 20140, itemname = "70级锤子制造指南书"}, 
  {itemid = 20141, itemname = "80级锤子制造指南书"}, 
  {itemid = 20155, itemname = "60级斧钺制造指南书"}, 
  {itemid = 20156, itemname = "70级斧钺制造指南书"}, 
  {itemid = 20157, itemname = "80级斧钺制造指南书"}, 
  {itemid = 20171, itemname = "60级飘带制造指南书"}, 
  {itemid = 20172, itemname = "70级飘带制造指南书"}, 
  {itemid = 20173, itemname = "80级飘带制造指南书"}, 
  {itemid = 20187, itemname = "60级双环制造指南书"}, 
  {itemid = 20188, itemname = "70级双环制造指南书"}, 
  {itemid = 20189, itemname = "80级双环制造指南书"}, 
  {itemid = 20203, itemname = "60级剑制造指南书"}, 
  {itemid = 20204, itemname = "70级剑制造指南书"}, 
  {itemid = 20205, itemname = "80级剑制造指南书"}, 
  {itemid = 20219, itemname = "60级刀制造指南书"}, 
  {itemid = 20220, itemname = "70级刀制造指南书"}, 
  {itemid = 20221, itemname = "80级刀制造指南书"}, 
  {itemid = 20235, itemname = "60级双剑制造指南书"}, 
  {itemid = 20236, itemname = "70级双剑制造指南书"}, 
  {itemid = 20237, itemname = "80级双剑制造指南书"}}
  
  local i = math.random(1,100)
  IAsk("确定要打开礼盒吗?")
  SetAnswer(1,"打开")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then 
    if not item:ReduceCount() then return end
	  if i <= 10 then
	  local r = RandTable(Item3)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O制造指南书礼盒#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
	  elseif i <= 30 then
      local r = RandTable(Item2)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O制造指南书礼盒#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
      elseif i <= 100 then
      local r = RandTable(ItemListZ)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
    end
  end
end
    






function Item60222:CanUse(user, target)
end



function Item60222:BattleUse(user, target)

end

AddItemTable(Item60222)