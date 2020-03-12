export SERVICE_PORT=80

echo "Service can be found under http://$(hostname -I | cut -d' ' -f1):$(SERVICE_PORT)"
