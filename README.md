## INT3402 20

# Cấu trúc chương trình

    ├── pom.xml                         các tham số để build chương trình bằng Maven
    ├── README.md                       this file
    ├── src
    │    ├── main
    │    │   ├── cup
    │    │   │   └── vc.cup              định nghĩa praser gồm bộ từ vựng và các luật sinh
    │    │   ├── java
    │    │   │   ├── Main.java           Hàm main đọc dữ liệu từ input đưa vào phân tích
    │    │   │   └── VCToken.java        Định nghĩa dạng Token
    │    │   └── jflex
    │    │       └── vc.flex             Định nghĩa Scanner
    │    └── test
    │        └── data
    │            └── test.txt            input test
    ├── Lexical_analysis.out (option)    output file            
    └── vc_compiler-full-1.0-SNAPSHOT    file jar build từ code trên

# Hướng dẫn chạy

## **Cách 1:**  
Chạy file jar bằng cmd

> java -jar vc_compiler.jar <path-to-input-file>

Nếu không có điền đường dẫn đến file input thì sau đó chương trình sẽ yêu cầu nhập đường dẫn đến file input để tiếp tục
chạy. Sau đó sẽ suất output ra file `Lexical_analysis.out`. Trong file gồm nhiều dòng. Mỗi dòng là 1 cặp từ tố và tên
phân loại được định dạng theo cú pháp:
`Class: <tên phân loại> , Text: <từ tố>`

## **Cách 2:**  
**Build chương trình trừ code bằng Maven:**

    mvn compile

Quá trình này sẽ chuyển các file trong thư mục src (các file .java, .cup .flex) thành file java vào thư
mục `target/generated-sources/`
sau đó compile chúng thành class trong thư mục `target/classes/`.

**Đóng gói thành file jar:**

    mvn package

Quá trình này sẽ đóng gói tất cả các java class vào file .jar. File jar sẽ được tạo trong thư mục
`target/` với tên `vc_compiler.jar`. Sau đó ta có thể chạy với câu lệnh

    java -jar target/vc_compiler.jar <path-to-test-file>
