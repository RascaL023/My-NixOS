if [[ $1 == 1 ]] then
    clear;
fi

# javac -d bin -cp lib/* src/jsoncgen/*.java
# java -cp bin:lib/* jsoncgen.Main

javac -d bin -cp "lib/*" $(find src -name "*.java")
java -cp bin:lib/* jsoncgen.Main

read -s

if [[ $2 == 1 ]] then
    clear;
fi
