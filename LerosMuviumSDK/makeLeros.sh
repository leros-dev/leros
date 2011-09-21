javac -target 1.5 -g -cp ./:./lib/lerosAPI.jar:./lib/jdom.jar:./lib/jaxen.jar:.  Blink.java
java -cp ./:./lib/Muvium-Leros.jar:./lib/LerosAPI.jar:./lib/jdom.jar:./lib/jaxen.jar:.  MuviumMetal Blink config.xml  muvium.asm

cp muvium.asm ../asm
