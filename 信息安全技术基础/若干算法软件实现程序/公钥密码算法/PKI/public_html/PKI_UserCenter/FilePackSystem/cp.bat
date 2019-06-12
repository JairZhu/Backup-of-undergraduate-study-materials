cls
del PackageMessage.jar
del *.class


javac -classpath .;BouncyCastle.jar PackageApplet.java

jar cvf PackageMessage.jar *.class

jarsigner -keystore C:/RootCaKeyStore/RootCaKeyStore  PackageMessage.jar  RootCaAuthCert