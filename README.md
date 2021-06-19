## Content

    ├── pom.xml                         project object model to build with Maven
    ├── README.md                       this file
    └── src
        ├── main
        |   ├── cup
        |   |   └── vc.cup              vocabulary, production rule
        |   ├── java
        |   |   ├── Main.java           main func
        |   |   └── VCToken.java        define token
        |   └── jflex
        |       └── vc.flex
        └── test     

To build:

    mvn compile

The **compile** phase will generate the sources, and build all Java classes, including those generated automatically.

Expected output:

* Java compiled class files in `target/classes`.

To package:

    mvn package

The **package** phase does everything above and packages the jar archive of the Java classes. You can then run

    java -jar target/vc_compiler-full-1.0-SNAPSHOT.jar src/test/data/test.txt