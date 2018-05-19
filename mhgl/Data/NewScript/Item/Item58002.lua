--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60222 = {
}

function Item60222:MapUse(target)
local Item2 = {
  {itemid = 60055, itemname = "140级项链制造指南书"}, 
  {itemid = 60072, itemname = "140级女衣制造指南书"}, 
  {itemid = 60039, itemname = "140级腰带制造指南书"}, 
  {itemid = 60314, itemname = "140级铠甲制造指南书"}, 
  {itemid = 60088, itemname = "140级男头制造指南书"}, 
  {itemid = 60120, itemname = "140级鞋子制造指南书"}, 
  {itemid = 60104, itemname = "140级女头制造指南书"}} 

 
local ItemListZ = {
  {itemid = 20083, itemname = "140级枪制造指南书"}, 
  {itemid = 20099, itemname = "140级扇制造指南书"}, 
  {itemid = 20115, itemname = "140级魔棒制造指南书"}, 
  {itemid = 20131, itemname = "140级爪刺制造指南书"}, 
  {itemid = 20147, itemname = "140级锤子制造指南书"}, 
   {itemid = 20195, itemname = "140级双环制造指南书"}, 
  {itemid = 20115, itemname = "140级魔棒制造指南书"}, 
  {itemid = 20131, itemname = "140级爪刺制造指南书"}, 
  {itemid = 20147, itemname = "140级锤子制造指南书"}, 
   {itemid = 20195, itemname = "140级双环制造指南书"},    
  {itemid = 20211, itemname = "140级剑制造指南书"}, 
  {itemid = 20243, itemname = "140级双剑制造指南书"}, 
  {itemid = 20243, itemname = "140级双剑制造指南书"}, 
  {itemid = 20163, itemname = "140级斧钺制造指南书"}, 
  {itemid = 20179, itemname = "140级飘带制造指南书"},  
  {itemid = 20163, itemname = "140级斧钺制造指南书"}, 
  {itemid = 20179, itemname = "140级飘带制造指南书"},
  {itemid = 403286, itemname = "140级巨魔王制造指南书"},
  {itemid = 403344, itemname = "140级狐美人制造指南书"},
  {itemid = 403351, itemname = "140级神天兵制造指南书"},
  {itemid = 403548, itemname = "140级法杖制造指南书"},
  {itemid = 403556, itemname = "140级宝珠制造指南书"},
  {itemid = 403564, itemname = "140级弓弩制造指南书"}}
  
  local i = math.random(1,100)
  IAsk("确定要打开礼盒吗?")
  SetAnswer(1,"打开")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then 
    if not item:ReduceCount() then return end
	  if i <= 30 then
      local r = RandTable(Item2)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O140指南书礼合#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    elseif i <= 100 then
      local r = RandTable(ItemListZ)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
script:Rumor(string.format(" %s #W打开了#O140指南书礼合#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
  	  
    end
  end
end
    






function Item60222:CanUse(user, target)
end



function Item60222:BattleUse(user, target)

end

AddItemTable(Item60222)