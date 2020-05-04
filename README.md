
# Launch Cluster and Application to Google Cloud
## Installation Prerequisites
```
Google Cloud Account
https://cloud.google.com/docs/authentication/getting-started
get te json with credential y copy in terraform directory 
service-account.json will be the name.
```


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

