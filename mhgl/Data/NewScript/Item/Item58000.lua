--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60222 = {
}

function Item60222:MapUse(target)
local Item2 = {
  {itemid = 60053, itemname = "120级项链制造指南书"}, 
  {itemid = 60070, itemname = "120级女衣制造指南书"}, 
  {itemid = 60037, itemname = "120级腰带制造指南书"}, 
  	  {itemid = 60102, itemname = "120级女头制造指南书"},
  {itemid = 60312, itemname = "120级铠甲制造指南书"}, 
    {itemid = 60070, itemname = "120级女衣制造指南书"},
  {itemid = 60086, itemname = "120级男头制造指南书"}, 
  {itemid = 60118, itemname = "120级鞋子制造指南书"}, 
    {itemid = 60070, itemname = "120级女衣制造指南书"},
	  {itemid = 60102, itemname = "120级女头制造指南书"},
  {itemid = 60102, itemname = "120级女头制造指南书"}} 

 
local ItemListZ = {
  {itemid = 20081, itemname = "120级枪制造指南书"}, 
  {itemid = 20097, itemname = "120级扇制造指南书"}, 
  {itemid = 20113, itemname = "120级魔棒制造指南书"}, 
  {itemid = 20129, itemname = "120级爪刺制造指南书"}, 
  {itemid = 20145, itemname = "120级锤子制造指南书"}, 
   {itemid = 20193, itemname = "120级双环制造指南书"}, 
  {itemid = 20113, itemname = "120级魔棒制造指南书"}, 
  {itemid = 20129, itemname = "120级爪刺制造指南书"}, 
  {itemid = 20145, itemname = "120级锤子制造指南书"}, 
   {itemid = 20193, itemname = "120级双环制造指南书"},    
  {itemid = 20209, itemname = "120级剑制造指南书"}, 
  {itemid = 20241, itemname = "120级双剑制造指南书"}, 
  {itemid = 20241, itemname = "120级双剑制造指南书"}, 
  {itemid = 20161, itemname = "120级斧钺制造指南书"}, 
  {itemid = 20177, itemname = "120级飘带制造指南书"},  
  {itemid = 20161, itemname = "120级斧钺制造指南书"}, 
  {itemid = 20177, itemname = "120级飘带制造指南书"},
  {itemid = 403284, itemname = "120级巨魔王制造指南书"},
  {itemid = 403342, itemname = "120级狐美人制造指南书"},
  {itemid = 403349, itemname = "120级神天兵制造指南书"},
  {itemid = 403546, itemname = "120级法杖制造指南书"},
  {itemid = 403554, itemname = "120级宝珠制造指南书"},
  {itemid = 403562, itemname = "120级弓弩制造指南书"}}
  
  local i = math.random(1,100)
  IAsk("确定要打开礼盒吗?")
  SetAnswer(1,"打开")
  SetAnswer(2,"离开")
  WaitAnswer(2)
  if GetAnswer() == 1 then 
    if not item:ReduceCount() then return end
	  if i <= 20 then
      local r = RandTable(Item2)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
      script:Rumor(string.format(" %s #W打开了#O120指南书礼合#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
    elseif i <= 100 then
      local r = RandTable(ItemListZ)  
      ShowMessage(string.format("#W获得制造指南书[%s]",r.itemname))
      player:GetItems():AddItem(r.itemid, 1)
script:Rumor(string.format(" %s #W打开了#O120指南书礼合#W,竟然在里面发现了一本#Y[%s]#O！", player:GetCharNameLink(), r.itemname), true)
  	  
    end
  end
end
    






function Item60222:CanUse(user, target)
end



function Item60222:BattleUse(user, target)

end

AddItemTable(Item60222)