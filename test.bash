#!/bin/bash
#SPDX-FIleCopyrightText: 2025 Daiki ojima j3131lnn@sit.ac.jp
#SPDX-License-Identifier:BSD-3-Clause

ng(){
	echo NG at Line $1
	res=1
}

res=0

out=$(seq 5 | ./plus)

[ "${out}" = 15.0] || ng ${LINENO}

[ "$res" = 0 ] && echo OK
exit $res

