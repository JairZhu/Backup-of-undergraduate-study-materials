cls

del UnpackMessage.jar
del *.class

javac -classpath .;BouncyCastle.jar UnpackApplet.java

jar cvf UnpackMessage.jar *.class

jarsigner -keystore C:/RootCaKeyStore/RootCaKeyStore  UnpackMessage.jar  RootCaAuthCert