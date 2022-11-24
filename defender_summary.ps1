$threats = Get-MpThreatDetection

$detectedthreats= @()
$filelist =@()
foreach($threat in $threats){
$threatType = Get-MpThreat -ThreatID $threat.ThreatID
$resources = $threat| Select-Object -ExpandProperty resources
foreach($resource in $resources){
if($resource -notmatch "this will never match"){

    
                            $threat.ThreatID
                            $threatType.ThreatName
                            $threat.LastThreatStatusChangeTime
                            $resource
                            $detectedthreats += $threatType.ThreatName
                            $threatType.ThreatType
                            $resource = $resource -replace ".http"
                            $resource = $resource -replace ".html"
                            $resource = $resource -replace ".json"
                            $resourceFiles =  $resource -split '\\'
                            $lastmember = $resourceFiles[$resourceFiles.Count – 1]
                            $lastmember
                            $filelist += $lastmember
                   

                            }

}
}

 $detectedthreats | Group-Object | Sort-Object -Property Count -Descending | FT -autosize

$filelist | Group-Object | Sort-Object -Property Count -Descending | FT -autosize
