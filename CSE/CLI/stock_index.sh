#!/bin/sh

curl -s "https://finance.naver.com/item/main.naver?code=300080" > stock_flitto.html

iconv -c -f euc-kr -t utf-8 stock_flitto.html > stock_flitto_enc.html

text=$(grep ".*현재가.*</dd>$" stock_flitto_enc.html)

price_now=$(echo $text | grep -oE "현재가 [0-9.,]+" | sed -e "s/현재가 //g")
price_diff=$(echo $text | grep -oE "상승|하락 [0-9.,]+" | sed -e "s/상승 /+/g" |sed -e "s/하락 /-/g")
percent=$(echo $text | grep -oE "플러스|마이너스 [0-9.,]+" | sed -e "s/플러스 /+/g" |sed -e "s/마이너스 /-/g")

echo "stock_index: $price_now ($price_diff, $percent%)"