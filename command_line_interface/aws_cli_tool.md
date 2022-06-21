# Install
Command line installer - All users
```sh
curl "https://awscli.amazonaws.com/AWSCLIV2.pkg" -o "AWSCLIV2.pkg"
sudo installer -pkg AWSCLIV2.pkg -target /.
```
```sh
which aws

aws --version
```

# Upload
```
aws s3 cp <directory_name> s3://flitto-deliveries-9957/... --recursive --acl bucket-owner-full-control
```