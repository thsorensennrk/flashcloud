keytool -delete -alias selfsigned -keystore /usr/local/FlashphonerWebCallServer/conf/wss.jks  -storepass password

openssl pkcs12 -export -out /usr/local/FlashphonerWebCallServer/conf/zz.blackedge.org.p12 -inkey /usr/local/FlashphonerWebCallServer/conf/private.key -in /usr/local/FlashphonerWebCallServer/conf/cert.crt -certfile /usr/local/FlashphonerWebCallServer/conf/ca_bundle.crt -name zz.blackedge.org -password pass:password

keytool -importkeystore -srckeystore /usr/local/FlashphonerWebCallServer/conf/zz.blackedge.org.p12 -srcstoretype PKCS12 -destkeystore /usr/local/FlashphonerWebCallServer/conf/wss.jks -srcstorepass password -storepass password

