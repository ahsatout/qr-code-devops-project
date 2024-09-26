```bash
kubectl create secret generic aws-secret \
  --from-literal=aws_access_key_id=<your_access_key_id> \
  --from-literal=aws_secret_access_key=<your_secret_access_key>
```
