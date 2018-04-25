

$EmotionAPIURI =   "https://westeurope.api.cognitive.microsoft.com/vision/v1.0/ocr"

$apiKey = "9d9ad91e5ce7439386523a45d8fb2242"

 $query = "?Subscription-Key=$apiKey"
 $uri = $EmotionAPIURI+$query  

 
 $result = Invoke-RestMethod -Method Post -Uri $uri -Header @{ "Ocp-Apim-Subscription-Key" = $apiKey } -InFile "C:\Users\rites\Desktop\MCT\ocr3.jpg" `
 -ContentType "application/octet-stream" -ErrorAction Stop            

# $result.regions.lines.words.text


