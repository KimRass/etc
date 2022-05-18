- Reference: https://engineer-mole.tistory.com/200
- 변수에 액세스할 때 변수명의 앞에 $를 넣는다. 혹은 $넣어서 변수를 {}로 감싼다.
- 변수의 값이 덮어 쓰기되는 것을 방지하기 위해서는 readonly를 사용한다. (`readonly var`)
- `$0`: 스크립트명
- `&&`: And
- `||`: Or
- Shell script 실행 권한 부여
	- `chmod +x ./score2grade.sh`
	- `chmod`: Change mode
- `-iname`: Turns off case sensitivity.
- `-name`: Retain case sensitivity.

# `wc`
```sh
# `-w`: Count words.
# `-c`: Count bytes.
# `-m`: Count characters.
# `-l`: Count lines.
wc -l <file>
```