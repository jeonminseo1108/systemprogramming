password
passwd
ls
cd
ls
vi sss
ls
del sss
scp -P 2222 "C:/Users/samsung/OneDrive/바탕 화면/assignment1.tar" sp201919932@sp01.snucse.org:~
cd 
cd
ls -al
ls
cmd
ls
tar -xzf assignment1.tar.gz
ls
cd assignment
cd assignment1
ls
cd
rm sss
ls
cd assignment1
vi readme.md 
cd test_files/
ls
vim test1.c
cd
cd assignment1/reference/
ls
./sampledecomment
cd
emacs gcc800
cd assignment1/src/
vim decomment.c
mv decomment.c ~/assignment1
ls
cd ..
ls
vim decomment.c
gcc800 -E decomment.c >decomment.i
ls
gcc800 -S decomment.i
rm decomment.i
ls
vim decomment.c
gcc800 -E decomment.c >decomment.i
gcc800 -S decomment.i
vim decomment.c
rm decomment.i
ls
gcc800 -E decomment.c >decomment.i
gcc800 -S decomment.i
ls
gcc800 -c decomment.s
gcc800 decomment.o -lc -o decomment
ls
cd reference/
ls
cd ..
chmod u+x sampledecomment
cd reference/
mv sampledecomment ~/assignment1
ls
cd
cd assignment1/
ls
chmod u+x sampledecomment
./sampledecomment < test_files/test1.c > output1 2> errors1
ls
./decomment < test_files/test1.c > output2 2> errors2
diff -c output1 output2
ls
diff -c errors1 errors2
ls
rm decomment.i decomment.s errors1 errors2 output1 output2 decomment.o decomment
ls
vim decomment.c
git status
git add decomment.c
git commit -m "error"
git push
vim decomment.c
gcc800 decomment.c -o decomment
./sampledecomment < test_files/test1.c > output1 2> errors1
./decomment < test_files/test1.c > output2 2> errors2
diff -c output1 output2
diff -c errors1 errors2
rm decomment
rm errors2 output2
ls
vim decomment.c
gcc800 decomment.c -o decomment
./decomment < test_files/test1.c > output2 2> errors2
diff -c errors1 errors2
diff -c output1 output2
git add decomment.c
git commit -m "error2"
git push
ls
rm decomment errors2 output2
vim decomment.c 
gcc800 decomment.c -o decomment
./decomment < test_files/test1.c > output2 2> errors2
diff -c output1 output2
rm decomment errors2 output2
vim decomment.c 
gcc800 decomment.c -o decomment
./decomment < test_files/test1.c > output2 2> errors2
diff -c output1 output2
rm decomment errors2 output2
ls
vim decomment.c 
gcc800 decomment.c -o decomment
./decomment < test_files/test1.c > output2 2> errors2
diff -c errors1 errors2
diff -c output1 output2
vim test_files/test1.c
rm decomment errors2 output2
vim decomment.c 
gcc800 decomment.c -o decomment
./decomment < test_files/test1.c > output2 2> errors2
diff -c output1 output2
diff -c errors1 errors2
vim decomment.c 
rm errors1 output1 errors2 output2
ls
./sampledecomment < test_files/test1.c > test_files/output11 2> test_files/errors11
./sampledecomment < test_files/test2.c > test_files/output12 2> test_files/errors12
./sampledecomment < test_files/test3.c > test_files/output13 2> test_files/errors13
./sampledecomment < test_files/test4.c > test_files/output14 2> test_files/errors14
./sampledecomment < test_files/test5.c > test_files/output15 2> test_files/errors15
cd test_files/
ls
cd ..
./decomment < test_files/test2.c > output22 2> errors22
diff -c test_files/output12 output22
diff -c test_files/errors12 errors22
./decomment < test_files/test3.c > output23 2> errors23
diff -c test_files/output13 output23
diff -c test_files/errors13 errors23
./decomment < test_files/test4.c > output24 2> errors24
diff -c test_files/output14 output24
diff -c test_files/errors14 errors24
./decomment < test_files/test5.c > output25 2> errors25
diff -c test_files/output15 output25
diff -c test_files/errors15 errors25
vim output22
vim test_files/output12
diff -c test_files/errors15 errors24
diff -c test_files/output15 output24
:q
cd ..
ls
cd assignment1/
ls
./decomment < test_files/test1.c > output21 2> errors21
diff -c test_files/output11 output21
diff -c test_files/errors11 errors21
ls
cd
git add .
git commit "success"
git commit -m "success"
git push
cd assignment1
git add .
git commit -m "success"
git push
vim decomment.c
cd
git reset
git push
git log
git reset --hard HEAD~1
git add decomment.c
git add assignment1/decomment.c
git commit --amend
git commit -m "success"
git config user.name "Jeonminseo"
git config user.email "idc08109@naver.com"
git commit -m "success"
git push
git add assignment1/decomment.c
git commit -m "succ"
git push
ls -al ~/.ssh
