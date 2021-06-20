## INT3402 20

## Content

    ├── pom.xml                         project object model to build with Maven
    ├── README.md                       this file
    └── src
    |    ├── main
    |    |   ├── cup
    |    |   |   └── vc.cup              define vocabulary, production rule
    |    |   ├── java
    |    |   |   ├── Main.java           main func
    |    |   |   └── VCToken.java        define VCToken
    |    |   └── jflex
    |    |       └── vc.flex             define scanner
    |    └── test
    |        └── data
    |            └── test.txt            input test
    ├── Lexical_analysis.out (option)    output file            
    └── vc_compiler-full-1.0-SNAPSHOT    jar package build from this code

## How to run
To build:

    mvn compile

The **compile** phase will generate the sources, and build all Java classes, including those generated automatically.

Expected output:

* Java compiled class files in `target/classes`.

To package:

    mvn package

The **package** phase does everything above and packages the jar archive of the Java classes. You can then run

    java -jar target/vc_compiler-full-1.0-SNAPSHOT.jar <path-to-test-file>