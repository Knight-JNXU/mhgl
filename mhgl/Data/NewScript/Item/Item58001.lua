--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60222 = {
}

function Item60222:MapUse(target)
local Item2 = {
  {itemid = 60054, itemname = "130级项链制造指南书"}, 
  {itemid = 60071, itemname = "130级女衣制造指南书"}, 
  {itemid = 60038, itemname = "130级腰带制造指南书"}, 
  {itemid = 60313, itemname = "130级铠甲制造指南书"}, 
  {itemid = 60087, itemname = "130级男头制造指南书"}, 
  {itemid = 60119, itemname = "130级鞋子制造指南书"}, 
  {itemid = 60103, itemname = "130级女头制造指南书"}} 

 
local ItemListZ = {
  {itemid = 20082, itemname = "130级枪制造指南书"}, 
  {itemid = 20098, itemname = "130级扇制造指南书"}, 
  {itemid = 20114, itemname = "130级魔棒制造指南书"}, 
  {itemid = 20130, itemname = "130级爪刺制造指南书"}, 
  {itemid = 20146, itemname = "130级锤子制造指南书"}, 
   {itemid = 20194, itemname = "130级双环制造指南书"}, 
  {itemid = 20114, itemname = "130级魔棒制造指南书"}, 
  {itemid = 20130, itemname = "130级爪刺制造指南书"}, 
  {itemid = 20146, itemname = "130级锤子制造指南书"}, 
   {itemid = 20194, itemname = "130级双环制造指南书"},    
  {itemid = 20210, itemname = "130级剑制造指南书"}, 
  {itemid = 20242, itemname = "130级双剑制造指南书"}, 
  {itemid = 20242, itemname = "130级双剑制造指南书"}, 
  {itemid = 20162, itemname = "130级斧钺制造指南书"}, 
  {itemid = 20178, itemname = "130级飘带制造指南书"},  
  {itemid = 20162, itemname = "130级斧钺制造指南书"}, 
  {itemid = 20178, itemname = "130级飘带制造指南书"},
  {itemid = 403285, itemname = "130级巨魔王制造指南书"},
  {itemid = 403343, itemname = "130级狐美人制造指南书"},
  {itemid = 403350, itemname = "130级神天兵制造指南书"},
  {itemid = 403547, itemname = "130级法杖制造指南书"},
  {itemid = 403555, itemname = "130级宝珠制造指南书"},
  {itemid = 403563, itemname = "130级弓弩制造指南书"}}
  
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
      script:Rumor(string.format(" %s #W打开了#O130指南书礼合#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    elseif i <= 100 then
      local r = RandTable(ItemListZ)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
script:Rumor(string.format(" %s #W打开了#O130指南书礼合#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
  	  
    end
  end
end
    






function Item60222:CanUse(user, target)
end



function Item60222:BattleUse(user, target)

end

AddItemTable(Item60222)