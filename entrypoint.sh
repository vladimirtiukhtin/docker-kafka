#!/bin/bash

if [[ ! -d ./pki ]]
  then echo "Directory \"pki\" does not exist, creating"; mkdir -p -m 0700 pki
  else echo "Directory \"pki\" exists"
fi

keytool -genkeypair \
  -alias kafka \
  -keystore pki/kafka.jks \
  -storepass 123456 \
  -validity 365 \
  -dname "CN=kafka.com"
