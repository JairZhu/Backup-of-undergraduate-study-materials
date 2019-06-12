del Apply.jar
del *.class

javac -classpath .;BouncyCastle.jar ApplyApplet.java

jar cvf Apply.jar *.class

jarsigner -keystore C:/RootCaKeyStore/RootCaKeyStore  Apply.jar  RootCaAuthCert