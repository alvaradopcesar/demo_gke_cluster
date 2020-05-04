
# Launch Cluster and Application in Google Cloud
## Installation Prerequisites

Google Cloud Account
[https://cloud.google.com/docs/authentication/getting-started](https://cloud.google.com/docs/authentication/getting-started) 

Get json with credential y copy in terraform directory as service-account.json.



## Launch GKE Cluster
```
$ make create_cloud
```

## Create Image and upload 
```
$ make create_image
```

## Deploy Services and App
```
$ make deploy
```

## Destroy GKE Cluster
```
$ make destroy_cloud
```


## Launch Demo Application

https://{ip}/greetings

https://{ip}/square/10