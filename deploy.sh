docker build -t mariogalaviz/tacool-site:latest -t mariogalaviz/tacool-site:$SHA -f ./site/Dockerfile ./site

docker push mariogalaviz/tacool-site:latest
docker push mariogalaviz/tacool-site:$SHA 

kubectl apply -f k8s
kubectl set image deployments/tacool-site-deployment site=mariogalaviz/tacool-site:$SHA 