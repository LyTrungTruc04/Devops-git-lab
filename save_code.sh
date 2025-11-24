#!/bin/bash

#1. Kiểm tra xem người dùng có nhập message chưa
if [ -z "$1" ]; then
	echo "LỖI: Vui lòng nhập nội dung commit!"
	echo "Ví dụ: ./save_code.sh 'Update code mới'"
	exit 1
fi

#2. Lấy tên nhánh hiện tại
CURRENT_BRANCH=$(git branch --show-current)

#3. Cơ chế an toàn (Safety Check)
if [ "$CURRENT_BRANCH" == "main" ]; then
	echo "NGUY HIỂM: Bạn đang ở nhánh Main!"
	echo "Hãy chuyển sang nhánh khác trước khi commit!"
	exit 1
fi

#4. Thực thi quy trình
echo "Đang đẩy code lên nhánh: $CURRENT_BRANCH"
git add .
git commit -m "$1"
git push -u origin $CURRENT_BRANCH

echo "Xong! Code đã lên."

