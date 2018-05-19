echo 卸载网关

title 网关提示

taskkill -f -im CardExchangeClient.exe
taskkill -f -im 利保网关.exe

sc delete svc_cardexchangeclient

echo 卸载完成，如软件界面仍存在，请手工退出

msg %username% /time:10 "卸载完成，如软件界面仍存在，请手工退出"

pause