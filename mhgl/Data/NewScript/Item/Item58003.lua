--author: apollo
--五级魅力丹：可携带召唤兽数目由7个上升为8个

Item60222 = {
}

function Item60222:MapUse(target)
local Item2 = {
  {itemid = 60056, itemname = "150级项链制造指南书"}, 
  {itemid = 60073, itemname = "150级女衣制造指南书"}, 
  {itemid = 60040, itemname = "150级腰带制造指南书"}, 
  {itemid = 60315, itemname = "150级铠甲制造指南书"}, 
  {itemid = 60089, itemname = "150级男头制造指南书"}, 
  {itemid = 60121, itemname = "150级鞋子制造指南书"}, 
  {itemid = 60105, itemname = "150级女头制造指南书"}} 

 
local ItemListZ = {
  {itemid = 20084, itemname = "150级枪制造指南书"}, 
  {itemid = 20100, itemname = "150级扇制造指南书"}, 
  {itemid = 20116, itemname = "150级魔棒制造指南书"}, 
  {itemid = 20132, itemname = "150级爪刺制造指南书"}, 
  {itemid = 20148, itemname = "150级锤子制造指南书"}, 
   {itemid = 20196, itemname = "150级双环制造指南书"}, 
  {itemid = 20116, itemname = "150级魔棒制造指南书"}, 
  {itemid = 20132, itemname = "150级爪刺制造指南书"}, 
  {itemid = 20148, itemname = "150级锤子制造指南书"}, 
   {itemid = 20196, itemname = "150级双环制造指南书"},    
  {itemid = 20212, itemname = "150级剑制造指南书"}, 
  {itemid = 20244, itemname = "150级双剑制造指南书"}, 
  {itemid = 20244, itemname = "150级双剑制造指南书"}, 
  {itemid = 20164, itemname = "150级斧钺制造指南书"}, 
  {itemid = 20180, itemname = "150级飘带制造指南书"},  
  {itemid = 20164, itemname = "150级斧钺制造指南书"}, 
  {itemid = 20180, itemname = "150级飘带制造指南书"},
  {itemid = 403287, itemname = "150级巨魔王制造指南书"},
  {itemid = 403345, itemname = "150级狐美人制造指南书"},
  {itemid = 403352, itemname = "150级神天兵制造指南书"},
  {itemid = 403549, itemname = "150级法杖制造指南书"},
  {itemid = 403557, itemname = "150级宝珠制造指南书"},
  {itemid = 403565, itemname = "150级弓弩制造指南书"}}
  
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