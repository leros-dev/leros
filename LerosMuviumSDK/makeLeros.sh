javac -target 1.5 -g -cp ./:./lib/Muvium-Leros-API.jar:.  Blink.java
java -cp ./:./lib/Muvium-Leros.jar:./lib/Muvium-Leros-API.jar:./lib/jdom.jar:./lib/jaxen.jar:.  MuviumMetal Blink config.xml  muvium.asm

cp muvium.asm ../asm
