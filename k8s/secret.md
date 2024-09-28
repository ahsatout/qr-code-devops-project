```bash
kubectl create secret generic aws-secret \
  --from-literal=aws_access_key_id=<your_access_key_id> \
  --from-literal=aws_secret_access_key=<your_secret_access_key>
```

Or

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: aws-secret
type: Opaque
data:
  aws_access_key_id: <base64_encoded_access_key_id>
  aws_secret_access_key: <base64_encoded_secret_access_key>
```
