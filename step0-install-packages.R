################################################
### 作者：Leo
### 更新时间：2023-02-06
### 微信公众号:Leo的生信笔记
### Github: https://github.com/liujialeo
################################################

################################################
################################################
### 第一步,设置安装位置的权限
################################################
################################################
#显示英文报错信息
Sys.setenv(LANGUAGE = "en") 
## 查看R包安装的位置，并设置权限
.libPaths()
#如果只出现一个地点，是正常的出现两个也不要惊慌。

################################################
################################################
### 第二步,安装CRAN上的R包
################################################
################################################
### 设置镜像，存在第二种方式
options("repos"=c(CRAN="https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
options(BioC_mirror="https://mirrors.tuna.tsinghua.edu.cn/bioconductor")
### 正式安装,如果问你，需要不需要编译（compilation？），点击否
## 运行以下程序，这个if语句会检测你的环境，如果没有那个R包才会自动帮你装
## 如果已经安装了，他会自动不装，所以，这些语句可以反复运行！不要怕点错。
## 成功会提示载入需要的程辑包：XXX，console里面出现>符号，并且没有出现报错(如果是warning不用管) 
## 如果出现：不存在叫‘XXX’这个名字的程辑包，那就把那一句再运行一次

if(!requireNamespace("tidyr",quietly = TRUE)) install.packages("tidyr",update = F,ask = F)
if(!requireNamespace("dplyr",quietly = TRUE)) install.packages("dplyr",update = F,ask = F)

if(!requireNamespace("stringr",quietly = TRUE)) install.packages("stringr",update = F,ask = F)
if(!requireNamespace("stringi",quietly = TRUE)) install.packages("stringi",update = F,ask = F)
if(!requireNamespace("viridisLite",quietly = TRUE)) install.packages("viridisLite",update = F,ask = F)
if(!requireNamespace("ggplot2",quietly = TRUE)) install.packages("ggplot2",update = F,ask = F)
if(!requireNamespace("data.table",quietly = TRUE)) install.packages("data.table",update = F,ask = F)
if(!requireNamespace("ggrepel",quietly = TRUE)) install.packages("ggrepel",update = F,ask = F)
if(!requireNamespace("devtools",quietly = TRUE)) install.packages("devtools",update = F,ask = F)
if(!requireNamespace("pheatmap",quietly = TRUE)) install.packages("pheatmap",update = F,ask = F)
if(!requireNamespace("ggfortify",quietly = TRUE)) install.packages("ggfortify",update = F,ask = F)
if(!requireNamespace("survival",quietly = TRUE)) install.packages("survival",update = F,ask = F)
if(!requireNamespace("survminer",quietly = TRUE)) install.packages("survminer",update = F,ask = F)
if(!requireNamespace("glmnet",quietly = TRUE)) install.packages("glmnet",update = F,ask = F)
if(!requireNamespace("ggpubr",quietly = TRUE)) install.packages("ggpubr",update = F,ask = F)
if(!requireNamespace("ggsignif",quietly = TRUE)) install.packages("ggsignif",update = F,ask = F)
if(!requireNamespace("tibble",quietly = TRUE)) install.packages("tibble",update = F,ask = F)
if(!requireNamespace("cowplot",quietly = TRUE)) install.packages("cowplot",update = F,ask = F)
if(!requireNamespace("xfun",quietly = TRUE)) install.packages("xfun",update = F,ask = F)
if(!requireNamespace("randomForest",quietly = TRUE)) install.packages("randomForest",update = F,ask = F)
if(!requireNamespace("Hmisc",quietly = TRUE)) install.packages("Hmisc",update = F,ask = F)
if(!requireNamespace("jsonlite",quietly = TRUE)) install.packages("jsonlite",update = F,ask = F)
if(!requireNamespace("corrplot",quietly = TRUE)) install.packages("corrplot",update = F,ask = F)
if(!requireNamespace("R.utils",quietly = TRUE)) install.packages("R.utils",update = F,ask = F)
if(!requireNamespace("purrr",quietly = TRUE)) install.packages("purrr",update = F,ask = F)
if(!requireNamespace("future.apply",quietly = TRUE)) install.packages("future.apply",update = F,ask = F)
if(!requireNamespace("pkgmaker",quietly = TRUE)) install.packages("pkgmaker",update = F,ask = F)
if(!requireNamespace("rngtools",quietly = TRUE)) install.packages("rngtools",update = F,ask = F)
if(!requireNamespace("bigmemory",quietly = TRUE)) install.packages("bigmemory",update = F,ask = F)
if(!requireNamespace("caret",quietly = TRUE)) install.packages("caret",update = F,ask = F)
if(!requireNamespace("forcats",quietly = TRUE)) install.packages("forcats",update = F,ask = F)
if(!requireNamespace("GOplot",quietly = TRUE)) install.packages("GOplot",update = F,ask = F)
if(!requireNamespace("ggupset",quietly = TRUE)) install.packages("ggupset",update = F,ask = F)
if(!requireNamespace("XML",quietly = TRUE)) install.packages("XML", type = "binary")
if(!requireNamespace("png",quietly = TRUE)) install.packages("png",update = F,ask = F)
if(!requireNamespace("msigdbr",quietly = TRUE)) install.packages("msigdbr",update = F,ask = F)
if(!requireNamespace("table1",quietly = TRUE)) install.packages("table1",update = F,ask = F)
if(!requireNamespace("ggExtra",quietly = TRUE)) install.packages("ggExtra",update = F,ask = F)
if(!requireNamespace("patchwork",quietly = TRUE)) install.packages("patchwork",update = F,ask = F)
if(!requireNamespace("ggstatsplot",quietly = TRUE)) install.packages("ggstatsplot",update = F,ask = F)
if(!requireNamespace("dendextend",quietly = TRUE)) install.packages("dendextend",update = F,ask = F)
if(!requireNamespace("factoextra",quietly = TRUE)) install.packages("factoextra",update = F,ask = F)
if(!requireNamespace("NMF",quietly = TRUE)) install.packages("NMF",update = F,ask = F)
################################################
################################################
### 第三步,安装Bioconductor上的R包
################################################
################################################
### 以之前的方式安装这个包，这个包是安装bioconductor包的基础

if(!requireNamespace("BiocManager",quietly = TRUE)) install.packages("BiocManager",update = F,ask = F)
### 注意！！！如果跳出选项问你是否updata, 输入或者点击no

### 正式安装
## 运行以下程序，这个if语句会检测你的环境，如果没有那个R包才会自动帮你装
## 如果已经安装了，他会自动不装，
## 所以，这些语句可以反复运行！不要怕点错。
## 成功会提示载入需要的程辑包：XXX，console里面出现>符号，并且没有出现报错(如果是warning不用管) 
## 如果出现：不存在叫‘XXX’这个名字的程辑包，那就把那一句再运行一次
if(!requireNamespace("limma",quietly = TRUE)) BiocManager::install("limma",update = F,ask = F)
if(!requireNamespace("Biobase",quietly = TRUE)) BiocManager::install("Biobase",update = F,ask = F)
if(!requireNamespace("IRanges",quietly = TRUE)) BiocManager::install("IRanges",update = F,ask = F)
if(!requireNamespace("GenomeInfoDbData",quietly = TRUE)) BiocManager::install("GenomeInfoDbData",update = F,ask = F)
if(!requireNamespace("DO.db",quietly = TRUE)) BiocManager::install("DO.db",update = F,ask = F)
if(!requireNamespace("GO.db",quietly = TRUE)) BiocManager::install("GO.db",update = F,ask = F)
if(!requireNamespace("fgsea",quietly = TRUE)) BiocManager::install("fgsea",update = F,ask = F)
if(!requireNamespace("gridGraphics",quietly = TRUE)) BiocManager::install("gridGraphics",update = F,ask = F)
if(!requireNamespace("clusterProfiler",quietly = TRUE)) BiocManager::install("clusterProfiler",update = F,ask = F)
if(!requireNamespace("GEOquery",quietly = TRUE)) BiocManager::install("GEOquery",update = F,ask = F)
if(!requireNamespace("hugene10sttranscriptcluster.db",quietly = TRUE)) BiocManager::install("hugene10sttranscriptcluster.db",update = F,ask = F)
if(!requireNamespace("DOSE",quietly = TRUE)) BiocManager::install("DOSE",update = F,ask = F)
if(!requireNamespace("GSEABase",quietly = TRUE)) BiocManager::install("GSEABase",update = F,ask = F)
if(!requireNamespace("enrichplot",quietly = TRUE)) BiocManager::install("enrichplot",update = F,ask = F)
if(!requireNamespace("DESeq2",quietly = TRUE)) BiocManager::install("DESeq2",update = F,ask = F)
if(!requireNamespace("edgeR",quietly = TRUE)) BiocManager::install("edgeR",update = F,ask = F)
if(!requireNamespace("pathview",quietly = TRUE)) BiocManager::install("pathview",update = F,ask = F)
if(!requireNamespace("GSVA",quietly = TRUE)) BiocManager::install("GSVA",update = F,ask = F)

## 安装export出图神器
if(!requireNamespace("officer",quietly = TRUE)) install.packages("officer",update = F,ask = F)
if(!requireNamespace("rvg",quietly = TRUE)) install.packages("rvg",update = F,ask = F)
if(!requireNamespace("flextable",quietly = TRUE)) install.packages("flextable",update = F,ask = F)
if(!requireNamespace("rgl",quietly = TRUE)) install.packages("rgl",update = F,ask = F)
if(!requireNamespace("stargazer",quietly = TRUE)) install.packages("stargazer",update = F,ask = F)
if(!requireNamespace("export",quietly = TRUE)) install.packages("./useful/export-master/", repos = NULL,type = "source")

