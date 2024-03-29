################################################
### 作者：Leo
### 更新时间：2023-02-06
### 微信公众号:Leo的生信笔记
### Github: https://github.com/liujialeo

### R 语言能干什么呢？
#################################################
### 1.首先是统计作图
### 加载数据
rm(list = ls())
load(file = "data/go.Rdata")
### 加载R包
library(ggplot2)
library(clusterProfiler)
### 画直方图
barplot(go, split="ONTOLOGY") +facet_grid(ONTOLOGY~., scale="free")
### 画点图
dotplot(go, split="ONTOLOGY") +facet_grid(ONTOLOGY~., scale="free")
### 修改标签
dotplot(go, split="ONTOLOGY",orderBy = "x") +
  facet_grid(ONTOLOGY~., scale="free")+
  scale_y_discrete(labels=function(x) stringr::str_wrap(x, width=60))

## 另外一个例子
load(file="data/EGG.Rdata")
barplot(EGG)
dotplot(EGG)

## 能力提高的时候可以定制！
## 把富集分数当成横坐标
if(T){
  x = EGG
  ## 提取富集分析的数据
  dd =x@result
  ## 计算富集分数
  dd$richFactor =dd$Count / as.numeric(sub("/\\d+", "", dd$BgRatio))
  ## 提取p值小于0.05 的数据
  dd <- dd[dd$p.adjust < 0.05,]
  
  library(ggplot2)
  ## 正式画图
  ggplot(dd,aes(richFactor,forcats::fct_reorder(Description, richFactor))) + 
    ## 画横线
    geom_segment(aes(xend=0, yend = Description)) +
    ## 画点
    geom_point(aes(color=p.adjust, size = Count)) +
    ## 调整颜色的区间,begin越大，整体颜色越明艳
    scale_color_viridis_c(begin = 0.3, end = 1) +
    ## 调整泡泡的大小
    scale_size_continuous(range=c(2, 10)) +
    theme_bw() + 
    xlab("Rich factor") +
    ylab(NULL) + 
    ggtitle("")
}

################################################
## 2.R语言，任何另外一个编程语言作用，批量
rm(list = ls())
## 判断癌和癌旁组织
## 1.加载数据
load(file = "data/TCGA_exprSet_plot.Rdata")
metadata <- data.frame(TCGA_id=rownames(exprSet))

## for循环批量处理
for (i in 1:nrow(metadata)) {
  print(i)
  num <- as.numeric(substring(metadata[i,1],14,15))
  if (num %in% seq(1,9)) {metadata[i,2] = "Tumor"}
  if (num %in% seq(10,29)) {metadata[i,2] = "Normal"}
}
## 修改列名
colnames(metadata) <- c("TCGA_id","sample")

#################################################
## 3.复现公共数据的图表

### 加载数据
load(file = "data/plotdf.Rdata")
if(T){
  library(ggplot2)
  options(scipen = 2)
  ggplot(plotdf,aes(-log10(p.value),cor))+
    geom_point(size=6,fill="purple",shape = 21,colour="black",stroke = 2)+
    scale_y_continuous(expand = c(0,0),limits = c(-1.1,1.1),breaks = seq(-1,1,0.2))+
    scale_x_log10(limits = c(0.01, 1000),breaks = c(0.01,0.1,10,1000))+
    geom_hline(yintercept = 0,size=1.5)+
    geom_vline(xintercept = -log10(0.05),size=1.5)+
    labs(x=bquote(-log[10]~italic("P")),y="Pearson correlation (r)")+
    theme(axis.title=element_text(size=20),
          axis.text = element_text(face = "bold",size = 16),
          axis.ticks.length=unit(.4, "cm"),
          axis.ticks = element_line(colour = "black", size = 1),
          panel.background = element_blank(),
          panel.grid.major = element_blank(), 
          panel.grid.minor = element_blank(),
          axis.line = element_line(colour = "black"),
          panel.border = element_rect(colour = "black", fill=NA, size=1.5),
          plot.margin = margin(1, 1, 1, 1, "cm"))
}

### 增强可读性，化为己用。
source("resource/pancorplot.R")
pancorplot(plotdf)
pancorplot(plotdf,anotate=c("BRCA"))
pancorplot(plotdf,anotate=c("BRCA","GBM"))
#################################################
### 4.如果临床医生以及科研人员只学一门语言，那就是R语言
load(file = "data/dataone.Rdata")
if(T){
  ### 构建两个函数
  rndr <- function(x, name, ...) {
    if (length(x) == 0) {
      y <- data[[name]]
      s <- rep("", length(render.default(x=y, name=name, ...)))
      if (is.numeric(y)) {
        p <- t.test(y ~ data$strat)$p.value
      } else {
        p <- chisq.test(table(y, droplevels(data$strat)))$p.value
      }
      s[2] <- sub("<", "&lt;", format.pval(p, digits=3, eps=0.001))
      s
    } else {
      render.default(x=x, name=name, ...)
    }
  }
  
  rndr.strat <- function(label, n, ...) {
    ifelse(n==0, label, render.strat.default(label, n, ...))
  }
  
  ### 直接作图
  library(table1)
  table1(~ gender + age + stage+fustat+sample| strat,
         data=data, droplevels=F, render=rndr, render.strat=rndr.strat, overall=F)
}

#################################################
### R语言能干什么？
### 四个方面：统计作图,批量操作,化为几用,生活助手
