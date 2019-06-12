cls
del Conversion.jar
del *.class


javac -classpath .;BouncyCastle.jar ConversionApplet.java

jar cvf Conversion.jar *.class

jarsigner -keystore C:/RootCaKeyStore/RootCaKeyStore  Conversion.jar  RootCaAuthCert