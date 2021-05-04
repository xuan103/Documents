# Linux 各種壓縮與解壓縮指令

---
## Contents

- [.tar](#tar)
- [.gz](#gz)
- [.tar.gz](#targz)
- [.bz](#bz)
- [.tar.bz](#tarbz)
- [.bz2](#bz2)
- [.tar.bz2](#tarbz2)
- [.xz](#xz)
- [.tar.xz](#tarxz)
- [.Z](#Z)
- [.tar.Z](#tarZ)
- [.tgz](#tgz)
- [.tar.tgz](#tartgz)
- [.7z](#7z)
- [.zip](#zip)
- [.rar](#rar)
- [.lha](#lha)

---

<h3 id="tar">.tar</h3>

- .tar (僅打包，無壓縮)

**打包**：
>$ tar cvf FileName.tar DirName

**解包**：
>$ tar xvf FileName.tar

>---
<h3 id="gz">.gz</h3>

**壓縮**：
>$ gzip FileName

**解壓縮** ：
>$ gunzip FileName.gz

OR

>$ gzip -d FileName.gz

>---
<h3 id="targz">.tar.gz</h3>

**壓縮**：
>$ tar zcvf FileName.tar.gz DirName

**解壓縮**：
>$ tar zxvf FileName.tar.gz

>---
<h3 id="bz">.bz</h3>

解壓縮 ：
>$ bzip2 -d FileName.bz

OR
>$ bunzip2 FileName.bz

>---
<h3 id="tarbz">.tar.bz</h3>

壓縮：unkown。

解壓縮：
>$ tar jxvf FileName.tar.bz

>---
<h3 id="bz2">.bz2</h3>

壓縮：
>$ bzip2 -z FileName

解壓縮 ：
>$ bzip2 -d FileName.bz2

OR
>$ bunzip2 FileName.bz2

>---
<h3 id="tarbz2">.tar.bz2</h3>

壓縮：
>$ tar jcvf FileName.tar.bz2 DirName

解壓縮：
>$ tar jxvf FileName.tar.bz2

>---
<h3 id="tarbz2">.tar.bz2</h3>

壓縮：
> tar -I lbzip2 -cvf FileName.tar.bz2 DirName

>---
<h3 id="xz">.xz</h3>

壓縮：
>$ xz -z FileName

解壓縮：
>$ xz -d FileName.xz

>---
<h3 id="tarxz">.tar.xz</h3>

壓縮：
>$ tar Jcvf FileName.tar.xz DirName

解壓縮：
> tar Jxvf FileName.tar.xz

>---
<h3 id="Z">.Z</h3>

壓縮：
>$ compress FileName

解壓縮：
>$ uncompress FileName.Z

>---
<h3 id="tarZ">.tar.Z</h3>


壓縮：
>$ tar Zcvf FileName.tar.Z DirName

解壓縮：
>$ tar Zxvf FileName.tar.Z

>---
<h3 id="tgz">.tgz</h3>

壓縮：
>$ tar zcvf FileName.tgz FileName

解壓縮：
>$ tar zxvf FileName.tgz

>---
<h3 id="tartgz">.tar.tgz</h3>

壓縮：
>$ tar zcvf FileName.tar.tgz FileName

解壓縮：
>$ tar zxvf FileName.tar.tgz

>---
<h3 id="tarbz2">.tar.bz2</h3>

壓縮：
>$ 7z a FileName.7z FileName

使用密碼 (PASSWORD) 壓縮：
>$ 7z a FileName.7z FileName -pPASSWORD

解壓縮：
>$ 7z x FileName.7z

>---
<h3 id="zip">.zip</h3>

壓縮：
>$ zip -r FileName.zip DirName

解壓縮：
>$ unzip FileName.zip

>---
<h3 id="rar">.rar</h3>

壓縮：
>$ rar a FileName.rar DirName

解壓縮 ：
>$ rar e FileName.rar

OR
>$ unrar e FileName.rar

OR: 在指定目錄內解壓縮。
>$ rar x FileName.rar DirName

>---
<h3 id="lha">.lha</h3>

壓縮：
>$ lha -a FileName.lha FileName

解壓縮：
>$ lha -e FileName.lha
