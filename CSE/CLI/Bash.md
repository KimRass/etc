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

# Check `charset`
```sh
# For a file
file -bi <file>
# For a server
locale
```

# Convert File Encoding
```sh
iconv -c -f <encoding1> -t <encoding2> <file1> > <file2>

# Example
iconv -c -f euc-kr -t utf-8 stock_flitto.html > stock_flitto_enc.html
```

# `cat`
```sh
# 파일의 내용을 순서대로 출력
cat <file1> <file2> ...

# 입력한 내용으로 새로운 파일을 만듭니다.
# 내용을 입력하고 "ctrl + d"를 눌러 저장한다.)
# 기존 파일 내용을 지우고 처음부터 새로 입력합니다.
cat > <file>
# 기존 파일 내용에 연속해서 기록합니다.
cat >> <file>

# Merge files into the one.
cat <file1> <file2> > <file3>
# Copy
cat <file1> > <file2>
```

# Regular Expression

# grep
```sh
# <options>
	# `-o`: 매치되는 문자열만 표시.
	# `-E`: Extended grep includes meta characters that were added later.
grep [<option>] <pattern> <file>
```

# Split Text
```sh
echo $<text> | cut -d "<character>" -f1
```

# Text between two texts
```sh
echo $<text> | grep -Po "(?<=(<text1> )).*(?= <text2>)"
```

# Replace Text
```sh
:%s/<text1>/<text2>
```