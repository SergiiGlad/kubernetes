
Once connected to the cloud shell, you should see that you are already authenticated and that the project is already set to your ```PROJECT_ID``` :

```
$ gcloud auth list
       Credentialed Accounts
ACTIVE  ACCOUNT
        gladseo@gmail.com
*       sergii.gladchenko@gmail.com

To set the active account, run:
    $ gcloud config set account `ACCOUNT`

```
authenticated through the shell yet, so run
```
$ gcloud auth login email@example.com
```

If for some reason the project is not set, simply issue the following command :

```$ gcloud config set project <PROJECT_ID>```

```$ gcloud config list project```

IMPORTANT: Finally, set the default zone and project configuration:
```
$ gcloud config set compute/zone us-central1-f
```

To SSH into _example-instance_ in zone:
```
gcloud compute ssh example-instance --zone us-central1-a
```

In the ssh session on my-vm, execute this command to create a CPU load:
```bash
dd if=/dev/urandom | gzip -9 >> /dev/null &
```

Google Cloud Fundamentals: Getting Started with Deployment Manager and Cloud Monitoring
gsutil ls gs://cloud-training/