## Definition

Kubernetes Secrets let you store and manage sensitive information, such as passwords, OAuth tokens, and ssh keys. Storing confidential information in a Secret is safer and more flexible than putting it verbatim in a Pod definition or in a container image.

A Secret is an object that contains a small amount of sensitive data such as a password, a token, or a key. Such information might otherwise be put in a Pod specification or in an image. Users can create secrets and the system also creates some secrets.

To use a secret, a Pod needs to reference the secret. A secret can be used with a Pod in three ways:
As files in a volume mounted on one or more of its containers.
As container environment variable.
By the kubelet when pulling images for the Pod.

## Create Secret from file (cmd)
secret.txt
```
secret1=test1
secret2=test2
```
`kubectl create secret generic mysecret --from-file=./secret.txt`  
`kubectl get secret mysecret`  
`kubectl describe secret mysecret`  
`kubectl get secret mysecret -o yaml`  

By default the secrets are encoded in base64.

## Create a secret on yaml

secret.yaml

```
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: YWRtaW4=
  password: MWYyZDFlMmU2N2Rm
stringData:
  username2: test
  password2: 1234
```

## Secure secret using placeholders

secure-secret.yaml  

```
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
stringData:
  username: $USER
  password: $PASSWORD
```

We then use a tool like `envsubst` to replace all the variables in the file by the environment variables in our system:  
`envsubst < secure-secret.yaml > tmp.yaml`  

## Secrets using volumes

secret-vol.yaml

```
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
stringData:
  username: admin
  password: 1234
---
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
    - name: mypod
      image: nginx:alpine
      volumeMounts:
        - name: test
          mountPath: "/opt"
          readOnly: true
  volumes:
    - name: test
      secret:
        secretName: mysecret
        items:
          - key: username
            path: user.txt
          - key: password
            path: pass.txt
```

## Secrets using ENV variables

secret-env.yaml

```
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
stringData:
  username: admin
  password: "1234"
---
apiVersion: v1
kind: Pod
metadata:
  name: mypod
spec:
  containers:
    - name: mypod
      image: nginx:alpine
      env:
        - name: USER_TEST
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: username
        - name: PASSWORD_TEST
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: password
```

```
envFrom:
  - secretRef:
      name: mysecret
```
