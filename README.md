# PinningSSLCertificate

get the certificate from server: openssl s_client -connect www.apple.com:443 -servername www.apple.com < /dev/null | openssl x509 -outform DER > appleCert.cer
