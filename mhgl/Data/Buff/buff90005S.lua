--多加内功(三阴玄针)

function buff90005Attri(Char, buff, Attri)
	Attri:SetPow(Attri:GetPow() * 1.075);
end
function buff90005Remove(buff, Char) 
	Attri:SetPow(Attri:GetPow() / 1.075);
end