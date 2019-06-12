cls
javac -classpath .;BouncyCastle.jar FilePackage.java
rem javac -classpath .;BouncyCastle.jar FilePackagePKCS12.java

java -classpath .;BouncyCastle.jar FilePackage hjy/mail.exe  hjy/mail1.exe hjy/Encrypt.cer hjy/SignPvk.pem
java -classpath .;BouncyCastle.jar FilePackage hjy/text.txt  hjy/text1.txt hjy/Encrypt.cer hjy/SignPvk.pem
java -classpath .;BouncyCastle.jar FilePackage hjy/pic.jpg  hjy/pic1.jpg hjy/Encrypt.cer hjy/SignPvk.pem

rem java -classpath .;BouncyCastle.jar FilePackagePKCS12 hjy/mail.exe hjy/mail2.exe hjy/Encrypt.cer hjy/pkcsEncrypt.pfx
