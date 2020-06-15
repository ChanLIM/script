#서버 이전을 위해 로그를 수집해달라는 요청이 들어와서 로그를 수집하려합니다. <br>


## 1.
https://github.com/ChanLIM/script 페이지를 fork 합니다. (본인 repo) <br>
본인의 repo에 script repository가 생기면 들어가서 git 주소 복사. <br>
ex.) https://github.com/본인계정/script.git

## 1-2.
본인 개인 서버에 접속하여 
git clone https://github.com/본인계정/script.git <br>

cd script <br>
생성된 script 폴더로 가서, 

git remote add upstream https://github.com/본인계정/script.git<br>


## 2.
sudo sh cfg2html-linux.sh <br>
로 해당 쉘 스크립트를 실행하시면, 다음 파일들이 생성됩니다.

tako@2080ti:~/script/Linux/Cfg2html_Linux$ ls <br>
2080ti.err  2080ti.html  2080ti.partitions.save  2080ti.txt  cfg2html-linux.sh  README <br>

## 3.
해당 디렉토리에서 
rm -rf \*tar.gz 로 다른 사람들의 압축파일을 없애고, <br>

tar --exclude='./.git' -czvf 본인이름.tar.gz . <br>

로 남은 파일들을 압축한 후, (끝에 점 중요)

## 4.
git checkout -b upstream <br>
git add 본인이름.tar.gz <br>
git commit <br>

git push origin upstream <br> <br>
를 차례로 입력하시고, <br>
output으로 나온 주소 ex.) https://github.com/본인계정/script/pull/new/BRANCHNAME 
로 가서 

## 5.
pull request 해주시기 바랍니다.<br>
Pull request 후 본인 repo에서 script repo는 삭제하시면 됩니다.


참고사이트 : https://wayhome25.github.io/git/2017/07/08/git-first-pull-request-story/


Cfg2Html (c) by ROSE SWE, Dipl.-Ing. Ralph Roth

This is the "swiss army knife" for the ASE, CE, sysadmin etc.
I wrote it to get the nessary informations to plan an update,
to performe basic trouble shooting or performance analysis.
As a bonus cfg2html creates a nice HTML and plain ASCII
documentation. If you are missing something, let me know it!

S E C U R I T Y
---------------
For security reasons it is better to store the HTML and ASCII files
in a safe place where only root user have access. Then remove the 
files from your file system.

  Usage: cfg2html_linux.sh [OPTION]
  creates HTML and plain ASCII host documentation

  -o            set directory to write or use the environment
                variable OUTDIR="/path/to/dir" (directory must
                exist
  -v            output version information and exit
  -h            display this help and exit

  use the following options to disable collections:

  -s            disable: System
  -c            disable: Cron
  -S            disable: Software
  -f            disable: Filesystem
  -l            disable: LVM
  -k            disable: Kernel
  -e            disable: Enhancements
  -n            disable: Network
  -a            disable: Applications
  -H            disable: Hardware
  -x            don't create background images


To get a new version visit:	 http://www.cfg2html.com

------------------------------------------------------------------

Original HP Version:  Ralph Roth, ROSE SWE, rose_swe@hotmail.com

Linux port         :  Michael Meifert dk3hg@users.sourceforge.net
cfg2html_linux ported (c) by Michael Meifert, SysAdm using
a Debian i386 System

For your information, there are SUN and SCO versions available:

Solaris port       :  Trond E. Aune, SysAdm t505414@online.no
SCO port           :  Jan Damen, Support Specialist jdamen@triple-p.nl
