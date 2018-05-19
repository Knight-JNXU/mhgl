--author: apollo
--仙灵店铺

Item80785 = {
}

function Item80785:MapUse(target)
    script:SetSaying(true)
    script:OpenInterface("shop", 615)
	
end

function Item80785:CanUse(user, target)
end

function Item80785:BattleUse(user, target)

end

AddItemTable(Item80785)
