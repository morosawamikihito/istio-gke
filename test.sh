#!/bin/sh

export GATEWAY_URL=$(kubectl -n istio-system get service istio-ingressgateway -o jsonpath='{.status.loadBalancer.ingress[0].ip}')

echo "GATEWAY_URL: ${GATEWAY_URL}"

BLUE_COUNT=0
GREEN_COUNT=0

for i in {1..500}; do
	if [ `curl -s $GATEWAY_URL | grep 'blue' | wc -l` -ne 0 ]; then
		BLUE_COUNT=`expr $BLUE_COUNT + 1`
	else
		GREEN_COUNT=`expr $GREEN_COUNT + 1`
	fi
done

echo "blue: ${BLUE_COUNT}, green: ${GREEN_COUNT}"
