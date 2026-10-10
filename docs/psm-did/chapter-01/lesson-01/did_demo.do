clear all
* 第1章·第1节 DID基础：教学案例，非真实估计
* treated=1 新泽西州；treated=0 宾夕法尼亚州
* post=1 政策后；post=0 政策前
input byte treated byte post double y
1 0 20
1 1 23
0 0 22
0 1 21
end

quietly summarize y if treated==1 & post==0
scalar T0=r(mean)
quietly summarize y if treated==1 & post==1
scalar T1=r(mean)
quietly summarize y if treated==0 & post==0
scalar C0=r(mean)
quietly summarize y if treated==0 & post==1
scalar C1=r(mean)

* 双重差分：(23-20)-(21-22)=4
scalar DID=(T1-T0)-(C1-C0)
display "DID = " DID
* 教学案例每个单元格只有一个设定值，不估计标准误。