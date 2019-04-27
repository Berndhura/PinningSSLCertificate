# PinningSSLCertificate

get the certificate from server: 

openssl s_client -connect www.apple.com:443 -servername www.apple.com < /dev/null | openssl x509 -outform DER > appleCert.cer

Android Library: https://github.com/datatheorem/TrustKit-Android

Youtube: SPKI explained:

https://www.youtube.com/watch?v=O7aTw81R6OI

SSL pinning in iOS:

https://infinum.co/the-capsized-eight/ssl-pinning-revisited
