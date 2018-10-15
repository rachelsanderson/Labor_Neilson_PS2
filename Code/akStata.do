********************************************************************************
* Project:   AK Replication Code
* Analyst:   Rachel Anderson
* Date:      14 Oct 2018 10:20:31
* This file: ak_replication.do
* Description: Code for checking my answers in Python
********************************************************************************

version 12
clear all
macro drop _all
set more off
// set graphics off

//Locals for saving figures, TeX files, etc.

cd "/Users/rachelanderson/Desktop/Dropbox/Labor/Neilson/PS/PS2" 
local data "/Users/rachelanderson/Desktop/Dropbox/Labor/Neilson/PS/PS2/Data" 

********************************************************************************

//load data 
import delimited "`data'/akdata.csv" 

//Program for making yob dummies
capture program drop make_qob_dum
program define make_qob_dum
	local i = 1
	while `i' <= 4 {
		gen qob`i' = qob == `i'
	local i = `i' + 1
	}
end

make_qob_dum

//drop non born in 30
drop if yob != 30

//Question 2 
reg lwage educ, r
 
//Question 3

reg educ qob2 qob3 qob4, r
reg educ qob1 qob3 qob4, r
reg educ qob1 qob2 qob4, r
reg educ qob1 qob2 qob3, r

ivreg2 lwage (educ = qob2 qob3 qob4), r
