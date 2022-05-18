#!/bin/sh

curl -s "https://finance.naver.com/item/main.naver?code=300080" > stock_flitto.html

# sed -i 's/utf-8/euc-kr/g' stock_flitto.html
sed "s/charset=utf-8/charset=euc-kr/g" stock_flitto.html
# iconv -c stock_flitto.html > stock_flitto.html

# cat stock_flitto.html

# grep "플리토" stock_flitto.html
# //html/body/div/dl/dd
# echo "cat //html/body/div/dl/dd" |  xmllint --html --shell stock_flitto.html

# while read line
# do
#     echo $line
# done < stock_flitto.html