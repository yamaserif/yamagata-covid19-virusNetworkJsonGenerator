echo (Convert-Path .)

$topData = Get-Content ..\virusNetwork.json -RAW -Encoding UTF8

$baseData = Get-Content virusNetwork_baseData.json -RAW -Encoding UTF8
$networkData = Get-Content virusNetwork_networkData.json -RAW -Encoding UTF8

$replaseBaseData = Get-Content .\replaceSetting\virusNetwork_baseData.json -RAW -Encoding UTF8
$replaseNetworkData = Get-Content .\replaceSetting\virusNetwork_networkData.json -RAW -Encoding UTF8

$topData2 = $topData.Replace($replaseBaseData, ($baseData + $replaseBaseData))
$topData3 = $topData2.Replace($replaseNetworkData, ($networkData + $replaseNetworkData))

Set-Content ..\virusNetwork.json $topData3 -Encoding utf8


$topData4 = Get-Content ..\virusNetwork.json -Encoding UTF8

$lastUpdate = Get-Content virusNetwork_lastUpdate.json -RAW -Encoding UTF8

$topData4[-1] = $lastUpdate

Set-Content ..\virusNetwork.json $topData4 -Encoding utf8

exit 0