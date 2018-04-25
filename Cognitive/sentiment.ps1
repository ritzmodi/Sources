

$EmotionAPIURI =   "https://westeurope.api.cognitive.microsoft.com/text/analytics/v2.0/sentiment"

$apiKey = "059a41b7360441c983a1a9aaf0766eb9"

 $query = "?Subscription-Key=$apiKey"
 $uri = $EmotionAPIURI+$query  

$documents = @()

$message = @{"language" = "en"; "id" = "1"; "text" = "I had a wonderful experience! The rooms were wonderful and the staff were helpful." };

$documents += $message

$final = @{documents = $documents}

$messagePayload = ConvertTo-Json $final
 
 $result = Invoke-RestMethod -Method Post -Uri $uri -Header @{ "Ocp-Apim-Subscription-Key" = $apiKey } -Body $messagePayload -ContentType application/json -ErrorAction Stop            

# $result.regions.lines.words.text


