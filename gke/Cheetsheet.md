
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


