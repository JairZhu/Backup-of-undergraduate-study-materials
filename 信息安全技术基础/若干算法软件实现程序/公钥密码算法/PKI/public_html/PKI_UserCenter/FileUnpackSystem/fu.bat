cls
rem javac -classpath .;BouncyCastle.jar FileUnpack.java
javac -classpath .;BouncyCastle.jar FileUnpackPKCS12.java

rem java -classpath .;BouncyCastle.jar FileUnpack hjy/mail1.exe hjy/mail.exe hjy/Sign.cer hjy/DecryptPvk.pem
rem java -classpath .;BouncyCastle.jar FileUnpack hjy/text1.txt hjy/text.txt hjy/Sign.cer hjy/DecryptPvk.pem
rem java -classpath .;BouncyCastle.jar FileUnpack hjy/pic1.jpg hjy/pic.jpg hjy/Sign.cer hjy/DecryptPvk.pem

java -classpath .;BouncyCastle.jar FileUnpackPKCS12 hjy/pic1.jpg hjy/pic.jpg hjy/Sign.cer hjy/pkcsEncrypt.pfx
