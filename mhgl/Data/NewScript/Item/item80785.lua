--author: apollo
--仙灵店铺

Item51402 = {}
Item51402.MapUse = function(l_1_0, l_1_1)
  IAsk("#O欢迎使用")
SetAnswer(1, "1号店铺")
SetAnswer(2, "2号店铺")
 SetAnswer(15, "离开")
  WaitAnswer(15)
if GetAnswer() == 1 then
    if IsProcess() then
    script:OpenInterface("shop", 3)
	end
	end
	if GetAnswer() == 2 then
    if IsProcess() then
    script:OpenInterface("shop", 1)
	end
	end
end

AddItemTable(Item51402)
