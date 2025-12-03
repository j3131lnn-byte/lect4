#!/bin/bash
#SPDX-FIleCopyrightText: 2025 Daiki ojima j3131lnn@sit.ac.jp
#SPDX-License-Identifier:BSD-3-Clause

ng(){
    echo "NG at Line $1"
    res=1
}

res=0

# 1ケース目: 正常 (1+2+3+4+5=15)
out=$(seq 5 | ./plus)
[ "$out" = "15" ] || ng ${LINENO}

# 2ケース目: 「あ」が入ったら終了ステータス1 & 出力なし
out=$(echo あ | ./plus)
status=$?              # ./plus の終了ステータスを保存
[ "$status" = 1 ] || ng ${LINENO}
[ -z "$out" ]  || ng ${LINENO}   # 出力が空かどうか

# 3ケース目: 空行だけでも終了ステータス1 & 出力なし
out=$(echo | ./plus)
status=$?
[ "$status" = 1 ] || ng ${LINENO}
[ -z "$out" ]  || ng ${LINENO}

[ "$res" = 0 ] && echo OK
exit $res

