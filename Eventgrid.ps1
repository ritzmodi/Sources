Login-AzureRmAccount
Set-AzureRmContext -Subscription 9755ffce-e94b-4332-9be8-1ade15e78909

New-AzureRmEventGridTopic -ResourceGroupName testone13 -Name "customTopicTest" -Location "Central US" -Verbose
New-AzureRmEventGridSubscription -ResourceGroupName testone13 -TopicName customTopicTest -EventSubscriptionName azFunction -EndpointType webhook -Endpoint https://testone13.azurewebsites.net/api/GenericWebhookCSharp1?code=Gi2fMej6w/TSbGvvMLyjlRwbmWJVXBgob1XFOoauSBX4fTWXwQnI2w== -Verbose


$endpoint = (Get-AzureRmEventGridTopic -ResourceGroupName testone13 -Name customTopicTest).Endpoint
$keys = Get-AzureRmEventGridTopicKey -ResourceGroupName testone13 -Name customTopicTest

$eventID = Get-Random 99999

#Date format should be SortableDateTimePattern (ISO 8601)
$eventDate = Get-Date -Format s

#Construct body using Hashtable
$htbody = @{
    id= $eventID
    eventType="recordInserted"
    subject="myapp/vehicles/motorcycles"
    eventTime= $eventDate   
    data= @{
        make="Ducati"
        model="Monster"
    }
    dataVersion="1.0"
}

#Use ConvertTo-Json to convert event body from Hashtable to JSON Object
#Append square brackets to the converted JSON payload since they are expected in the event's JSON payload syntax
$body = "["+(ConvertTo-Json $htbody)+"]"

Invoke-WebRequest -Uri $endpoint -Method POST -Body $body -Headers @{"aeg-sas-key" = $keys.Key1}