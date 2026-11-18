-- source: D:\Dev\Lua\Deving\src\skin_src.lua | md5: 68f2806b264e34bf4a30c62851c12982 | source_mtime_utc: 2026-11-18T16:17:17Z
--[[
授权级别:不授权
Copyright 2025 [FL]。
该文件仅限我自己使用 谢绝授权
]]-- 请勿破解本文件
local T__HI__S__B__U_g__={}
local __T_His_B_U__g__={}
local __TH__I__S__b_u_g__={}
local T__H_I__s_b_uG_={}
local Th_i_s__B_U__g=require("\117\116\105\108\115"..
("\111\115\47"):reverse()
..
string.char(114, 97, 111, 110, 108)
..
string.char(105, 110, 101, 112, 108, 97)
..
("\114\101\121"):reverse()

)
local t__his__B_UG=SoraAPI["\106\115\111"..
"\110"]local __T__h__i__s_b_UG__={}
local __t__H__I_s_B__uG_={}
local __t_hi_s__bU__g__=TheNet:GetUserID()
local _t_hI__sBu__G=""
local __T_HIS_b_u_G;local _t__HI_Sb__Ug__={}
local function _tHisbU_g_(_TH_is_bug_)if not _TH_is_bug_ or _TH_is_bug_==""
or __T__h__i__s_b_UG__[_TH_is_bug_]or not TheNet:GetIsServer()
then return(133
+
138
*
5
==832)
end;local _thi_S_bU__G__=GetTimeRealSeconds()
if not _t__HI_Sb__Ug__[_TH_is_bug_]then _t__HI_Sb__Ug__[_TH_is_bug_]=_thi_S_bU__G__+40 end;return _thi_S_bU__G__<_t__HI_Sb__Ug__[_TH_is_bug_]end;local function _tHI_S__Bu__G__(__t_H_Isb__Ug,t__h__isB__ug)return((T__HI__S__B__U_g__[__t_H_Isb__Ug]and T__HI__S__B__U_g__[__t_H_Isb__Ug][t__h__isB__ug])
or(__TH__I__S__b_u_g__[__t_H_Isb__Ug]and __TH__I__S__b_u_g__[__t_H_Isb__Ug][t__h__isB__ug])
)
and(455
-
175
+
436
==716)
or(419
+
249
*
353
==88321)
end local function _Thi__S__b__ug__(t_His__b__uG_)return string[("\98\117\115"):reverse()
](t_His__b__uG_,-5)
==string.char(95, 110, 111, 110)
..
"\101"
end;local __t__H_IS__b__U_g=(179
+
286
*
215
+
305
*
203
==123590)
function SoraSkinCheckFn(T_H_is__Bu_G,T__hIs_B__uG_)if T_H_is__Bu_G and not T__hIs_B__uG_ then T__hIs_B__uG_=T_H_is__Bu_G end;T__hIs_B__uG_=GetSkinMap(T__hIs_B__uG_)
return _Thi__S__b__ug__(T__hIs_B__uG_)
or(__T_His_B_U__g__[T__hIs_B__uG_]or T__H_I__s_b_uG_[T__hIs_B__uG_])
and( false
 and
 
 false
 or
 
 false
 and
 
 true
 and
 
 true
 and
 
 true
 and
 not
 false
 or
 not
 false
 and
 not
 false
 and
 not
 false
 or
 
 false
)
or(417
-
475
*
206
*
278
-
283
~=-27202166)
end;function SoraSkinCheckClientFn(_t_hI_Sb_u__g__,t__h__i__s_B__U__g__,__T_hI_s__b_UG__)if type(__T_hI_s__b_UG__)
~="\115\116\114"..
string.char(105, 110, 103)

then return(15
*
66
*
326
-
91
-
281
~=322368)
end;local _t__Hi__Sbu_g__=GetSkin(__T_hI_s__b_UG__)
local __T__h_IS__b_U_G=GetSkinMap(__T_hI_s__b_UG__)
if _t__Hi__Sbu_g__ and _t__Hi__Sbu_g__["\105\115\99\104\97"..
"\114\97\99\116\101\114"..
"\115\107\105\110"..
"\115"]then return _Thi__S__b__ug__(__T__h_IS__b_U_G)
or _tHisbU_g_(t__h__i__s_B__U__g__)
or _tHI_S__Bu__G__(t__h__i__s_B__U__g__,__T__h_IS__b_U_G)
end;if _t__Hi__Sbu_g__ or GetSkin(__T__h_IS__b_U_G)
then return _tHI_S__Bu__G__(t__h__i__s_B__U__g__,__T__h_IS__b_U_G)
end;return IsItem({__T__h_IS__b_U_G}
)
and __T__h__i__s_b_UG__[t__h__i__s_B__U__g__]== (202
+
168
+
188
+
154
+
354
~=1070)
and _tHI_S__Bu__G__(t__h__i__s_B__U__g__,__T__h_IS__b_U_G)
end;UseSkin={}
function IsItem(TH_iS_B__u__g__)local t_H_I__s__b_U_G__=TH_iS_B__u__g__[1]if UseSkin[t_H_I__s__b_U_G__]then return(360
-
32
*
67
-
60
-
376
==-2220)
else return(15
*
341
-
204
+
67
-
81
==4907)
end end;function IsSkin(tHIS__B__u__g)return not IsItem(tHIS__B__u__g)
end;function RegUseSkinFN(_T_h__i__S_B_U_g__,__th__is__b_u_G_,_T__Hi_S_BU_G)UseSkin[_T_h__i__S_B_U_g__]={serverfn=
__th__is__b_u_G_,
clientfn=
_T__Hi_S_BU_G}
end;local _Th_i__sb__U__g_="\83\111\114\97\83"..
"\107\105\110"..
string.char(101, 104, 99, 97, 67)
:reverse()

local __t__H__I_SB_u_g_=_Th_i__sb__U__g_.."\95\115\101\114"..
"\118\101\114"
if TheNet:GetIsServer()
then TheSim:GetPersistentString(__t__H__I_SB_u_g_,function(T_H_ISBu__G__,
__t__hIs_bU__G__)
if T_H_ISBu__G__ then local __tH_I_s_B__U_G__,__t_h_is__B_Ug_=pcall(t__his__B_UG[("\100\111\99\101\100"):reverse()
..
"\101"],__t__hIs_bU__G__)
if __tH_I_s_B__U_G__ and type(__t_h_is__B_Ug_)
==string.char(101, 108, 98, 97, 116)
:reverse()

and type(__t_h_is__B_Ug_[string.char(111, 119, 110, 101, 114)
])
=="\116\97\98"..
string.char(108, 101)

and type(__t_h_is__B_Ug_["\116\109\112"])
=="\116\97\98\108"..
"\101"
then for __thi__S_BuG,_Th__i__SB_U_G_ in pairs(__t_h_is__B_Ug_["\111\119\110"..
string.char(114, 101)
:reverse()
])
do if not __T__h__i__s_b_UG__[__thi__S_BuG]and type(_Th__i__SB_U_G_)
=="\116\97\98\108"..
"\101"
then T__HI__S__B__U_g__[__thi__S_BuG]=_Th__i__SB_U_G_ end end;for __t__hiS__Bug,_T_HI_SBUG__ in pairs(__t_h_is__B_Ug_["\116\109\112"])
do if not __T__h__i__s_b_UG__[__t__hiS__Bug]and type(_T_HI_SBUG__)
=="\116\97\98\108"..
"\101"
then __TH__I__S__b_u_g__[__t__hiS__Bug]=_T_HI_SBUG__ end end end end end
)
end if not TheNet:IsDedicated()
then TheSim:GetPersistentString(_Th_i__sb__U__g_,function(_t__H__I__Sbu__g,
__t__h_I__S_B_U__g)
if _t__H__I__Sbu__g and not __T__h__i__s_b_UG__[__t_hi_s__bU__g__]then local _t__h_Is_b_u__g_,__ThI_s__B_u__g_=pcall(t__his__B_UG["\100\101\99\111\100"..
string.char(101)
],__t__h_I__S_B_U__g)
 if _t__h_Is_b_u__g_ and type(__ThI_s__B_u__g_)
=="\116\97\98\108\101"
and type(__ThI_s__B_u__g_[string.char(111, 119, 110)
..
"\101\114"])
==string.char(116, 97, 98, 108, 101)

and type(__ThI_s__B_u__g_["\116\109\112"])
==string.char(116, 97, 98, 108)
..
"\101"
then for __t__H__i_S__BU__G_,__T__h_I_s_B_UG in pairs(__ThI_s__B_u__g_[string.char(114, 101, 110, 119, 111)
:reverse()
])
do if type(__t__H__i_S__BU__G_)
=="\115\116\114\105"..
"\110\103"
and __T__h_I_s_B_UG==1 then __T_His_B_U__g__[__t__H__i_S__BU__G_]=__T__h_I_s_B_UG end end;for T_hi_sb_u__g_,_T_h_i_SB__UG_ in pairs(__ThI_s__B_u__g_["\116\109\112"])
do if type(T_hi_sb_u__g_)
=="\115\116\114\105\110"..
("\103"):reverse()

and _T_h_i_SB__UG_==1 then T__H_I__s_b_uG_[T_hi_sb_u__g_]=_T_h_i_SB__UG_ end end end end end
)
end;function SaveSkinCache()if TheNet:GetIsServer()
then local _Th_i_s__B__ug_,t_h__i__sBUG=pcall(t__his__B_UG[string.char(101, 110, 99, 111, 100, 101)
],{owner=
T__HI__S__B__U_g__,
tmp=
__TH__I__S__b_u_g__}
)
if _Th_i_s__B__ug_ then TheSim:SetPersistentString(__t__H__I_SB_u_g_,t_h__i__sBUG,(492
*
395
*
265
~=51500110)
)
end end;local _T__hIsB_u_g_,__th__I_S__B_ug=pcall(t__his__B_UG["\101\110\99\111\100\101"],{owner=
__T_His_B_U__g__,
tmp=
T__H_I__s_b_uG_}
)
if _T__hIsB_u_g_ then TheSim:SetPersistentString(_Th_i__sb__U__g_,__th__I_S__B_ug,(59
+
2
*
221
-
343
~=162)
)
end end;local _T_hiSB_Ug={sora_mysora=
1,
sora_mysora_r=
1,
sora_yhjd=
1,
sora_sby=
1}
 RegUseSkinFN("\115\111\114\97"..
"\95\121\105\110\103\121"..
"\117"
,function(__Thi__S_B__u__G,
_th_Is__b__u__G__)
if __Thi__S_B__u__G and __Thi__S_B__u__G["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114\97"..
("\111\99\109\101\116\105"):reverse()
..
string.char(110, 116, 114, 111, 108)
]then __Thi__S_B__u__G[string.char(99, 111, 109)
..
"\112\111\110\101"..
string.char(110, 116, 115)
][string.char(115, 111, 114, 97, 105)
..
string.char(116, 101, 109, 99, 111, 110)
..
"\116\114\111"..
"\108"]:CreateItem(string.char(115, 111, 114, 97)
..
"\95\121\105"..
"\110\103\121\117"
)
end end
)
RegUseSkinFN("\115\111\114"..
"\97\95\100\105\101"..
"\121\117"
,function(__t__H_I__S__B_ug,
TH__IS_B_ug_)
if __t__H_I__S__B_ug and __t__H_I__S__B_ug[string.char(99, 111, 109, 112)
..
"\111\110\101"..
"\110\116\115"][string.char(115, 111, 114, 97)
..
"\105\116\101\109"..
"\99\111\110\116\114\111"..
"\108"]then __t__H_I__S__B_ug["\99\111\109"..
"\112\111\110\101\110\116"..
"\115"]["\115\111\114\97\105"..
"\116\101\109\99\111"..
"\110\116\114"..
("\108\111"):reverse()
]:CreateItem("\115\111\114"..
"\97\95\100\105"..
"\101\121\117"
)
end end
)
RegUseSkinFN("\115\111\114"..
"\97\95\113\105"..
"\121\117"
,function(T_H_i_S_B_u_G_,
_T_h_I_sB__Ug__)
 if T_H_i_S_B_u_G_ and T_H_i_S_B_u_G_["\99\111\109\112"..
string.char(111, 110, 101, 110)
..
"\116\115"]["\115\111\114\97\105"..
"\116\101\109\99\111\110"..
"\116\114\111\108"]then T_H_i_S_B_u_G_["\99\111\109\112\111\110"..
string.char(101, 110, 116)
..
"\115"]["\115\111\114\97\105\116"..
string.char(99, 109, 101)
:reverse()
..
"\111\110\116\114"..
"\111\108"]:CreateItem("\115\111\114\97\95"..
"\113\105\121\117"
)
end end
)
 RegUseSkinFN(("\97\114\111\115"):reverse()
..
"\95\108\121\106"
,function(t__h__isb_u__G__,
T__H_i_S_B__Ug_)
if t__h__isb_u__G__ and t__h__isb_u__G__["\99\111\109\112\111"..
string.char(116, 110, 101, 110)
:reverse()
..
"\115"]["\115\111\114\97\105"..
string.char(116, 101, 109)
..
string.char(99, 111, 110)
..
"\116\114\111\108"]then t__h__isb_u__G__["\99\111\109\112\111\110"..
"\101\110\116"..
"\115"]["\115\111\114\97"..
"\105\116\101"..
string.char(109, 99, 111, 110)
..
"\116\114\111\108"]:CreateItem("\115\111\114\97\95\108"..
"\121\106"
)
end end
)
RegUseSkinFN("\115\111\114\97"..
("\110\97\108\95"):reverse()
..
("\110\114\101\116"):reverse()

,function(__Thi__SB_ug__,
_t__h_i_s_B__u__g_)
if __Thi__SB_ug__ and __Thi__SB_ug__["\99\111\109\112\111"..
"\110\101\110\116\115"]["\115\111\114\97\105"..
"\116\101\109\99"..
string.char(111, 110, 116, 114)
..
"\111\108"]then __Thi__SB_ug__[("\110\111\112\109\111\99"):reverse()
..
"\101\110\116\115"]["\115\111\114\97\105\116"..
("\111\99\109\101"):reverse()
..
string.char(110, 116, 114, 111, 108)
]:CreateItem("\115\111\114"..
"\97\95\108"..
"\97\110\116\101\114\110"
)
end end
)
RegUseSkinFN("\115\111\114\97\95\108"..
"\97\110\116\101"..
"\114\110\95\121\104"
,function(_th_is__bu_G,
_tH__Is__B__ug__)
if _th_is__bu_G and _th_is__bu_G[string.char(99, 111, 109, 112, 111, 110)
..
string.char(101, 110, 116, 115)
][string.char(115, 111, 114, 97, 105, 116)
..
"\101\109\99\111\110"..
string.char(116, 114, 111)
..
"\108"]then _th_is__bu_G["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114\97\105\116"..
"\101\109\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114"..
"\97\95\108\97\110"..
("\114\101\116"):reverse()
..
"\110"
,("\95\97\114\111\115"):reverse()
..
"\108\97\110\116"..
("\104\121\95\110\114\101"):reverse()

)
end end
)
 RegUseSkinFN("\115\111\114\97"..
"\95\114\105\110"..
string.char(103)

,function(__thiS__bU__G,
thi_Sbu_G)
if __thiS__bU__G and __thiS__bU__G[string.char(99, 111, 109)
..
string.char(112, 111, 110, 101, 110, 116)
..
("\115"):reverse()
]["\115\111\114\97\105"..
"\116\101\109"..
"\99\111\110\116\114\111"..
"\108"]then __thiS__bU__G["\99\111\109\112"..
string.char(111, 110, 101, 110, 116, 115)
][string.char(115, 111, 114, 97, 105, 116)
..
string.char(101, 109, 99, 111, 110, 116)
..
"\114\111\108"]:CreateItem("\115\111\114"..
"\97\95\114"..
"\105\110\103"
)
end end
)
 local function T__H__i__SB__u_g__(_tH_iS_Bu_G,_T__hI__s__bUg_,T__H__i_s__bU__g__)local t__h__i__sB_U__g_={}
t__h__i__sB_U__g_["\113\117\111\116\101"..
"\115"]=("\138\229\162\149\230"):reverse()
..
"\168\230\136\145"..
"\229\176\177\230"..
string.char(157, 128, 228)
..
"\186\134\228\189"..
"\160\229\147\166"
t__h__i__sB_U__g_["\114\97\114"..
"\105\116\121"]="\230\149\162\229\138"..
string.char(168, 230, 136)
..
"\145\229\176\177\230"..
"\157\128\228"..
"\186\134\228\189\160"..
string.char(166, 147, 229)
:reverse()

t__h__i__sB_U__g_[("\114\97\114"):reverse()
..
"\105\116\121"..
"\99\111\114\108\111\114"]={255/255,
215/255,
0/255,
1}
t__h__i__sB_U__g_["\114\97\114\105"..
"\116\121\111"..
string.char(114, 100, 101, 114)
]=100;t__h__i__sB_U__g_[string.char(114, 101, 108)
..
"\101\97\115\101"..
string.char(95, 103, 114, 111, 117)
..
("\112"):reverse()
]=-1006;t__h__i__sB_U__g_["\115\107\105"..
string.char(110, 95, 116, 97)
..
"\103\115"]={"\66\65\83\69"
,
"\115\111\114\97"
,
("\65\72\67"):reverse()
..
"\82\65\67\84\69\82"
}
t__h__i__sB_U__g_[string.char(115, 107, 105, 110, 115)
]={normal_skin=
_tH_iS_Bu_G,
ghost_skin=
"\103\104\111\115"..
"\116\95\115\111\114"..
"\97\95\98\117"..
"\105\108\100"
}
t__h__i__sB_U__g_["\99\104\101\99\107"..
"\102\110"]=SoraSkinCheckFn;t__h__i__sB_U__g_["\99\104\101\99"..
"\107\99\108\105\101"..
"\110\116\102"..
"\110"]=SoraSkinCheckClientFn;t__h__i__sB_U__g_["\115\104\97\114"..
"\101\95\98\105\103\112"..
string.char(111, 114, 116, 114)
..
"\97\105\116\95"..
"\110\97\109\101"]=string.char(115, 111, 114, 97)

t__h__i__sB_U__g_["\70\114\97"..
string.char(109, 101, 83, 121)
..
string.char(109, 98, 111, 108)
]=string.char(68, 105, 115, 116)
..
"\105\110\103"..
string.char(117, 105, 115, 104)
..
("\100\101"):reverse()

for __th_IS__Bu_G,T__HI__s_b__u_g__ in pairs(_T__hI__s__bUg_)
do t__h__i__sB_U__g_[__th_IS__Bu_G]=T__HI__s_b__u_g__ end;if t__h__i__sB_U__g_[string.char(105, 115, 95, 108, 111)
..
"\110\103\104\97\105"..
"\114"]then t__h__i__sB_U__g_["\115\107\105\110\115"][string.char(103, 104, 111, 115)
..
("\115\95\116"):reverse()
..
"\107\105\110"]="\103\104\111\115\116\95"..
("\114\111\115"):reverse()
..
"\97\95\114\95\98"..
"\117\105\108"..
"\100"
end MakeCharacterSkin("\115\111\114\97"
,_tH_iS_Bu_G,t__h__i__sB_U__g_,( false
 and
 
 false
 and
 
 false
 and
 not
 false
 and
 
 true
 and
 not
 true
 and
 
 false
 or
 not
 false
 or
 not
 false
 and
 
 false
)
)
if not T__H__i_s__bU__g__ then local __t_H_i__sB__u_G=shallowcopy(t__h__i__sB_U__g_)
__t_H_i__sB__u_G["\114\97\114\105\116\121"]="\233\153\144"..
"\230\151\182\228\189\147"..
("\140\170\233"):reverse()

__t_H_i__sB__u_G["\114\97\114\105"..
string.char(116, 121, 111, 114, 100)
..
"\101\114"]=80;__t_H_i__sB__u_G["\114\97\114"..
string.char(105, 116, 121, 99, 111, 114)
..
string.char(108, 111, 114)
]={0.957,
0.769,
0.188,
1}
__t_H_i__sB__u_G[string.char(83, 101, 109, 97, 114, 70)
:reverse()
..
"\121\109\98\111"..
"\108"]="\104\101\105\114\108\111"..
"\111\109"
__t_H_i__sB__u_G[string.char(110, 97, 109, 101)
]=_T__hI__s__bUg_["\110\97\109\101"]..string.char(40, 233, 153, 144, 230)
..
"\151\182\41"
SoraAPI[("\67\101\107\97\77"):reverse()
..
"\104\97\114\97"..
"\99\116\101\114\83"..
"\107\105\110"]("\115\111\114\97"
,_tH_iS_Bu_G.."\95\116\109\112"
,__t_H_i__sB__u_G,(452
-
74
-
412
==-34)
)
end end;T__H__i__SB__u_g__(string.char(115, 111, 114, 97, 95, 109)
..
"\121\115\111\114\97"
,{name=
"\232\138\177\229\171"..
"\129"
,
des=
"\230\137\167\229"..
"\173\144\228\185\139\230"..
"\137\139\44\228"..
"\184\142\229\173\144\229"..
"\129\149\232\128\129"
}
)
T__H__i__SB__u_g__("\115\111\114\97\95\109"..
"\121\115\111"..
string.char(114, 97, 95)
..
("\114"):reverse()

,{name=
"\232\138\177\229\171"..
"\129\45\233"..
string.char(149, 191, 229, 143, 145)

,
is_longhair=
(443
-
496
+
80
*
393
==31387)
,
des=
"\230\137\167"..
"\229\173\144\228"..
("\137\230\139\185"):reverse()
..
string.char(139, 44, 228)
..
"\184\142\229\173"..
"\144\229\129\149\232\128"..
"\129"
}
)
 T__H__i__SB__u_g__("\115\111\114\97"..
"\95\115\98\121"
,{name=
"\230\176\184\230\129"..
"\146\230\176\180\229\133"..
"\181\230\156\136"
,
des=
"\228\187\163\232"..
"\161\168\230"..
"\156\136\228\186\174\230"..
"\182\136\231\129\173\228"..
"\189\160"
,
init_fn=
function(T__h_I__s__b__u__G)
if T__h_I__s__b__u__G and TheWorld["\105\115\109"..
"\97\115\116\101"..
"\114\115\105\109"]then T__h_I__s__b__u__G["\115\111\114\97"..
"\102\111\111\116"..
("\120\102\95"):reverse()
]=SpawnPrefab("\115\111\114\97\95"..
"\102\111\111"..
"\116\95\102\120\95\115"..
string.char(98, 121)

)
T__h_I__s__b__u__G[string.char(115, 111, 114, 97)
..
"\102\111\111\116\95"..
string.char(102, 120)
]["\101\110\116\105"..
"\116\121"]:SetParent(T__h_I__s__b__u__G["\101\110\116\105\116"..
"\121"])
T__h_I__s__b__u__G[string.char(115, 111, 114)
..
string.char(97, 102, 111, 111, 116, 95)
..
"\102\120"][string.char(111, 119, 110)
..
"\101\114"]=T__h_I__s__b__u__G T__h_I__s__b__u__G["\115\111\114\97\100\97"..
string.char(110, 99, 101, 102)
..
"\120\112\114\101\102"..
"\97\98"]="\115\111\114"..
"\97\95\102\120\95\102"..
"\101\97\116\104"..
string.char(114, 101)
:reverse()

end end
,
clear_fn=
function(_th__I_S_B_u_G__)
if _th__I_S_B_u_G__ and _th__I_S_B_u_G__["\115\111\114\97"..
string.char(102, 111, 111)
..
"\116\95\102\120"]and TheWorld[string.char(105, 115, 109, 97, 115)
..
("\115\114\101\116"):reverse()
..
"\105\109"]then _th__I_S_B_u_G__["\115\111\114"..
"\97\102\111\111\116"..
"\95\102\120"]:Remove()
_th__I_S_B_u_G__["\115\111\114"..
"\97\100\97\110"..
"\99\101\102\120\112\114"..
string.char(101, 102, 97, 98)
]=nil
end end
}
)
MakeSkinNameMap("\115\111\114\97"..
"\95\115\100\115\122"
,("\115\95\97\114\111\115"):reverse()
..
string.char(100, 115, 122, 95)
..
string.char(114)

)
MakeSkinNameMap(("\97\114\111\115"):reverse()
..
"\95\115\100\115"..
"\122"
,"\115\111\114\97\98\97"..
"\103\95\115"..
("\100"):reverse()

)
MakeSkinNameMap("\115\111\114\97\95"..
"\119\115\113\121"
,"\115\111\114\97"..
"\98\97\103\95\119\115"..
"\113\121"
)
MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
"\95\108\100"
,"\115\111\114"..
"\97\112\97\99"..
"\107\101\114"..
string.char(95, 108, 100)

)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107"..
string.char(110, 111, 116, 95, 108)
..
"\100"
,"\115\111\114\97\51"..
"\112\97\99\107"..
string.char(100, 108, 95, 114, 101)
:reverse()

)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111\116\95"..
string.char(115, 98, 121)

,"\115\111\114\97\112\97"..
"\99\107\101"..
string.char(114, 95, 115, 98)
..
"\121"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110"..
string.char(111, 116, 95, 115, 98, 121)

,string.char(115, 111, 114, 97, 51, 112)
..
("\107\99\97"):reverse()
..
"\101\114\95\115\98"..
("\121"):reverse()

)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119"..
("\111\110\107"):reverse()
..
"\116\95\100\119"
,"\115\111\114\97"..
"\112\97\99\107\101"..
string.char(114, 95, 100, 119)

)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107\110\111"..
"\116\95\100\119"
,"\115\111\114\97"..
"\51\112\97\99\107\101"..
"\114\95\100"..
"\119"
)
 MakeSkinNameMap("\115\111\114"..
string.char(97, 98, 111, 119)
..
string.char(107, 110, 111, 116, 95)
..
string.char(104, 100)

,"\115\111\114\97"..
"\112\97\99\107"..
"\101\114\95\104"..
"\100"
)
MakeSkinNameMap(("\111\98\97\114\111\115"):reverse()
..
"\119\107\110\111\116\95"..
("\100\104"):reverse()

,"\115\111\114\97"..
"\112\97\99\107\101\114"..
"\95\104\100\50"
)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119"..
"\107\110\111"..
"\116\95\104\100"
,"\115\111\114"..
string.char(97, 51, 112, 97)
..
"\99\107\101\114\95"..
"\104\100"
)
MakeSkinNameMap(("\98\97\114\111\115"):reverse()
..
string.char(111, 119, 107)
..
"\110\111\116\95"..
"\104\100"
,string.char(115, 111, 114, 97, 51, 112)
..
"\97\99\107\101"..
"\114\95\104\100\50"
)
MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107"..
string.char(110, 111, 116, 95)
..
"\104\100"
,"\115\111\114\97\95"..
"\115\104\111\117"..
"\98\97\110"..
"\95\104\100"
)
MakeSkinNameMap("\115\111\114\97"..
("\107\119\111\98"):reverse()
..
"\110\111\116\95\104"..
"\100"
,string.char(115, 111, 114, 97)
..
string.char(95, 115, 104, 111, 117)
..
"\98\97\110\95"..
"\104\100\50"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(98, 111, 119, 107, 110, 111)
..
"\116\95\119\115\113\121"
,"\115\111\114\97\112"..
"\97\99\107\101\114\95"..
"\119\115\113\121"
)
MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
string.char(95, 119, 115, 113, 121)

,"\115\111\114\97"..
"\51\112\97"..
"\99\107\101"..
"\114\95\119\115"..
"\113\121"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111\116\95"..
"\100\119\95\116"..
"\109\112"
,"\115\111\114"..
"\97\112\97\99\107"..
"\101\114\95\100\119\95"..
"\116\109\112"
)
 MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
string.char(95, 100, 119, 95)
..
"\116\109\112"
,"\115\111\114\97\51"..
"\112\97\99\107\101\114"..
string.char(95, 100, 119, 95)
..
"\116\109\112"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\115\100"..
"\115\122\95"..
"\116\109\112"
,("\97\114\111\115"):reverse()
..
string.char(95, 115, 100)
..
"\115\122\95\114\95\116"..
"\109\112"
)
MakeSkinNameMap("\115\111\114\97\95"..
string.char(115, 100, 115)
..
string.char(122, 95, 116, 109, 112)

,"\115\111\114"..
string.char(97, 98, 97)
..
string.char(95, 100, 115, 95, 103)
:reverse()
..
"\116\109\112"
)
MakeSkinNameMap(string.char(95, 97, 114, 111, 115)
:reverse()
..
"\99\121\120"..
"\103"
,("\114\111\115"):reverse()
..
"\97\104\97\116"..
"\95\99\121\120\103"
)
MakeSkinNameMap(string.char(115, 111, 114, 97)
..
"\95\99\121\120\103"
,string.char(115, 111, 114)
..
"\97\50\104\97\116"..
"\95\99\121\120\103"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\99\121\120\103"
,string.char(115, 111, 114, 97, 116, 101)
..
"\108\101\95\99"..
"\121\120\103"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\99\121"..
"\120\103"
,("\97\109\97\114\111\115"):reverse()
..
"\103\105\99\95\99"..
("\103\120\121"):reverse()

)
MakeSkinNameMap(("\114\111\115"):reverse()
..
string.char(97, 95, 99, 121)
..
"\120\103"
,string.char(115, 111, 114)
..
"\97\112\105\99\107"..
"\95\99\121\120\103"
)
MakeSkinNameMap("\115\111\114"..
("\103\120\121\99\95\97"):reverse()

,"\115\111\114\97\50\112"..
"\108\97\110\116\95\99"..
"\121\120\103"
)
MakeSkinNameMap("\115\111\114\97\95\99"..
string.char(121, 120, 103)

,"\115\111\114\97\104\101"..
"\97\108\105\110\103"..
string.char(103, 120, 121, 99, 95)
:reverse()

)
MakeSkinNameMap("\115\111\114\97\95"..
"\106\121\121\104"
,"\115\111\114\97"..
string.char(50, 104, 97, 116)
..
"\95\106\121"..
"\121\104"
)
 MakeSkinNameMap("\115\111\114"..
"\97\95\106\121"..
"\121\104"
,"\115\111\114\97\104\97"..
"\116\95\106"..
"\121\121\104"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(95, 106, 121, 121, 104)

,"\115\111\114\97\116"..
"\101\108\101"..
"\95\106\121\121\104"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\106\121"..
string.char(121, 104)

,"\115\111\114\97\109"..
"\97\103\105"..
string.char(99, 95, 106, 121, 121)
..
("\104"):reverse()

)
MakeSkinNameMap("\115\111\114"..
"\97\95\106\121\121\104"
,"\115\111\114\97\112"..
"\105\99\107"..
"\95\106\121\121\104"
)
MakeSkinNameMap("\115\111\114\97\95"..
"\106\121\121"..
"\104"
,"\115\111\114\97\50\112"..
"\108\97\110"..
"\116\95\106\121\121\104"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\106\121\121\104"
,"\115\111\114"..
string.char(97, 104, 101, 97)
..
"\108\105\110"..
"\103\95\106\121"..
"\121\104"
)
 AddSimPostInit(function()
local _t__hIs__B__u_G__=ShouldDisplayItemInCollection;GLOBAL[string.char(83, 104, 111, 117, 108, 100)
..
"\68\105\115\112\108\97"..
"\121\73\116\101"..
"\109\73\110\67\111"..
"\108\108\101\99"..
"\116\105\111\110"]=function(_T_HIs_B_uG_,...
)
if(_T_hiSB_Ug[_T_HIs_B_uG_]or _T_HIs_B_uG_:match("\94\115\111"..
string.char(114, 97, 95)
..
"\46\43\95\116\109"..
string.char(36, 112)
:reverse()

)
)
and not SoraSkinCheckFn(TheInventory,_T_HIs_B_uG_)
then return(112
+
184
+
20
+
162
~=478)
end;return _t__hIs__B__u_G__(_T_HIs_B_uG_,...
)
end
end
)
local _t__H_i__s__B__ug;if SkinAPIThankYouPopup then _t__H_i__s__B__ug=SkinAPIThankYouPopup else _t__H_i__s__B__ug=require"screens/thankyoupopup"end;local function _T_his__bU_g__(_T_h__I__S__B__U__G__,_th_i__S__bug__)local __T__hI_s_b_uG__=GetSkinMapByBase(_T_h__I__S__B__U__G__)
local Thi__sbU_G_={}
for _t_h_I_s__BU_g,_tH_i_S_bu__G in pairs(__T__hI_s_b_uG__)
do table["\105\110\115"..
string.char(101, 114, 116)
](Thi__sbU_G_,{item=
_t_h_I_s__BU_g,
item_id=
1,
gifttype=
"\83\79\82\65\83\75"..
"\73\78"
}
)
end;local __T_H_iS_B_u__G_=_t__H_i__s__B__ug(Thi__sbU_G_)
if _th_i__S__bug__ then if _th_i__S__bug__["\115\107\105\110\110"..
string.char(97, 109, 101)
]then local tHI__SB_Ug_=__T_H_iS_B_u__G_["\83\101\116"..
"\83\107\105"..
"\110\78\97"..
"\109\101"]__T_H_iS_B_u__G_["\83\101\116\83\107\105"..
"\110\78\97\109\101"]=function(t__h__IS_b__Ug_,...
)
tHI__SB_Ug_(t__h__IS_b__Ug_,...
)
__T_H_iS_B_u__G_["\105\116\101\109\95"..
string.char(110, 97, 109, 101)
]:SetString(_th_i__S__bug__["\115\107\105\110\110"..
"\97\109\101"])
end
end if _T_h__I__S__B__U__G__:match("\94\73\79\85\95"
)
then local __tHISB__u__g=__T_H_iS_B_u__G_["\67\104\97"..
("\105\71\101\103\110"):reverse()
..
string.char(102, 116)
]__T_H_iS_B_u__G_["\67\104\97\110"..
"\103\101\71\105\102"..
string.char(116)
]=function(_T__hI__S_B_ug_,...
)
__tHISB__u__g(_T__hI__S_B_ug_,...
)
 __T_H_iS_B_u__G_["\115\112\97"..
"\119\110\95\112"..
"\111\114\116\97\108"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65"..
"\80\95\73\67"..
"\79\78"
,GetInventoryItemAtlas("\119\97\120"..
"\112\97\112\101"..
"\114\46\116\101\120"
)
,"\119\97\120\112"..
string.char(97, 112, 101, 114, 46)
..
"\116\101\120"
)
end
local _t__hI__s__B__U_g=__T_H_iS_B_u__G_["\79\112\101\110\71"..
"\105\102\116"]__T_H_iS_B_u__G_["\79\112\101\110"..
"\71\105\102"..
"\116"]=function(Th__I__s_BUg,...
)
_t__hI__s__B__U_g(Th__I__s_BUg,...
)
__T_H_iS_B_u__G_[("\110\119\97\112\115"):reverse()
..
"\95\112\111\114"..
"\116\97\108"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95"..
"\73\67\79"..
string.char(78)

,GetInventoryItemAtlas("\119\97\120\112"..
"\97\112\101\114"..
"\46\116\101"..
string.char(120)

)
,"\119\97\120\112"..
string.char(97, 112, 101)
..
"\114\46\116\101\120"
)
end
__T_H_iS_B_u__G_["\116\105\116\108\101"]:SetString(string.char(230, 172, 160, 230, 157, 161)
..
("\230\176\136\229\40"):reverse()
..
"\156\159\232\135\170\229"..
"\138\168\229\133"..
"\145\230\141\162"..
"\41"
)
end end;TheFrontEnd:PushScreen(__T_H_iS_B_u__G_)
end;local _t_h_i_S__B__u__g="\104\116\116\112"..
"\58\47\47\115\107"..
string.char(46, 110, 105)
:reverse()
..
"\102\108\97\112"..
"\105\46\99\110\47"..
"\97\112\105\47\68\115"..
string.char(116)

local T__H__Isbug=""
local __T_Hi__s__Bu_g__=0;local T__H_i_sB_U__G__=0;local function __T_h__i__SbUG()end;local __T__H_Is_B_uG=SoraCD(5,(137
*
195
*
296
+
266
~=7907915)
)
local function __t__h_I_S__B_u_G(__t_h_Is__b_u_G_,t__H__iSbU__G,_t__h_I__S__B__U_G)if not __T_HIS_b_u_G or __t_h_Is__b_u_G_=="\99\47\76\111"..
"\103\105\110"
or T__H__Isbug~=t__H__iSbU__G or T__H_i_sB_U__G__~=_t__h_I__S__B__U_G then return end;T__H__Isbug=""
__T_Hi__s__Bu_g__=0;if __T__H_Is_B_uG()
then __T_HIS_b_u_G()
elseif t__H__iSbU__G~=""
and TheWorld then TheWorld:DoTaskInTime(5,function()
if T__H__Isbug==""
and T__H_i_sB_U__G__==_t__h_I__S__B__U_G then __T_HIS_b_u_G()
end end
)
end end;local function __thI_sB_U_G__(__Th__I_S_bUg__,_Th__i__S_b_U_G,_T__h__I_sB_u__g)if not __Th__I_S_bUg__ then return(197
-
72
-
107
*
336
==-35822)
end;_Th__i__S_b_U_G=_Th__i__S_b_U_G or{}
_Th__i__S_b_U_G["\109\111\100"]=modname;_Th__i__S_b_U_G["\101\120\116"]=DATASKINEXT or{}
if DATASKINFN then DATASKINFN(_Th__i__S_b_U_G)
end;_T__h__I_sB_u__g=_T__h__I_sB_u__g or __T_h__i__SbUG;local T__H_iS_B__U_G,__t__HI_s__bUG__=pcall(t__his__B_UG["\101\110\99\111\100\101"],_Th__i__S_b_U_G)
if T__H_iS_B__U_G then local _THi_s_BUg__,tHI_Sb__Ug__=T__H__Isbug,T__H_i_sB_U__G__ QueryServer(_t_h_i_S__B__u__g..__Th__I_S_bUg__.."\63\116\111"..
"\107\101\110\61"
.._THi_s_BUg__,function(__t_His_B__U_G_,
__T__h_I_s_B_u__g,
_T_H__is_b__u__g_)
if __T__h_I_s_B_u__g and _T_H__is_b__u__g_==200 then __t__H_IS__b__U_g=(73
*
342
+
339
-
468
==24837)
local T__HI_S__bu__g__,T__H__i_s_b__u__G=pcall(t__his__B_UG["\100\101\99"..
"\111\100\101"],__t_His_B__U_G_)
if T__HI_S__bu__g__ and type(T__H__i_s_b__u__G)
==string.char(116, 97, 98, 108, 101)

then if T__H__i_s_b__u__G[string.char(100, 111, 99)
:reverse()
..
"\101"]==401 then __t__h_I_S__B_u_G(__Th__I_S_bUg__,_THi_s_BUg__,tHI_Sb__Ug__)
end _T__h__I_sB_u__g(T__H__i_s_b__u__G[string.char(99, 111, 100, 101)
],T__H__i_s_b__u__G["\109\115\103"],T__H__i_s_b__u__G["\100\97\116\97"])
else _T__h__I_sB_u__g(-3,"\101\114\114\32\106\115"..
"\111\110"
,__t_His_B__U_G_)
end elseif _T_H__is_b__u__g_==401 then __t__h_I_S__B_u_G(__Th__I_S_bUg__,_THi_s_BUg__,tHI_Sb__Ug__)
_T__h__I_sB_u__g(401,nil
,__t_His_B__U_G_)
else _T__h__I_sB_u__g(-2,_T_H__is_b__u__g_,__t_His_B__U_G_)
end end
,"\80\79\83\84"
,__t__HI_s__bUG__)
else _T__h__I_sB_u__g(-1,"\101\114\114"..
"\32\106\115\111"..
"\110"
)
end end;local _t__HI__S_b_ug={}
local __t_H__i__s_b_u_G_={}
local _th__i__s__b_u_G={}
local t__hi__S_b__UG_={5,
15,
30}
local _Th_I_sb_UG;local function __T__h_i__S__b_u__G(__T__H_I__S__B_u__g_)local th__is_bU__G__=_t__HI__S_b_ug[__T__H_I__S__B_u__g_]_t__HI__S_b_ug[__T__H_I__S__B_u__g_]=nil
 if th__is_bU__G__ then if th__is_bU__G__["\116\105\109\101"..
"\111\117\116\116\97\115"..
"\107"]then th__is_bU__G__["\116\105\109\101"..
"\111\117\116\116\97\115"..
string.char(107)
]:Cancel()
end;if th__is_bU__G__["\114\101\116"..
"\114\121\116\97\115\107"]then th__is_bU__G__["\114\101\116"..
"\114\121\116\97"..
"\115\107"]:Cancel()
end end end _Th_I_sb_UG=function(__t_hiS_b__U__g_,
__th_i__Sb__u_g)
if _t__HI__S_b_ug[__t_hiS_b__U__g_]~=__th_i__Sb__u_g then return end;__th_i__Sb__u_g["\97\116\116\101\109\112"..
"\116\115"]=__th_i__Sb__u_g["\97\116\116\101"..
"\109\112\116\115"]+1;local ThI__s_b__uG_={}
__th_i__Sb__u_g["\114\101\113\117\101\115"..
string.char(116)
]=ThI__s_b__uG_;local function t_h_i_S_B__U_G(__T_HIs__B__ug__,_t_h_i_S_b_u__g__,_t_H__I_s_b_U__g)if _t__HI__S_b_ug[__t_hiS_b__U__g_]~=__th_i__Sb__u_g or __th_i__Sb__u_g["\114\101\113\117"..
"\101\115\116"]~=ThI__s_b__uG_ then return end;__th_i__Sb__u_g["\114\101\113"..
string.char(117, 101, 115)
..
"\116"]=nil
if __th_i__Sb__u_g["\116\105\109\101\111\117"..
"\116\116\97\115\107"]then __th_i__Sb__u_g["\116\105\109"..
"\101\111\117\116\116\97"..
"\115\107"]:Cancel()
__th_i__Sb__u_g["\116\105\109\101\111\117"..
"\116\116\97"..
string.char(115, 107)
]=nil
end;if __th_i__Sb__u_g["\114\101\102\114"..
"\101\115\104\65\102"..
"\116\101\114"..
"\85\110\108\111"..
string.char(99, 107)
]then __th_i__Sb__u_g[string.char(101, 114, 102, 101, 114)
:reverse()
..
string.char(115, 104, 65, 102, 116, 101)
..
string.char(114, 85, 110, 108)
..
"\111\99\107"]=nil
__th_i__Sb__u_g["\97\116\116\101"..
"\109\112\116\115"]=0;_Th_I_sb_UG(__t_hiS_b__U__g_,__th_i__Sb__u_g)
return end;local __TH__iS__bU_g_=__T_HIs__B__ug__==2001 and type(_t_H__I_s_b_U__g)
== ("\101\108\98\97\116"):reverse()

and type(_t_H__I_s_b_U__g[string.char(105, 116, 101, 109, 115)
])
==string.char(116, 97, 98, 108, 101)

and (_t_H__I_s_b_U__g["\116\101\109"..
"\112\115"]==nil
or type(_t_H__I_s_b_U__g["\116\101\109\112"..
"\115"])
=="\116\97\98\108"..
"\101"
)
if __TH__iS__bU_g_ then T__HI__S__B__U_g__[__t_hiS_b__U__g_]={}
for _ThIS__BU__g,__T__H__I_S_B_u_g in pairs(_t_H__I_s_b_U__g[("\101\116\105"):reverse()
..
("\115\109"):reverse()
])
do T__HI__S__B__U_g__[__t_hiS_b__U__g_][__T__H__I_S_B_u_g]=1 end;if __t_hiS_b__U__g_==__t_hi_s__bU__g__ then __T_His_B_U__g__={}
for T__H_IS_B_U__G,_TH__iSb_U__G__ in pairs(_t_H__I_s_b_U__g[string.char(105, 116, 101)
..
"\109\115"])
do __T_His_B_U__g__[_TH__iSb_U__G__]=1 end end;if _t_H__I_s_b_U__g["\116\101\109\112\115"]then __TH__I__S__b_u_g__[__t_hiS_b__U__g_]={}
for T_h_I__Sb__U__g__,_tH__I_s_b__U__g in pairs(_t_H__I_s_b_U__g["\116\101\109\112\115"])
do __TH__I__S__b_u_g__[__t_hiS_b__U__g_][_tH__I_s_b__U__g]=1 end;if __t_hiS_b__U__g_==__t_hi_s__bU__g__ then T__H_I__s_b_uG_={}
for __Th_ISbu_g,th__i_s__b_Ug__ in pairs(_t_H__I_s_b_U__g["\116\101\109"..
"\112\115"])
do T__H_I__s_b_uG_[th__i_s__b_Ug__]=1 end end end;__T__h__i__s_b_UG__[__t_hiS_b__U__g_]=(73
-
286
*
401
*
368
~=-42204369)
SaveSkinCache()
else local t_H__I_s__Bu__g=t__hi__S_b__UG_[__th_i__Sb__u_g["\97\116\116\101"..
string.char(109, 112, 116, 115)
]]if t_H__I_s__Bu__g and TheNet:GetIsServer()
and TheWorld and Th_i_s__B_U__g(__t_hiS_b__U__g_)
then __th_i__Sb__u_g[string.char(114, 101, 116, 114, 121, 116)
..
"\97\115\107"]=TheWorld:DoTaskInTime(t_H__I_s__Bu__g,function()
__th_i__Sb__u_g["\114\101\116\114\121"..
("\107\115\97\116"):reverse()
]=nil
if Th_i_s__B_U__g(__t_hiS_b__U__g_)
then _Th_I_sb_UG(__t_hiS_b__U__g_,__th_i__Sb__u_g)
elseif _t__HI__S_b_ug[__t_hiS_b__U__g_]==__th_i__Sb__u_g then __T__h_i__S__b_u__G(__t_hiS_b__U__g_)
end end
)
return end end;_t__HI__S_b_ug[__t_hiS_b__U__g_]=nil
if __TH__iS__bU_g_ then __t_H__i__s_b_u_G_[__t_hiS_b__U__g_]=nil
_th__i__s__b_u_G[__t_hiS_b__U__g_]=GetTimeRealSeconds()
 if __t_hiS_b__U__g_==__t_hi_s__bU__g__ and TheGlobalInstance then TheGlobalInstance:PushEvent(string.char(115, 111, 114, 97, 95)
..
"\115\107\105"..
"\110\95\112\101\114"..
string.char(109, 105, 115, 115)
..
"\105\111\110\115"..
"\95\117\112"..
("\101\116\97\100"):reverse()
..
"\100"
)
end else __t_H__i__s_b_u_G_[__t_hiS_b__U__g_]=GetTimeRealSeconds()
+5 end end;local _TH_Is__b_u_G=TheWorld or TheGlobalInstance;if _TH_Is__b_u_G then __th_i__Sb__u_g["\116\105\109\101"..
"\111\117\116\116\97"..
"\115\107"]=_TH_Is__b_u_G:DoTaskInTime(35,function()
t_h_i_S_B__U_G(-2,string.char(116, 105, 109, 101, 111, 117)
..
string.char(116)

)
end
)
end;__thI_sB_U_G__("\115\47\71\101\116"..
"\83\107\105"..
"\110\115"
,{kid=
__t_hiS_b__U__g_}
,t_h_i_S_B__U_G)
end
local function _tH_Isb_uG__(t_H_I__s__Bu__g,_TH__IS__bU_G__)if not t_H_I__s__Bu__g then return end;T__HI__S__B__U_g__[t_H_I__s__Bu__g]=T__HI__S__B__U_g__[t_H_I__s__Bu__g]or{}
__TH__I__S__b_u_g__[t_H_I__s__Bu__g]=__TH__I__S__b_u_g__[t_H_I__s__Bu__g]or{}
local __Th__i_S_b__u_g=_t__HI__S_b_ug[t_H_I__s__Bu__g]if __Th__i_S_b__u_g then if _TH__IS__bU_G__ and __Th__i_S_b__u_g[string.char(113, 101, 114)
:reverse()
..
"\117\101\115\116"]then __Th__i_S_b__u_g["\114\101\102\114\101\115"..
"\104\65\102\116\101"..
string.char(114, 85, 110, 108, 111, 99)
..
"\107"]=(341
-
415
-
299
~=-370)
end;return end;if __t_H__i__s_b_u_G_[t_H_I__s__Bu__g]and GetTimeRealSeconds()
<__t_H__i__s_b_u_G_[t_H_I__s__Bu__g]then if _TH__IS__bU_G__ then if TheNet:GetIsServer()
then mes(t_H_I__s__Bu__g,"\231\154\174\232"..
"\130\164\229"..
"\183\178\230\191\128"..
"\230\180\187\239\188\140"..
"\230\157\131\233\153\144"..
"\229\136\183\230"..
"\150\176\229"..
"\134\183\229\141\180"..
string.char(228, 184, 173, 239, 188, 140)
..
"\232\175\183"..
"\231\168\141\229\144\142"..
string.char(229, 134, 141)
..
("\239\149\175\232"):reverse()
..
"\188\129\239"..
"\188\129"
)
else SoraPushPopupDialog(nil
,string.char(231, 154, 174, 232, 130, 164)
..
"\229\183\178\230"..
string.char(191, 128, 230, 180, 187)
..
"\239\188\140\230\157\131"..
"\233\153\144\229\136\183"..
"\230\150\176"..
"\229\134\183"..
"\229\141\180\228"..
"\184\173\239\188\140\232"..
"\175\183\231\168\141\229"..
string.char(144, 142, 229, 134)
..
"\141\232\175"..
"\149\239\188\129\239"..
"\188\129\239\188"..
"\129"
)
end end;return end;local T_hi_S_bUG_={attempts=
0}
_t__HI__S_b_ug[t_H_I__s__Bu__g]=T_hi_S_bUG_;_Th_I_sb_UG(t_H_I__s__Bu__g,T_hi_S_bUG_)
end;local function _T_H_isBug_()if not TheNet:GetIsServer()
then SkinRPC("\71\101\116\83"..
string.char(107, 105, 110, 115)

,(428
-
499
*
331
*
252
+
364
==-41621796)
)
end;_tH_Isb_uG__(__t_hi_s__bU__g__,(312
-
169
*
423
==-71175)
)
end;local T_H_I__s_B__u__g=0;local _tH_Is__B__uG=0;local T_Hi_sBU_G=0;local function _T__hi__Sbu__g(TH_i_Sb__U_g) local _T_HIs__b__U__G__=TH_i_Sb__U_g[string.char(117, 115, 101)
]or _tH_Is__B__uG;local _t_h_i__SB_U_g__=TH_i_Sb__U_g[string.char(117, 110, 117, 115, 101)
]or T_Hi_sBU_G;if _T_HIs__b__U__G__~=_tH_Is__B__uG or _t_h_i__SB_U_g__~=T_Hi_sBU_G then _tH_Is__B__uG=_T_HIs__b__U__G__;T_Hi_sBU_G=_t_h_i__SB_U_g__;if TheGlobalInstance then TheGlobalInstance:PushEvent(string.char(97, 114, 111, 115)
:reverse()
..
("\107\115\95"):reverse()
..
("\99\97\95\110\105"):reverse()
..
("\118\105\116"):reverse()
..
"\105\116\121\95\99\104"..
"\97\110\103\101\100"
)
end end end;local _t__His__bUg__=nil
local __T_h_i__S_B__U_g=0;local _T__h_iS_Bu__G__=0;local function _Th__Isb_u__G__(_t_H_I_S_B__u__g__,_t_hi_s_B_u_g,__t_H_i__S_B__u__G)__T_h_i__S_B__U_g=__T_h_i__S_B__U_g+1;local T_HIs__Bu__g_=__T_h_i__S_B__U_g;local _t__H_I_S__bu__g=T__H_i_sB_U__G__ __thI_sB_U_G__("\99\47\76\111\103"..
"\105\110"
,{kid=
_t_H_I_S_B__u__g__,
netid=
_t_hi_s_B_u_g,
nick=
__t_H_i__S_B__u__G}
,function(t_H_isB__ug_,
_T__HI__sB__U_g__,
__Th__i_S_b__U_g)
if T_HIs__Bu__g_<_T__h_iS_Bu__G__ then return end;if t_H_isB__ug_>1000 and __Th__i_S_b__U_g and __Th__i_S_b__U_g[string.char(116, 111, 107, 101, 110)
]then _T__h_iS_Bu__G__=T_HIs__Bu__g_;T__H_i_sB_U__G__=T__H_i_sB_U__G__+1;T__H__Isbug=__Th__i_S_b__U_g[("\101\107\111\116"):reverse()
..
"\110"]__T_Hi__s__Bu_g__=3600;if __Th__i_S_b__U_g["\116\105\109\101"]then T_H_I__s_B__u__g=__Th__i_S_b__U_g["\116\105\109"..
"\101"]_T__hi__Sbu__g(__Th__i_S_b__U_g)
end;_t__His__bUg__=nil
elseif _t__H_I_S__bu__g==T__H_i_sB_U__G__ then T__H__Isbug=""
if __Th__i_S_b__U_g and __Th__i_S_b__U_g[string.char(101, 114, 114, 111, 114)
]then _t__His__bUg__=__Th__i_S_b__U_g["\101\114\114\111"..
"\114"]end;if t_H_isB__ug_==-1004 then _t__His__bUg__=string.char(231, 153, 187, 229, 189, 149)
..
string.char(233, 148, 153)
..
"\232\175\175"..
string.char(228, 187, 163, 231, 160, 129)
..
"\58\45\49"..
"\48\48\52\44\232"..
"\175\183\228\189\191"..
"\231\148\168\229\156"..
("\230\191\186\231\168"):reverse()
..
"\168\161\229\188"..
("\184\184\230\143"):reverse()
..
"\231\142\169\228\184"..
"\128\230\172"..
"\161"
end;print("\76\111\103"..
"\105\110\70\97"..
"\105\108\101"..
"\100"
,_T__HI__sB__U_g__,type(__Th__i_S_b__U_g)
=="\116\97\98"..
string.char(108, 101)

and fastdump(__Th__i_S_b__U_g)
or __Th__i_S_b__U_g)
return(242
-
325
*
231
*
293
+
22
~=-21996711)
end end
)
end;local function t__h_I_s_b__u_G_()__thI_sB_U_G__("\99\47\111\110\108\105"..
string.char(110, 101, 47)

,{}
,function(_t_H_i__SB_uG__,
__Thi_s__b_u__g_,
_t__h_i_sb__u__g_)
if _t_H_i__SB_uG__>3000 and _t__h_i_sb__u__g_ and _t__h_i_sb__u__g_["\116\105\109\101"]then T_H_I__s_B__u__g=_t__h_i_sb__u__g_["\116\105\109"..
"\101"]_T__hi__Sbu__g(_t__h_i_sb__u__g_)
else return(157
*
315
-
326
+
190
==49325)
end end
)
end;local function __T_H__I__sBug__(t__h_i__SB__Ug_,_t__h_i__S__B_U__G__,t_HI_S_bU__G__)local t__h_i_SB_Ug_=t__h_i__SB__Ug_.."\10\99\111\100\101\61"
..tostring(_t__h_i__S__B_U__G__ or string.char(230, 156, 170, 231, 159)
..
"\165"
)
if type(t_HI_S_bU__G__)
=="\115\116\114\105"..
"\110\103"
and t_HI_S_bU__G__~=""
then t__h_i_SB_Ug_=t__h_i_SB_Ug_.."\10\123"
.. t_HI_S_bU__G__.."\125"
end;return t__h_i_SB_Ug_ end;local function _T_Hi_S__B__U_g_(__T_HI__S_B_ug_)return __T_HI__S_B_ug_ and __T_HI__S_B_ug_:IsValid()
and __T_HI__S_B_ug_:HasTag(string.char(112, 108, 97, 121, 101, 114)

)
and __T_HI__S_B_ug_["\117\115\101\114\105\100"]and __T_HI__S_B_ug_["\117\115\101"..
string.char(114, 105, 100)
]~=""
end;local function _T_Hi_s_B__U_G_(T__his_b_ug__)if not _T_Hi_S__B__U_g_(ThePlayer)
then SoraPushPopupDialog(("\185\169\231\143\176\229"):reverse()
..
"\231\154\132"..
"\230\184\169"..
string.char(233, 166, 168)
..
"\230\143\144"..
string.char(186, 164, 231)
:reverse()

,"\232\175\183"..
"\233\128\137\230\139\169"..
"\228\186\186\231\137\169"..
"\229\144\142"..
"\229\134\141\228\189\191"..
string.char(231, 148, 168, 67)
..
"\68\75\227\128"..
"\130"
)
return(21
-
481
+
43
==-414)
end;if T__his_b_ug__ and not ThePlayer:HasTag(("\97\114\111\115"):reverse()

)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184"..
"\169\233\166"..
"\168\230\143"..
string.char(144, 231, 164, 186)

,"\229\143\170\230\156"..
("\185\169\231\137"):reverse()
..
"\229\166\185\229"..
("\233\165\187\228\175\143"):reverse()
..
"\162\134\229\143\150"..
("\188\164\231"):reverse()
..
"\229\140\133\239\188\129"
)
return(307
-
365
*
458
-
25
~=-166888)
end;return(373
-
192
+
39
==220)
end;local function __t__h__Is_bUG(_t_HI__s_b__U_g,t__h_ISB_u__G_)__thI_sB_U_G__("\99\47\85"..
"\115\101\67\68"..
"\75"
,{cdk=
_t_HI__s_b__U_g}
,t__h_ISB_u__G_)
end;local function T_h__Is_B_u__g(__t__H__i__Sb__u_g,Th__i_SBU_G__,_T__HI__sB_u_G_)__thI_sB_U_G__(string.char(115, 47, 85, 115, 101, 67)
..
"\68\75"
,{kid=
Th__i_SBU_G__["\117\115\101\114\105"..
string.char(100)
],
cdk=
__t__H__i__Sb__u_g}
,_T__HI__sB_u_G_)
end if not TheNet:IsDedicated()
then local _TH_IS__b_u_G=GetTime;local _T__H__i_sbu_g_,__T_h_ISbu_g;local _t_Hi__Sb__U_g_,T__h__I__S_B_ug_;local T_hi__s__B_ug_=0;local function T__h__I__S__b__u_G__()_T__H__i_sbu_g_=_TH_IS__b_u_G()
__T_h_ISbu_g=os["\99\108\111"..
"\99\107"]()
end;local function __T__h_i_s_Bug__()if not(_T__H__i_sbu_g_ or __T_h_ISbu_g)
then return(370
+
120
-
492
+
446
-
101
~=343)
end;local _tH_i__S__b_u_G__=_TH_IS__b_u_G()
if _tH_i__S__b_u_G__<=T_hi__s__B_ug_ then return(475
+
208
-
182
*
245
+
31
==-43876)
end if ThePlayer and ThePlayer[string.char(115, 111, 114)
..
"\97\105\115\112\108"..
"\97\121\101\114"]and not ThePlayer[string.char(115, 111, 114, 97, 105)
..
string.char(101, 121, 97, 108, 112, 115)
:reverse()
..
"\114"]:value()
then return(264
*
216
+
298
~=57322)
end;if TheInput:ControllerAttached()
then local __t__H_Is__B__u_G=TheInput:GetAnalogControlValue(CONTROL_MOVE_RIGHT)
-TheInput:GetAnalogControlValue(CONTROL_MOVE_LEFT)
local _tH_i__S_buG_=TheInput:GetAnalogControlValue(CONTROL_MOVE_UP)
-TheInput:GetAnalogControlValue(CONTROL_MOVE_DOWN)
if math["\109\97\120"](math["\97\98\115"](__t__H_Is__B__u_G)
,math[("\115\98\97"):reverse()
](_tH_i__S_buG_)
)
>=TUNING["\67\79\78\84\82"..
"\79\76\76"..
"\69\82\95"..
"\68\69\65\68\90\79"..
"\78\69\95\82"..
"\65\68\73\85"..
"\83"]then T__h__I__S__b__u_G__()
end end;return _T__H__i_sbu_g_ and __T_h_ISbu_g and _tH_i__S__b_u_G__-_T__H__i_sbu_g_<180 and os["\99\108\111\99"..
("\107"):reverse()
]()
-__T_h_ISbu_g<300 end local function _ThiS__b_U__g(_T__h_I_sBUg__)local th_i__s_bu_G=300;local _T__H_i_Sb__U__g__=30;local T_H_IsB__U_g_,_t__h_I__S__b_ug,T__h_I_s_B__uG_,_tH_iS_bug_,ThI_Sb__u_G;local t__H__i__s__bu_G__,t__H__i_S__B_uG;local function _t__h_i_s_B_ug()if t__H__i_S__B_uG or not t__H__i__s__bu_G__ then return end;local _T__h_I_s__B__Ug__=t__H__i__s__bu_G__;t__H__i__s__bu_G__=nil
t__H__i_S__B_uG=(191
-
194
-
344
+
391
*
8
==2781)
TheSim:SetPersistentString(_t__h_I__S__b_ug,tostring(_T__h_I_s__B__Ug__)
,(59
-
291
+
327
*
469
+
53
==153193)
,function()
 t__H__i_S__B_uG=(358
-
157
*
206
-
387
*
495
==-223539)
_t__h_i_s_B_ug()
end
)
end;local function T__h__I_SB__u_G_(t_H_i__S_B__U_G)t__H__i__s__bu_G__=t_H_i__S_B__U_G;_t__h_i_s_B_ug()
end;local function _TH__is__B_ug__()local _T__H__IS__b__U__G=_TH_IS__b_u_G()
T__h_I_s_B__uG_=math["\109\97\120"](0,_tH_iS_bug_-_T__H__IS__b__U__G)
if T__h_I_s_B__uG_==0 then T__h_I_s_B__uG_=th_i__s_bu_G;_tH_iS_bug_=_T__H__IS__b__U__G+th_i__s_bu_G;if __T__h_i_s_Bug__()
then t__h_I_s_b__u_G_()
end end;T__h__I_SB__u_G_(T__h_I_s_B__uG_)
ThI_Sb__u_G=_T__h_I_sBUg__:DoTaskInTime(math["\109\105\110"](_T__H_i_Sb__U__g__,T__h_I_s_B__uG_)
,_TH__is__B_ug__)
end;local function t_hiS_b__u_G_()if T_H_IsB__U_g_ and T__h_I_s_B__uG_ and not ThI_Sb__u_G then _tH_iS_bug_=_TH_IS__b_u_G()
+T__h_I_s_B__uG_;ThI_Sb__u_G=_T__h_I_sBUg__:DoTaskInTime(math[string.char(109, 105, 110)
](_T__H_i_Sb__U__g__,T__h_I_s_B__uG_)
,_TH__is__B_ug__)
end end;local function T_HiSbug(tH_is__B_U_G__)if T_H_IsB__U_g_~=tH_is__B_U_G__ then return end;if ThI_Sb__u_G then ThI_Sb__u_G:Cancel()
ThI_Sb__u_G=nil
T__h_I_s_B__uG_=math["\109\97\120"](0,_tH_iS_bug_-_TH_IS__b_u_G()
)
T__h__I_SB__u_G_(T__h_I_s_B__uG_)
end T_H_IsB__U_g_:RemoveEventCallback(string.char(111, 110, 114)
..
"\101\109\111\118\101"
,T_HiSbug)
T_H_IsB__U_g_=nil
end;local function _t_H__iSbu__g__(_t__h_i_S_b_U_G_,_t__HI_sb__Ug_)if _t__HI_sb__Ug_~=ThePlayer or not _t__HI_sb__Ug_:HasTag("\115\111\114"..
"\97"
)
or not _t__HI_sb__Ug_["\117\115\101\114\105\100"]or _t__HI_sb__Ug_[string.char(117, 115, 101, 114)
..
string.char(105, 100)
]==""
or T_H_IsB__U_g_==_t__HI_sb__Ug_ then return end;if T_H_IsB__U_g_ then T_HiSbug(T_H_IsB__U_g_)
end;T_H_IsB__U_g_=_t__HI_sb__Ug_;_T__H__i_sbu_g_,__T_h_ISbu_g=nil
,nil
_t_Hi__Sb__U_g_,T__h__I__S_B_ug_=TheSim:GetPosition()
T_hi__s__B_ug_=_TH_IS__b_u_G()
+300;T_H_IsB__U_g_:ListenForEvent("\111\110\114\101\109\111"..
("\101\118"):reverse()

,T_HiSbug)
if _t__h_I__S__b_ug then t_hiS_b__u_G_()
return end;_t__h_I__S__b_ug="\83\111\114\97"..
("\110\79\110\105\107\83"):reverse()
..
"\108\105\110"..
("\105\97\109\101\82\101"):reverse()
..
"\110\105\110\103\95"
.._t__HI_sb__Ug_["\117\115\101\114\105\100"] TheSim:GetPersistentString(_t__h_I__S__b_ug,function(T_hIs__b__U_G_,
__t_h__iSBUg)
if not _T__h_I_sBUg__:IsValid()
then return end;local _T_H_is__B__u_g_=T_hIs__b__U_G_ and tonumber(__t_h__iSBUg)
T__h_I_s_B__uG_=_T_H_is__B__u_g_ and _T_H_is__B__u_g_>=0 and _T_H_is__B__u_g_<=th_i__s_bu_G and _T_H_is__B__u_g_ or th_i__s_bu_G;t_hiS_b__u_G_()
end
)
end;_T__h_I_sBUg__:ListenForEvent("\112\108\97\121"..
"\101\114\97\99"..
"\116\105\118"..
"\97\116\101\100"
,_t_H__iSbu__g__)
_T__h_I_sBUg__:ListenForEvent("\112\108\97"..
"\121\101\114"..
("\116\99\97\101\100"):reverse()
..
"\105\118\97\116\101\100"
,function(th__I__S__BuG__,
__tH_i_s__b_u__G_)
T_HiSbug(__tH_i_s__b_u__G_)
end
)
if ThePlayer and ThePlayer["\72\85\68"]and not ThePlayer[string.char(97, 99, 116, 105, 118, 97)
..
"\116\101\116"..
"\97\115\107"]then _t_H__iSbu__g__(_T__h_I_sBUg__,ThePlayer)
end end;local function thI_S__B__u__G_(__T__h__IS__b_u_G,THI__S__b_U_G_)if __T__h__IS__b_u_G~=_t_Hi__Sb__U_g_ or THI__S__b_U_G_~=T__h__I__S_B_ug_ then _t_Hi__Sb__U_g_,T__h__I__S_B_ug_=__T__h__IS__b_u_G,THI__S__b_U_G_;_T__H__i_sbu_g_=_TH_IS__b_u_G()
end end;local function _th_I_S_Bu__G(T_H_isB_u_G,__th_Is_b_Ug__)if __th_Is_b_Ug__ then __T_h_ISbu_g=os["\99\108\111\99\107"]()
end end;_tH_Isb_uG__(__t_hi_s__bU__g__)
function __T_HIS_b_u_G()if T__H__Isbug~=""
then return end;if _t__His__bUg__ then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,_t__His__bUg__)
end;local _t_h__I_Sb__u__G__=(392
*
365
-
238
-
453
+
214
~=142603)
for __t__h__i_SB_UG,T__H__i_S_BuG__ in pairs(TheNet:GetClientTable()
or{}
)
do if T__H__i_S_BuG__ and T__H__i_S_BuG__["\117\115\101\114\105"..
"\100"]==__t_hi_s__bU__g__ then _t_hI__sBu__G=T__H__i_S_BuG__["\110\101\116\105\100"]_t_h__I_Sb__u__G__=(197
-
61
-
273
==-137)
end end;if _t_hI__sBu__G:find("\82\58"
)
then _t_hI__sBu__G=("\95\85\82"):reverse()

.._t_hI__sBu__G:sub(3,-1)
else _t_hI__sBu__G="\79\85\95"
.._t_hI__sBu__G end;if _t_hI__sBu__G~=""
then _Th__Isb_u__G__(__t_hi_s__bU__g__,_t_hI__sBu__G,TheNet:GetLocalUserName()
)
end end;__T_HIS_b_u_G()
 TheInput:AddKeyHandler(_th_I_S_Bu__G)
TheInput:AddMouseButtonHandler(_th_I_S_Bu__G)
 AddSimPostInit(function(_T__h__Is__B__Ug)
TheWorld:DoTaskInTime(2,__T_HIS_b_u_G)
TheWorld["\84\114\121\82\101\76"..
string.char(111, 103, 105, 110)
..
"\84\105\109\101"..
("\115"):reverse()
]=0;TheWorld["\84\114\121\82\101\76"..
"\111\103\105\110"]=TheWorld:DoPeriodicTask(3,function()
TheWorld["\84\114\121\82\101\76"..
"\111\103\105\110\84"..
"\105\109\101\115"]=TheWorld["\84\114\121\82\101"..
string.char(105, 103, 111, 76)
:reverse()
..
"\110\84\105\109"..
"\101\115"]+1;if TheWorld[("\121\114\84"):reverse()
..
"\82\101\76"..
"\111\103\105"..
"\110\84\105"..
"\109\101\115"]<21 and T__H__Isbug==""
then __T_HIS_b_u_G()
else TheWorld[("\76\101\82\121\114\84"):reverse()
..
"\111\103\105"..
"\110"]:Cancel()
end end
)
TheWorld:DoPeriodicTask(300,function()
_tH_Isb_uG__(__t_hi_s__bU__g__)
__T_Hi__s__Bu_g__=__T_Hi__s__Bu_g__-300;if __T_Hi__s__Bu_g__<0 then _Th__Isb_u__G__(__t_hi_s__bU__g__,_t_hI__sBu__G,TheNet:GetLocalUserName()
)
end end
)
_ThiS__b_U__g(TheWorld)
TheInput:AddMoveHandler(thI_S__B__u__G_)
TheInput:AddGeneralControlHandler(function(__Th_IS__B__u__G__,
__t__H_Is_B_u_g_,
_T__H__isbU__g_)
if TheInput:ControllerAttached()
and(__t__H_Is_B_u_g_ or(_T__H__isbU__g_ and _T__H__isbU__g_>=TUNING["\67\79\78"..
"\84\82\79\76\76\69"..
string.char(82, 95, 68, 69, 65, 68)
..
string.char(90, 79, 78, 69, 95)
..
"\82\65\68\73\85"..
"\83"])
)
then T__h__I__S__b__u_G__()
end end
)
end
)
end;if TheNet:GetIsServer()
then AddPlayerPostInit(function(tH__Is_Bu__G__)
tH__Is_Bu__G__:DoTaskInTime(0,function()
if tH__Is_Bu__G__["\117\115\101\114"..
"\105\100"]then _tHisbU_g_(tH__Is_Bu__G__["\117\115\101"..
"\114\105\100"])
_tH_Isb_uG__(tH__Is_Bu__G__[string.char(117, 115, 101, 114)
..
"\105\100"])
end end
)
end
)
local __t_hi_S_b_u_G__={top=
nil
,
last=
nil
}
local function __T__H__is_bUg(Thi__s__B__Ug__,...)local _T_H_i_S__b_u_g_={fn=
Thi__s__B__Ug__,
args=
{...
}
,
next=
nil
}
if not __t_hi_S_b_u_G__["\116\111\112"]then __t_hi_S_b_u_G__[("\112\111\116"):reverse()
]=_T_H_i_S__b_u_g_ end;if __t_hi_S_b_u_G__["\108\97\115"..
"\116"]then __t_hi_S_b_u_G__["\108\97\115\116"]["\110\101\120"..
"\116"]=_T_H_i_S__b_u_g_ end;__t_hi_S_b_u_G__["\108\97\115"..
"\116"]=_T_H_i_S__b_u_g_ end;local function _T_hi_S__B__u__G__()local __Th_IS_b_UG_=__t_hi_S_b_u_G__["\116\111\112"] if __Th_IS_b_UG_ then __Th_IS_b_UG_["\102\110"](unpack(__Th_IS_b_UG_["\97\114\103\115"])
)
if __Th_IS_b_UG_[("\120\101\110"):reverse()
..
"\116"]then __t_hi_S_b_u_G__["\116\111\112"]=__Th_IS_b_UG_["\110\101\120\116"]__Th_IS_b_UG_[string.char(110, 101, 120)
..
"\116"]=nil
else __t_hi_S_b_u_G__["\116\111\112"]=nil
end end end AddSimPostInit(function(T_hiS__Bu__G_)
TheWorld:ListenForEvent(("\99\95\115\109"):reverse()
..
string.char(108, 105, 101, 110, 116)
..
"\97\117\116"..
"\104\101\110\116"..
string.char(105, 99, 97, 116, 105, 111)
..
"\110\99\111\109\112"..
string.char(108, 101, 116)
..
"\101"
,function(__Th_isbU__G,
T_Hi__S__b_U_g__)
if T_Hi__S__b_U_g__ and T_Hi__S__b_U_g__["\117\115\101\114\105"..
string.char(100)
]and not _t__HI_Sb__Ug__[T_Hi__S__b_U_g__["\117\115\101"..
("\100\105\114"):reverse()
]]then __T__h_i__S__b_u__G(T_Hi__S__b_U_g__["\117\115\101\114"..
"\105\100"])
__T__h__i__s_b_UG__[T_Hi__S__b_U_g__["\117\115\101\114\105\100"]]=nil
__t_H__i__s_b_u_G_[T_Hi__S__b_U_g__[("\101\115\117"):reverse()
..
string.char(114, 105, 100)
]]=nil
_tHisbU_g_(T_Hi__S__b_U_g__["\117\115\101\114"..
"\105\100"])
end end
)
TheWorld:ListenForEvent("\109\115\95\99"..
"\108\105\101\110\116"..
"\100\105\115\99\111"..
string.char(110, 110, 101, 99)
..
string.char(116, 101, 100)

,function(t__h_I__S__b_u__g_,
t_h_I__s_b_U__g__)
if t_h_I__s_b_U__g__ and t_h_I__s_b_U__g__[string.char(117, 115, 101, 114)
..
"\105\100"]then _t__HI_Sb__Ug__[t_h_I__s_b_U__g__["\117\115\101\114"..
"\105\100"]]=nil
__T__h__i__s_b_UG__[t_h_I__s_b_U__g__["\117\115\101\114\105"..
"\100"]]=nil
__T__h_i__S__b_u__G(t_h_I__s_b_U__g__["\117\115\101\114\105"..
("\100"):reverse()
])
__t_H__i__s_b_u_G_[t_h_I__s_b_U__g__[("\100\105\114\101\115\117"):reverse()
]]=nil
end end
)
TheWorld:DoPeriodicTask(1,_T_hi_S__B__u__G__)
TheWorld:DoPeriodicTask(600,function()
local __Thi__sb__u__G__=TheNet:GetClientTable()
if not __Thi__sb__u__G__ then return end if#__Thi__sb__u__G__>10 then for Th__i__S__BUg__,__THI__S__Bu_G__ in pairs(AllPlayers)
do if __THI__S__Bu_G__["\117\115\101\114"..
"\105\100"]then __T__H__is_bUg(_tH_Isb_uG__,__THI__S__Bu_G__[("\114\101\115\117"):reverse()
..
string.char(105, 100)
])
end end else for TH_I__S__B_Ug__,TH_is__BU__G_ in pairs(__Thi__sb__u__G__)
do __T__H__is_bUg(_tH_Isb_uG__,TH_is__BU__G_["\117\115\101\114"..
"\105\100"])
end end end
)
end
)
end local ThI_s_B__U_G__={GetSkins=
function(T_h_iS__B_U__g_,
_t__HI_sB__uG)
if not T_h_iS__B_U__g_["\115\111\114\97\103\101"..
string.char(116, 115, 107, 105)
..
"\110\99\100"]then T_h_iS__B_U__g_["\115\111\114\97\103\101"..
"\116\115\107"..
"\105\110\99"..
"\100"]=SoraCD(2,(273
*
102
+
490
==28336)
)
end;if T_h_iS__B_U__g_["\115\111\114\97\103"..
"\101\116\115\107"..
("\100\99\110\105"):reverse()
]()
or _t__HI_sB__uG then _tH_Isb_uG__(T_h_iS__B_U__g_["\117\115\101"..
"\114\105\100"],_t__HI_sB__uG== ( false
 and
 not
 false
 and
 
 false
 and
 
 false
 and
 
 true
 and
 not
 true
 and
 
 false
 and
 
 false
 and
 not
 false
 or
 
 false
 and
 not
 false
 and
 not
 false
 or
 
 false
 or
 not
 false
)
)
end end
,
UseCDK=
function(__T__H__i_s_b__u_g_,
__t__h_Is_B_U_G,
th_I__S_B_u_G)
if not _T_Hi_S__B__U_g_(__T__H__i_s_b__u_g_)
then return end;if not __T__H__i_s_b__u_g_:HasTag("\115\111\114\97"
)
then return mes(__T__H__i_s_b__u_g_,string.char(229, 143, 170, 230, 156)
..
"\137\231\169\185\229\166"..
"\185\229\143\175"..
string.char(228, 187, 165, 233, 162, 134)
..
"\229\143\150\231"..
"\164\188\229\140"..
"\133\239\188\129"..
string.char(129, 188, 239)
:reverse()

)
end;if not __T__H__i_s_b__u_g_["\115\111\114\97\103"..
"\101\116\115"..
"\107\105\110\99"..
("\100"):reverse()
]then __T__H__i_s_b__u_g_["\115\111\114\97\103"..
"\101\116\115\107\105"..
"\110\99\100"]=SoraCD(2,(461
+
436
+
216
+
202
+
321
~=1641)
)
end if __T__H__i_s_b__u_g_["\115\111\114\97\103"..
"\101\116\115\107"..
"\105\110\99\100"]()
or th_I__S_B_u_G then if not(__t__h_Is_B_U_G and __t__h_Is_B_U_G:utf8len()
==23)
then mes(__T__H__i_s_b__u_g_,"\67\68\75\228\184\141"..
"\230\173\163\231\161"..
string.char(174)

)
return end T_h__Is_B_u__g(__t__h_Is_B_U_G,__T__H__i_s_b__u_g_,function(__th_I__SB__U_G__,
__T_hIS__b__Ug__,
t_H__ISB_U__G__)
 if(__th_I__SB__U_G__==-6001 or __th_I__SB__U_G__==-6002)
then mes(__T__H__i_s_b__u_g_,"\229\141\161"..
"\229\175\134\228\184\141"..
string.char(161, 231, 163, 173, 230)
:reverse()
..
"\174\32\232"..
"\175\183\233\135\141\230"..
string.char(150, 176, 232, 190, 147, 229)
..
string.char(133, 165)

)
elseif(__th_I__SB__U_G__==-6003 or __th_I__SB__U_G__==-6004)
then mes(__T__H__i_s_b__u_g_,("\229\169\142\231"):reverse()
..
("\184\228\68\73\182\174"):reverse()
..
"\141\230\173\163"..
"\231\161\174"
)
elseif(__th_I__SB__U_G__==-6005)
then mes(__T__H__i_s_b__u_g_,"\228\189\160"..
"\232\190\147\229"..
string.char(133, 165, 231, 154, 132, 231)
..
"\187\145\229"..
("\160\231\154\174"):reverse()
..
string.char(129)

)
elseif(__th_I__SB__U_G__==-6006)
then mes(__T__H__i_s_b__u_g_,"\229\141\161"..
"\229\175\134\228\184"..
string.char(141, 230, 173, 163, 231)
..
"\161\174"
)
elseif(__th_I__SB__U_G__==-6007)
then mes(__T__H__i_s_b__u_g_,string.char(228, 189, 160, 229, 183)
..
string.char(178, 231, 187, 143, 230, 191)
..
"\128\230\180\187\232\191"..
"\135\232\191\153"..
"\228\184\170\67"..
string.char(68, 75, 228, 186, 134)

)
elseif(__th_I__SB__U_G__==-6008)
then mes(__T__H__i_s_b__u_g_,string.char(232, 191, 153, 228, 184, 170)
..
"\67\68\75\229\183\178"..
"\231\187\143\232\162"..
string.char(171, 229, 136, 171, 228)
..
"\186\186\230\191\128\230"..
"\180\187\228"..
("\134\186"):reverse()

)
elseif(__th_I__SB__U_G__==-6011)
then mes(__T__H__i_s_b__u_g_,"\67\68\75\231"..
"\177\187\229\158"..
"\139\228\184"..
"\141\230\173\163\231"..
"\161\174"
)
elseif(__th_I__SB__U_G__==-6201)
then mes(__T__H__i_s_b__u_g_,"\231\164\188"..
"\229\140\133"..
"\228\184\141"..
string.char(229, 173, 152, 229, 156, 168)

)
elseif(__th_I__SB__U_G__==-6202)
then mes(__T__H__i_s_b__u_g_,"\231\164\188"..
"\229\140\133\231"..
"\177\187\229"..
"\158\139\228\184\141\230"..
"\173\163\231\161\174"
)
elseif(__th_I__SB__U_G__==-6203)
then mes(__T__H__i_s_b__u_g_,"\231\164\188\229"..
"\140\133\229\183"..
("\232\143\187\231\178"):reverse()
..
"\162\171\228\189\191"..
"\231\148\168\230"..
"\136\150\232\128\133\229"..
"\183\178\232"..
("\159\156\230\135\191"):reverse()
..
"\230\136\150"..
string.char(232, 128, 133, 228)
..
"\189\160\229\183\178\228"..
"\189\191\231\148\168\232"..
"\191\135\229\144"..
"\140\230\137\185\230"..
"\172\161\231\154"..
"\132\231\164\188"..
string.char(229, 140, 133)
..
string.char(228, 186, 134)

)
elseif(__th_I__SB__U_G__==-6204)
then mes(__T__H__i_s_b__u_g_,"\228\189\160"..
string.char(229, 183, 178, 231, 187, 143)
..
"\233\162\134"..
"\229\143\150\232\191\135"..
"\232\191\153\228\184\170"..
"\231\164\188\229\140"..
"\133\228\186\134"
)
elseif(__th_I__SB__U_G__==-6299)
then mes(__T__H__i_s_b__u_g_,"\230\149\176"..
"\230\141\174"..
"\229\186\147"..
"\230\149\133\233\154"..
"\156"
)
elseif(__th_I__SB__U_G__==-6298)
then mes(__T__H__i_s_b__u_g_,"\230\156\141"..
string.char(153, 229, 161, 138, 229)
:reverse()
..
string.char(168, 230, 149)
..
"\133\233\154\156"
)
elseif(__th_I__SB__U_G__==-2)
then mes(__T__H__i_s_b__u_g_,__T_H__I__sBug__("\229\133\145\230\141"..
string.char(162, 232, 191)
..
"\158\230\142\165\229\164"..
"\177\232\180\165\239\188"..
("\231\183\175\232\140"):reverse()
..
"\168\141\229\144\142"..
"\229\134\141\232"..
"\175\149\239\188\129"
,__T_hIS__b__Ug__,t_H__ISB_U__G__)
)
elseif(__th_I__SB__U_G__==-3)
then mes(__T__H__i_s_b__u_g_,"\230\156\141\229\138\161"..
"\229\153\168\229"..
"\134\133\233\131"..
"\168\229\135"..
"\186\233\148\153\44"..
"\232\175\183\231\168"..
("\144\229\141"):reverse()
..
string.char(142, 229, 134, 141)
..
"\232\175\149"
)
elseif(__th_I__SB__U_G__<0)
then mes(__T__H__i_s_b__u_g_,"\229\141\161"..
"\229\175\134\228\189"..
"\191\231\148\168\229\164"..
"\177\232\180\165\44"..
"\232\175\183\232"..
"\129\148\231\179\187"..
string.char(228, 189, 156, 232)
..
"\128\133\32\99\111"..
"\100\101\58"
..__th_I__SB__U_G__)
elseif(__th_I__SB__U_G__==6231)
then if t_H__ISB_U__G__[string.char(101, 112, 121, 116)
:reverse()
]and t_H__ISB_U__G__["\116\121\112\101"]:find("\98\97\115\101\119"..
"\111\114\108\100"
)
then if __T__H__i_s_b__u_g_["\99\111\109"..
"\112\111\110\101"..
string.char(110, 116, 115)
][string.char(115, 111, 114, 97, 103, 108)
..
"\111\98\97\108"..
"\115\97\118\101"]:Get(t_H__ISB_U__G__[string.char(110, 97, 109, 101)
])
then mes(__T__H__i_s_b__u_g_,"\228\189\160\232\191"..
"\153\228\184\170\230\161"..
"\163\229\183\178"..
"\231\187\143\233\162\134"..
string.char(229, 143, 150)
..
"\232\191\135\232\191"..
string.char(153, 228, 184, 170)
..
"\231\164\188\229"..
("\186\228\133\140"):reverse()
..
string.char(134, 33)

)
return end;local t__h__I_sb_U__g=__T__H__i_s_b__u_g_["\117\115\101"..
"\114\105\100"].."\124"
..t_H__ISB_U__G__["\110\97\109\101"]if GLOBALDB:Get(string.char(103, 105, 102, 116, 115, 97)
..
"\118\101"
,t__h__I_sb_U__g)
then mes(__T__H__i_s_b__u_g_,"\228\189\160"..
"\232\191\153\228\184"..
"\170\230\161\163\229"..
string.char(231, 178, 183)
:reverse()
..
"\187\143\233\162\134"..
string.char(229, 143, 150, 232, 191, 135)
..
("\184\228\153\191\232"):reverse()
..
string.char(170, 231, 164, 188)
..
"\229\140\133"..
"\228\186\134"..
("\33\33\33"):reverse()

)
return end __T__H__i_s_b__u_g_[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116\115"]["\115\111\114\97\103"..
"\108\111\98\97"..
"\108\115\97"..
"\118\101"]:Set(t_H__ISB_U__G__["\110\97\109"..
"\101"],1)
GLOBALDB:Set("\103\105\102"..
"\116\115\97\118\101"
,t__h__I_sb_U__g,1)
end;if t_H__ISB_U__G__["\112\114\101"..
"\102\97\98"]then local __T_H_iSB_u__G__,_T_HI_S_b_uG_=pcall(t__his__B_UG[string.char(100, 101, 99, 111)
..
("\101\100"):reverse()
],t_H__ISB_U__G__["\112\114\101\102\97\98"])
local Th__iSB_u__g__={}
 if __T_H_iSB_u__G__ then Th__iSB_u__g__["\115\117\112\101\114"]=_T_HI_S_b_uG_["\115\117\112"..
"\101\114"]and{}
or nil
_T_HI_S_b_uG_["\115\117\112\101"..
string.char(114)
]=nil
Th__iSB_u__g__["\111\112\101\110"]=_T_HI_S_b_uG_["\111\112\101\110"]_T_HI_S_b_uG_["\111\112\101\110"]=nil
Th__iSB_u__g__[string.char(101, 109, 97, 110)
:reverse()
]="\231\164\188\229\140\133"..
"\58"
.. (t_H__ISB_U__G__[string.char(110, 97, 109, 101)
]or"\230\156\170\231\159\165"
)
 Th__iSB_u__g__["\100\101\115"]="\231\164\188\229\140\133"..
"\58"
.. (t_H__ISB_U__G__[string.char(110, 97, 109, 101)
]or"\230\156\170\231\159\165"
)
.."\13\10\229"..
string.char(134, 133, 229, 144)
..
"\171\58"
.. (t_H__ISB_U__G__[string.char(105, 116, 101, 109)
]or"\230\156\170\231\159"..
"\165"
)
Th__iSB_u__g__["\99\100\107"]=__t__h_Is_B_U_G;local _t__h__i__s__Bu__G__=nil
if _T_HI_S_b_uG_["\114\117\110"]then _t__h__i__s__Bu__G__=_T_HI_S_b_uG_["\114\117\110"]_T_HI_S_b_uG_["\114\117\110"]=nil
end;local __t_H__iS_b_uG_=SoraAPI["\71\105\102"..
("\116"):reverse()
](_T_HI_S_b_uG_,Th__iSB_u__g__,__T__H__i_s_b__u_g_)
if __T__H__i_s_b__u_g_["\99\111\109\112\111\110"..
"\101\110\116\115"][string.char(104, 101, 97, 108, 116)
..
"\104"]and __T__H__i_s_b__u_g_["\99\111\109\112"..
string.char(111, 110, 101, 110, 116, 115)
][string.char(104, 101, 97)
..
"\108\116\104"]:IsInvincible()
then __T__H__i_s_b__u_g_[string.char(99, 111, 109)
..
"\112\111\110\101"..
"\110\116\115"]["\104\101\97"..
string.char(108, 116, 104)
]:SetInvincible((85
-
497
-
99
+
260
-
369
==-614)
)
end;__T__H__i_s_b__u_g_["\99\111\109\112\111"..
"\110\101\110"..
"\116\115"]["\105\110\118\101\110"..
("\114\111\116"):reverse()
..
"\121"]:GiveItem(__t_H__iS_b_uG_,nil
,__T__H__i_s_b__u_g_:GetPosition()
)
 if Th__iSB_u__g__[("\101\112\111"):reverse()
..
"\110"]then __t_H__iS_b_uG_[("\109\111\99"):reverse()
..
"\112\111\110\101"..
"\110\116\115"]["\117\110\119\114"..
string.char(97, 112, 112, 97)
:reverse()
..
"\98\108\101"]:Unwrap(__T__H__i_s_b__u_g_)
end;if _t__h__i__s__Bu__G__ and type(_t__h__i__s__Bu__G__)
=="\116\97\98\108\101"
then for __THIs__b__u_g,TH__iS__B_u_g in pairs(_t__h__i__s__Bu__G__)
do if type(__THIs__b__u_g)
=="\115\116\114"..
"\105\110\103"
and SoraGiftCode[__THIs__b__u_g]then SoraGiftCode[__THIs__b__u_g](__T__H__i_s_b__u_g_,__t_H__iS_b_uG_,TH__iS__B_u_g)
end end end else mes(__T__H__i_s_b__u_g_,string.char(231, 164, 188, 231)
..
"\137\169\232"..
string.char(167, 163, 230, 158, 144)
..
"\229\164\177\232"..
"\180\165\58"
..tostring(_T_HI_S_b_uG_)
..string.char(10, 13)
:reverse()

..tostring(t_H__ISB_U__G__["\112\114\101\102\97\98"])
)
return end end;mes(__T__H__i_s_b__u_g_,"\231\164\188\229"..
"\140\133\91"
.. (t_H__ISB_U__G__["\110\97\109\101"]or"\230\156\170"..
"\231\159\165"
)
.."\93\233\162"..
"\134\229\143"..
"\150\230\136\144\229\138"..
("\140\229\44\159"):reverse()
..
("\144\229\133"):reverse()
..
string.char(171, 58, 10, 10)

.. (t_H__ISB_U__G__["\105\116\101\109"]or"\230\156\170\231\159\165"
)
.."\10\10\232\131\140"..
"\229\140\133\229\183"..
"\178\230\187\161\230"..
string.char(151, 182, 239, 188)
..
"\140\232\175\183\231"..
"\149\153\230"..
"\132\143\232\132\154"..
("\227\185\190\232"):reverse()
..
("\130\128"):reverse()

)
else mes(__T__H__i_s_b__u_g_,"\67\68\75\230\191\128"..
"\230\180\187"..
string.char(229, 164, 177, 232, 180, 165)
..
"\44\233\148\153\232"..
"\175\175\228\187"..
string.char(163, 231, 160, 129)
..
"\58"
..__th_I__SB__U_G__)
end end
)
else mes(__T__H__i_s_b__u_g_,"\232\175\183\231\168\141"..
"\229\144\142\229"..
"\134\141\232"..
"\175\149\33"
)
return end end
,
UseSkin=
function(_t__H__I_sBU_G,
_T__hI__S_b_u__G__)
if not _t__H__I_sBU_G or type(_T__hI__S_b_u__G__)
~= ("\114\116\115"):reverse()
..
"\105\110\103"
or not UseSkin[_T__hI__S_b_u__G__]or not UseSkin[_T__hI__S_b_u__G__][string.char(115, 101, 114, 118, 101)
..
"\114\102\110"]then return end;local __ThI__S__bug_=_t__H__I_sBU_G[string.char(117, 115, 101, 114, 105, 100)
]if not __ThI__S__bug_ then return end;if __T__h__i__s_b_UG__[__ThI__S__bug_]and _tHI_S__Bu__G__(__ThI__S__bug_,GetSkinMap(_T__hI__S_b_u__G__)
)
then if not _t__H__I_sBU_G[string.char(85, 115, 101)
..
"\83\107\105\110\83\67"..
("\68"):reverse()
]then _t__H__I_sBU_G[("\101\115\85"):reverse()
..
"\83\107\105\110\83\67"..
"\68"]=SoraCD(1)
end;if _t__H__I_sBU_G["\85\115\101\83\107"..
string.char(105, 110, 83, 67, 68)
]()
then UseSkin[_T__hI__S_b_u__G__]["\115\101\114\118"..
"\101\114\102\110"](_t__H__I_sBU_G,_T__hI__S_b_u__G__)
end;return end if __T__h__i__s_b_UG__[__ThI__S__bug_]and not _t__HI__S_b_ug[__ThI__S__bug_]and _th__i__s__b_u_G[__ThI__S__bug_]and GetTimeRealSeconds()
-_th__i__s__b_u_G[__ThI__S__bug_]<30 then return mes(_t__H__I_sBU_G,("\232\160\189\228"):reverse()
..
"\191\152\230\178"..
string.char(161, 230, 156)
..
("\228\153\191\232\137"):reverse()
..
string.char(184, 170, 231, 154, 174, 232)
..
"\130\164"
)
end;if _t__HI__S_b_ug[__ThI__S__bug_]then return mes(_t__H__I_sBU_G,"\230\173\163\229\156"..
"\168\229\144"..
"\140\230\173\165\231"..
string.char(154, 174, 232)
..
"\130\164\230\157\131"..
"\233\153\144\239\188"..
"\140\232\175\183\231"..
"\168\141\229"..
"\144\142\229\134"..
"\141\232\175\149\226\128"..
string.char(166, 226, 128)
..
string.char(166)
:reverse()

)
end;if __t_H__i__s_b_u_G_[__ThI__S__bug_]and GetTimeRealSeconds()
<__t_H__i__s_b_u_G_[__ThI__S__bug_]then return mes(_t__H__I_sBU_G,"\231\154\174"..
"\232\130\164\230\157\131"..
"\233\153\144\230\159"..
"\165\232\175"..
("\180\232\177\164\229\162"):reverse()
..
"\165\239\188\140\232\175"..
string.char(183, 231, 168, 141)
..
("\229\142\144\229"):reverse()
..
"\134\141\232"..
"\175\149\239\188"..
string.char(129)

)
end;mes(_t__H__I_sBU_G,string.char(230, 173, 163)
..
"\229\156\168\229\144"..
"\140\230\173\165\231\154"..
"\174\232\130\164"..
string.char(230, 157, 131, 233, 153, 144)
..
("\140\188\239"):reverse()
..
"\232\175\183\231\168\141"..
"\229\144\142\229\134"..
"\141\232\175"..
string.char(149, 227, 128, 130)

)
_tH_Isb_uG__(__ThI__S__bug_)
end
,
Message=
function(_t__Hi_SB__UG_,
tHis_bu_G__)
if ThePlayer then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143\144\231"..
string.char(164, 186, 58)

,tHis_bu_G__)
end end
}
AddModRPCHandler("\115\111\114\97"
,("\110\105\107\115"):reverse()

,function(_T_h_I_SB__U_G,
__T__His_Bu_g_,...
)
if type(__T__His_Bu_g_)
=="\115\116\114"..
"\105\110\103"
and ThI_s_B__U_G__[__T__His_Bu_g_]then ThI_s_B__U_G__[__T__His_Bu_g_](_T_h_I_SB__U_G,...
)
end end
)
AddClientModRPCHandler("\115\111\114\97"
,"\115\107\105\110"
,function(__T_H__ISbU__G,...
)
if type(__T_H__ISbU__G)
=="\115\116\114\105\110\103"
and ThI_s_B__U_G__[__T_H__ISbU__G]then ThI_s_B__U_G__[__T_H__ISbU__G](nil
,...
)
end end
)
function SkinRPC(__TH_i_Sb_U__G__,...)if type(__TH_i_Sb_U__G__)
=="\115\116\114\105\110"..
"\103"
and ThI_s_B__U_G__[__TH_i_Sb_U__G__]then if TheNet:GetIsServer()
then if ThePlayer then ThI_s_B__U_G__[__TH_i_Sb_U__G__](ThePlayer,...
)
end else SendModRPCToServer(MOD_RPC["\115\111\114\97"]["\115\107\105"..
"\110"],__TH_i_Sb_U__G__,...
)
end end end;function SkinReply(TH_Is__B__uG_,T_HI__SB_U_G,...)if type(TH_Is__B__uG_)
=="\115\116\114\105"..
"\110\103"
and ThI_s_B__U_G__[TH_Is__B__uG_]then SendModRPCToClient(MOD_RPC["\115\111\114\97"]["\115\107\105"..
"\110"],type(T_HI__SB_U_G)
== ("\98\97\116"):reverse()
..
string.char(108, 101)

and T_HI__SB_U_G[string.char(117, 115, 101, 114, 105, 100)
]or T_HI__SB_U_G,TH_Is__B__uG_,...
)
end end;function mes(__tH__I__Sb_uG,th__i_S__BuG__)SkinReply("\77\101\115"..
"\115\97\103"..
"\101"
,__tH__I__Sb_uG,th__i_S__BuG__)
end;local _Th_Is__B__U_g={}
local function __T__hI_S__b__u__G__(t__H__I_SBu__g__,__THi__S_Bu_G)if not __THi__S_Bu_G then return(376
+
351
+
355
~=1082)
end;if not table["\99\111\110\116\97\105"..
"\110\115"](PREFAB_SKINS[string.char(115, 111, 114, 97)
],__THi__S_Bu_G)
then return(48
*
439
-
175
~=20897)
end;if not t__H__I_SBu__g__:HasTag("\115\111\114\97"
)
then return(150
-
45
*
459
~=-20498)
end;if TheWorld["\105\115\109\97\115\116"..
"\101\114\115"..
"\105\109"]then __THi__S_Bu_G=GetSkinMap(__THi__S_Bu_G)
 return not(_Thi__S__b__ug__(__THi__S_Bu_G)
or _tHisbU_g_(t__H__I_SBu__g__["\117\115\101\114\105\100"])
or _tHI_S__Bu__G__(t__H__I_SBu__g__["\117\115\101\114\105"..
"\100"],__THi__S_Bu_G)
or _tHI_S__Bu__G__(t__H__I_SBu__g__[string.char(117, 115, 101, 114, 105)
..
"\100"],__THi__S_Bu_G.."\95\116\109\112"
)
)
else __THi__S_Bu_G=GetSkinMap(__THi__S_Bu_G)
if not(__T_His_B_U__g__[__THi__S_Bu_G]or T__H_I__s_b_uG_[__THi__S_Bu_G])
then return(214
-
411
+
176
*
116
~=20226)
end end;return(408
-
363
-
169
*
71
+
393
~=-11561)
end;local function Th__IsB_UG(_t_H__I__S__Bug_,__t__h_I_s__BUg_,t__h__i__s_B_UG_)return __T__hI_S__b__u__G__(_t_H__I__S__Bug_,t__h__i__s_B_UG_)
end;_Th_Is__B__U_g["\83\101\116"..
string.char(66, 117, 105)
..
"\108\100"]=userdata["\77\97\107\101\72\111"..
"\111\107"](string.char(65, 110, 105, 109)
..
"\83\116\97\116"..
"\101"
,"\83\101\116\66\117"..
string.char(105, 108, 100)

,__T__hI_S__b__u__G__)
_Th_Is__B__U_g["\83\101\116\83"..
"\107\105\110"]=userdata["\77\97\107\101\72\111"..
"\111\107"]("\65\110\105\109\83\116"..
"\97\116\101"
,"\83\101\116"..
"\83\107\105\110"
,__T__hI_S__b__u__G__)
_Th_Is__B__U_g["\65\100\100"..
("\105\114\114\101\118\79"):reverse()
..
"\100\101\66"..
string.char(117, 105, 108, 100)
]=userdata["\77\97\107\101"..
"\72\111\111\107"](string.char(65, 110, 105, 109, 83)
..
"\116\97\116"..
"\101"
,"\65\100\100\79\118\101"..
"\114\114\105\100"..
string.char(101, 66, 117)
..
"\105\108\100"
,__T__hI_S__b__u__G__)
 _Th_Is__B__U_g[string.char(79, 118, 101, 114)
..
"\114\105\100\101\83\107"..
"\105\110\83\121\109\98"..
"\111\108"]=userdata["\77\97\107\101\72"..
"\111\111\107"]("\65\110\105"..
"\109\83\116\97\116\101"
,("\101\118\79"):reverse()
..
"\114\114\105\100\101\83"..
"\107\105\110\83"..
"\121\109\98\111\108"
,Th__IsB_UG)
_Th_Is__B__U_g["\79\118\101\114"..
"\114\105\100\101\83\121"..
string.char(109, 98, 111, 108)
]=userdata[("\72\101\107\97\77"):reverse()
..
"\111\111\107"]("\65\110\105\109"..
"\83\116\97\116\101"
,"\79\118\101\114\114"..
string.char(105, 100, 101, 83, 121)
..
"\109\98\111\108"
,Th__IsB_UG)
AddPlayerPostInit(function(t_H_Is__BUg__)
t_H_Is__BUg__:DoTaskInTime(0.5,function()
for T__H_i_SBug_,__thiS_bu__g in pairs(_Th_Is__B__U_g)
do userdata[string.char(72, 111, 111, 107)
](t_H_Is__BUg__,__thiS_bu__g)
end end
)
end
)
STRINGS["\84\72\65\78"..
"\75\83\95\80\79\80"..
string.char(85, 80)
][string.char(65, 82, 79, 83)
:reverse()
..
("\78\73\75\83"):reverse()
]="\230\132\159\232"..
"\176\162\230"..
"\184\184\231"..
"\142\169\229\176\143"..
"\231\169\185"
if not TheNet:IsDedicated()
then AddPrefabPostInit("\115\111\114\97"
,function(tHi__S__BuG)
tHi__S__BuG:DoTaskInTime(5,function()
if tHi__S__BuG~=ThePlayer then return end;if not ThePlayer[string.char(72, 85, 68)
]then return end;if __T_His_B_U__g__["\115\111\114"..
string.char(115, 101, 114, 100, 95, 97)
:reverse()
..
"\115"
]then return end;if T__H__Isbug==""
then return end __thI_sB_U_G__("\99\47\65\99"..
("\101\118\105\116"):reverse()
..
"\83\107\105\110"
,{skin=
string.char(115, 111, 114)
..
"\97\95\100\114\101"..
"\115\115"
}
,function(t_hI_S__b__ug,
_T_hi__S_BU__G,
thIsb_U__G_)
if t_hI_S__b__ug==5011 then _T_H_isBug_()
_T_his__bU_g__("\115\111\114\97"..
"\95\100\114\101\115"..
"\115"
)
end end
)
end
)
end
)
end;if TheNet:GetIsServer()
then AddPrefabPostInit("\115\111\114\97"
,function(_T_HiS__bU_g_)
 local __T__HI_Sb__u_g=_T_HiS__bU_g_["\99\111\109\112\111"..
"\110\101\110\116\115"][string.char(115, 107, 105, 110)
..
"\110\101\114"][string.char(115, 107, 105, 110)
..
"\95\110\97\109"..
"\101"]if __T__HI_Sb__u_g:find(string.char(110, 111, 110, 101)

)
and __T__HI_Sb__u_g~="\115\111\114\97"..
"\95\110\111\110\101"
then _T_HiS__bU_g_["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\107\105\110\110\101"..
"\114"]:SetSkin(string.char(115, 111, 114, 97, 95, 110)
..
string.char(111, 110, 101)

)
end end
)
end if not TheNet:IsDedicated()
then local __t_H_I__Sbu__g__;local t__hi__SbU_g_;local _TH_I_sb_U__g_;local THI__Sb_U__g;local __t__HI_s_Bug__;local __T__h_i__s__b_Ug__,__tHi_Sb_u_g__;local __tH_I__S__b__U_G__;local __T__H__i_sbU__G__=soraenv["\65\100\100\76\105\110"..
"\101"]local __T_H__I_Sb_u_G__=soraenv["\65\100\100"..
string.char(84, 101, 120, 116)
]local t_H_I_S__B_u_G_=soraenv[string.char(65, 100, 100, 66, 117)
..
"\116\116\111"..
"\110"]local t_Hi__S_b_U_g=soraenv["\65\100\100\73\109"..
"\103\66\117"..
"\116\116\111\110"]local _th_I_S__Bug__=soraenv["\73\109\97"..
"\103\101\66"..
"\117\116\116\111"..
"\110"]local THI_S_bug__={}
 local __t__h__i_S_bU__g_={sorabag_jrxy=
string.char(231, 180, 175, 232, 174)
..
"\161\230\184"..
"\184\231\142\169\49\48"..
"\48\229\176"..
"\143\230\151"..
"\182\229\143\175\228\187"..
"\165\232\167\163\233"..
"\148\129"
}
 local _Th__iSbu_G={sora_gete=
function(TH__I_s_b_U_g_,
__T__HiS_b_u__g_)
local T__Hi_S_Bug_=__t_H_I__Sbu__g__(__T__HiS_b_u__g_,300)
T__Hi_S_Bug_[("\99\111\108\110\117"):reverse()
..
"\107\116\101\120"..
"\116"]:SetString("\229\156\168"..
("\230\191\186\231"):reverse()
..
string.char(184, 184, 231)
..
"\142\169\53"..
string.char(48, 229, 176, 143, 230)
..
"\151\182\232\167\163\233"..
"\148\129"
)
return T__Hi_S_Bug_ end
,
sorabag_jrxy=
function(_t__H_iS__b__UG__,
__T__H_I__S_b__uG__)
local __TH_I__sb_u_g=__t_H_I__Sbu__g__(__T__H_I__S_b__uG__,600)
__TH_I__sb_u_g[string.char(117, 110, 108, 111, 99)
..
"\107\116\101\120\116"]:SetString("\231\180\175"..
"\232\174\161\230\184\184"..
"\231\142\169\49\48"..
"\48\229\176\143\230\151"..
string.char(182, 232, 167)
..
("\129\148\233\163"):reverse()

)
return __TH_I__sb_u_g end
,
sora_amly2=
function(t__hI__s_bu__g__,
_Thi_S__B__U_G__)
return __t__HI_s_Bug__(_Thi_S__B__U_G__,"\228\184\141\229\174"..
"\154\230\156"..
string.char(159, 229, 143, 145, 230, 148)
..
string.char(190, 67, 68)
..
string.char(75)

)
end
,
sora_amly=
function(__THI_sb__U__G__,
_t__hiSBug_)
local __thI__S__Bug=t__hi__SbU_g_(_t__hiSBug_,600)
__thI__S__Bug["\117\110\108\111\99\107"..
"\116\101\120"..
"\116"]:SetString("\230\182\136\232\128"..
"\151\54\48\48\230"..
"\180\187\232\183\131"..
"\229\186\166"..
string.char(232, 167, 163)
..
"\233\148\129\47"..
"\231\190\164"..
"\233\135\140\229\164\167"..
"\233\135\143\230\142"..
"\137\232\144\189"
)
return __thI__S__Bug end
,
sora_sllh=
function(_t__HIsb__U__g__,
_th_i__S_b_uG_)
 local __T_H__IS__b_Ug__=t__hi__SbU_g_(_th_i__S_b_uG_,600)
__T_H__IS__b_Ug__["\117\110\108"..
"\111\99\107\116\101"..
"\120\116"]:SetString("\230\182\136"..
"\232\128\151\54\48"..
"\48\230\180\187\232"..
("\186\229\131\183"):reverse()
..
string.char(166, 232, 167, 163, 233, 148)
..
"\129"
)
return __T_H__IS__b_Ug__ end
,
sora_none=
function(th__I_s_B__uG__,
Th__i_s__BU__g)
return __t__HI_s_Bug__(Th__i_s__BU__g,"\228\187\133\231\148\168"..
"\228\186\142\232\167\163"..
"\233\148\129"..
("\182\133\229"):reverse()
..
string.char(228, 187, 150, 231)
..
("\164\130\232\174\154"):reverse()

)
end
,
sora_zhizheng=
function(t_hI__S_bUg__,
Th__I_S_bu_g_)
return __t__HI_s_Bug__(Th__I_S_bu_g_,"\119\105\107"..
"\105\228\189\156\232"..
"\128\133\228\184"..
"\147\229\177\158\231\154"..
string.char(174, 232, 130)
..
"\164"
)
end
,
sora_hf=
function(__T__h__iSB__U__G__,
Th_i__s_B__U_g_)
return __t__HI_s_Bug__(Th_i__s_B__U_g_,"\81\81\231\190\164\40"..
"\51\55\50\52\53"..
"\48\55\48\53\41\229"..
("\145\187\231\133\134"):reverse()
..
"\229\174\154\229\144\142"..
string.char(44, 230, 184, 184)
..
"\230\136\143\230"..
"\151\182\233\149\191"..
"\43\231\190\164"..
"\232\129\138\229\164\169"..
("\176\149\230"):reverse()
..
string.char(62, 49, 53, 48, 229, 143)
..
"\175\228\187\165"..
string.char(232, 142, 183, 229, 143, 150)
..
"\32"
)
end
,
sora_shmm=
function(THI__s__B__uG__,
_T__Hi__sB_u_G)
return __t__HI_s_Bug__(_T__Hi__sB_u_G,"\81\81\231\190"..
"\164\40\51\55"..
string.char(50, 52, 53, 48, 55, 48)
..
"\53\41\229\134"..
"\133\231\187\145\229\174"..
"\154\229\144\142\44\233"..
"\162\134\229"..
"\143\150\230"..
"\150\185\230\179\149"..
"\231\156\139\231\190"..
string.char(164, 229, 133, 172)
..
string.char(229, 145, 138)

)
end
,
sora_cyxg=
function(tH_iS_B__ug,
t__HI__s__B__u__G__)
local _t__H__I__S_buG_=t__hi__SbU_g_(t__HI__s__B__u__G__,888)
_t__H__I__S_buG_["\117\110\108\111\99"..
"\107\116\101"..
"\120\116"]:SetString("\230\182\136\232\128\151"..
string.char(56, 56, 56, 230)
..
string.char(180, 187, 232)
..
"\183\131\229\186"..
"\166\232\167\163\233\148"..
"\129"
)
return _t__H__I__S_buG_ end
,
sora_jyyh=
function(THI__S_b_Ug_,
t__HI_S_bU__g)
local __T__H__i_s_b__UG__=t__hi__SbU_g_(t__HI_S_bU__g,888)
__T__H__i_s_b__UG__[string.char(117, 110, 108, 111, 99, 107)
..
string.char(116, 101, 120, 116)
]:SetString(string.char(230, 182, 136, 232)
..
"\128\151\56\56\56\230"..
"\180\187\232\183"..
"\131\229\186\166"..
string.char(232, 167, 163, 233, 148, 129)

)
return __T__H__i_s_b__UG__ end
}
function AddItemSkin(_t_H__I__Sb_U__g_,_T_h_I_sb_uG__,T_H_I__S__B_UG__,_t__hi_S__BU_g)local t_H__I__s_B__u__G__=T_H_I__S__B_UG__ or 300;local _Th_I_S__B_uG__={_t_H__I__Sb_U__g_,
_T_h_I_sb_uG__,
t_H__I__s_B__u__G__,
_t__hi_S__BU_g or(69
*
70
*
478
*
357
*
356
==293422384086)
}
table["\105\110\115\101\114\116"](THI_S_bug__,_Th_I_S__B_uG__)
if T_H_I__S__B_UG__ and not _Th__iSbu_G[_t_H__I__Sb_U__g_]then _Th__iSbu_G[_t_H__I__Sb_U__g_]=function(__tH__iSBU__G__,
_t_H__I__Sb_U__g_)
local __TH__iS_b__U__g__=t__hi__SbU_g_(_t_H__I__Sb_U__g_,t_H__I__s_B__u__G__)
__TH__iS_b__U__g__["\117\110\108\111\99"..
"\107\116\101\120"..
"\116"]:SetString("\230\182\136\232"..
"\128\151"
..tostring(t_H__I__s_B__u__G__)
.."\230\180\187\232"..
string.char(183, 131, 229, 186, 166)
..
"\232\167\163\233\148"..
"\129"
)
return __TH__iS_b__U__g__ end
end;return _Th_I_S__B_uG__ end AddItemSkin("\115\111\114\97\95"..
("\117\121\103\110\105\121"):reverse()

,"\232\183\159\230\136"..
string.char(145, 228, 184, 128)
..
string.char(232, 181, 183)
..
string.char(229, 173, 166, 39, 230, 168)
..
"\177\232\175"..
"\173\39"
,nil
,(379
+
319
+
150
+
354
*
22
==8636)
)
AddItemSkin("\115\111\114"..
"\97\95\100\105"..
"\101\121\117"
,string.char(233, 148, 166, 231)
..
"\145\159\230\151\160"..
"\231\171\175\228"..
string.char(186, 148, 229, 141, 129)
..
string.char(229, 188, 166)
..
"\239\188\140\228\184"..
"\128\229\188\166\228\184"..
"\128\230\159\177"..
string.char(230, 128, 157, 229, 141)
..
"\142\229\185\180"..
"\46\10\229"..
"\186\132\231\148\159\230"..
"\153\147\230"..
"\162\166\232\191\183\232"..
"\157\180\232\157"..
"\182\239\188\140\230\156"..
"\155\229\184"..
"\157\230\152\165"..
"\229\191\131\230"..
"\137\152\230\157\156\233"..
"\185\131\46\10"..
"\230\178\167"..
"\230\181\183\230\156"..
"\136\230\152\142\231\143"..
"\160\230\156\137\230"..
string.char(188, 239, 170, 179)
:reverse()
..
"\140\232\147\157"..
"\231\148\176"..
"\230\151\165\230"..
"\154\150\231\142\137"..
string.char(231, 148, 159, 231)
..
"\131\159\46"..
"\10\230\173\164"..
"\230\131\133\229\143"..
"\175\229\190\133\230\136"..
string.char(144, 232, 191, 189, 229, 191)
..
"\134\239\188"..
"\159\229\143\170\230"..
"\152\175\229"..
"\189\147\230\151"..
string.char(182, 229, 183, 178, 230, 131)
..
"\152\231\132\182\46"
,nil
,(72
+
206
-
343
==-65)
)
AddItemSkin("\115\111\114"..
"\97\95\113"..
string.char(105, 121, 117)

,string.char(228, 191, 174, 231)
..
string.char(144, 134, 233, 155, 168, 228)
..
"\188\158\126\228\191"..
"\174\231\144\134\233"..
"\155\168\228\188"..
"\158\126\228\191"..
string.char(174, 231, 144)
..
"\134\233\155"..
"\168\228\188\158"..
string.char(126)

,888)
 AddItemSkin(("\108\95\97\114\111\115"):reverse()
..
string.char(121, 106)

,"\229\188\130\228\184\150"..
"\231\155\184\233\129"..
string.char(135, 44, 229, 176, 189)
..
"\228\186\171\231"..
"\149\153\229\189\177"
,888)
AddItemSkin("\115\111\114\97\95\108"..
string.char(97, 110, 116, 101, 114, 110)

,string.char(232, 174, 169)
..
"\229\174\131"..
"\229\184\166\228\189\160"..
"\230\137\190\229\136"..
string.char(176, 229, 155, 158, 229)
..
"\174\182\231\154\132\232"..
"\183\175"
,450)
AddItemSkin("\115\111\114\97\95"..
"\108\97\110"..
string.char(116, 101, 114, 110)
..
("\104\121\95"):reverse()

,"\232\144\189\230"..
"\168\177\230\140\135"..
string.char(229, 188, 149, 229, 155)
..
"\158\229\174"..
"\182\231\154\132"..
"\232\183\175"
,nil
,( true
 and
 
 false
 and
 not
 false
 and
 
 false
 or
 not
 true
 and
 not
 false
 and
 
 false
 and
 
 false
 or
 
 true
)
)
AddItemSkin(("\114\111\115"):reverse()
..
"\97\95\114\105"..
("\103\110"):reverse()

,"\230\173\187"..
"\231\148\159\229\165"..
"\145\233\152\148\44\228"..
string.char(184, 142, 229, 173, 144, 230)
..
"\136\144\232\175"..
"\180"
,450)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116"..
"\95\115\110"..
string.char(115)

,"\230\131\133"..
"\228\185\139\230"..
"\137\128\231\148\159"..
"\239\188\140\231"..
string.char(148, 177, 229)
..
string.char(191, 131, 232, 128, 140)
..
"\232\181\183"
,500)
AddItemSkin("\115\111\114"..
"\97\50\99\104"..
("\107\112\95\116\115\101"):reverse()
..
"\113"
,"\229\176\177"..
"\229\134\179"..
"\229\174\154\230\152"..
"\175\228\189\160\228\186"..
"\134\44\231\154\174\229"..
"\141\161\228\184\152"..
"\33"
,300)
 AddItemSkin("\115\111\114"..
"\97\50\99\104"..
string.char(101, 115, 116, 95)
..
"\106\110\103"
,"\230\157\176\229\176"..
("\229\176\157\230\188"):reverse()
..
"\176\188\230\157\176"..
"\229\176\188"..
"\230\157\176"..
"\229\176\188"..
"\230\157\176"..
string.char(239, 188, 129)

,300)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115\116"..
("\98\121\95"):reverse()

,string.char(228, 187, 142, 229)
..
"\137\141\231\154\132\233"..
"\130\163\228\184\170"..
"\228\188\138"..
string.char(229, 184, 131, 230, 151, 169)
..
"\229\183\178\231"..
"\187\143\228\184"..
"\141\229\156\168\228"..
"\186\134\239"..
"\188\140\10\231\142\176"..
"\229\156\168\229\156\168"..
"\228\189\160\233\157"..
"\162\229\137\141\231\154"..
"\132\230\152\175\229"..
("\232\182\143"):reverse()
..
"\181\171\233\130"..
"\163\230\139"..
"\137\228\188\138\229\184"..
string.char(131, 46)

,300)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116\95\122"..
"\122\98"
,"\231\143\141\231"..
"\143\160\232"..
"\180\157\233\135\140"..
"\231\156\159\231"..
"\154\132\230\156"..
"\137\231\143\141\231"..
"\143\160"
,300)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115"..
"\116\95\106\99\121"
,"\233\163\158\229\143"..
"\182\229\191\171"..
string.char(229, 136, 128, 239, 188, 129)

,300)
AddItemSkin(string.char(115, 111, 114, 97, 50)
..
"\99\104\101\115\116"..
"\95\109\108\115"
,("\165\157\230\129\166\232"):reverse()
..
string.char(228, 184, 128, 230, 157)
..
"\175\228\185\136\239\188"..
"\159"
,300)
AddItemSkin("\115\111\114\97"..
"\50\99\104"..
("\116\115\101"):reverse()
..
"\95\120\122\122"
,("\171\162\232\161\191\228"):reverse()
..
"\230\136\145\229\144"..
"\131\230\142\137"..
("\134\186\228"):reverse()

,300)
 AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115\116"..
"\95\100\100"
,"\229\134\141\231\187"..
"\153\230\136\145\232\174"..
string.char(178, 228, 184, 128)
..
"\233\129\141\239"..
"\188\140\10"..
"\228\189\160"..
string.char(228, 187, 142, 228)
..
"\184\128\229\160\134\229"..
"\176\143\231"..
"\140\171\233\135\140\233"..
"\128\137\228\184\173"..
"\230\136\145"..
"\231\154\132"..
"\230\149\133\228\186"..
"\139\229\144\167"
,300)
AddItemSkin("\115\111\114\97"..
string.char(50, 99, 104, 101, 115)
..
"\116\95\115"..
"\103\106"
,"\231\159\165"..
"\233\129\147\228\189"..
"\160\229\143\151\228\186"..
"\134\229\165\189\229"..
"\164\154\229\167\148"..
"\229\177\136\239\188"..
"\140\230\137"..
"\128\228\187\165\230\138"..
"\177\230\138\177\228"..
("\160\189"):reverse()

,nil
,(347
-
405
+
82
~=33)
)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115\116"..
"\95\115\120"
,string.char(136, 174, 229)
:reverse()
..
"\230\138\164"..
string.char(229, 191, 131)
..
("\229\140\188\239"):reverse()
..
"\174\136\230\138\164\228"..
"\189\160"
)
AddItemSkin(string.char(115, 111, 114, 97)
..
("\101\114\105\102\50"):reverse()
..
"\95\120\104\108"
,string.char(231, 166, 129, 230, 173)
..
"\162\231\148\168\229"..
"\176\190\229\183"..
"\180\231\131\164\231\129"..
"\171"
,300)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\50\102\105\114\101"..
"\95\104\114\104"
,"\232\128\140\228\189\160"..
"\44\230\136\145\231"..
"\154\132\230\156\139\229"..
string.char(10, 139, 143)
:reverse()
..
string.char(228, 189, 160)
..
"\230\137\141\230\152"..
"\175\231\156\159\230"..
("\231\163\173"):reverse()
..
string.char(154, 132, 229, 184, 149)
..
"\233\178\129"
,300)
AddItemSkin(("\102\50\97\114\111\115"):reverse()
..
"\105\114\101\95\104\104"..
"\108"
,string.char(230, 145, 184)
..
string.char(232, 128, 179)
..
"\230\156\181\230\152"..
string.char(175, 231, 166, 129, 230)
..
"\173\162\228"..
"\186\139\233\161"..
"\185\33"
,300)
 AddItemSkin("\115\111\114\97"..
"\50\102\105\114\101\95"..
"\104\106\108"
,string.char(229, 186, 186, 228)
:reverse()
..
"\174\182\230\137"..
"\141\228\184\141"..
"\230\152\175\228\188\138"..
"\229\184\131\229\145"..
"\162"
,300)
AddItemSkin("\115\111\114"..
"\97\50\102\105"..
"\114\101\95\114"..
"\116\116"
,string.char(231, 156, 139, 239)
..
("\136\230\129\188"):reverse()
..
"\145\229\143"..
"\175\231\136\177"..
"\229\144\151"..
"\126"
)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95\102\108"..
"\111\119\101\114"
,"\228\189\160\229\183"..
"\178\232\162\171\231"..
"\167\187\229\135\186"..
"\231\190\164\232\129"..
"\138\39\232\138\177"..
"\229\188\128\229\175"..
"\140\232\180\181\39"
,300)
AddItemSkin("\115\111\114\97\50\105"..
"\99\101\95"..
"\115\101\101\100"
,"\230\157\165\231"..
string.char(130, 185, 231, 167, 141)
..
string.char(229, 173, 144, 44, 232, 159)
..
"\185\232\159\185"
,300)
AddItemSkin("\115\111\114\97\50"..
("\104\98\95\101\99\105"):reverse()
..
"\108"
,string.char(231, 142, 175)
..
"\230\184\184\230"..
string.char(149, 180, 228, 184, 170)
..
"\230\152\159\231"..
"\179\187\228"..
"\184\128\228\184\135\230"..
("\188\239\161\172"):reverse()
..
"\140\10\229"..
"\143\170\228"..
"\184\186\233\129"..
"\135\232\167\129\228"..
string.char(189, 160)

,500)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101"..
string.char(95, 98, 121, 98)

,"\231\169\191\230"..
"\162\173\233\163"..
"\142\233\155\170\44"..
"\231\187\189"..
"\230\148\190\229"..
"\175\146\232"..
"\138\146\33"
,300)
AddItemSkin(string.char(115, 111, 114, 97, 50, 105)
..
("\95\101\99"):reverse()
..
string.char(106, 113, 114)

,"\229\143\189\228"..
"\188\129\229"..
"\136\131\228\184\141"..
"\230\152\175\230\156\186"..
"\229\153\168"..
"\228\186\186\33"
,300)
 AddItemSkin("\115\111\114\97\50"..
"\98\105\114\100\99\104"..
"\101\115\116\95\103"..
"\103\100"
,"\229\156\168\228"..
"\184\139\230\177"..
"\159\230\185\150\228"..
"\186\186\231\167"..
"\176\232\143"..
"\135\232\143\135\230"..
"\175\146\239\188"..
string.char(140, 10, 230)
..
"\154\151\229\153\168"..
("\156\166\230"):reverse()
..
"\230\142\146\229\144"..
"\141\231\172\172\228\184"..
("\228\129\141\229\131"):reverse()
..
("\239\131\184"):reverse()
..
"\188\140\10\231"..
"\139\172\233"..
"\151\168\231"..
"\187\157\230"..
"\138\128\45\45"..
("\189\165\229"):reverse()
..
"\232\143\135\230"..
"\175\146\239"..
"\188\129"
)
AddItemSkin("\115\111\114"..
("\98\50\97"):reverse()
..
"\105\114\100"..
"\99\104\101\115\116"..
string.char(95, 120, 122, 121, 98)

,"\232\165\191\230\160\188"..
"\230\150\175\230\175"..
"\148\228\184\142"..
"\228\187\153\229\173\144"..
("\138\188\228"):reverse()
..
("\229\131\184\229"):reverse()
..
"\191\131\229\191\131\231"..
string.char(155, 184, 229, 141, 176)
..
"\228\186\134"..
"\239\188\129"
,300)
AddItemSkin("\115\111\114\97\50\98"..
"\105\114\100"..
string.char(99, 104, 101, 115)
..
"\116\95\104\100\119"
,"\230\129\173\229\150\156"..
string.char(228, 189, 160, 239, 188)
..
string.char(140, 232, 162, 171)
..
"\233\156\141\230"..
"\160\188\230"..
"\178\131\232\140\168\229"..
"\189\149\229\143\150\228"..
"\186\134\239"..
"\188\129"
)
AddItemSkin(string.char(115, 111, 114, 97, 95)
..
"\115\105\103\110"..
"\95\109\121\121"
,"\231\190\138\232\133\191"..
string.char(189, 165, 229)
:reverse()
..
"\229\144\131\44\230\137"..
"\128\228\187\165\229\128"..
"\188\229\190"..
"\151\33"
)
AddItemSkin("\115\111\114"..
string.char(97, 95, 115, 105)
..
string.char(103, 110, 95, 121, 101, 122)

,string.char(229, 138, 160, 229)
..
"\164\167\239"..
"\188\129\229"..
"\138\160\229\164\167"..
"\239\188\129"..
string.char(229, 134, 141, 230, 143, 143)
..
string.char(228, 184, 128, 229)
..
"\156\136\239\188"..
string.char(129)

,300)
AddItemSkin(string.char(115, 111, 114, 97, 95, 115)
..
"\109\97\108"..
string.char(108, 108, 105)
..
"\103\104\116\95\102"..
"\108"
,"\232\191\153\230\152"..
string.char(175, 233, 163, 142)
..
string.char(233, 147, 131, 10, 228, 184)
..
"\141\230\152\175"..
"\232\138\177"
)
 AddItemSkin(string.char(115, 111, 114, 97, 95, 115)
..
"\109\97\108\108\108"..
string.char(105, 103, 104, 116, 95, 106)
..
("\106"):reverse()

,"\229\152\191\239"..
"\188\129\10\230\136"..
"\145\231\159"..
"\165\233\129\147"..
"\228\184\128"..
"\228\184\170"..
string.char(232, 131, 189, 232, 174)
..
"\169\230\136\145"..
string.char(229, 156, 168, 232, 181, 176)
..
"\232\183\175\231\154\132"..
string.char(230, 151, 182, 229, 128, 153)
..
"\239\188\140\10"..
string.char(228, 184, 141, 232)
..
"\162\171\231"..
"\187\183\229\184"..
"\166\231\187\138\229\128"..
string.char(146, 231, 154)
..
string.char(132, 229, 138, 158, 230, 179)
..
string.char(149, 239, 188, 140, 10)
..
"\228\189\160\228\187\172"..
("\229\179\131\230"):reverse()
..
"\144\172\229\144"..
"\151\239\188\159"
)
AddItemSkin("\115\111\114"..
"\97\95\115\104"..
string.char(111, 117, 98, 97, 110)
..
"\95\120\100"
,"\228\184\141\229\144"..
"\131\233\165\173"..
string.char(239, 188, 140, 232, 191, 153)
..
"\230\160\183\230"..
"\136\145\229\176\177\233"..
"\149\191\228\184"..
"\141\229\164\167\228"..
"\186\134\239\188"..
"\140\10\230\136\145"..
"\229\176\177\229\143"..
"\175\228\187"..
string.char(165, 228, 184, 141, 231, 166)
..
"\187\229\188\128"..
"\228\189\160\228\186\134"..
"\229\144\151"
,nil
,(277
+
419
+
234
-
75
-
206
~=656)
)
AddItemSkin("\115\111\114\97\95\115"..
"\104\111\117\98\97\110"..
"\95\107\102\107"
,"\229\166\136\33"
,nil
,(162
*
36
-
336
~=5502)
)
AddItemSkin(string.char(115, 111, 114, 97)
..
string.char(95, 115, 104, 111, 117)
..
("\108\95\110\97\98"):reverse()
..
"\121"
,"\230\181\129\232"..
"\144\164\231"..
"\131\164\228\184\178"..
"\126\228\184"..
("\228\131\133\229\137"):reverse()
..
string.char(178, 184, 228, 128, 184)
:reverse()
..
"\126\229\141\129\229"..
"\133\131\228\184"..
"\137\228\184"..
"\178\126"
,nil
,(317
*
294
*
255
-
342
*
225
~=23688542)
)
AddItemSkin("\115\111\114"..
("\104\115\95\97"):reverse()
..
"\111\117\98\97\110"..
string.char(95, 104, 100)

,string.char(230, 152, 175)
..
"\232\157\180"..
"\232\157\182"..
"\230\162\166\230\136"..
"\144\228\186"..
"\134\229\135\164\229"..
"\135\176\239\188"..
("\152\191\232\10\140"):reverse()
..
("\175\152\230"):reverse()
..
("\176\135\229\164\135\229"):reverse()
..
"\230\162\166"..
"\230\136\144\228"..
"\186\134\232\157\180"..
"\232\157\182\239\188"..
"\159"
,nil
,(232
*
354
*
137
*
440
+
2
~=4950675846)
)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\95\115\104"..
"\111\117\98"..
"\97\110\95\104"..
"\100\50"
,"\230\152\175\232\157\180"..
"\232\157\182"..
"\230\162\166\230\136\144"..
"\228\186\134\229\135\164"..
"\229\135\176\239\188\140"..
"\10\232\191"..
("\175\152\230\152"):reverse()
..
("\229\164\135\229"):reverse()
..
string.char(135, 176, 230, 162)
..
"\166\230\136\144\228\186"..
"\134\232\157\180\232"..
"\157\182\239\188\159"
, nil
,(393
-
368
+
419
-
423
==21)
)
AddItemSkin("\115\111\114\97\95"..
"\112\101\97\114"..
("\100\112\95\108"):reverse()

,"\228\186\186\229\174"..
string.char(182, 228, 184)
..
"\141\230\152\175"..
"\232\131\150\10\229\143"..
"\170\230\152\175\229\143"..
string.char(171, 232, 131, 150, 228, 184)
..
"\129"
)
AddItemSkin(string.char(115, 111, 114)
..
"\97\50\98\97\115\101"..
("\105\98\95"):reverse()
..
"\103"
,"\232\176\129\228\184\141"..
"\229\150\156"..
"\230\172\162\229\164"..
string.char(167, 231, 154, 132)
..
"\229\145\162\10\229\175"..
"\185\44\230"..
"\136\145\232\175\180"..
"\231\154\132\229\176\177"..
"\230\152\175\231\165"..
string.char(173, 229, 157, 155)

)
AddItemSkin(string.char(114, 111, 115)
:reverse()
..
"\97\50\98\97\115\101"..
string.char(95, 115, 109, 97)
..
string.char(108, 108)

,"\232\176\129\228\184"..
string.char(141, 229, 150, 156, 230)
..
"\172\162\229\176"..
("\229\132\154\231\143"):reverse()
..
"\145\162\10\229"..
"\175\185\44\230\136\145"..
("\132\154\231\180\175\232"):reverse()
..
string.char(229, 176, 177, 230)
..
"\152\175\231\165"..
"\173\229\157\155"
)
AddItemSkin(string.char(115, 111, 114)
..
"\97\50\98\97"..
"\115\101\95"..
"\122\108\104"
,"\232\191\153"..
"\230\152\175\233"..
string.char(231, 191, 152)
:reverse()
..
"\180\171"
)
 AddItemSkin("\115\111\114\97"..
"\50\98\97\115"..
("\104\108\104\95\101"):reverse()

,"\232\191\153\230\152\175"..
"\233\152\191"..
string.char(230, 156, 177)

)
AddItemSkin("\115\111\114"..
string.char(111, 98, 97)
:reverse()
..
"\119\107\110\111"..
"\116\95\115\111"..
"\114\97"
,"\230\136\145\228"..
"\185\159\228\188\154\230"..
"\152\175\231\172\172\228"..
("\229\128\184"):reverse()
..
string.char(144, 141, 229)
..
"\144\151"
)
AddItemSkin("\115\111\114\97\98\111"..
"\119\107\110"..
"\111\116\95"..
"\108\100"
,string.char(229, 143, 174, 229, 143, 174)
..
"\229\189\147\239\188"..
"\140\229\143"..
"\174\229\143\174\229"..
"\189\147\10\233"..
string.char(147, 131, 229)
..
string.char(132, 191, 229, 147, 141)
..
string.char(229, 143, 174, 229, 189, 147)

)
AddItemSkin("\115\111\114\97\98"..
"\111\119\107"..
"\110\111\116\95"..
("\100\104"):reverse()

,"\230\152\175\232"..
("\232\180\157"):reverse()
..
"\157\182\230\162"..
("\186\228\144\136\230\166"):reverse()
..
"\134\229\135\164\229\135"..
"\176\239\188\140\10\232"..
"\191\152\230\152"..
"\175\229\135\164\229\135"..
string.char(176, 230, 162, 166, 230, 136)
..
"\144\228\186\134\232"..
("\239\182\157\232\180\157"):reverse()
..
"\188\159"
,nil
,(224
+
466
*
8
-
26
-
452
~=3483)
)
AddItemSkin("\115\111\114\97"..
("\97\112\51"):reverse()
..
"\99\107\101\114"..
"\95\104\100"
,"\230\152\175"..
"\232\157\180"..
string.char(162, 230, 182, 157, 232)
:reverse()
..
"\166\230\136\144\228\186"..
"\134\229\135\164"..
"\229\135\176\239\188\140"..
"\10\232\191\152"..
"\230\152\175"..
"\229\135\164\229\135"..
"\176\230\162"..
"\166\230\136\144"..
("\232\134\186\228"):reverse()
..
"\157\180\232\157\182"..
"\239\188\159"
,nil
,(313
*
262
+
494
*
198
~=179827)
)
AddItemSkin("\115\111\114"..
string.char(97, 51, 112)
..
"\97\99\107\101"..
"\114\95\104\100"..
"\50"
,"\230\152\175\232"..
"\157\180\232"..
"\157\182\230\162\166"..
"\230\136\144\228\186"..
"\134\229\135\164\229"..
"\135\176\239\188"..
("\232\10\140"):reverse()
..
string.char(191, 152, 230)
..
("\229\164\135\229\175\152"):reverse()
..
string.char(135, 176, 230, 162, 166)
..
"\230\136\144"..
string.char(228, 186, 134, 232)
..
"\157\180\232"..
"\157\182\239\188"..
"\159"
, nil
,(427
*
184
-
136
+
0
~=78436)
)
AddItemSkin(string.char(115, 111, 114)
..
"\97\98\97\103\95"..
string.char(115, 100, 108)

,string.char(229, 152, 152, 44, 229)
..
("\175\232\163\156"):reverse()
..
"\158\232\128\129\228\186"..
"\186\232\166\129\230\157"..
"\165\228\186\134"
)
AddItemSkin("\115\111\114"..
"\97\98\97\103\95\106"..
("\121\120\114"):reverse()

,"\233\135\145\232"..
"\149\138\230\155\166\231"..
"\190\189\229\138\168\230"..
("\231\129\128"):reverse()
..
"\190\189\231\191\188"
,600)
AddItemSkin("\115\111\114"..
"\97\104\97"..
"\116\95\115"..
"\100"
,"\229\152\152\44"..
string.char(229, 156, 163, 232, 175)
..
"\158\232\128"..
"\129\228\186\186\232\166"..
"\129\230\157\165\228\186"..
"\134"
)
AddItemSkin(string.char(115, 111, 114, 97, 50)
..
"\98\117\105\108"..
"\100\95\100"..
"\101\99\111\114\95\106"..
string.char(115, 115)

,("\158\188\228\162\186\231"):reverse()
..
"\228\188\158\239"..
"\188\140\231\153\189"..
"\230\157\134"..
"\230\157\134\10\229"..
string.char(144, 131, 229, 174)
..
("\232\128\184\228\140"):reverse()
..
"\181\183\232\186\186\230"..
"\157\191\230\157\191\227"..
"\128\130"
,300)
 AddItemSkin("\115\111\114\97"..
string.char(50, 98, 117)
..
"\105\108\100\95\100"..
"\101\99\111\114\95\115"..
"\109\97\108\108"
,"\232\191\153\230"..
"\152\175\228\184"..
"\173\230\157"..
("\232\10\140\188\239\175"):reverse()
..
string.char(191, 153, 230)
..
"\152\175\229\164"..
"\167\230\157"..
string.char(175, 239, 188, 140, 10)
..
string.char(232, 191, 153, 230, 152, 175)
..
"\232\182\133\229\164"..
"\167\230\157\175\46"
,60)
AddItemSkin("\115\111\114\97\50\98"..
"\117\105\108\100\95"..
"\100\101\99\111\114\95"..
string.char(109, 101, 100, 105)
..
"\117\109"
,"\232\191\153\230"..
"\152\175\228\184"..
"\173\230\157\175\239\188"..
"\140\10\232"..
"\191\153\230\152\175"..
"\229\164\167\230"..
"\157\175\239\188\140\10"..
"\232\191\153\230"..
"\152\175\232\182"..
"\133\229\164\167\230"..
"\157\175\46"
,60)
AddItemSkin("\115\111\114"..
"\97\51\115"..
"\119\111\114\100\95"..
"\114\111\115"..
string.char(101)

,string.char(142, 231, 175, 152, 230)
:reverse()
..
"\171\232\175\173"..
"\239\188\129\228"..
"\184\141\230\152\175\230"..
"\162\133\233\155\168"..
"\239\188\129"
)
AddItemSkin("\115\111\114"..
"\97\95\119\113\95"..
"\98\98\106"
,"\232\191\153\231"..
string.char(142, 169, 230, 132, 143, 231)
..
"\156\159\231\154\132"..
"\232\131\189\229\135"..
"\186\231\154\174\232\130"..
"\164\229\144\151"..
"\63"
)
AddItemSkin("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
string.char(95, 100, 119)

,"\231\171\175\229\141"..
"\136\232\138"..
string.char(130, 229, 191)
..
string.char(133, 233, 161, 187, 229, 144)
..
string.char(131, 231, 178)
..
string.char(189, 229, 173, 144, 229)
..
"\144\151"
,300)
AddItemSkin(string.char(115, 111, 114, 97, 95, 112)
..
"\101\97\114\108\95\115"..
"\108\109"
,"\232\144\140\231"..
"\142\139\230\152"..
"\175\232\176\129\63"
)
AddItemSkin("\115\111\114"..
string.char(97, 95, 112, 101)
..
string.char(116, 95, 108, 114, 97)
:reverse()
..
"\121"
,"\233\152\191\231"..
"\143\141\231\136"..
("\228\138\184\228\177"):reverse()
..
("\229\191\152\233\134\186"):reverse()
..
"\188\186"
)
 AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95\113\121"
,string.char(141, 184, 228)
:reverse()
..
"\230\173\162\228\184\131"..
("\149\164\229"):reverse()
..
"\44\230\155\180\229\156"..
string.char(156, 230, 168)
:reverse()
..
"\157\229\164\149"..
("\32\32\32\10"):reverse()
..
("\45\45\32"):reverse()
..
"\45\50\48"..
"\50\52\228\184\131"..
"\229\164\149\231\186"..
string.char(170, 229, 191, 181)

)
AddItemSkin("\115\111\114\97\95\116"..
"\113\121\95\113"..
string.char(107, 121, 122)

,"\228\188\151\231\148\159"..
"\228\184\186\230"..
"\163\139\44\228\184"..
"\128\230\142"..
"\183\233\146\177"..
"\229\157\164"
)
AddItemSkin("\115\111\114\97\95\116"..
string.char(113, 121, 95, 120)
..
("\108\113"):reverse()

,"\229\176\143\233\157"..
"\146\233\190\153"..
"\228\184\186\228\187\128"..
"\228\185\136\230"..
"\152\175\231\186"..
("\154\231\178\137\232\162"):reverse()
..
"\132\63"
)
AddItemSkin(string.char(115, 111, 114, 97, 95, 108)
..
"\105\103\104"..
string.char(116, 102, 108, 105, 101)
..
"\114\95\116"..
"\106\122\122"
,"\233\151\178\230"..
"\157\165\230"..
string.char(151, 160, 228, 186, 139)
..
"\239\188\140\232\186\186"..
"\231\171\185"..
"\229\144\172\230\155"..
string.char(178)

)
AddItemSkin(string.char(115, 111, 114, 97, 95, 108)
..
"\105\103\104\116"..
("\95\114\101\105\108\102"):reverse()
..
"\98\101\101\120"
,"\232\191\153"..
"\230\152\175\231\134"..
"\138\239\188\140\10"..
string.char(228, 184, 141, 230, 152)
..
"\175\66\101\101"..
string.char(239, 188, 129)

)
AddItemSkin("\115\111\114"..
"\97\98\111\119\107\110"..
"\111\116\95\115\98\121"
,("\161\232\163\187\228"):reverse()
..
string.char(168, 230, 156)
..
"\136\228\186\174\230"..
string.char(182, 136, 231, 129)
..
"\173\228\189\160\33"
,nil
,( false
 and
 
 false
 and
 not
 false
 or
 
 false
 or
 
 true
 and
 not
 false
 or
 not
 false
 and
 not
 true
 and
 
 false
 or
 not
 false
 or
 not
 false
)
)
 AddItemSkin("\115\111\114"..
"\97\109\97\103\105"..
"\99\95\115\98\121"
,"\228\187\163\232\161"..
("\186\228\136\156\230\168"):reverse()
..
("\182\230\174"):reverse()
..
"\136\231\129\173\228\189"..
"\160\33"
,nil
,(139
*
379
+
170
-
226
+
499
==53124)
)
AddItemSkin("\115\111\114\97\98"..
"\97\103\95\115"..
"\98\121"
,("\168\161\232\163\187\228"):reverse()
..
"\230\156\136\228"..
string.char(186, 174, 230, 182, 136)
..
string.char(231, 129, 173, 228)
..
"\189\160\33"
,nil
,(409
*
105
+
324
-
334
~=42938)
)
AddItemSkin("\115\111\114"..
string.char(97, 104, 97, 116, 95)
..
"\115\98\121"
,"\228\187\163\232\161\168"..
"\230\156\136\228\186\174"..
"\230\182\136"..
"\231\129\173\228\189\160"..
"\33"
,nil
,(155
-
442
-
134
==-421)
)
AddItemSkin("\115\111\114\97\95\116"..
"\113\121\95\115\98\121"
,("\168\161\232\163\187\228"):reverse()
..
string.char(230, 156, 136, 228, 186)
..
"\174\230\182"..
"\136\231\129\173\228\189"..
"\160\33"
,nil
,(70
*
322
+
144
-
86
+
432
==23030)
)
AddItemSkin("\115\111\114\97"..
"\95\116\113\121\95"..
"\98\111\120\95\115"..
("\121\98"):reverse()

,"\228\187\163"..
"\232\161\168\230"..
"\156\136\228\186"..
"\174\230\182\136\231"..
string.char(129, 173, 228, 189, 160)
..
"\33"
,nil
,(292
*
327
-
451
~=95038)
)
AddItemSkin("\115\111\114"..
"\97\95\115\105"..
"\103\110\95"..
"\119\115\113\121"
,"\228\184\135\229"..
"\156\163\231\139\130\230"..
"\172\162\239\188\140\230"..
"\151\160\228\185\144\228"..
"\184\141\228\189\156"..
"\239\188\129"
)
AddItemSkin("\115\111\114\97"..
"\95\115\109"..
"\97\108\108"..
"\108\105\103\104\116\95"..
"\119\115\113\121"
,"\228\184\141"..
("\231\153\187\231"):reverse()
..
"\179\150\229"..
"\176\177\230"..
string.char(230, 160, 189, 228, 138, 138)
:reverse()
..
"\138\147\232"..
"\181\183\230\157\165\229"..
"\144\131\230\142"..
string.char(137, 239, 188, 129)

)
 AddItemSkin("\115\111\114\97\109"..
"\97\103\105\99\95\119"..
"\115\113\121"
,"\230\136\145\229"..
"\176\134\231\142"..
"\171\231\145\176\232\151"..
"\143\228\186\142"..
"\232\186\171\229\144"..
"\142\44\10\230\156"..
"\159\231\155\188"..
"\228\184\142"..
"\228\189\160\232"..
"\181\180\231\186\166"..
"\46"
)
AddItemSkin("\115\111\114"..
"\97\116\101\108\101"..
string.char(95, 119, 115, 113, 121)

,"\229\156\168\230\136\145"..
("\231\146\141\232"):reverse()
..
"\152\160\231\154\132"..
"\229\156\159"..
("\138\184\228\176\156\229"):reverse()
..
string.char(44, 10, 228, 189, 160)
..
"\230\152\175"..
"\230\156\128\229\144\142"..
"\231\154\132\231\142\171"..
string.char(231, 145, 176)

)
AddItemSkin("\115\111\114\97\98"..
string.char(111, 119, 107, 110, 111)
..
string.char(116, 95, 119, 115, 113, 121)

,"\230\156\137\228\186"..
"\186\233\170"..
"\130\228\189\160\233\135"..
string.char(142, 229, 191)
..
"\131\229\139\131\229"..
"\139\131\239\188"..
"\140\10\230"..
"\156\137\228"..
("\228\177\136\231\186\186"):reverse()
..
"\189\160\231"..
"\129\181\233\173"..
"\130\230\156\137"..
"\231\129\171"
)
AddItemSkin("\115\111\114\97\95\108"..
"\105\103\104\116\102"..
"\108\105\101"..
"\114\95\119\115"..
("\121\113"):reverse()

,string.char(233, 135, 147, 229)
:reverse()
..
string.char(133, 183, 239)
..
"\188\129\229"..
("\183\133\233\135\147"):reverse()
..
"\239\188\129\229\147"..
"\135\233\133\183"..
"\229\147\135\233\133\183"..
"\239\188\129"
)
AddItemSkin("\115\111\114\97"..
"\50\112\108\97"..
"\110\116\95\120\109"
,"\230\152\159"..
string.char(228, 185, 139, 230, 137, 128)
..
"\229\144\145\239\188"..
"\140\230\162\166\228\185"..
"\139\230\137"..
"\128\229\189"..
"\146"
)
local __T__hI_s__b__u_g_={sora_none=
"\115\111\114\97\95\117"..
"\110\105\102\111"..
"\114\109\115"
}
local __t_H__i_s_B__U_G=require"widgets/screen"local TH__I__S__bu_g__=require"widgets/text"local __t__h_i__sBU_g__=require"widgets/uianim"local __tH_is__b__u__g_=require"widgets/image"local _T__H__iS_B_U_G_=require"widgets/widget"local _THi_S__b__U_G__=require"widgets/redux/templates"local __t__H_iS__B__u_G_=require"widgets/redux/accountitemframe" local __t_hIs__b_uG_=require"widgets/textbutton"local _t__H_i_s_b__U_g=5;local _th_is__BU__g__=44;local __tHI_S__B__uG__=300;local T_h__I_s_bU__g__=40;local __tH_IsBug_=BUTTONFONT;local t__Hi_S_B__UG=32;local t__H__isb_u_G__=0.6;local __tH__i_s_b__U__g=-55;local __t__hI_s_B_uG=UICOLOURS[("\69\84\73\72\87"):reverse()
]local __TH_i_S_Bu__g=UICOLOURS["\71\82\69\89"] PushNoConnectScr=function(__T__H__IS__bU__g_)
 local t_h__iS__B__u__g__=__T__H__IS__bU__g_==1 and"\229\189\147"..
"\229\137\141\229\174"..
"\162\230\136\183"..
string.char(231, 171, 175, 230, 178, 161)
..
"\230\156\137"..
"\228\191\174"..
("\232\141\164\229"):reverse()
..
"\129\148\231\189\145"..
"\10\232\175\183\231"..
string.char(130, 185, 229, 135, 187, 226)
..
("\159\230\156\128"):reverse()
..
"\165\231\156\139\230"..
"\143\144\231\164"..
"\186\226\128\157"..
("\230\140\188\239"):reverse()
..
"\140\137\230\181\143"..
"\232\167\136\229"..
"\153\168\230\143"..
"\144\231\164\186\229\174"..
string.char(140, 230, 136)
..
"\144\228\191\174\229\164"..
"\141"
or"\229\189\147\229"..
"\137\141\230\156\141\229"..
"\138\161\231"..
string.char(171, 175, 230)
..
"\178\161\230\156"..
"\137\228\191\174\229"..
"\164\141\232\129"..
("\10\145\189\231\148"):reverse()
..
"\232\175\183\232\174"..
"\169\230\136\191\228"..
string.char(184, 187, 228, 191, 174)
..
("\141\156\230\141\164\229"):reverse()
..
"\229\138\161\231\171"..
"\175\231\154\132"..
"\232\129\148\231"..
"\189\145\233"..
"\151\174\233\162"..
string.char(150, 136, 230, 10, 152)
:reverse()
..
"\231\148\177\230\136"..
"\191\228\184\187"..
"\229\188\128\229\144"..
string.char(175, 229, 174)
..
"\162\230\136\183\231\171"..
"\175\228\187\163"..
("\134\144\231"):reverse()
..
string.char(230, 168, 161, 229)
..
"\188\143\239\188\136"..
"\228\184\141\230\142"..
"\168\232\141\144"..
"\239\188\137"
SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233\166"..
"\168\230\143"..
string.char(144, 231, 164, 186)

,t_h__iS__B__u__g__,{"\230\159\165\231"..
string.char(156, 139, 230, 143, 144, 231)
..
"\164\186"
,
string.char(229, 133, 179, 233)
..
string.char(151, 173)

}
,{function()
VisitURL("\104\116\116\112\58"..
string.char(107, 105, 119, 47, 47)
:reverse()
..
"\105\46\102\108"..
"\97\112\105\46\99\110"..
"\47\110"
,(208
-
74
+
168
==306)
)
end
,
nil
}
)
end
THI__Sb_U__g=function()
if TheNet:GetIsServer()
then if not ServerHasHttpOK()
then PushNoConnectScr(2)
return(305
+
25
-
305
-
352
==-318)
end else if not HasHttpOK()
then PushNoConnectScr(1)
return(435
-
161
-
364
==-83)
end;if not ServerHasHttpOK()
then PushNoConnectScr(2)
return(242
*
183
-
242
~=44044)
end end;return(354
*
75
*
424
+
252
-
276
==11257176)
end
__t__HI_s_Bug__=function(__Th_IS_bu_G__,
_t_h_IS_bUG)
if not _T_Hi_s_B__U_G_()
or not THI__Sb_U__g()
then return end;local __t_Hi__s_B_u_g__=_TH_I_sb_U__g_(__Th_IS_bu_G__ or"\115\111\114\97\95\110"..
"\111\110\101"
)
__t_Hi__s_B_u_g__["\117\110\108\111"..
"\99\107\116"..
("\116\120\101"):reverse()
]:SetString(_t_h_IS_bUG or string.char(228, 187, 133, 231)
..
string.char(148, 168, 228)
..
string.char(186, 142, 232, 167)
..
"\163\233\148\129\231\169"..
"\185\229\166\185\67\68"..
"\75"
)
return __t_Hi__s_B_u_g__ end
PushCDKScr=function(_t_HIS__Bu__g__)
local t__h__i__s__B_U__G__=__t__HI_s_Bug__(string.char(115, 111, 114, 97, 95)
..
"\110\111\110\101"
,_t_HIS__Bu__g__)
if t__h__i__s__B_U__G__ then TheFrontEnd:PushScreen(t__h__i__s__B_U__G__)
end;return t__h__i__s__B_U__G__ end
PushItemScr=function(_t_h__is__b_u_g__)
if not THI__Sb_U__g()
then return end;local _thI__s__b_u_g__=__tH_I__S__b__U_G__()
TheFrontEnd:PushScreen(_thI__s__b_u_g__)
return _thI__s__b_u_g__ end
 AddClassPostConstruct("\119\105\100\103\101\116"..
string.char(115, 47, 114, 101, 100)
..
"\117\120\47"..
"\105\116\101\109"..
"\101\120\112\108\111\114"..
"\101\114"
,function(self)
local t_hi__s__B_u__G_=self["\95\83\104\111\119"..
"\73\116\101"..
"\109\83\101\116"..
("\111\102\110\73"):reverse()
]self[("\119\111\104\83\95"):reverse()
..
"\73\116\101"..
"\109\83\101\116"..
"\73\110\102\111"]=function(t_HI_sB_u__G,...
)
 if _Th__iSbu_G[t_HI_sB_u__G["\115\101\116\95\105"..
string.char(109, 101, 116)
:reverse()
..
"\95\116\121\112\101"]]then if not THI__Sb_U__g()
then return end;t_HI_sB_u__G[string.char(115, 101, 116, 95)
..
string.char(105, 110, 102, 111, 95, 115)
..
"\99\114\101"..
"\101\110"]=_Th__iSbu_G[t_HI_sB_u__G["\115\101\116"..
string.char(95, 105, 116, 101, 109)
..
string.char(112, 121, 116, 95)
:reverse()
..
"\101"]](t_HI_sB_u__G,t_HI_sB_u__G[string.char(115, 101, 116, 95, 105)
..
"\116\101\109\95\116\121"..
"\112\101"])
if not t_HI_sB_u__G[string.char(115, 101, 116, 95, 105, 110)
..
("\114\99\115\95\111\102"):reverse()
..
"\101\101\110"]then return end;t_HI_sB_u__G["\115\101\116"..
"\95\105\110\102\111"..
"\95\115\99\114\101"..
"\101\110"]["\111\119\110\101\100\95"..
("\95\121\98"):reverse()
..
"\119\97\114\100"..
"\114\111\98\101"]=(309
-
25
-
207
+
129
~=212)
TheFrontEnd:PushScreen(self["\115\101\116\95\105"..
string.char(111, 102, 110)
:reverse()
..
"\95\115\99\114"..
"\101\101\110"])
return end;return t_hi__s__B_u__G_(t_HI_sB_u__G,...
)
end
if self["\105\110\116"..
"\101\114\97\99\116"..
"\95\114\111"..
string.char(111, 116)
]then self["\115\111\114"..
"\97\116\105\109\101\95"..
"\116\101\120\116"]=self["\105\110\116\101\114"..
string.char(114, 95, 116, 99, 97)
:reverse()
..
"\111\111\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,30,nil
,UICOLOURS["\87\72\73\84\69"])
)
 local function TH_iS_b_u__G_()self["\115\111\114"..
"\97\116\105"..
string.char(109, 101, 95, 116, 101)
..
string.char(120, 116)
]:SetString(string["\102\111\114\109"..
"\97\116"]("\229\143\175\231\148\168"..
string.char(47, 230, 128, 187, 230)
..
"\180\187\232"..
"\183\131\229\186\166"..
("\37\32\58"):reverse()
..
"\100\47\37"..
"\100"
,T_Hi_sBU_G,_tH_Is__B__uG+T_Hi_sBU_G)
)
end;TH_iS_b_u__G_()
self["\115\111\114"..
"\97\116\105\109\101\95"..
string.char(116, 101, 120, 116)
]["\105\110\115\116"]:ListenForEvent("\115\111\114\97\95\115"..
"\107\105\110\95\97"..
"\99\116\105\118\105"..
"\116\121\95\99"..
"\104\97\110\103\101"..
"\100"
,TH_iS_b_u__G_,TheGlobalInstance)
self["\115\111\114\97\116"..
"\105\109\101\95\116"..
string.char(101, 120, 116)
]:SetPosition(120,240)
self[string.char(115, 111, 114, 97, 116, 105)
..
"\109\101\95\116\101\120"..
"\116"]:Hide()
self[("\97\114\111\115"):reverse()
..
"\105\116\101"..
"\109\95\98\116"..
"\110"]=self[string.char(105, 110, 116, 101)
..
string.char(114, 97, 99, 116)
..
"\95\114\111\111\116"]:AddChild(_THi_S__b__U_G__[("\97\100\110\97\116\83"):reverse()
..
string.char(114, 100, 66, 117)
..
"\116\116\111\110"](function()
PushItemScr()
end
,"\231\137\169\229\147"..
("\154\231\129"):reverse()
..
"\174\232\130\164"
,{130,
45}
)
)
self[string.char(115, 111, 114, 97)
..
"\105\116\101\109\95"..
"\98\116\110"]:SetPosition(150,50)
self["\115\111\114\97\105\116"..
string.char(101, 109, 95, 98, 116, 110)
]:Hide()
self["\115\111\114\97"..
"\116\105\109\101\95\116"..
string.char(101, 120, 116, 95, 98, 116)
..
("\110"):reverse()
]=self[string.char(105, 110, 116)
..
string.char(101, 114, 97, 99, 116)
..
"\95\114\111\111"..
"\116"]:AddChild(__t_hIs__b_uG_("\104\121\100"
)
)
 self["\115\111\114\97"..
"\116\105\109\101\95\116"..
string.char(101, 120, 116)
..
"\95\98\116\110"]:SetText("\230\156\170\228\191"..
"\174\229\164\141\232\129"..
string.char(189, 231, 148)
:reverse()
..
"\145\239\188\140\232\175"..
"\183\231\130\185\230\173"..
("\165\159\230\164"):reverse()
..
"\231\156\139\228\191"..
"\174\229\164"..
("\141"):reverse()

)
self["\115\111\114"..
"\97\116\105"..
"\109\101\95"..
string.char(116, 101, 120, 116, 95)
..
"\98\116\110"]:SetPosition(160,240)
 self["\115\111\114\97"..
"\116\105\109\101\95\116"..
string.char(101, 120, 116)
..
("\110\116\98\95"):reverse()
]:SetOnClick(function()
VisitURL("\104\116\116\112\58"..
"\47\47\119\105\107"..
string.char(105, 46, 102, 108, 97, 112)
..
"\105\46\99\110\47"..
string.char(110)
:reverse()

,( false
 and
 
 true
 or
 not
 false
 and
 not
 false
 and
 
 false
 and
 
 true
 and
 not
 false
 and
 
 true
 and
 not
 false
)
)
SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132, 230, 184)
..
"\169\233\166\168\230"..
("\186\164\231\144\143"):reverse()

,"\232\175\183\229"..
"\133\136\230\140"..
("\167\232\143\181\230\137"):reverse()
..
"\136\229\153\168"..
"\230\143\144\231\164\186"..
"\228\191\174\229\164\141"..
"\232\129\148\231"..
string.char(189, 145, 233)
..
"\151\174\233"..
"\162\152\10\229"..
"\166\130\230\156\170"..
string.char(229, 188, 185, 229, 135, 186)
..
"\230\181\143"..
string.char(232, 167, 136, 229, 153)
..
string.char(168, 44, 232, 175)
..
"\183\232\191\155\81"..
"\81\231\190\164\58\51"..
"\55\50\52\53"..
"\48\55\48\53\230\159"..
"\165\231\156\139"
)
end
)
self["\115\111\114\97\116\105"..
"\109\101\95\116\101"..
"\120\116\95\98\116"..
"\110"]:Hide()
end;local __t__H__is__b__u__G__=self["\95\85\112"..
("\73\101\116\97\100"):reverse()
..
"\116\101\109\83"..
"\101\108\101\99"..
"\116\101\100\73\110\102"..
"\111"] self["\95\85\112"..
"\100\97\116\101\73\116"..
string.char(101, 109, 83, 101, 108)
..
string.char(101, 99, 116, 101, 100, 73)
..
"\110\102\111"]=function(__Thi__sB_u_G,
_t_h_I_S__B_U__g_,...
)
local t_hI_S__BUG=__t__H__is__b__u__G__(__Thi__sB_u_G,_t_h_I_S__B_U__g_,...
)
if _t_h_I_S__B_U__g_ and _Th__iSbu_G[_t_h_I_S__B_U__g_]and not __T_His_B_U__g__[_t_h_I_S__B_U__g_]and __Thi__sB_u_G[("\95\116\101\115"):reverse()
..
"\105\110\102\111\95"..
string.char(110, 116, 98)
:reverse()
]then __Thi__sB_u_G["\115\101\116"..
"\95\105\110\102\111\95"..
("\110\116\98"):reverse()
]:SetText(string.char(230, 191, 128)
..
("\187\180\230"):reverse()

)
__Thi__sB_u_G[string.char(115, 101, 116, 95)
..
"\105\110\102\111"..
"\95\98\116"..
"\110"]:Show()
__Thi__sB_u_G["\115\101\116\95\105\116"..
("\112\121\116\95\109\101"):reverse()
..
"\101"]=_t_h_I_S__B_U__g_ elseif __Thi__sB_u_G["\115\101\116"..
"\95\105\110\102"..
string.char(111, 95, 98, 116)
..
"\110"]then __Thi__sB_u_G["\115\101\116\95"..
"\105\110\102\111\95"..
"\98\116\110"]:SetText(STRINGS[("\73\85"):reverse()
][string.char(67, 79, 76, 76, 69)
..
"\67\84\73\79"..
"\78\83\67\82\69"..
"\69\78"]["\83\69\84\95\73"..
"\78\70\79"])
end;if __Thi__sB_u_G[string.char(115, 111, 114, 97, 105, 116)
..
"\101\109\95\98"..
string.char(116, 110)
]then local _t__H__i__s_bUG__=_t_h_I_S__B_U__g_ and ServerHasHttpOK()
if _t__H__i__s_bUG__ then __Thi__sB_u_G["\115\111\114"..
"\97\105\116\101\109"..
"\95\98\116\110"]:Show()
else __Thi__sB_u_G["\115\111\114\97"..
string.char(105, 116, 101, 109, 95, 98)
..
"\116\110"]:Hide()
end;if _t_h_I_S__B_U__g_ and _t_h_I_S__B_U__g_:match("\94\115\111"..
"\114\97"
)
then if not _t__H__i__s_bUG__ then self["\115\111\114\97\116"..
"\105\109\101"..
string.char(95, 116, 101)
..
"\120\116"]:Hide()
self["\115\111\114\97\116"..
"\105\109\101"..
"\95\116\101\120\116\95"..
"\98\116\110"]:Show()
else self["\115\111\114\97\116\105"..
"\109\101\95\116"..
("\116\120\101"):reverse()
]:Show()
self["\115\111\114\97\116"..
"\105\109\101\95\116"..
"\101\120\116\95"..
"\98\116\110"]:Hide()
end else self["\115\111\114\97"..
"\116\105\109\101"..
"\95\116\101\120\116"]:Hide()
self["\115\111\114"..
"\97\116\105"..
"\109\101\95\116"..
string.char(101, 120, 116, 95, 98)
..
"\116\110"]:Hide()
end end;return t_hI_S__BUG end
end
)
 local _tHIS_bUG_=Class(__t_H__i_s_B__U_G,function(self,
_t_HI__sB_U__G,
__t__H_is__B__u__G_)
__t_H__i_s_B__U_G["\95\99\116"..
"\111\114"](self,string.char(85, 110, 76, 111)
..
"\99\107\83"..
"\99\114\101\101\110"
)
self["\105\116\101\109"]=_t_HI__sB_U__G;self[string.char(99, 98)
]=__t__H_is__B__u__G_;self["\98\108\97\99\107"]=self:AddChild(_THi_S__b__U_G__[string.char(66, 97, 99, 107)
..
"\103\114\111\117\110"..
"\100\84\105\110\116"]()
)
self["\112\114\111\111\116"]=self:AddChild(_THi_S__b__U_G__[string.char(101, 101, 114, 99, 83)
:reverse()
..
"\110\82\111"..
string.char(111, 116)
]("\82\79\79\84"
)
)
self["\99\100"]=SoraCD(5,(126
-
416
-
9
*
472
+
415
~=-4120)
)
 self["\98\117\116\116\111"..
string.char(110, 115)
]={{text=
"\230\191\128\230"..
"\180\187"
,
cb=
function()
if self["\99\100"]()
then if self[string.char(99, 98)
]then self["\99\98"](self,_t_HI__sB_U__G)
end else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230"..
"\143\144\231\164\186"
,("\231\183\175\232"):reverse()
..
"\168\141\229"..
("\229\153\128"):reverse()
..
("\227\149\175\232\141\134"):reverse()
..
string.char(128, 130)

)
end end
}
,
{text=
"\229\133\179\233\151\173"
,
cb=
function()
self:Close()
end
}
}
local _Thi__sB_u__g=400;self[string.char(100, 105, 97, 108, 111, 103)
]=self["\112\114\111\111\116"]:AddChild(_THi_S__b__U_G__[("\87\121\108\114\117\67"):reverse()
..
string.char(105, 110, 100, 111)
..
"\119"](_Thi__sB_u__g,450,STRINGS["\78\65\77\69\83"][_t_HI__sB_U__G],self[("\111\116\116\117\98"):reverse()
..
("\115\110"):reverse()
])
)
self["\99\111\110\116\101"..
("\111\111\114\95\116\110"):reverse()
..
"\116"]=self["\112\114\111\111\116"]:AddChild(_T__H__iS_B_U_G_("\99\111\110\116\101\110"..
"\116\95\114\111\111\116"
)
)
self["\99\111\110\116\101"..
"\110\116\95\114\111\111"..
string.char(116)
]:SetPosition(200,-150)
self[string.char(97, 110, 105, 109)
..
"\95\114\111\111"..
"\116"]=self["\99\111\110\116"..
"\101\110\116\95\114"..
"\111\111\116"]:AddChild(_T__H__iS_B_U_G_("\97\110\105\109\95\114"..
"\111\111\116"
)
)
self["\97\110\105"..
"\109\95\114\111"..
"\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self[string.char(97, 110, 105, 109, 95, 114)
..
string.char(111, 111, 116)
]:SetHAnchor(ANCHOR_MIDDLE)
self["\97\110\105\109"..
"\95\114\111\111"..
"\116"]:SetScaleMode(SCALEMODE_PROPORTIONAL)
self["\97\110\105\109\95"..
"\114\111\111\116"]:SetPosition(-150,-50)
self[string.char(97, 110, 105, 109)
]=self["\97\110\105\109\95"..
("\116\111\111\114"):reverse()
]:AddChild(__t__h_i__sBU_g__()
)
self["\97\110\105\109\115"..
string.char(116, 97, 116, 101)
]=self[string.char(105, 110, 97)
:reverse()
..
"\109"]:GetAnimState()
local __t__h_I_s__bug_= __T__hI_s__b__u_g_[_t_HI__sB_U__G]or _t_HI__sB_U__G;local th_i_SB__uG=__t__h_I_s__bug_;local T__h_i_S__b_u__g=GetSkin(__t__h_I_s__bug_)
if T__h_i_S__b_u__g and T__h_i_S__b_u__g[string.char(105, 115, 105, 116)
..
string.char(101, 109, 115, 107, 105)
..
"\110\115"]then th_i_SB__uG="\115\111\114"..
"\97\95\117"..
"\110\105\102\111\114"..
"\109\115"
end;self["\97\110\105\109\115\116"..
"\97\116\101"]:SetBuild(th_i_SB__uG)
self[("\116\115\109\105\110\97"):reverse()
..
("\101\116\97"):reverse()
]:SetBank(("\115\108\105\119"):reverse()
..
"\111\110"
)
self["\97\110\105"..
"\109\115\116\97\116"..
"\101"]:PlayAnimation("\101\109\111\116"..
"\101\88\76"..
"\95\108\111\111\112"..
"\95\100\97"..
"\110\99\101\48"
,(308
-
137
-
10
~=169)
)
self[("\109\105\110\97"):reverse()
..
"\115\116\97\116\101"]:AddOverrideBuild("\112\108\97\121\101"..
"\114\95\101\109\111\116"..
"\101\95\101\120\116\114"..
"\97"
)
self["\97\110\105\109"]:SetFacing(FACING_DOWN)
self["\97\110\105"..
"\109"]:SetScale(0.8,0.8,0.8)
self[string.char(97, 110, 105, 109)
..
"\115\116\97"..
string.char(101, 116)
:reverse()
]:Hide("\65\82\77\95\99"..
"\97\114\114\121"
)
self["\97\110\105\109\115\116"..
"\97\116\101"]:Hide("\104\101\97\100"..
("\116\97\104\95"):reverse()

)
self[("\109\105\110\97"):reverse()
..
("\116\97\116\115"):reverse()
..
"\101"]:Hide(string.char(72, 65, 73, 82, 95, 72)
..
"\65\84"
)
 self["\105\99\111\110"]=self["\99\111\110"..
string.char(116, 101, 110, 116)
..
"\95\114\111\111"..
("\116"):reverse()
]:AddChild(__t__h_i__sBU_g__()
)
self["\105\99\111\110"]:GetAnimState()
:SetBank(string.char(97, 99, 99, 111, 117, 110)
..
"\116\105\116"..
"\101\109\95"..
"\102\114\97\109\101"
)
self["\105\99\111\110"]:GetAnimState()
:SetBuild(string.char(97, 99, 99, 111, 117)
..
"\110\116\105\116\101"..
"\109\95\102\114"..
"\97\109\101"
)
self[("\110\111\99\105"):reverse()
]:GetAnimState()
:PlayAnimation("\105\99\111"..
"\110"
,( false
 and
 not
 true
 and
 
 true
 and
 not
 false
 or
 not
 false
 and
 not
 true
 or
 
 false
 and
 
 false
 and
 
 false
 or
 not
 false
 and
 not
 false
 or
 not
 true
 and
 not
 false
 and
 
 true
)
)
if T__h_i_S__b_u__g then if T__h_i_S__b_u__g[("\97\119\115"):reverse()
..
"\112\95\105"..
string.char(99, 111, 110)
]then self[string.char(105, 99, 111, 110)
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65"..
string.char(67, 73, 95, 80)
:reverse()
..
"\79\78"
,T__h_i_S__b_u__g["\115\119\97\112\95"..
"\105\99\111\110"]["\98\117\105\108\100"],T__h_i_S__b_u__g["\115\119\97\112\95\105"..
"\99\111\110"][string.char(105, 109, 97, 103, 101)
])
elseif T__h_i_S__b_u__g["\105\109\97\103\101"]then self["\105\99\111"..
"\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79"..
string.char(78)

,softresolvefilepath(T__h_i_S__b_u__g["\97\116\108\97\115"])
,T__h_i_S__b_u__g["\105\109\97"..
"\103\101"]..string.char(46, 116, 101, 120)

)
else self[("\110\111\99\105"):reverse()
]:GetAnimState()
:OverrideSkinSymbol(("\65\87\83"):reverse()
..
"\80\95\73\67\79\78"
,__t__h_I_s__bug_,"\83\87\65\80\95\73"..
"\67\79\78"
)
end else self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol(string.char(83, 87, 65)
..
string.char(80, 95, 73, 67, 79)
..
"\78"
,__t__h_I_s__bug_,string.char(95, 80, 65, 87, 83)
:reverse()
..
string.char(73, 67, 79)
..
"\78"
)
end;self["\105\99\111\110"]:GetAnimState()
:Hide(string.char(84, 73, 78)
..
"\84"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\76\79\67\75"
)
self["\105\99\111\110"]:GetAnimState()
:Hide(string.char(87, 69, 78)
:reverse()

)
self[("\111\99\105"):reverse()
..
"\110"]:GetAnimState()
:Hide(string.char(84, 67, 69, 76, 69, 83)
:reverse()

)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:Hide("\73\67\95\87\69"..
"\65\86\69"
)
for THI__s_b_u__g_,_T__h_I_S__b_Ug__ in pairs(EVENT_ICONS)
do self[string.char(105, 99, 111, 110)
]:GetAnimState()
:Hide(THI__s_b_u__g_)
end;self["\105\99\111\110"]:GetAnimState()
:Hide("\68\76\67"
)
self[("\110\111\99\105"):reverse()
]:SetPosition(-100,310)
self["\105\110\102\111\95\116"..
"\120\116"]=self["\99\111\110\116\101\110"..
"\116\95\114\111\111"..
"\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,26,nil
,UICOLOURS[string.char(87, 72, 73, 84, 69)
])
)
self["\105\110\102\111"..
"\95\116\120\116"]:SetPosition(-35,130)
self["\105\110\102\111\95\116"..
"\120\116"]:SetRegionSize(_Thi__sB_u__g*0.8,85)
self[string.char(105, 110, 102, 111)
..
"\95\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\105\110\102\111"..
"\95\116\120"..
string.char(116)
]:SetVAlign(ANCHOR_MIDDLE)
self["\105\110\102\111\95"..
"\116\120\116"]:EnableWordWrap((78
+
336
*
113
-
124
~=37929)
)
self["\105\110\102\111\95"..
"\116\120\116"]:SetString(STRINGS["\83\75\73\78\95\68"..
("\82\67\83\69"):reverse()
..
string.char(78, 79, 73, 84, 80, 73)
:reverse()
..
("\83"):reverse()
][_t_HI__sB_U__G]or"\85\110\75\110\111\119"
)
self[("\101\109\97\110"):reverse()
..
"\95\116\120"..
"\116"]=self["\99\111\110\116\101"..
"\110\116\95\114"..
"\111\111\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,30,nil
,UICOLOURS["\87\72\73\84"..
"\69"])
)
self[("\101\109\97\110"):reverse()
..
string.char(95, 116, 120, 116)
]:SetPosition(-35,220)
self["\110\97\109\101\95\116"..
("\116\120"):reverse()
]:SetRegionSize( _Thi__sB_u__g*0.8,85)
self[string.char(110, 97, 109, 101, 95)
..
string.char(116, 120, 116)
]:SetHAlign(ANCHOR_LEFT)
self["\110\97\109\101"..
"\95\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\110\97\109\101\95"..
string.char(116, 120, 116)
]:EnableWordWrap((35
+
54
+
238
+
109
+
477
==913)
)
self["\110\97\109\101"..
"\95\116\120\116"]:SetString(STRINGS[string.char(83, 75, 73, 78, 95)
..
string.char(78, 65, 77, 69, 83)
][_t_HI__sB_U__G]or"\85\110\75\110\111\119"
)
self["\114\97\114\105\116"..
"\121\95\116\120"..
string.char(116)
]=self[string.char(99, 111, 110, 116)
..
"\101\110\116\95"..
"\114\111\111\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\114\97\114"..
"\105\116\121\95\116\120"..
"\116"]:SetPosition(-35,190)
self["\114\97\114\105\116\121"..
("\116\120\116\95"):reverse()
]:SetRegionSize(_Thi__sB_u__g*0.8,85)
self[("\116\105\114\97\114"):reverse()
..
"\121\95\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\114\97\114\105\116\121"..
"\95\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\114\97\114\105\116"..
"\121\95\116\120"..
"\116"]:EnableWordWrap((266
+
329
-
452
+
273
+
350
==766)
)
 self[string.char(114, 97, 114, 105)
..
"\116\121\95\116"..
"\120\116"]:SetString("\230\128\187"..
("\176\229\139\185\228"):reverse()
..
string.char(177, 230, 152, 175, 233)
..
"\157\158\229\184\184\229"..
("\136\231\175\143"):reverse()
..
"\177"
)
self["\104\111\114\105"..
"\122\111\110\116\97\108"..
"\95\108\105\110"..
string.char(101)
]=self["\99\111\110\116\101\110"..
("\116\111\111\114\95\116"):reverse()
]:AddChild(__tH_is__b__u__g_("\105\109\97\103\101"..
"\115\47\103\108"..
"\111\98\97\108"..
string.char(95, 114, 101)
..
"\100\117\120\46"..
("\108\109\120"):reverse()

,"\105\116\101\109\95"..
"\100\105\118\105"..
"\100\101\114\46\116"..
"\101\120"
)
)
self[string.char(104, 111, 114, 105)
..
string.char(108, 97, 116, 110, 111, 122)
:reverse()
..
string.char(95, 108, 105)
..
string.char(110, 101)
]:SetScale(0.5,1)
self["\104\111\114"..
"\105\122\111\110"..
"\116\97\108\95"..
"\108\105\110\101"]:SetPosition(-200,75,0)
self["\104\111\114\105"..
"\122\111\110\116\97"..
"\108\95\108"..
"\105\110\101\50"]=self[("\110\101\116\110\111\99"):reverse()
..
string.char(116, 95, 114, 111, 111, 116)
]:AddChild(__tH_is__b__u__g_("\105\109\97\103"..
"\101\115\47\103"..
"\108\111\98"..
"\97\108\95\114\101\100"..
"\117\120\46\120"..
string.char(109, 108)

,"\105\116\101\109"..
"\95\100\105\118"..
string.char(105, 100, 101, 114)
..
"\46\116\101\120"
)
)
self["\104\111\114\105\122"..
string.char(111, 110, 116)
..
"\97\108\95\108\105\110"..
string.char(101, 50)
]:SetScale(0.25,1)
 self[("\105\114\111\104"):reverse()
..
"\122\111\110\116\97\108"..
string.char(95, 108, 105, 110, 101)
..
"\50"]:SetPosition(-95,170,0)
self["\117\110\108\111\99\107"..
"\100\101\115"]=self["\99\111\110\116\101"..
"\110\116\95\114\111"..
"\111\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111"..
"\99\107\100"..
"\101\115"]:SetPosition(-235,50)
self["\117\110\108\111\99"..
("\101\100\107"):reverse()
..
("\115"):reverse()
]:SetRegionSize(_Thi__sB_u__g*0.8,85)
self[("\111\108\110\117"):reverse()
..
"\99\107\100\101\115"]:SetHAlign(ANCHOR_LEFT)
self["\117\110\108\111\99\107"..
"\100\101\115"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(99, 111, 108, 110, 117)
:reverse()
..
"\107\100\101\115"]:EnableWordWrap((83
*
219
-
169
+
61
*
217
~=31253)
)
self[string.char(117, 110, 108, 111, 99, 107)
..
"\100\101\115"]:SetString("\232\167\163"..
"\233\148\129\230\150"..
"\185\229\188\143\58"
)
self[("\107\99\111\108\110\117"):reverse()
..
"\116\101\120\116"]=self["\99\111\110\116"..
"\101\110\116\95\114\111"..
"\111\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111"..
"\99\107\116\101\120\116"]:SetPosition(-165,50)
self["\117\110\108\111"..
"\99\107\116\101\120\116"]:SetRegionSize(_Thi__sB_u__g*0.8,85)
self[("\99\111\108\110\117"):reverse()
..
"\107\116\101\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\117\110\108\111\99"..
"\107\116\101\120"..
"\116"]:SetVAlign(ANCHOR_MIDDLE)
 self[string.char(117, 110, 108, 111, 99)
..
"\107\116\101\120"..
"\116"]:EnableWordWrap((450
+
323
+
392
*
120
==47813)
)
self["\117\110\108\111"..
"\99\107\116\101\120\116"]:SetString(""
)
self["\100\101\102"..
"\97\117\108\116\95\102"..
"\111\99\117"..
"\115"]=self["\100\105\97\108\111"..
"\103"]end
)
function _tHIS_bUG_:OnControl(_Th_I__sbu__g__,__t_h_I__s_b__UG__)if _tHIS_bUG_["\95\98\97\115"..
"\101"][("\110\111\67\110\79"):reverse()
..
"\116\114\111\108"](self,_Th_I__sbu__g__,__t_h_I__s_b__UG__)
then return(152
*
65
-
87
==9793)
end;if _Th_I__sbu__g__==CONTROL_CANCEL and not __t_h_I__s_b__UG__ then self["\98\117\116\116\111"..
"\110\115"][#self[string.char(98, 117, 116, 116, 111)
..
string.char(110, 115)
]]["\99\98"]()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110\116"..
"\115\116\97\114"..
"\118\101\47"..
string.char(72, 85, 68, 47, 99, 108)
..
string.char(105, 99, 107, 95, 109)
..
string.char(111, 118, 101)

)
return(370
-
325
*
229
-
460
+
160
==-74355)
end end;function _tHIS_bUG_:Close()if self["\79\110\67\108"..
"\111\115\101"..
string.char(67, 66)
]then self["\79\110\67\108\111\115"..
"\101\67\66"]["\67\108\111\115\101"..
string.char(67, 66)
](self[("\111\108\67\110\79"):reverse()
..
"\115\101\67\66"],self)
end;TheFrontEnd:PopScreen(self)
end __t_H_I__Sbu__g__=Class(_tHIS_bUG_,function(self,
T__H__is_B_u_g__,
_tHi_SBuG__)
_tHIS_bUG_["\95\99\116"..
"\111\114"](self,T__H__is_B_u_g__)
_tHi_SBuG__=_tHi_SBuG__ or 300;local _th_Is__B__uG_=T_H_I__s_B__u__g/_tHi_SBuG__;self["\99\104\97\114\97"..
("\114\101\116\99"):reverse()
..
"\112\114\111\103\114"..
string.char(101, 115, 115)
]=self["\99\111\110\116\101"..
"\110\116\95\114\111"..
"\111\116"]:AddChild(TH__I__S__bu_g__(HEADERFONT,40, nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(99, 104, 97, 114)
..
"\97\99\116\101"..
string.char(114, 112, 114, 111, 103, 114)
..
"\101\115\115"]:SetPosition(-200,10)
_th_Is__B__uG_=math["\109\105\110"](math["\109\97\120"](0,_th_Is__B__uG_)
,1)
self[("\99\97\114\97\104\99"):reverse()
..
("\111\114\112\114\101\116"):reverse()
..
"\103\114\101"..
string.char(115, 115)
]:SetString(string[string.char(102, 111, 114, 109)
..
string.char(97, 116)
]("\229\189\147"..
"\229\137\141\232"..
string.char(191, 155, 229)
..
"\186\166\58\32\37"..
"\48\46\49\102\37"..
"\37"
,_th_Is__B__uG_*100)
)
 self["\99\98"]=function(t__H_is__B__U__G__,
_T_h__i_s__b_u__G__)
if not THI__Sb_U__g()
then return end if T_H_I__s_B__u__g>=_tHi_SBuG__ then if T__H__Isbug==""
and __T_HIS_b_u_G and __T__H_Is_B_uG()
then __T_HIS_b_u_G()
SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184"..
"\169\233\166\168\230"..
"\143\144\231\164"..
"\186"
,"\232\175\183\231"..
"\168\141\229\144\142\229"..
string.char(175, 232, 141, 134)
:reverse()
..
"\149"
)
return end local __T_hI_s_b__uG_=SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233"..
string.char(166, 168, 230, 143, 144, 231)
..
string.char(164, 186)

,string.char(230, 173, 163, 229, 156)
..
"\168\230\191\128\230"..
"\180\187\228\184\173\44"..
("\183\175\232"):reverse()
..
string.char(141, 168, 231)
:reverse()
..
"\229\144\142"..
"\230\159\165\231\156\139"..
"\231\187\147\230\158\156"
)
 __thI_sB_U_G__(string.char(99, 47, 65)
..
("\105\116\99"):reverse()
..
"\118\101\83\107"..
"\105\110"
,{skin=
self["\105\116\101\109"]}
,function(T__h__iS_b_U__G,
__t__hIS_Bu_G_,
_t_h_ISbU__g)
TheFrontEnd:PopScreen(__T_hI_s_b__uG_)
if T__h__iS_b_U__G==5031 then _T_H_isBug_()
_T_his__bU_g__(_t_h_ISbU__g["\115\107\105\110"..
"\112\114\101\102\97"..
"\98"])
elseif T__h__iS_b_U__G==5032 then _T_H_isBug_()
_T__hi__Sbu__g(_t_h_ISbU__g)
SoraPushPopupDialog(("\231\143\176\229"):reverse()
..
"\169\185\231\154\132"..
"\230\184\169\233"..
"\166\168\230\143\144"..
string.char(231, 164, 186)

,tostring(_t_h_ISbU__g[string.char(109, 115, 103)
])
)
_T_his__bU_g__(_t_h_ISbU__g[("\110\105\107\115"):reverse()
..
"\112\114\101\102"..
"\97\98"])
elseif T__h__iS_b_U__G==401 then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231"..
"\154\132\230\184\169\233"..
"\166\168\230"..
"\143\144\231\164"..
"\186"
,string.char(231, 154, 174, 232, 130, 164)
..
"\231\153\187\229"..
"\189\149\229"..
"\135\173\232\175\129\229"..
"\183\178\229"..
"\164\177\230\149\136\239"..
string.char(188, 140, 232, 175, 183, 231)
..
"\168\141\229\144\142"..
"\229\134\141\232"..
"\175\149\239\188\129"
)
elseif T__h__iS_b_U__G==-2 then SoraPushPopupDialog(("\143\176\229"):reverse()
..
"\231\169\185\231\154\132"..
string.char(230, 184, 169)
..
"\233\166\168\230\143\144"..
string.char(231, 164, 186)

,__T_H__I__sBug__("\231\154\174"..
("\128\191\230\164\130\232"):reverse()
..
string.char(230, 180, 187, 232)
..
"\191\158\230\142\165"..
"\229\164\177"..
("\165\180\232"):reverse()
..
"\239\188\140\232\175"..
"\183\231\168\141\229\144"..
string.char(142, 229, 134)
..
"\141\232\175\149\239"..
string.char(188, 129)

,__t__hIS_Bu_G_,_t_h_ISbU__g)
)
elseif T__h__iS_b_U__G<0 then SoraPushPopupDialog("\229\176\143\231\169\185"..
("\132\154\231"):reverse()
..
"\230\184\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,tostring(_t_h_ISbU__g)
)
else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184\169\233"..
"\166\168\230"..
string.char(143, 144, 231)
..
"\164\186"
,"\231\154\174"..
string.char(232, 130, 164)
..
"\230\191\128\230\180\187"..
"\229\164\177\232\180\165"..
"\44\233\148\153"..
"\232\175\175"..
"\228\187\163"..
"\231\160\129"..
"\58"
..tostring(T__h__iS_b_U__G)
)
end end
)
return else SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143"..
"\144\231\164"..
string.char(186)

,string.char(229, 156, 168, 231, 186)
..
"\191\230\151\182"..
"\233\149\191\228"..
"\184\141\232"..
string.char(182, 179, 10, 230)
..
("\229\187\180\230\128\191"):reverse()
..
string.char(165, 180, 232, 177, 164)
:reverse()
..
"\10\229\166\130\230\158"..
string.char(156, 230, 151)
..
"\182\233\149\191\228\184"..
"\141\229\175"..
"\185\32\232\175\183"..
"\232\191\135\229"..
"\141\138\229\176"..
"\143\230\151"..
"\182\229\134\141"..
string.char(232, 175, 149)

)
end end
end
)
 t__hi__SbU_g_=Class(_tHIS_bUG_,function(self,
_t__h_i_s_bU__G,
T__h__I_S_BU_g)
_tHIS_bUG_["\95\99\116\111\114"](self,_t__h_i_s_bU__G)
T__h__I_S_BU_g=T__h__I_S_BU_g or 300;self["\99\104\97\114\97"..
"\99\116\101\114"..
"\112\114\111\103\114"..
"\101\115\115"]=self["\99\111\110\116\101\110"..
string.char(116, 95, 114, 111, 111, 116)
]:AddChild(TH__I__S__bu_g__(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[("\97\104\99"):reverse()
..
"\114\97\99\116\101"..
"\114\112\114"..
"\111\103\114\101\115"..
"\115"]:SetPosition(-200,10)
self[string.char(99, 104, 97, 114)
..
"\97\99\116"..
string.char(101, 114, 112)
..
"\114\111\103\114\101"..
"\115\115"]:SetString(string[("\97\109\114\111\102"):reverse()
..
"\116"]("\229\143\175"..
"\231\148\168\230\180"..
"\187\232\183\131"..
"\229\186\166\58"..
("\32\100\37\32"):reverse()

,T_Hi_sBU_G)
)
 self["\99\98"]=function(_T__h__ISb__U_g_,
__t__HI_S_b_U__g)
if not THI__Sb_U__g()
then return end if T_Hi_sBU_G>=T__h__I_S_BU_g then if T__H__Isbug==""
and __T_HIS_b_u_G and __T__H_Is_B_uG()
then __T_HIS_b_u_G()
SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
string.char(231, 154, 132, 230, 184, 169)
..
"\233\166\168\230"..
"\143\144\231\164\186"
,string.char(232, 175, 183)
..
string.char(231, 168, 141, 229, 144, 142)
..
"\229\134\141"..
string.char(232, 175, 149)

)
return end local T__HI__S__B_u_g__=SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
("\230\168\166\233\169\184"):reverse()
..
"\143\144\231\164\186"
,"\230\173\163\229\156\168"..
"\230\191\128\230\180"..
"\187\228\184\173\44"..
"\232\175\183\231"..
"\168\141\229"..
string.char(144, 142, 230)
..
"\159\165\231"..
"\156\139\231"..
("\230\147\187"):reverse()
..
("\156\158"):reverse()

)
 __thI_sB_U_G__("\99\47\65\99\116"..
"\105\118\101"..
string.char(110, 105, 107, 83)
:reverse()

,{skin=
self["\105\116\101\109"]}
,function(_T_h__i__sbU__G,
_T__hI__S_b__U__g_,
__t_h_I__s__B__U_g)
TheFrontEnd:PopScreen(T__HI__S__B_u_g__)
if _T_h__i__sbU__G==5031 then _T_H_isBug_()
_T_his__bU_g__(__t_h_I__s__B__U_g["\115\107\105\110"..
("\98\97\102\101\114\112"):reverse()
])
elseif _T_h__i__sbU__G==5032 then _T_H_isBug_()
_T__hi__Sbu__g(__t_h_I__s__B__U_g)
SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184"..
string.char(169, 233, 166, 168, 230, 143)
..
"\144\231\164\186"
,tostring(__t_h_I__s__B__U_g["\109\115\103"])
)
_T_his__bU_g__(__t_h_I__s__B__U_g["\115\107\105\110\112"..
string.char(114, 101, 102)
..
"\97\98"])
elseif _T_h__i__sbU__G==401 then SoraPushPopupDialog("\229\176\143\231\169\185"..
string.char(231, 154, 132, 230)
..
string.char(184, 169, 233)
..
"\166\168\230"..
"\143\144\231\164\186"
,string.char(231, 154, 174, 232, 130, 164)
..
string.char(231, 153, 187, 229, 189, 149)
..
"\229\135\173"..
"\232\175\129\229\183"..
"\178\229\164\177\230"..
"\149\136\239"..
string.char(188, 140, 232, 175)
..
"\183\231\168\141\229\144"..
string.char(142, 229, 134, 141, 232)
..
"\175\149\239\188\129"
)
elseif _T_h__i__sbU__G==-2 then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230\184"..
"\169\233\166\168\230\143"..
"\144\231\164\186"
,__T_H__I__sBug__(string.char(231, 154, 174, 232, 130)
..
string.char(164, 230, 191, 128, 230, 180)
..
"\187\232\191"..
string.char(158, 230, 142)
..
"\165\229\164"..
"\177\232\180\165\239"..
"\188\140\232"..
"\175\183\231"..
"\168\141\229\144"..
"\142\229\134\141"..
"\232\175\149\239\188\129"..
("\129\188\239"):reverse()

,_T__hI__S_b__U__g_,__t_h_I__s__B__U_g)
)
elseif _T_h__i__sbU__G<0 then SoraPushPopupDialog("\229\176\143\231\169"..
("\184\230\132\154\231\185"):reverse()
..
string.char(169, 233, 166, 168, 230)
..
"\143\144\231\164\186"
,tostring(__t_h_I__s__B__U_g)
)
else SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143"..
"\144\231\164\186"
,"\231\154\174\232\130\164"..
"\230\191\128\230\180\187"..
"\229\164\177\232\180\165"..
"\44\233\148"..
"\153\232\175"..
"\175\228\187\163\231\160"..
"\129\58"
..tostring(_T_h__i__sbU__G)
)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184"..
string.char(166, 233, 169)
:reverse()
..
"\168\230\143"..
"\144\231\164\186"
,string["\102\111\114"..
"\109\97\116"](("\175\143\229"):reverse()
..
"\231\148\168\230\180\187"..
"\232\183\131\229\186\166"..
string.char(232, 141, 184, 228)
:reverse()
..
"\182\179\239"..
"\188\140\229"..
("\32\141\137\229\147\189"):reverse()
..
"\37\100\239\188\140\233"..
string.char(156, 128, 232, 166, 129)
..
string.char(32, 37, 100, 227)
..
"\128\130"
,T_Hi_sBU_G,T__h__I_S_BU_g)
)
end end
end
)
 _TH_I_sb_U__g_=Class(_tHIS_bUG_,function(self,
_t__h_i__S_b_u_g__,
t_h__iS__B_u_G__)
_tHIS_bUG_["\95\99\116\111\114"](self,_t__h_i__S_b_u_g__,t_h__iS__B_u_G__)
self["\99\100\107"..
"\98\111\120"]=self[("\110\101\116\110\111\99"):reverse()
..
("\116\111\111\114\95\116"):reverse()
]:AddChild(_THi_S__b__U_G__["\83\116\97"..
"\110\100\97\114\100"..
"\83\105\110\103\108"..
"\101\76\105\110\101\84"..
"\101\120\116\69"..
("\121\114\116\110"):reverse()
](nil
,360,40)
)
self[string.char(99, 100, 107, 98)
..
"\111\120"]:SetPosition(-200,0)
self["\99\100\107\98\111"..
"\120"]["\116\101\120\116"..
"\98\111\120"]:SetTextLengthLimit(23)
self[("\98\107\100\99"):reverse()
..
"\111\120"][string.char(116, 120, 101, 116)
:reverse()
..
("\120\111\98"):reverse()
]:SetForceEdit((425
-
382
-
32
==11)
)
self[string.char(99, 100, 107)
..
string.char(120, 111, 98)
:reverse()
][string.char(120, 101, 116)
:reverse()
..
"\116\98\111\120"]:EnableWordWrap((314
+
34
+
485
*
494
==239948)
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120"..
"\116\98\111"..
"\120"]:EnableScrollEditWindow((5
+
165
+
101
~=275)
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116\98"..
"\111\120"]:SetHelpTextEdit(""
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120"..
"\116\98\111\120"]:SetHelpTextApply("\232\175\183\232\190\147"..
string.char(229, 133, 165, 67, 68, 75)

)
 self[("\98\107\100\99"):reverse()
..
"\111\120"]["\116\101\120\116"..
"\98\111\120"]:SetTextPrompt("\232\175\183\232"..
"\190\147\229\133\165"..
string.char(67, 68, 75)

,UICOLOURS["\71\82\69"..
string.char(89)
])
self["\99\100\107"..
"\98\111\120"]["\116\101\120"..
string.char(116, 98, 111, 120)
]["\112\114\111"..
"\109\112\116"]:SetHAlign(ANCHOR_MIDDLE)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116"..
string.char(98, 111, 120)
]:SetCharacterFilter(string.char(45, 48, 49, 50, 51, 52)
..
string.char(53, 54, 55)
..
string.char(56, 57, 81, 87)
..
string.char(69, 82, 84, 89)
..
string.char(85, 80, 65, 83, 68)
..
"\70\71\72\74\75"..
"\76\90\88\67\86\66"..
"\78\77\113\119\101"..
string.char(114, 116, 121, 117)
..
"\112\97\115\100\102"..
"\103\104\106\107\108\122"..
string.char(118, 99, 120)
:reverse()
..
string.char(98, 110, 109)

)
self["\99\100\107"..
"\98\111\120"]:SetOnGainFocus(function()
self["\99\100\107\98"..
"\111\120"]["\116\101\120\116"..
"\98\111\120"]:OnGainFocus()
end
)
self["\99\100\107\98\111"..
"\120"]:SetOnLoseFocus(function()
self["\99\100\107"..
string.char(98, 111, 120)
]["\116\101\120\116\98\111"..
"\120"]:OnLoseFocus()
end
)
self["\99\100\107\98\111\120"]["\102\111\99\117\115\95"..
string.char(102, 111, 114)
..
"\119\97\114\100"]=self[string.char(99, 100, 107, 98, 111)
..
"\120"]["\116\101\120\116"..
"\98\111\120"] self["\99\98"]=function(_tH_i__Sb__ug_,
__T__h__I__SB_U__G)
if not _T_Hi_s_B__U_G_()
or not THI__Sb_U__g()
then return end local T_h_i__Sb__u_g_=self[string.char(107, 100, 99)
:reverse()
..
string.char(98, 111, 120)
]["\116\101\120\116"..
"\98\111\120"]:GetString()
 if T_h_i__Sb__u_g_ then T_h_i__Sb__u_g_=T_h_i__Sb__u_g_:upper()
if not(T_h_i__Sb__u_g_:utf8len()
==23 and T_h_i__Sb__u_g_:match(("\57\45\48\91\94"):reverse()
..
string.char(93, 45, 37, 90, 45, 65)
:reverse()
..
"\43\36"
)
)
then SoraPushPopupDialog(string.char(229, 176, 143)
..
("\185\169\231"):reverse()
..
"\231\154\132\230"..
"\184\169\233\166"..
string.char(143, 230, 168)
:reverse()
..
"\144\231\164\186"
,"\232\175\183\232\190\147"..
string.char(229, 133, 165, 230, 173)
..
string.char(174, 161, 231, 163)
:reverse()
..
"\231\154\132\229\141"..
string.char(161, 229, 175)
..
"\134"
)
return end;if T__H__Isbug==""
and __T_HIS_b_u_G and __T__H_Is_B_uG()
then __T_HIS_b_u_G()
SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184"..
"\169\233\166\168"..
"\230\143\144\231\164"..
"\186"
,string.char(232, 175, 183, 231, 168)
..
"\141\229\144\142"..
"\229\134\141"..
string.char(232, 175, 149)

)
return end;local T_His__B__U_G__=SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143"..
("\164\231\144"):reverse()
..
"\186"
,"\230\173\163\229\156"..
string.char(168, 230, 191, 128, 230)
..
"\180\187\228"..
"\184\173\44"..
"\232\175\183\231\168\141"..
"\229\144\142\230\159\165"..
string.char(231, 156, 139, 231, 187)
..
"\147\230\158\156"
)
 __t__h__Is_bUG(T_h_i__Sb__u_g_,function(t__h_Is__b__u__g,
__ThIS__b_u__g,
thi_sB_U__g)
 TheFrontEnd:PopScreen(T_His__B__U_G__)
 if(t__h_Is__b__u__g==-6001 or t__h_Is__b__u__g==-6002 or t__h_Is__b__u__g==-6003)
then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132\230\184\169"..
"\233\166\168"..
"\230\143\144\231\164\186"
,string.char(229, 141, 161, 229, 175, 134)
..
"\228\184\141"..
string.char(230, 173, 163, 231)
..
"\161\174\32\232\175\183"..
string.char(233, 135, 141, 230)
..
"\150\176\232\190"..
("\165\133\229\147"):reverse()

)
elseif(t__h_Is__b__u__g==-6004)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184"..
string.char(169, 233, 166, 168, 230)
..
"\143\144\231"..
string.char(164, 186)

,"\232\191\153"..
"\229\188\160"..
"\229\141\161"..
"\229\175\134\229\183"..
"\178\231\187\143\232"..
"\162\171\228\189"..
"\160\228\189"..
"\191\231\148\168\232\191"..
"\135\228\186\134"
)
elseif(t__h_Is__b__u__g==-6005)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166\168\230\143"..
"\144\231\164\186"
,"\232\191\153\229\188\160"..
string.char(229, 141, 161, 229, 175, 134)
..
"\229\183\178\231\187"..
"\143\232\162"..
"\171\229\136\171\228\186"..
"\186\228\189"..
"\191\231\148\168\232"..
("\186\228\135\191"):reverse()
..
"\134"
)
elseif(t__h_Is__b__u__g==-6103)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,"\231\187\145\229"..
"\174\154\231\160\129"..
"\228\184\141"..
"\230\173\163\231\161"..
string.char(174)

)
elseif(t__h_Is__b__u__g==-6104)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154\132"..
("\233\169\184\230"):reverse()
..
string.char(166, 168, 230)
..
string.char(143, 144, 231)
..
string.char(164, 186)

,"\231\187\145"..
"\229\174\154"..
"\231\160\129"..
"\229\183\178\231\187\143"..
string.char(232, 162, 171, 231, 187, 145)
..
"\229\174\154\228\186"..
"\134"
)
elseif(t__h_Is__b__u__g==-6105)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230"..
string.char(184, 169, 233, 166, 168, 230)
..
"\143\144\231\164"..
"\186"
,string.char(228, 189, 160)
..
"\229\183\178\231\187\143"..
("\229\145\187\231"):reverse()
..
"\174\154\230"..
"\136\144\229"..
string.char(138, 159)

)
elseif(t__h_Is__b__u__g==-6106)
then SoraPushPopupDialog(("\143\176\229"):reverse()
..
"\231\169\185\231"..
"\154\132\230"..
string.char(184, 169, 233, 166, 168, 230)
..
"\143\144\231\164"..
"\186"
,string.char(228, 189, 160, 229, 183, 178)
..
("\187\231\143\187\231"):reverse()
..
"\145\229\174"..
"\154\232\191"..
"\135\229\133\182"..
"\228\187\150\231\154\132"..
"\231\187\145\229\174\154"..
"\231\160\129"..
string.char(228, 186, 134)

)
elseif(t__h_Is__b__u__g==-6201)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230\184"..
string.char(169, 233, 166, 168)
..
string.char(230, 143, 144, 231)
..
"\164\186"
,string.char(231, 164, 188, 229, 140)
..
"\133\228\184"..
string.char(141, 229, 173, 152, 229, 156)
..
"\168"
)
elseif(t__h_Is__b__u__g==-6202)
then SoraPushPopupDialog(("\185\169\231\143\176\229"):reverse()
..
string.char(231, 154, 132, 230, 184, 169)
..
string.char(233, 166, 168, 230)
..
("\231\144\143"):reverse()
..
"\164\186"
,("\188\164\231"):reverse()
..
"\229\140\133\231\177\187"..
"\229\158\139\228"..
"\184\141\230\173"..
"\163\231\161"..
"\174"
)
elseif(t__h_Is__b__u__g==-6203)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132\230"..
string.char(184, 169, 233, 166, 168)
..
"\230\143\144"..
string.char(231, 164, 186)

,"\231\164\188\229"..
"\140\133\229\183"..
("\191\232\178"):reverse()
..
"\135\230\156\159"
)
elseif (t__h_Is__b__u__g==401)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
string.char(184, 169, 233, 166, 168)
..
string.char(164, 231, 144, 143, 230)
:reverse()
..
"\186"
,"\229\133\145"..
string.char(230, 141, 162, 231)
..
"\153\187\229\189\149\229"..
"\135\173\232"..
"\175\129\229\183\178\229"..
"\164\177\230"..
"\149\136\239\188\140"..
"\232\175\183\231"..
"\168\141\229"..
"\144\142\229\134\141\232"..
"\175\149\239"..
"\188\129\239\188"..
"\129"
)
elseif(t__h_Is__b__u__g==-2)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
string.char(169, 233, 166, 168)
..
string.char(230, 143, 144, 231, 164)
..
string.char(186)

,__T_H__I__sBug__(string.char(229, 133, 145)
..
string.char(232, 162, 141, 230)
:reverse()
..
string.char(191, 158, 230, 142)
..
string.char(165, 229, 164, 177, 232)
..
"\180\165\239\188\140\232"..
"\175\183\231\168\141\229"..
"\144\142\229\134\141\232"..
"\175\149\239\188\129\239"..
"\188\129"
,__ThIS__b_u__g,thi_sB_U__g)
)
elseif(t__h_Is__b__u__g==-3)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230"..
("\168\166\233\169\184"):reverse()
..
("\164\231\144\143\230"):reverse()
..
"\186"
,string.char(230, 156, 141)
..
"\229\138\161\229\153"..
string.char(168, 229, 134)
..
"\133\233\131\168"..
string.char(229, 135, 186, 233, 148, 153)
..
("\175\232\44"):reverse()
..
"\183\231\168\141"..
"\229\144\142\229\134\141"..
"\232\175\149"
)
elseif(t__h_Is__b__u__g<0)
then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
string.char(169, 185, 231)
..
"\154\132\230\184\169"..
("\168\166\233"):reverse()
..
"\230\143\144"..
"\231\164\186"
,"\229\141\161\229"..
"\175\134\228\189\191"..
("\229\168\148\231"):reverse()
..
"\164\177\232\180\165\44"..
string.char(232, 175, 183, 232, 129)
..
"\148\231\179"..
"\187\228\189\156\232\128"..
("\111\99\32\133"):reverse()
..
("\58\101\100"):reverse()

..t__h_Is__b__u__g)
elseif(t__h_Is__b__u__g==6021)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184"..
("\168\166\233\169"):reverse()
..
"\230\143\144\231\164"..
("\186"):reverse()

,"\228\189\160\229"..
"\183\178\231\187"..
"\143\230\139\165\230\156"..
string.char(137, 228, 186, 134, 91)

..thi_sB_U__g["\115\107\105"..
string.char(110, 110, 97, 109, 101)
].."\93\44\228\184"..
"\141\233\156\128\232\166"..
"\129\233\135\141\229"..
"\164\141\230"..
("\180\230\128\191"):reverse()
..
"\187"
)
SkinRPC("\71\101\116"..
("\115\110\105\107\83"):reverse()

)
_tH_Isb_uG__(__t_hi_s__bU__g__)
elseif(t__h_Is__b__u__g==6103)
then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
"\169\185\231"..
"\154\132\230\184"..
string.char(169, 233, 166, 168)
..
string.char(230, 143, 144, 231, 164)
..
"\186"
,"\231\187\145\229\174"..
("\144\136\230\154"):reverse()
..
"\229\138\159\44\81\81"..
"\58"
..thi_sB_U__g["\113\113"])
elseif(t__h_Is__b__u__g==6001)
then _T_H_isBug_()
TheFrontEnd:PopScreen(self)
_T_his__bU_g__(thi_sB_U__g[string.char(115, 107, 105, 110, 112)
..
string.char(114, 101, 102, 97)
..
"\98"],{skinname=
thi_sB_U__g["\115\107\105\110"..
"\110\97\109\101"]}
)
elseif(t__h_Is__b__u__g==6231)
then if _T_Hi_s_B__U_G_((498
*
476
*
116
-
44
+
88
~=27497620)
)
then SkinRPC(string.char(68, 67, 101, 115, 85)
:reverse()
..
"\75"
,T_h_i__Sb__u_g_,(276
+
383
+
315
+
181
~=1163)
)
end else SoraPushPopupDialog("\229\176\143\231"..
string.char(169, 185, 231, 154, 132, 230)
..
("\230\168\166\233\169\184"):reverse()
..
"\143\144\231\164\186"
, "\67\68\75\230\191\128"..
string.char(230, 180, 187, 229, 164, 177)
..
"\232\180\165"..
"\44\233\148\153"..
"\232\175\175\228\187"..
"\163\231\160"..
("\58\129"):reverse()

..t__h_Is__b__u__g)
end end
)
return else SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230\184"..
"\169\233\166\168"..
"\230\143\144\231\164\186"
,"\232\175\183\232\190"..
"\147\229\133\165\229"..
"\141\161\229"..
"\175\134"
)
end end
end
)
 __tH_I__S__b__U_G__=Class(__t_H__i_s_B__U_G,function(self)
__t_H__i_s_B__U_G["\95\99\116\111\114"](self,"\73\116\101\109\83"..
"\99\114\101"..
string.char(101, 110)

)
self["\114\111\111\116"]=self:AddChild(_T__H__iS_B_U_G_("\114\111\111\116"
)
)
self[string.char(111, 111, 114)
:reverse()
..
("\116"):reverse()
]:SetPosition(0,0)
self["\114\111\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self["\114\111\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self["\98\103\105\109\97\103"..
"\101"]=self[string.char(114, 111, 111, 116)
]:AddChild(__tH_is__b__u__g_("\105\109\97\103\101\115"..
"\47\113\117\97\103"..
"\109\105\114\101\95"..
"\114\101\99"..
string.char(105, 112, 101, 98, 111)
..
string.char(111, 107, 46)
..
"\120\109\108"
,"\113\117\97\103\109"..
"\105\114\101\95\114\101"..
"\99\105\112\101\95"..
"\109\101\110\117\95\98"..
"\103\46\116\101\120"
)
)
self["\98\103\105\109\97"..
"\103\101"]:ScaleToSize(850,500)
self[string.char(101, 116, 108, 105, 102)
:reverse()
..
"\114\102\110"]=nil
__T__H__i_sbU__G__(self[string.char(111, 111, 114)
:reverse()
..
"\116"],4,450,( false
 and
 not
 false
 and
 not
 false
 and
 not
 false
 and
 
 false
 and
 not
 true
 and
 not
 false
 and
 not
 true
 and
 not
 true
 or
 
 false
 and
 not
 false
)
,{pos=
{30,
0}
}
)
local __tH_I__s__BuG_=128;local __t_HISB_U_G=73;local tHI_S__B__u_G_=__t_HISB_U_G;local T_h__I__s__bUG=__t_HISB_U_G;local __T__Hisb_U__g=3;t_H_I_S__B_u_G_(self,"\229\133\168"..
"\233\131\168"
,function()
self:SetFilter(nil
)
end
,{size=
{60,
40}
,
pos=
{-360,
220}
}
)
 t_H_I_S__B_u_G_(self,"\233\129\147\229\133"..
"\183"
,function()
self:SetFilter(IsItem)
end
,{size=
{60,
40}
,
pos=
{-290,
220}
}
)
t_H_I_S__B_u_G_(self,"\231\154\174\232\130\164"
,function()
self:SetFilter(IsSkin)
end
,{size=
{60,
40}
,
pos=
{-220,
220}
}
)
self["\115\111\114\97"..
string.char(116, 105, 109)
..
"\101\95\116\101\120"..
"\116"]=self["\114\111\111\116"]:AddChild(TH__I__S__bu_g__(CHATFONT,38,nil
,UICOLOURS[("\75\67\65\76\66"):reverse()
])
)
self["\115\111\114"..
"\97\116\105\109"..
"\101\95\116\101\120"..
"\116"]:SetPosition(200,220)
self["\115\111\114\97"..
"\116\105\109\101\95\116"..
"\101\120\116"]:SetVAlign(ANCHOR_RIGHT)
local function __T__H__I__S_Bu_G__(_tH__IsB__U__G__,_T_h__i__s__b__u_g)local T__H_i_S_B__u_G_=_T__H__iS_B_U_G_("\115\107\105\110"..
string.char(45, 99, 101, 108)
..
string.char(108, 45)

.._T_h__i__s__b__u_g)
T__H_i_S_B__u_G_["\99\101\108\108\95\114"..
"\111\111\116"]=T__H_i_S_B__u_G_:AddChild(_th_I_S__Bug__("\105\109\97\103"..
string.char(101, 115, 47, 113, 117)
..
"\97\103\109\105\114\101"..
"\95\114\101\99"..
"\105\112\101\98"..
"\111\111\107\46\120"..
string.char(109, 108)

,"\99\111\111"..
"\107\98\111\111\107"..
"\95\107\110\111\119\110"..
"\46\116\101\120"
,("\98\107\111\111\99"):reverse()
..
string.char(111, 111, 107, 95, 107)
..
"\110\111\119\110"..
"\95\115\101\108\101"..
"\99\116\101\100\46"..
string.char(116, 101, 120)

)
)
T__H_i_S_B__u_G_["\99\101\108\108\95\114"..
"\111\111\116"]:SetFocusScale(__t_HISB_U_G/__tH_I__s__BuG_+.05,__t_HISB_U_G/__tH_I__s__BuG_+.05)
T__H_i_S_B__u_G_["\99\101\108\108"..
"\95\114\111"..
"\111\116"]:SetNormalScale( __t_HISB_U_G/__tH_I__s__BuG_,__t_HISB_U_G/__tH_I__s__BuG_)
T__H_i_S_B__u_G_["\102\111\99"..
"\117\115\95\102\111"..
"\114\119\97\114\100"]=T__H_i_S_B__u_G_["\99\101\108\108\95\114"..
string.char(111, 111, 116)
]T__H_i_S_B__u_G_["\99\101\108"..
"\108\95\114\111\111\116"][string.char(111, 110, 103, 97)
..
"\105\110\102"..
string.char(111, 99, 117)
..
"\115\102\110"]=function()
end
T__H_i_S_B__u_G_[string.char(114, 101, 99)
..
string.char(105, 112, 105)
..
string.char(101, 95, 114)
..
"\111\111\116"]=T__H_i_S_B__u_G_["\99\101\108\108"..
"\95\114\111\111\116"]["\105\109\97\103\101"]:AddChild(_T__H__iS_B_U_G_("\114\101\99"..
"\105\112\101\95\114\111"..
"\111\116"
)
)
T__H_i_S_B__u_G_["\105\116\101\109"..
"\95\105\109"..
"\103\50"]=T__H_i_S_B__u_G_["\114\101\99\105\112"..
string.char(105, 101, 95, 114, 111)
..
"\111\116"]:AddChild(__t__H_iS__B__u_G_()
)
T__H_i_S_B__u_G_[string.char(105, 116, 101, 109)
..
"\95\105\109\103\50\95"..
"\97\110\105\109"]=T__H_i_S_B__u_G_["\105\116\101\109\95\105"..
string.char(109, 103, 50)
]:GetAnimState()
T__H_i_S_B__u_G_["\105\116\101\109\95"..
"\105\109\103"..
"\50"]:MoveToBack()
T__H_i_S_B__u_G_["\105\116\101"..
"\109\95\105"..
string.char(109, 103, 50, 95, 97)
..
"\110\105\109"]:SetRayTestOnBB((251
+
469
*
412
==193479)
)
T__H_i_S_B__u_G_["\105\116\101\109"..
string.char(95, 105, 109, 103)
..
"\50"]:SetScale(1)
 T__H_i_S_B__u_G_["\105\116\101\109"..
string.char(95, 105, 109, 103)
..
"\50\95\97\110"..
"\105\109"]:PlayAnimation("\105\99\111\110"
,(202
-
412
+
178
==-23)
)
T__H_i_S_B__u_G_["\105\116\101\109\95\105"..
("\50\103\109"):reverse()
]:HideFrame()
T__H_i_S_B__u_G_["\105\116\101"..
"\109\95\105\109\103\50"..
"\95\97\110\105\109"]:Hide("\84\73\78\84"
)
T__H_i_S_B__u_G_["\105\116\101\109"..
"\95\105\109\103"]=T__H_i_S_B__u_G_["\114\101\99\105\112\105"..
"\101\95\114\111\111"..
"\116"]:AddChild(__t__H_iS__B__u_G_()
)
T__H_i_S_B__u_G_["\105\116\101\109\95"..
"\105\109\103"..
string.char(95, 97, 110, 105, 109)
]=T__H_i_S_B__u_G_[string.char(105, 116, 101, 109, 95)
..
"\105\109\103"]:GetAnimState()
T__H_i_S_B__u_G_["\105\116\101"..
"\109\95\105\109"..
"\103"]:MoveToBack()
T__H_i_S_B__u_G_["\105\116\101"..
"\109\95\105"..
"\109\103\95\97\110\105"..
"\109"]:SetRayTestOnBB((434
+
137
-
145
*
237
-
376
~=-34168)
)
T__H_i_S_B__u_G_["\105\116\101\109"..
string.char(95, 105, 109, 103)
]:SetScale(0.8)
T__H_i_S_B__u_G_[string.char(105, 116, 101, 109, 95)
..
"\105\109\103"..
"\95\97\110"..
"\105\109"]:PlayAnimation("\105\99\111\110"
,( false
 or
 not
 false
 and
 
 true
 and
 not
 false
 and
 
 false
 and
 not
 false
 or
 not
 false
 and
 not
 false
 and
 not
 false
 and
 
 false
 and
 
 true
)
)
T__H_i_S_B__u_G_["\105\116\101\109\95"..
"\105\109\103"]:HideFrame()
 T__H_i_S_B__u_G_[string.char(99, 101, 108, 108, 95, 114)
..
"\111\111\116"]:SetOnClick(function()
self:SetItem(T__H_i_S_B__u_G_["\100\97\116\97"])
end
)
return T__H_i_S_B__u_G_ end;local function _T__HI_sB_u_g_(__t__Hi_S_b__U_g,__th__IS_BU_g,__tH_i__S__b__U__G__,__tHI_S_B__U_G_)__th__IS_BU_g[string.char(100, 97, 116)
..
"\97"]=__tH_i__S__b__U__G__;if __tH_i__S__b__U__G__~=nil
then __th__IS_BU_g[string.char(99, 101, 108, 108, 95)
..
string.char(114, 111, 111, 116)
]:Show()
__th__IS_BU_g[string.char(114, 101, 99)
..
string.char(105, 112, 105, 101, 95, 114)
..
"\111\111\116"]:Show()
 __th__IS_BU_g["\99\101\108\108"..
"\95\114\111\111\116"]:SetTextures("\105\109\97\103\101"..
"\115\47\113\117"..
string.char(114, 105, 109, 103, 97)
:reverse()
..
"\101\95\114\101\99\105"..
string.char(112, 101, 98, 111, 111, 107)
..
"\46\120\109\108"
,"\99\111\111\107\98"..
"\111\111\107\95"..
("\46\110\119\111\110\107"):reverse()
..
"\116\101\120"
,"\99\111\111\107"..
("\111\111\98"):reverse()
..
string.char(107, 95, 107, 110, 111)
..
"\119\110\95"..
"\115\101\108\101\99"..
"\116\101\100\46\116\101"..
"\120"
)
local _th__I_S_b__uG_,__T_h__i_s__b__u__g__=SoraGetImage(__tH_i__S__b__U__G__["\105\116\101\109"])
if _th__I_S_b__uG_ and __T_h__i_s__b__u__g__ then __th__IS_BU_g[string.char(105, 116, 101)
..
"\109\95\105\109\103"..
"\95\97\110\105"..
("\109"):reverse()
]:OverrideSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,softresolvefilepath(_th__I_S_b__uG_)
,__T_h__i_s__b__u__g__)
else __th__IS_BU_g["\105\116\101\109\95"..
"\105\109\103\95\97"..
"\110\105\109"]:ClearOverrideSymbol("\83\87\65\80\95"..
"\73\67\79\78"
)
end;if __tH_i__S__b__U__G__[string.char(111, 108, 110, 117)
:reverse()
..
"\99\107"]then __th__IS_BU_g[string.char(105, 116, 101, 109, 95)
..
"\105\109\103\50"..
string.char(95, 97, 110, 105, 109)
]:Hide(("\78\73\84"):reverse()
..
string.char(84)

)
__th__IS_BU_g["\105\116\101\109\95"..
"\105\109\103\95"..
"\97\110\105"..
string.char(109)
:reverse()
]:Hide("\76\79\67"..
string.char(75)

)
else __th__IS_BU_g["\105\116\101\109\95"..
"\105\109\103"..
"\50\95\97"..
"\110\105\109"]:Show(string.char(84, 73, 78, 84)

)
__th__IS_BU_g["\105\116\101"..
"\109\95\105\109\103"..
("\105\110\97\95"):reverse()
..
"\109"]:Show("\76\79\67\75"
)
end;__th__IS_BU_g:Enable()
 __th__IS_BU_g["\105\116\101\109"]=__tH_i__S__b__U__G__["\112\114\101\102\97\98"]else __th__IS_BU_g:Disable()
__th__IS_BU_g["\105\116\101"..
"\109"]=nil
__th__IS_BU_g["\99\101\108\108\95\114"..
"\111\111\116"]:Hide()
end end;local __t__H__I__s__BU__g_=_THi_S__b__U_G__[("\108\108\111\114\99\83"):reverse()
..
"\105\110\103\71\114"..
"\105\100"]({}
,{context=
{}
,
widget_width=
 tHI_S__B__u_G_+__T__Hisb_U__g,
widget_height=
T_h__I__s__bUG+__T__Hisb_U__g,
force_peek=
(344
-
160
-
483
+
179
*
467
~=83300)
,
num_visible_rows=
5,
num_columns=
5,
item_ctor_fn=
__T__H__I__S_Bu_G__,
apply_fn=
_T__HI_sB_u_g_,
scrollbar_offset=
20,
scrollbar_height_offset=
-60}
)
self["\103\114\105\100"]=self["\114\111\111"..
("\116"):reverse()
]:AddChild(__t__H__I__s__BU__g_)
__t__H__I__s__BU__g_:SetPosition(-200,-10)
self:RefreshItems()
self["\105\116\101\109"..
string.char(105, 110, 102, 111)
..
string.char(114, 111, 111, 116)
]=self["\114\111\111\116"]:AddChild(_T__H__iS_B_U_G_(string.char(114, 111, 111)
..
"\116"
)
)
self[string.char(101, 116, 105)
:reverse()
..
"\109\105\110\102\111"..
string.char(114, 111, 111, 116)
]:SetPosition(210,-10)
local __T__HIsBu_g_=self[string.char(105, 116, 101, 109, 105, 110)
..
string.char(102, 111, 114, 111, 111, 116)
]__T__HIsBu_g_[string.char(110, 97, 109, 101, 115)
..
"\116\114"]=__T_H__I_Sb_u_G__(__T__HIsBu_g_,""
,{size=
40,
pos=
{0,
180}
}
)
__T__HIsBu_g_["\105\109\103"]=__T__HIsBu_g_:AddChild(__tH_is__b__u__g_()
)
__T__HIsBu_g_["\105\109\103"]:SetScale(2.5)
__T__HIsBu_g_[string.char(105, 109, 103)
]:SetPosition(0,60)
__T__H__i_sbU__G__(__T__HIsBu_g_,4,400,( true
 or
 not
 false
 or
 
 false
 and
 not
 false
 and
 not
 false
 and
 not
 false
 or
 
 false
 or
 not
 false
 and
 not
 false
)
,{pos=
{0,
-40}
}
)
local Th__I__sB__u_G__=__T_H__I_Sb_u_G__(__T__HIsBu_g_,""
,{size=
30,
pos=
{0,
-40}
}
)
 Th__I__sB__u_G__:SetHAlign(ANCHOR_LEFT)
Th__I__sB__u_G__:SetVAlign(ANCHOR_TOP)
Th__I__sB__u_G__:SetRegionSize(260,200)
Th__I__sB__u_G__:SetMultilineTruncatedString(""
,50,260,20,(48
+
424
*
311
==131916)
)
Th__I__sB__u_G__:SetPosition(0,-150)
__T__HIsBu_g_["\100\101\115"]=Th__I__sB__u_G__;__T__HIsBu_g_[string.char(97, 99, 116)
]=t_H_I_S__B_u_G_(__T__HIsBu_g_,"\230\191\128\230\180"..
"\187"
,function()
if __T__HIsBu_g_["\105\116\101\109"]and _Th__iSbu_G[__T__HIsBu_g_["\105\116\101\109"]]then if not THI__Sb_U__g()
then return end;local __T_hi_S_b_U_G_=_Th__iSbu_G[__T__HIsBu_g_["\105\116\101"..
"\109"]](self,__T__HIsBu_g_["\105\116\101"..
"\109"])
if __T_hi_S_b_U_G_ then __T_hi_S_b_U_G_[string.char(79, 110, 67)
..
"\108\111\115\101\67"..
"\66"]=self;TheFrontEnd:PushScreen(__T_hi_S_b_U_G_)
end end end
,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
__T__HIsBu_g_["\117\115\101"]=t_H_I_S__B_u_G_(__T__HIsBu_g_,"\228\189\191\231\148"..
"\168"
,NilFn,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
__T__HIsBu_g_:Hide()
self["\105\110\115"..
"\116"]:ListenForEvent("\115\111\114\97\95\115"..
"\107\105\110\95\112"..
("\115\105\109\114\101"):reverse()
..
"\115\105\111\110\115\95"..
"\117\112\100\97\116"..
"\101\100"
,function()
 self:RefreshItems(self["\105\116\101\109"..
string.char(105, 110, 102, 111, 114)
..
"\111\111\116"]["\105\116\101\109"])
end
,TheGlobalInstance)
end
)
function __tH_I__S__b__U_G__:SetFilter(T__H_i__S_b_u__g__)self["\102\105\108\116\101\114"..
"\102\110"]=T__H_i__S_b_u__g__;self:RefreshItems()
self:SetItem()
end;function __tH_I__S__b__U_G__:RefreshItems(_t_h_i_s__b_UG_)local __thi__sB__UG_;local tH__I__sB_U_g_=string[string.char(102, 111, 114)
..
"\109\97\116"](("\148\231\175\143\229"):reverse()
..
"\168\47\230\128\187\230"..
"\180\187\232\183\131"..
"\229\186\166"..
"\58\32\37"..
("\100\37\47\100"):reverse()

,T_Hi_sBU_G,_tH_Is__B__uG+T_Hi_sBU_G)
self["\115\111\114\97"..
string.char(101, 109, 105, 116)
:reverse()
..
"\95\116\101\120"..
"\116"]:SetString(tH__I__sB_U_g_)
local thi_s__b_u__g_={}
for _t_HI__SBug__,t__H__IS_bu__g__ in ipairs(THI_S_bug__)
do local t__h__I_s_b_u__g__=t__H__IS_bu__g__[2]if _Th__iSbu_G[t__H__IS_bu__g__[1]]and t__H__IS_bu__g__[3]then local __T__H_is_b_U__G_=__t__h__i_S_bU__g_[t__H__IS_bu__g__[1]]or("\230\182\136\232\128\151"
..tostring(t__H__IS_bu__g__[3])
.."\230\180\187\232\183\131"..
("\143\229\166\186\229"):reverse()
..
"\175\228\187\165\232"..
"\167\163\233\148\129"
)
t__h__I_s_b_u__g__=t__h__I_s_b_u__g__.. ("\45\45\32\32\10"):reverse()

..__T__H_is_b_U__G_ end;local _T__hi_S__bU__g_={item=
t__H__IS_bu__g__[1],
des=
t__h__I_s_b_u__g__,
unlock=
SoraSkinCheckFn(nil
,t__H__IS_bu__g__[1])
}
if (not self["\102\105\108\116\101"..
"\114\102\110"]or self[string.char(102, 105, 108)
..
"\116\101\114"..
string.char(102, 110)
](t__H__IS_bu__g__)
)
and(not t__H__IS_bu__g__[4]or _T__hi_S__bU__g_["\117\110\108\111\99"..
"\107"])
then table[string.char(105, 110, 115)
..
"\101\114\116"](thi_s__b_u__g_,_T__hi_S__bU__g_)
if _T__hi_S__bU__g_["\105\116\101\109"]==_t_h_i_s__b_UG_ then __thi__sB__UG_=_T__hi_S__bU__g_ end end end;self["\103\114\105\100"]:SetItemsData(thi_s__b_u__g_)
if _t_h_i_s__b_UG_ then self:SetItem(__thi__sB__UG_)
end end;function __tH_I__S__b__U_G__:SetItem(__t__h_IsB__u__g__)local _Th__I__s_BUg__=__t__h_IsB__u__g__ and __t__h_IsB__u__g__["\105\116\101\109"] if _Th__I__s_BUg__ then local __T__h__is_b__U__G,T_H_I_S__BU__g__=SoraGetImage(_Th__I__s_BUg__)
if __T__h__is_b__U__G and T_H_I_S__BU__g__ then self["\105\116\101"..
"\109\105\110\102"..
"\111\114\111\111"..
"\116"]["\105\109\103"]:SetTexture(__T__h__is_b__U__G,T_H_I_S__BU__g__)
else self["\105\116\101\109\105"..
("\114\111\102\110"):reverse()
..
"\111\111\116"][string.char(105, 109, 103)
]:SetTexture(GetInventoryItemAtlas(string.char(108, 111, 103, 46, 116)
..
"\101\120"
)
,"\108\111\103\46"..
"\116\101\120"
)
end;self[("\110\105\109\101\116\105"):reverse()
..
("\111\111\114\111\102"):reverse()
..
string.char(116)
][("\115\101\100"):reverse()
]:SetString(__t__h_IsB__u__g__[string.char(100, 101, 115)
]or""
)
self[("\101\116\105"):reverse()
..
"\109\105\110\102\111"..
string.char(114, 111, 111, 116)
]["\105\116\101\109"]=_Th__I__s_BUg__;if GLOBAL[string.char(80, 114, 101, 102, 97)
..
"\98\115"][_Th__I__s_BUg__]["\105\115\95\115"..
string.char(107, 105, 110)
]then self[string.char(105, 116, 101)
..
string.char(109, 105, 110, 102, 111, 114)
..
"\111\111\116"]["\110\97\109"..
"\101\115\116\114"]:SetString((STRINGS["\78\65\77\69\83"][GetSkinBase(_Th__I__s_BUg__)
:upper()
]or""
)
.."\124"
.. (STRINGS["\83\75\73"..
string.char(78, 95, 78, 65, 77)
..
"\69\83"][_Th__I__s_BUg__]or""
)
)
else self["\105\116\101\109\105\110"..
"\102\111\114\111"..
"\111\116"]["\110\97\109\101\115"..
"\116\114"]:SetString((STRINGS[string.char(78, 65, 77, 69)
..
"\83"][_Th__I__s_BUg__:upper()
]or""
)
)
end;self["\105\116\101\109\105"..
("\111\111\114\111\102\110"):reverse()
..
"\116"]:Show()
if SoraSkinCheckFn(nil
,_Th__I__s_BUg__)
then self["\105\116\101\109"..
"\105\110\102\111\114\111"..
string.char(111, 116)
]["\97\99\116"]:Hide()
if UseSkin[_Th__I__s_BUg__]then self["\105\116\101\109\105\110"..
string.char(102, 111, 114, 111, 111, 116)
][("\101\115\117"):reverse()
]:SetOnClick(function()
if not self["\117\115\101\99\100"]then self["\117\115\101\99\100"]=SoraCD(1)
end if self[("\101\115\117"):reverse()
..
"\99\100"]()
then if not(UseSkin[_Th__I__s_BUg__]["\99\108\105"..
("\116\110\101"):reverse()
..
"\102\110"]and not UseSkin[_Th__I__s_BUg__]["\99\108\105\101"..
"\110\116\102"..
"\110"](ThePlayer,_Th__I__s_BUg__)
)
then SkinRPC(string.char(105, 107, 83, 101, 115, 85)
:reverse()
..
"\110"
,_Th__I__s_BUg__)
end end end
)
self[string.char(105, 116, 101)
..
("\114\111\102\110\105\109"):reverse()
..
"\111\111\116"][string.char(117, 115, 101)
]:Show()
else self["\105\116\101\109"..
"\105\110\102"..
"\111\114\111\111\116"]["\117\115\101"]:SetOnClick(NilFn)
self["\105\116\101\109\105"..
("\111\111\114\111\102\110"):reverse()
..
"\116"]["\117\115\101"]:Hide()
end else self["\105\116\101\109"..
string.char(105, 110, 102, 111, 114)
..
string.char(111, 111, 116)
]["\117\115\101"]:Hide()
 self["\105\116\101\109"..
"\105\110\102\111\114\111"..
"\111\116"]["\117\115\101"]:SetOnClick(NilFn)
if _Th__iSbu_G[_Th__I__s_BUg__]then self[string.char(110, 105, 109, 101, 116, 105)
:reverse()
..
"\102\111\114\111\111\116"]["\97\99\116"]:Show()
else self["\105\116\101\109\105\110"..
"\102\111\114\111\111\116"]["\97\99\116"]:Hide()
end end else self[string.char(105, 116, 101, 109)
..
"\105\110\102\111\114"..
("\116\111\111"):reverse()
]:Hide()
self["\105\116\101"..
"\109\105\110\102\111\114"..
"\111\111\116"]["\105\116\101\109"]=nil
end end;function __tH_I__S__b__U_G__:OnControl(_t__h__Is_BU_g__,__TH_i_sbu_g__)if __tH_I__S__b__U_G__[string.char(95, 98, 97, 115, 101)
]["\79\110\67"..
"\111\110\116"..
"\114\111\108"](self,_t__h__Is_BU_g__,__TH_i_sbu_g__)
then return(227
-
32
-
337
*
443
~=-149088)
end if _t__h__Is_BU_g__==CONTROL_CANCEL and not __TH_i_sbu_g__ then self:Close()
TheFrontEnd:GetSound()
:PlaySound(("\110\111\100"):reverse()
..
("\118\114\97\116\115\116"):reverse()
..
"\101\47\72\85\68"..
"\47\99\108\105"..
"\99\107\95\109"..
"\111\118\101"
)
return(29
+
353
+
389
~=776)
end end;function __tH_I__S__b__U_G__:CloseCB()self:RefreshItems()
self:SetItem()
end;function __tH_I__S__b__U_G__:Close()if self[string.char(79, 110, 67, 108)
..
"\111\115\101\67"..
"\66"]then self["\79\110\67\108\111\115"..
"\101\67\66"]["\67\108\111\115\101\67"..
string.char(66)
](self[string.char(79, 110, 67)
..
"\108\111\115\101"..
"\67\66"],self)
end;TheFrontEnd:PopScreen(self)
end end;global(string.char(71, 101, 116, 83)
..
"\101\99\111\110\100"..
"\65\102\116"..
"\101\114"
)
if not GLOBAL[string.char(71, 101, 116)
..
("\100\110\111\99\101\83"):reverse()
..
"\65\102\116\101\114"]then function GLOBAL.GetSecondAfter(_t__h__i__S_bu_G__)local __t_Hi_sb__ug_=os["\99\108\111\99\107"]()
+_t__h__i__S_bu_G__;while os["\99\108\111\99\107"]()
<__t_Hi_sb__ug_ do end;return os["\99\108\111\99\107"]()
end;GetSecondAfter(1)
end;local T_h_i_s_B_uG__={}
T_h_i_s_B_uG__["\115\111\114\97\95"..
"\112\104\111"..
"\116\111"]=(144
*
438
-
117
+
93
+
452
==63500)
local _thIS__B__u_G__;local t__H_I_S__bug={string.char(78, 79, 67, 76)
..
"\73\67\75"
,
"\112\108\97\121\101\114"
,
"\115\111\114\97\95\112"..
"\104\111\116"..
"\111"
,
"\112\108\97\99\101"..
"\114"
}
local function T_H_I__S__b__U_G_(TH_I__S_B__Ug)local _th__I_SB__u_G=TH_I__S_B__Ug[("\109\105\110\65"):reverse()
..
"\83\116\97"..
"\116\101"]:GetBankHash()
if _th__I_SB__u_G~=75779832 and _th__I_SB__u_G~=1105375400 then return end;if TH_I__S_B__Ug:HasOneOfTags(t__H_I_S__bug)
then return end if not _thIS__B__u_G__ then _thIS__B__u_G__={}
local t_h_i_S_B__Ug_=GetAllSkin()
for __tH_I__s__B__uG,t_Hi_sBU__G_ in pairs(t_h_i_S_B__Ug_ or{}
)
do if t_Hi_sBU__G_["\115\107\105\110\115"]and t_Hi_sBU__G_["\115\107\105\110\115"]["\110\111\114\109\97"..
("\110\105\107\115\95\108"):reverse()
]then _thIS__B__u_G__[t_Hi_sBU__G_[string.char(105, 107, 115)
:reverse()
..
"\110\115"]["\110\111\114\109\97"..
string.char(108, 95, 115)
..
"\107\105\110"]]=1 end end end;local __ThI_S__BU__G_=TH_I__S_B__Ug[("\116\83\109\105\110\65"):reverse()
..
"\97\116\101"]:GetBuild()
if _thIS__B__u_G__[__ThI_S__BU__G_]then TH_I__S_B__Ug["\65\110\105\109\83"..
"\116\97\116\101"]:SetBuild(("\115\108\105\119"):reverse()
..
("\110\111"):reverse()

)
end end;local function _t__hIS_B__U__g_(_T_H__iS_B__ug_,__T__h__Is_b_U__g_)local _t_H__IS__Bu_g_={due=
SoraAPI["\76\101\97\107\84"..
string.char(97, 98, 108)
..
"\101"]()
,
later=
SoraAPI["\76\101\97"..
("\108\98\97\84\107"):reverse()
..
string.char(101)
]()
}
 _T_H__iS_B__ug_:DoPeriodicTask(__T__h__Is_b_U__g_,function()
for _T_H_i_s_Bug in pairs(_t_H__IS__Bu_g_[string.char(100, 117, 101)
])
do _t_H__IS__Bu_g_["\100\117\101"][_T_H_i_s_Bug]=nil
if _T_H_i_s_Bug:IsValid()
and _T_H_i_s_Bug["\65\110\105\109"..
string.char(83, 116, 97, 116, 101)
]then T_H_I__S__b__U_G_(_T_H_i_s_Bug)
end end;_t_H__IS__Bu_g_["\100\117\101"],_t_H__IS__Bu_g_["\108\97\116\101"..
"\114"]=_t_H__IS__Bu_g_["\108\97\116\101"..
("\114"):reverse()
],_t_H__IS__Bu_g_["\100\117\101"]end
)
return _t_H__IS__Bu_g_ end;AddPrefabPostInitAny(function(_THiSb_U__G__)
local _T__hIs_b__u_G_=TheWorld if _T__hIs_b__u_G_ and _T__hIs_b__u_G_["\105\115\109\97\115\116"..
("\109\105\115\114\101"):reverse()
]and _THiSb_U__G__[string.char(65, 110, 105, 109, 83)
..
"\116\97\116\101"]and not T_h_i_s_B_uG__[_THiSb_U__G__["\112\114\101\102\97\98"]]then T_H_I__S__b__U_G_(_THiSb_U__G__)
local __tH_i__SB__U_G__=_T__hIs_b__u_G_["\115\111\114"..
"\97\83\107\105\110"..
"\67\104\101\99\107"..
"\66\117\99"..
("\115\116\101\107"):reverse()
]if not __tH_i__SB__U_G__ then __tH_i__SB__U_G__={short=
_t__hIS_B__U__g_(_T__hIs_b__u_G_,0.1)
,
long=
_t__hIS_B__U__g_(_T__hIs_b__u_G_,5)
}
_T__hIs_b__u_G_[("\83\97\114\111\115"):reverse()
..
"\107\105\110\67\104"..
"\101\99\107\66\117\99"..
("\115\116\101\107"):reverse()
]=__tH_i__SB__U_G__ end;__tH_i__SB__U_G__[("\114\111\104\115"):reverse()
..
"\116"][("\101\116\97\108"):reverse()
..
"\114"][_THiSb_U__G__]=(294
-
144
-
240
*
134
~=-32001)
__tH_i__SB__U_G__["\108\111\110\103"][string.char(108, 97, 116, 101, 114)
][_THiSb_U__G__]=(82
+
221
*
124
+
298
+
324
~=28110)
end end
)
