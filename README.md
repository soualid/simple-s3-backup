# simple-s3-backup
Simple Docker image to automate S3 backup, initially created to be used as Chronos job.

## Usage

### Environment

Mandatory :

`AWS_ACCESS_KEY` Your AWS access key
`AWS_SECRET` Your AWS access key secret
`LOCAL` Local path to store on your s3 account (typically a mounted volume from your host)
`REMOTE` Remote location, note that the `-currentdate-` string will be dynamically replaced with the current date and time

Optional :

`CURL_FROM` Optionnaly download a file before starting the backup, this can be used to backup an app configuration exposed by a REST webservice (like your Marathon or Chronos configuration)
`CURL_TO` Where to store the downloaded file

### Example

Simplest backup.

```docker run -it -e AWS_ACCESS_KEY=xxx -e AWS_SECRET=xxx -e LOCAL=/source/to_backup -e REMOTE=s3://backups.xxx.xxx/backup-currentdate-/ -v /Users/demo:/source tat2bu/simple-s3-backup```

Download server marathon configuration and backup it to S3.

```docker run -it -e AWS_ACCESS_KEY=xxx -e AWS_SECRET=xxx -e LOCAL=/marathon-config.json -e REMOTE=s3://backups.xxx.xxx/marathon/marathon-config-currentdate-.json -e CURL_FROM=https://my.marathon/v2/apps -e CURL_TO=marathon-config.json tat2bu/simple-s3-backup```