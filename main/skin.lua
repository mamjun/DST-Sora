-- source: D:\Dev\Lua\Deving\src\skin_src.lua | md5: a7c71efd5c6867599acb2ae9fdaccde0 | source_mtime_utc: 2026-11-14T14:00:36Z
--[[
授权级别:不授权
Copyright 2025 [FL]。
该文件仅限我自己使用 谢绝授权
]]-- 请勿破解本文件
local __TH_I_s__B_U__G_={}
local T__h_I_S__b_u__G_={}
local _T_h_i__sb__uG_={}
local _t_H_iSB_Ug={}
local __T_h__I_sb_UG_=SoraAPI[string.char(106, 115, 111)
..
"\110"]local _t_HI__sB__u__G={}
local T_his_b_U_g_={}
local _T__H__IS_b__u__g__=TheNet:GetUserID()
local _t_HI__Sb_U_G__=""
local __THI_s_b_uG__;local _th_isb_U_G_={}
local function _T__his_B_u__g(_t_h__I__s__bUg__)return string["\115\117\98"](_t_h__I__s__bUg__,-5)
=="\95\110\111"..
"\110\101"
end;local __T_hi_s__B__uG__=(274
-
192
*
165
-
450
==-31848)
function SoraSkinCheckFn(__th_iSb_u__G_,__t__hi__S__B__U__g)if __th_iSb_u__G_ and not __t__hi__S__B__U__g then __t__hi__S__B__U__g=__th_iSb_u__G_ end;__t__hi__S__B__U__g=GetSkinMap(__t__hi__S__B__U__g)
return _T__his_B_u__g(__t__hi__S__B__U__g)
or(T__h_I_S__b_u__G_[__t__hi__S__B__U__g]or _t_H_iSB_Ug[__t__hi__S__B__U__g])
and(198
*
434
-
81
==85851)
or(326
*
236
-
228
-
3
~=76705)
end;function SoraSkinCheckClientFn(__t_h__I_S__b_ug__,_tHi_S__B__u_G__,__T_hI__S_bUg__)local t__H__IsBU_G__=__T_hI__S_bUg__;__T_hI__S_bUg__=GetSkinMap(__T_hI__S_bUg__)
if _tHi_S__B__u_G__ and __T_hI__S_bUg__ then local _t__h__i_s_B__U_G__=GetSkin(__T_hI__S_bUg__)
if not _t__h__i_s_B__U_G__ and not IsItem({__T_hI__S_bUg__}
)
then return(196
-
366
+
475
==313)
end;local T_Hi_S__bu__g;if t__H__IsBU_G__~=__T_hI__S_bUg__ then T_Hi_S__bu__g=GetSkin(t__H__IsBU_G__)
end;if _t__h__i_s_B__U_G__ and(T_Hi_S__bu__g or _t__h__i_s_B__U_G__)
["\105\115\99\104\97"..
"\114\97\99\116"..
"\101\114\115"..
"\107\105\110\115"]then if _th_isb_U_G_[_tHi_S__B__u_G__]then return(14
*
330
-
240
*
440
~=-100975)
end;if not _t_HI__sB__u__G[_tHi_S__B__u_G__]then return(198
*
334
*
120
+
477
~=7936322)
end end;if _t_HI__sB__u__G[_tHi_S__B__u_G__]then if __TH_I_s__B_U__G_[_tHi_S__B__u_G__]and __TH_I_s__B_U__G_[_tHi_S__B__u_G__][__T_hI__S_bUg__]then return(231
-
486
-
74
~=-322)
end;if _T_h_i__sb__uG_[_tHi_S__B__u_G__]and _T_h_i__sb__uG_[_tHi_S__B__u_G__][__T_hI__S_bUg__]then return(164
+
355
*
390
==138614)
end end;return(216
-
272
-
227
+
84
+
458
~=259)
end;return _T__his_B_u__g(__T_hI__S_bUg__)
or(100
-
35
*
155
-
397
+
432
==-5286)
end;UseSkin={}
function IsItem(__t_H__I__S_b_u__g_)local tH_Is_B_U__G_=__t_H__I__S_b_u__g_[1]if UseSkin[tH_Is_B_U__G_]then return( true
 and
 
 false
 and
 
 true
 or
 not
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
 
 false
 and
 
 false
)
else return(352
+
49
*
72
~=3880)
end end;function IsSkin(__t_HI__s_B__u__g_)return not IsItem(__t_HI__s_B__u__g_)
end;function RegUseSkinFN(_t__hi_s_B_u_g,_t__h_iSbU__g__,__t_hiS__b__U_g_) UseSkin[_t__hi_s_B_u_g]={serverfn=
_t__h_iSbU__g__,
clientfn=
__t_hiS__b__U_g_}
end;local T__H_i__S_BU__g=string.char(83, 111, 114, 97, 83, 107)
..
"\105\110\67\97\99"..
("\101\104"):reverse()

local _T_H_Isb__uG__=T__H_i__S_BU__g.."\95\115\101\114"..
"\118\101\114"
if TheNet:GetIsServer()
then TheSim:GetPersistentString(_T_H_Isb__uG__,function(__t_HIS__B_U__g,
_T__h__i_s_B_U_G)
if __t_HIS__B_U__g then local _tHI__Sb__U__G,__t_H__I__S_b__u__G__=pcall(__T_h__I_sb_UG_["\100\101\99"..
"\111\100\101"],_T__h__i_s_B_U_G)
if _tHI__Sb__U__G and __t_H__I__S_b__u__G__[string.char(116, 109, 112)
]and __t_H__I__S_b__u__G__[string.char(111, 119, 110, 101, 114)
]then for T__H_is_BU__g,_T_HI__sB_u__g in pairs(__t_H__I__S_b__u__G__["\111\119\110\101"..
("\114"):reverse()
])
do if type(_T_HI__sB_u__g)
=="\116\97\98\108"..
"\101"
then __TH_I_s__B_U__G_[T__H_is_BU__g]=_T_HI__sB_u__g end end;for tH__I_sBug__,__T_hI__s__bu__G__ in pairs(__t_H__I__S_b__u__G__[("\112\109\116"):reverse()
])
do if type(__T_hI__s__bu__G__)
=="\116\97\98\108"..
"\101"
then _T_h_i__sb__uG_[tH__I_sBug__]=__T_hI__s__bu__G__ end end end end end
)
end;if not TheNet:IsDedicated()
then TheSim:GetPersistentString(T__H_i__S_BU__g,function(__T__Hi__S_B_u_g__,
_TH_i_sB__u_G__)
if __T__Hi__S_B_u_g__ then local __T__H__i__sb_Ug,_t__h__IS_B_Ug_=pcall(__T_h__I_sb_UG_["\100\101\99\111\100\101"],_TH_i_sB__u_G__)
if __T__H__i__sb_Ug and _t__h__IS_B_Ug_["\116\109\112"]and _t__h__IS_B_Ug_["\111\119\110"..
"\101\114"]then for __T_H_i_SBU_g__,T__hiS_B_u__G in pairs(_t__h__IS_B_Ug_[("\101\110\119\111"):reverse()
..
"\114"])
do if type(__T_H_i_SBU_g__)
==string.char(115, 116, 114, 105)
..
"\110\103"
and T__hiS_B_u__G==1 then T__h_I_S__b_u__G_[__T_H_i_SBU_g__]=T__hiS_B_u__G end end;for _t_H_IsBu_G_,_T_his_bU_G__ in pairs(_t__h__IS_B_Ug_[string.char(116, 109, 112)
])
do if type(_t_H_IsBu_G_)
==string.char(115, 116, 114, 105, 110, 103)

and _T_his_bU_G__==1 then _t_H_iSB_Ug[_t_H_IsBu_G_]=_T_his_bU_G__ end end end end end
)
end;function SaveSkinCache()if TheNet:GetIsServer()
then local _t__H__I__s_b_U_g,th_I_S_b__UG=pcall(__T_h__I_sb_UG_["\101\110\99\111"..
"\100\101"],{owner=
__TH_I_s__B_U__G_,
tmp=
_T_h_i__sb__uG_}
)
if _t__H__I__s_b_U_g then TheSim:SetPersistentString(_T_H_Isb__uG__,th_I_S_b__UG,(227
+
382
+
119
-
109
~=622)
)
end end;local t_Hi_sbU__g_,_ThiS__B_u__g=pcall(__T_h__I_sb_UG_["\101\110\99"..
"\111\100\101"],{owner=
T__h_I_S__b_u__G_,
tmp=
_t_H_iSB_Ug}
)
if t_Hi_sbU__g_ then TheSim:SetPersistentString(T__H_i__S_BU__g,_ThiS__B_u__g,(186
+
152
+
483
+
386
==1207)
)
end end;local t__h_is_b__u__g_={sora_mysora=
1,
sora_mysora_r=
1,
sora_yhjd=
1,
sora_sby=
1}
RegUseSkinFN("\115\111\114"..
"\97\95\121\105"..
"\110\103\121\117"
,function(_tHi_Sb__U__g__,
_Th_i__s__b__U__g_)
if _tHi_Sb__U__g__ and _tHi_Sb__U__g__["\99\111\109\112"..
string.char(111, 110, 101, 110, 116)
..
string.char(115)
]["\115\111\114\97\105\116"..
string.char(101, 109, 99, 111, 110)
..
"\116\114\111\108"]then _tHi_Sb__U__g__["\99\111\109"..
"\112\111\110\101\110"..
string.char(116, 115)
]["\115\111\114\97\105"..
string.char(116, 101, 109, 99, 111, 110)
..
"\116\114\111\108"]:CreateItem(string.char(115, 111, 114)
..
"\97\95\121\105\110"..
string.char(103, 121, 117)

)
end end
)
 RegUseSkinFN("\115\111\114"..
"\97\95\100\105"..
("\117\121\101"):reverse()

,function(T__H_I_S_bU_G,
_THI__s__b_u_g_)
if T__H_I_S_bU_G and T__H_I_S_bU_G["\99\111\109"..
"\112\111\110\101\110"..
"\116\115"]["\115\111\114"..
"\97\105\116\101\109"..
string.char(99, 111, 110, 116)
..
"\114\111\108"]then T__H_I_S_bU_G["\99\111\109"..
"\112\111\110"..
"\101\110\116\115"][string.char(115, 111, 114)
..
"\97\105\116"..
string.char(101, 109, 99, 111, 110)
..
"\116\114\111\108"]:CreateItem("\115\111\114"..
"\97\95\100\105\101\121"..
("\117"):reverse()

)
end end
)
RegUseSkinFN("\115\111\114\97"..
"\95\113\105\121\117"
,function(TH__is_B_ug,
thI_sb__U__g_)
if TH__is_B_ug and TH__is_B_ug[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116\115"]["\115\111\114"..
string.char(97, 105, 116)
..
string.char(101, 109, 99)
..
"\111\110\116"..
"\114\111\108"]then TH__is_B_ug["\99\111\109\112"..
"\111\110\101\110\116\115"]["\115\111\114\97\105\116"..
"\101\109\99\111\110\116"..
"\114\111\108"]:CreateItem("\115\111\114"..
("\113\95\97"):reverse()
..
"\105\121\117"
)
end end
)
RegUseSkinFN(string.char(115, 111, 114, 97)
..
string.char(95, 108, 121, 106)

,function(t__hi__sBu__g,
tH_Is_B__u_G_)
 if t__hi__sBu__g and t__hi__sBu__g["\99\111\109\112\111"..
"\110\101\110"..
"\116\115"][string.char(115, 111, 114, 97, 105)
..
string.char(116, 101, 109, 99, 111, 110)
..
string.char(116, 114, 111)
..
("\108"):reverse()
]then t__hi__sBu__g["\99\111\109"..
"\112\111\110"..
"\101\110\116"..
string.char(115)
:reverse()
]["\115\111\114\97\105"..
"\116\101\109\99\111"..
"\110\116\114"..
"\111\108"]:CreateItem("\115\111\114\97"..
string.char(95, 108, 121, 106)

)
end end
)
 RegUseSkinFN("\115\111\114"..
"\97\95\108\97"..
string.char(110, 116, 101, 114, 110)

,function(_T__h_I_s_B_uG,
t__h_iSb__uG__)
if _T__h_I_s_B_uG and _T__h_I_s_B_uG["\99\111\109"..
"\112\111\110"..
string.char(101, 110, 116, 115)
]["\115\111\114\97\105"..
"\116\101\109\99\111\110"..
"\116\114\111\108"]then _T__h_I_s_B_uG["\99\111\109"..
"\112\111\110\101"..
"\110\116\115"][("\116\105\97\114\111\115"):reverse()
..
string.char(101, 109, 99, 111, 110)
..
string.char(116, 114, 111, 108)
]:CreateItem(("\97\114\111\115"):reverse()
..
"\95\108\97\110\116\101"..
"\114\110"
)
end end
)
RegUseSkinFN(("\108\95\97\114\111\115"):reverse()
..
"\97\110\116\101\114\110"..
"\95\121\104"
,function(__t_h_I__s__bUG_,
__TH__i_SB_u_G_)
if __t_h_I__s__bUG_ and __t_h_I__s__bUG_["\99\111\109\112\111\110"..
"\101\110\116"..
"\115"]["\115\111\114"..
string.char(97, 105, 116)
..
"\101\109\99\111\110"..
"\116\114\111\108"]then __t_h_I__s__bUG_["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114\97"..
"\105\116\101"..
"\109\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114\97\95"..
string.char(108, 97, 110)
..
string.char(116, 101, 114, 110)

,"\115\111\114\97"..
"\95\108\97\110\116"..
"\101\114\110\95"..
"\121\104"
)
end end
)
RegUseSkinFN("\115\111\114\97\95\114"..
string.char(105, 110, 103)

,function(th__is__B_u__G,
T_h__ISBu_G__)
if th__is__B_u__G and th__is__B_u__G["\99\111\109\112\111"..
"\110\101\110\116\115"]["\115\111\114"..
string.char(97, 105, 116, 101)
..
"\109\99\111\110"..
"\116\114\111\108"]then th__is__B_u__G["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114"..
"\97\105\116\101\109"..
string.char(99, 111, 110, 116)
..
"\114\111\108"]:CreateItem("\115\111\114\97\95\114"..
"\105\110\103"
)
end end
)
 local function th__I__sB__U__G_(_t__H__I__S__B__Ug_,_t__h__i_S_B__ug__,ThI__S_bU_G__)local __t__hi_S_B__U__g__={}
__t__hi_S_B__U__g__["\113\117\111\116\101"..
"\115"]="\230\149\162\229"..
"\138\168\230\136\145"..
"\229\176\177"..
string.char(230, 157, 128, 228, 186)
..
"\134\228\189\160\229\147"..
"\166"
__t__hi_S_B__U__g__["\114\97\114\105\116"..
"\121"]="\230\149\162\229\138\168"..
"\230\136\145\229"..
"\176\177\230"..
"\157\128\228\186"..
"\134\228\189\160\229"..
("\166\147"):reverse()

__t__hi_S_B__U__g__[string.char(114, 97, 114)
..
string.char(105, 116, 121)
..
"\99\111\114\108"..
"\111\114"]={255/255,
215/255,
0/255,
1}
__t__hi_S_B__U__g__["\114\97\114\105"..
"\116\121\111"..
"\114\100\101\114"]=100;__t__hi_S_B__U__g__["\114\101\108\101\97\115"..
"\101\95\103\114"..
string.char(111, 117, 112)
]=-1006;__t__hi_S_B__U__g__["\115\107\105\110"..
string.char(95, 116, 97, 103)
..
"\115"]={string.char(66, 65, 83, 69)

,
string.char(115, 111, 114)
..
"\97"
,
"\67\72\65\82\65"..
string.char(82, 69, 84, 67)
:reverse()

}
__t__hi_S_B__U__g__["\115\107\105\110\115"]={normal_skin=
_t__H__I__S__B__Ug_,
ghost_skin=
string.char(103, 104, 111, 115, 116, 95)
..
"\115\111\114\97\95"..
"\98\117\105\108\100"
}
__t__hi_S_B__U__g__[string.char(99, 104, 101, 99, 107, 102)
..
string.char(110)
]=SoraSkinCheckFn;__t__hi_S_B__U__g__["\99\104\101\99"..
string.char(107, 99, 108, 105, 101, 110)
..
"\116\102\110"]=SoraSkinCheckClientFn __t__hi_S_B__U__g__["\115\104\97"..
"\114\101\95\98\105\103"..
"\112\111\114\116"..
"\114\97\105\116\95"..
string.char(110, 97, 109)
..
"\101"]="\115\111\114\97"
__t__hi_S_B__U__g__["\70\114\97\109\101"..
"\83\121\109\98"..
string.char(111, 108)
]="\68\105\115\116\105"..
string.char(110, 103, 117)
..
"\105\115\104\101\100"
for Th_is__B_u__g__,_T__h_i__S__b_UG__ in pairs(_t__h__i_S_B__ug__)
do __t__hi_S_B__U__g__[Th_is__B_u__g__]=_T__h_i__S__b_UG__ end;if __t__hi_S_B__U__g__["\105\115\95\108\111"..
"\110\103\104\97\105\114"]then __t__hi_S_B__U__g__["\115\107\105"..
"\110\115"]["\103\104\111"..
"\115\116\95\115\107"..
"\105\110"]="\103\104\111\115\116\95"..
string.char(115, 111, 114, 97, 95)
..
string.char(114, 95, 98, 117, 105)
..
string.char(108, 100)

end;MakeCharacterSkin("\115\111\114"..
"\97"
,_t__H__I__S__B__Ug_,__t__hi_S_B__U__g__,(142
+
240
+
69
*
199
*
197
~=2705395)
)
if not ThI__S_bU_G__ then local _t_hIS_B__ug=shallowcopy(__t__hi_S_B__U__g__)
_t_hIS_B__ug["\114\97\114"..
"\105\116\121"]="\233\153\144\230\151"..
"\182\228\189\147"..
"\233\170\140"
_t_hIS_B__ug["\114\97\114\105\116\121"..
string.char(111, 114, 100, 101, 114)
]=80;_t_hIS_B__ug["\114\97\114"..
"\105\116\121\99\111"..
string.char(114, 108, 111, 114)
]={0.957,
0.769,
0.188,
1}
_t_hIS_B__ug["\70\114\97\109\101"..
"\83\121\109\98\111"..
"\108"]="\104\101\105\114\108"..
"\111\111\109"
_t_hIS_B__ug[("\101\109\97\110"):reverse()
]=_t__h__i_S_B__ug__["\110\97\109"..
"\101"]..string.char(40, 233, 153)
..
"\144\230\151\182\41"
SoraAPI[string.char(77, 97, 107)
..
"\101\67\104"..
"\97\114\97\99\116\101"..
"\114\83\107"..
string.char(105, 110)
]("\115\111\114\97"
,_t__H__I__S__B__Ug_.."\95\116\109\112"
,_t_hIS_B__ug,(223
-
290
-
212
*
258
+
471
==-54292)
)
end end;th__I__sB__U__G_(("\114\111\115"):reverse()
..
"\97\95\109\121\115\111"..
"\114\97"
,{name=
"\232\138\177\229\171"..
string.char(129)

,
des=
"\230\137\167\229\173"..
"\144\228\185\139\230"..
"\137\139\44\228\184"..
"\142\229\173"..
"\144\229\129\149\232\128"..
"\129"
}
)
th__I__sB__U__G_("\115\111\114\97\95\109"..
"\121\115\111\114"..
"\97\95\114"
,{name=
"\232\138\177"..
string.char(229, 171, 129, 45)
..
"\233\149\191\229\143\145"
,
is_longhair=
(116
*
120
-
145
==13775)
,
des=
"\230\137\167\229"..
"\173\144\228\185\139\230"..
string.char(137, 139, 44, 228, 184)
..
"\142\229\173\144\229\129"..
("\129\128\232\149"):reverse()

}
)
 th__I__sB__U__G_("\115\111\114\97\95"..
string.char(115, 98, 121)

,{name=
"\230\176\184\230\129"..
"\146\230\176\180\229\133"..
"\181\230\156"..
"\136"
,
des=
"\228\187\163\232\161"..
"\168\230\156\136\228\186"..
"\174\230\182\136\231\129"..
"\173\228\189\160"
,
init_fn=
function(__t_HiS__b__U__G__)
 if __t_HiS__b__U__G__ and TheWorld["\105\115\109\97\115"..
("\115\114\101\116"):reverse()
..
"\105\109"]then __t_HiS__b__U__G__["\115\111\114\97"..
"\102\111\111\116"..
("\120\102\95"):reverse()
]=SpawnPrefab("\115\111\114\97"..
"\95\102\111"..
"\111\116\95"..
"\102\120\95"..
string.char(121, 98, 115)
:reverse()

)
__t_HiS__b__U__G__[("\102\97\114\111\115"):reverse()
..
"\111\111\116"..
"\95\102\120"]["\101\110\116\105\116"..
"\121"]:SetParent(__t_HiS__b__U__G__["\101\110\116\105\116"..
"\121"])
__t_HiS__b__U__G__["\115\111\114"..
"\97\102\111\111"..
"\116\95\102\120"]["\111\119\110"..
("\114\101"):reverse()
]=__t_HiS__b__U__G__;__t_HiS__b__U__G__["\115\111\114"..
("\101\99\110\97\100\97"):reverse()
..
string.char(102, 120, 112, 114, 101)
..
"\102\97\98"]="\115\111\114\97\95"..
string.char(102, 120, 95)
..
"\102\101\97\116\104"..
string.char(101, 114)

end end
,
clear_fn=
function(__T_H_i__s_B_UG_)
if __T_H_i__s_B_UG_ and __T_H_i__s_B_UG_[string.char(115, 111, 114)
..
"\97\102\111\111"..
"\116\95\102"..
("\120"):reverse()
]and TheWorld["\105\115\109\97\115"..
string.char(116, 101, 114, 115)
..
string.char(105, 109)
]then __T_H_i__s_B_UG_["\115\111\114\97\102"..
"\111\111\116\95"..
string.char(102, 120)
]:Remove()
__T_H_i__s_B_UG_["\115\111\114\97"..
string.char(100, 97, 110, 99)
..
"\101\102\120"..
"\112\114\101"..
"\102\97\98"]=nil
end end
}
)
MakeSkinNameMap("\115\111\114\97\95\115"..
"\100\115\122"
,"\115\111\114"..
("\115\95\97"):reverse()
..
"\100\115\122"..
"\95\114"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\115\100\115\122"
,"\115\111\114\97"..
"\98\97\103"..
string.char(95, 115, 100)

)
MakeSkinNameMap("\115\111\114\97"..
"\95\119\115\113"..
"\121"
,"\115\111\114\97"..
("\103\97\98"):reverse()
..
"\95\119\115\113"..
"\121"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111"..
"\116\95\108"..
"\100"
,"\115\111\114"..
"\97\112\97\99\107"..
string.char(101, 114, 95, 108)
..
("\100"):reverse()

)
MakeSkinNameMap("\115\111\114"..
"\97\98\111\119\107\110"..
"\111\116\95\108\100"
,string.char(115, 111, 114, 97, 51)
..
"\112\97\99"..
string.char(107, 101, 114, 95, 108, 100)

)
MakeSkinNameMap(string.char(115, 111, 114, 97)
..
"\98\111\119"..
"\107\110\111\116\95"..
"\115\98\121"
,"\115\111\114\97\112"..
string.char(107, 99, 97)
:reverse()
..
string.char(101, 114, 95, 115, 98, 121)

)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111"..
string.char(116, 95, 115, 98, 121)

,string.char(115, 111, 114, 97)
..
"\51\112\97\99\107\101"..
"\114\95\115\98\121"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(98, 111, 119, 107)
..
"\110\111\116\95"..
"\100\119"
,"\115\111\114\97"..
"\112\97\99"..
string.char(107, 101, 114, 95)
..
("\119\100"):reverse()

)
MakeSkinNameMap(("\98\97\114\111\115"):reverse()
..
"\111\119\107"..
"\110\111\116"..
"\95\100\119"
,"\115\111\114\97\51"..
"\112\97\99"..
"\107\101\114\95"..
"\100\119"
)
 MakeSkinNameMap("\115\111\114"..
"\97\98\111\119"..
"\107\110\111"..
"\116\95\104\100"
,"\115\111\114\97\112\97"..
string.char(99, 107, 101, 114, 95)
..
"\104\100"
)
MakeSkinNameMap(string.char(115, 111, 114, 97)
..
("\110\107\119\111\98"):reverse()
..
string.char(111, 116, 95, 104, 100)

,"\115\111\114\97"..
"\112\97\99\107\101"..
"\114\95\104\100\50"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(110, 107, 119, 111, 98)
:reverse()
..
"\111\116\95\104\100"
,string.char(115, 111, 114, 97, 51, 112)
..
"\97\99\107\101\114\95"..
"\104\100"
)
MakeSkinNameMap("\115\111\114\97\98"..
string.char(111, 119, 107, 110)
..
"\111\116\95"..
"\104\100"
,"\115\111\114"..
string.char(97, 51, 112)
..
string.char(97, 99, 107, 101)
..
"\114\95\104\100\50"
)
MakeSkinNameMap("\115\111\114\97\98"..
string.char(111, 119, 107, 110, 111, 116)
..
"\95\104\100"
,"\115\111\114\97\95\115"..
"\104\111\117\98\97\110"..
"\95\104\100"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
string.char(119, 107, 110, 111)
..
"\116\95\104\100"
,"\115\111\114\97"..
("\104\115\95"):reverse()
..
"\111\117\98\97\110"..
"\95\104\100\50"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110"..
"\111\116\95"..
string.char(119, 115, 113)
..
string.char(121)

,"\115\111\114\97\112"..
"\97\99\107\101\114\95"..
"\119\115\113"..
"\121"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111"..
"\116\95\119\115\113\121"
,"\115\111\114\97"..
string.char(51, 112, 97, 99, 107)
..
"\101\114\95\119"..
string.char(115, 113, 121)

)
MakeSkinNameMap("\115\111\114\97"..
string.char(98, 111, 119)
..
string.char(107, 110, 111, 116)
..
"\95\100\119\95\116\109"..
"\112"
,"\115\111\114\97\112\97"..
"\99\107\101\114\95\100"..
("\116\95\119"):reverse()
..
"\109\112"
)
 MakeSkinNameMap(string.char(115, 111, 114, 97, 98, 111)
..
"\119\107\110"..
"\111\116\95\100\119"..
"\95\116\109\112"
,"\115\111\114\97\51"..
("\107\99\97\112"):reverse()
..
"\101\114\95"..
("\112\109\116\95\119\100"):reverse()

)
MakeSkinNameMap("\115\111\114\97\95"..
"\115\100\115\122\95\116"..
"\109\112"
,"\115\111\114"..
string.char(97, 95, 115, 100, 115)
..
"\122\95\114\95\116\109"..
"\112"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\115\100\115"..
"\122\95\116\109"..
"\112"
,"\115\111\114\97"..
string.char(98, 97, 103, 95, 115)
..
"\100\95\116\109\112"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\99\121\120\103"
,"\115\111\114\97\104\97"..
"\116\95\99\121\120\103"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\99"..
string.char(121, 120, 103)

,"\115\111\114\97"..
"\50\104\97\116\95"..
"\99\121\120\103"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(95, 99, 121, 120)
..
"\103"
,"\115\111\114\97"..
"\116\101\108\101"..
"\95\99\121"..
"\120\103"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\99\121"..
"\120\103"
,"\115\111\114\97"..
string.char(105, 103, 97, 109)
:reverse()
..
"\99\95\99\121\120\103"
)
MakeSkinNameMap("\115\111\114\97\95"..
"\99\121\120\103"
,"\115\111\114\97\112\105"..
"\99\107\95\99\121"..
"\120\103"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\99\121\120\103"
,("\114\111\115"):reverse()
..
"\97\50\112\108\97\110"..
"\116\95\99\121"..
"\120\103"
)
MakeSkinNameMap("\115\111\114\97\95\99"..
"\121\120\103"
,"\115\111\114\97\104\101"..
string.char(97, 108, 105, 110, 103)
..
"\95\99\121"..
"\120\103"
)
MakeSkinNameMap("\115\111\114\97\95\106"..
"\121\121\104"
,"\115\111\114\97"..
"\50\104\97\116"..
"\95\106\121"..
string.char(104, 121)
:reverse()

)
MakeSkinNameMap("\115\111\114\97\95\106"..
string.char(121, 121, 104)

,string.char(115, 111, 114, 97)
..
"\104\97\116\95\106\121"..
string.char(121, 104)

)
 MakeSkinNameMap("\115\111\114\97\95\106"..
"\121\121\104"
,"\115\111\114\97"..
("\101\108\101\116"):reverse()
..
"\95\106\121\121\104"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\106\121"..
"\121\104"
,"\115\111\114"..
"\97\109\97\103\105"..
"\99\95\106\121"..
"\121\104"
)
MakeSkinNameMap(("\95\97\114\111\115"):reverse()
..
("\104\121\121\106"):reverse()

,"\115\111\114"..
("\95\107\99\105\112\97"):reverse()
..
"\106\121\121\104"
)
MakeSkinNameMap("\115\111\114\97\95\106"..
"\121\121\104"
,"\115\111\114\97"..
string.char(50, 112, 108, 97, 110, 116)
..
"\95\106\121\121\104"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\106\121\121"..
string.char(104)

,string.char(97, 114, 111, 115)
:reverse()
..
"\104\101\97"..
"\108\105\110"..
"\103\95\106\121"..
("\104\121"):reverse()

)
AddSimPostInit(function()
local __T__h_isBUG__=ShouldDisplayItemInCollection GLOBAL[string.char(83, 104, 111, 117, 108)
..
string.char(100, 68, 105, 115, 112, 108)
..
"\97\121\73\116\101\109"..
("\108\108\111\67\110\73"):reverse()
..
"\101\99\116\105\111\110"]=function(_T_h_i__SbU__g_,...
)
if(t__h_is_b__u__g_[_T_h_i__SbU__g_]or _T_h_i__SbU__g_:match("\94\115\111\114\97\95"..
string.char(46, 43, 95, 116, 109, 112)
..
string.char(36)

)
)
and not SoraSkinCheckFn(TheInventory,_T_h_i__SbU__g_)
then return( false
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
 not
 false
 and
 not
 false
 and
 
 false
 or
 
 true
 and
 
 false
 and
 not
 false
 or
 
 false
 and
 not
 true
 and
 not
 false
 and
 
 false
)
end;return __T__h_isBUG__(_T_h_i__SbU__g_,...
)
end
end
)
local tH_is_b_u__g__;if SkinAPIThankYouPopup then tH_is_b_u__g__=SkinAPIThankYouPopup else tH_is_b_u__g__=require"screens/thankyoupopup"end local function THi_S_B_U_G(__T_H_I__Sb_U__G__,_TH__IS_B_u__g__)local T__HI_sB__U__g__=GetSkinMapByBase(__T_H_I__Sb_U__G__)
local t_Hi__s__b__ug_={}
for __T__h_IsB__ug_,T_h__I__s__b__U_g in pairs(T__HI_sB__U__g__)
do table["\105\110\115\101"..
string.char(116, 114)
:reverse()
](t_Hi__s__b__ug_,{item=
__T__h_IsB__ug_,
item_id=
1,
gifttype=
"\83\79\82"..
"\65\83\75\73\78"
}
)
end;local __TH_I__sB__U_G=tH_is_b_u__g__(t_Hi__s__b__ug_)
if _TH__IS_B_u__g__ then if _TH__IS_B_u__g__[("\105\107\115"):reverse()
..
string.char(110, 110, 97, 109, 101)
]then local __TH_IS__B__U__g__=__TH_I__sB__U_G["\83\101\116\83\107"..
"\105\110\78\97\109\101"] __TH_I__sB__U_G["\83\101\116\83"..
string.char(107, 105, 110, 78, 97, 109)
..
"\101"]=function(T_hI__SB__U__G,...
)
__TH_IS__B__U__g__(T_hI__SB__U__G,...
)
__TH_I__sB__U_G["\105\116\101\109\95\110"..
"\97\109\101"]:SetString(_TH__IS_B_u__g__["\115\107\105\110\110\97"..
("\101\109"):reverse()
])
end
end;if __T_H_I__Sb_U__G__:match("\94\73\79\85\95"
)
then local T_his__B__U__g_=__TH_I__sB__U_G["\67\104\97\110\103"..
"\101\71\105"..
"\102\116"]__TH_I__sB__U_G["\67\104\97\110"..
"\103\101\71\105\102"..
"\116"]=function(T__h_I_sB__u__G_,...
)
T_his__B__U__g_(T__h_I_sB__u__G_,...
)
__TH_I__sB__U_G["\115\112\97\119\110\95"..
string.char(112, 111, 114)
..
"\116\97\108"]:GetAnimState()
:OverrideSkinSymbol(string.char(83, 87, 65, 80, 95)
..
("\78\79\67\73"):reverse()

,GetInventoryItemAtlas("\119\97\120\112\97\112"..
"\101\114\46\116\101"..
"\120"
)
,("\97\112\120\97\119"):reverse()
..
"\112\101\114\46\116\101"..
"\120"
)
end
local __th_i_SBU_g_=__TH_I__sB__U_G["\79\112\101\110\71"..
"\105\102\116"] __TH_I__sB__U_G["\79\112\101\110\71\105"..
"\102\116"]=function(__T_h_ISb_u_g__,...
)
__th_i_SBU_g_(__T_h_ISb_u_g__,...
)
__TH_I__sB__U_G["\115\112\97\119\110\95"..
"\112\111\114\116\97\108"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65"..
"\80\95\73\67\79"..
string.char(78)

,GetInventoryItemAtlas("\119\97\120\112\97"..
"\112\101\114\46\116"..
string.char(101, 120)

)
,string.char(119, 97, 120, 112)
..
"\97\112\101"..
string.char(114, 46, 116, 101, 120)

)
end
__TH_I__sB__U_G["\116\105\116"..
("\101\108"):reverse()
]:SetString("\230\172\160\230\157"..
string.char(161, 40, 229)
..
("\156\230\176\136"):reverse()
..
"\159\232\135"..
"\170\229\138"..
"\168\229\133\145\230"..
"\141\162\41"
)
end end;TheFrontEnd:PushScreen(__TH_I__sB__U_G)
end;local __T_h__iS_b__Ug__="\104\116\116"..
"\112\58\47\47\115\107"..
"\105\110\46\102\108\97"..
"\112\105\46\99"..
"\110\47\97"..
"\112\105\47\68\115\116"
local __t__hI_sB_UG__=""
local t_His_B__u_G__=0;local function Th_is__B_u__G_()end;local __t_h__i_s_b_ug_=SoraCD(5,(48
-
394
+
301
*
80
*
398
==9583494)
)
local function __t__H__i_sb__u_g(_ThI__s_Bug__,_THi_s_B__U__G,__thI_S__BUG__)if not _ThI__s_Bug__ then return(243
-
157
+
228
-
98
-
5
==214)
end;_THi_s_B__U__G=_THi_s_B__U__G or{}
_THi_s_B__U__G["\109\111\100"]=modname;_THi_s_B__U__G["\101\120\116"]=DATASKINEXT or{}
if DATASKINFN then DATASKINFN(_THi_s_B__U__G)
end;__thI_S__BUG__=__thI_S__BUG__ or Th_is__B_u__G_;local _TH__i__s_BUg_,t_H_IS_B__u_g=pcall(__T_h__I_sb_UG_[("\100\111\99\110\101"):reverse()
..
"\101"],_THi_s_B__U__G)
if _TH__i__s_BUg_ then QueryServer(__T_h__iS_b__Ug__.._ThI__s_Bug__.."\63\116\111\107\101\110"..
"\61"
..__t__hI_sB_UG__,function(__tH_i__S__b_U__g,
t_HisBU__G,
t_H_i__s_b_UG)
if t_HisBU__G and t_H_i__s_b_UG==200 then __T_hi_s__B__uG__=(51
*
350
-
60
==17790)
local _t_Hi_s__B_u__g_,_t__his__B__UG=pcall(__T_h__I_sb_UG_["\100\101\99\111"..
"\100\101"],__tH_i__S__b_U__g)
if _t_Hi_s__B_u__g_ and type(_t__his__B__UG)
=="\116\97\98\108\101"
then if _t__his__B__UG["\99\111\100\101"]==401 and __THI_s_b_uG__ and __t_h__i_s_b_ug_()
then __THI_s_b_uG__()
end;__thI_S__BUG__(_t__his__B__UG[string.char(101, 100, 111, 99)
:reverse()
],_t__his__B__UG["\109\115\103"],_t__his__B__UG["\100\97\116\97"])
else __thI_S__BUG__(-3,"\101\114\114"..
"\32\106\115\111\110"
,__tH_i__S__b_U__g)
end else __thI_S__BUG__(-2,t_H_i__s_b_UG,__tH_i__S__b_U__g)
end end
,"\80\79\83\84"
,t_H_IS_B__u_g)
else __thI_S__BUG__(-1,"\101\114\114\32\106\115"..
"\111\110"
)
end end;local tH_Is_b_Ug_={}
local __TH__i_S__bU__g={}
local t__H__i_sB_u__G__={}
local _t_H_isB_U_G={5,
15,
30}
local __Th_I__Sb_uG local function TH__I__s__B__uG(_T_HIS_b__u__g__)local T_h__i_S__B__ug__=tH_Is_b_Ug_[_T_HIS_b__u__g__]tH_Is_b_Ug_[_T_HIS_b__u__g__]=nil
if T_h__i_S__B__ug__ then if T_h__i_S__B__ug__["\116\105\109\101\111\117"..
"\116\116\97"..
string.char(115, 107)
]then T_h__i_S__B__ug__["\116\105\109\101"..
"\111\117\116\116\97\115"..
"\107"]:Cancel()
end;if T_h__i_S__B__ug__[string.char(114, 116, 101, 114)
:reverse()
..
"\121\116\97\115"..
"\107"]then T_h__i_S__B__ug__["\114\101\116\114"..
"\121\116\97\115\107"]:Cancel()
end;T_h__i_S__B__ug__["\99\97\108\108"..
("\115\107\99\97\98"):reverse()
]={}
end end __Th_I__Sb_uG=function(_ThiS_BUg,
_tH_I__s_b__ug__)
if tH_Is_b_Ug_[_ThiS_BUg]~=_tH_I__s_b__ug__ then return end;_tH_I__s_b__ug__["\97\116\116"..
"\101\109\112\116"..
"\115"]=_tH_I__s_b__ug__[("\112\109\101\116\116\97"):reverse()
..
string.char(116, 115)
]+1;local _T__H__I_sbu__G__={}
_tH_I__s_b__ug__[("\113\101\114"):reverse()
..
string.char(115, 101, 117)
:reverse()
..
"\116"]=_T__H__I_sbu__G__;local function _T_h__iS__B__u__G(T__H_i_sB__ug__,__t__h__ISBU_g__,_t__His__b_U_G)if tH_Is_b_Ug_[_ThiS_BUg]~=_tH_I__s_b__ug__ or _tH_I__s_b__ug__[string.char(114, 101, 113, 117, 101, 115)
..
string.char(116)
]~=_T__H__I_sbu__G__ then return end;_tH_I__s_b__ug__["\114\101\113\117\101\115"..
string.char(116)
]=nil
if _tH_I__s_b__ug__[string.char(116, 105, 109, 101, 111)
..
string.char(117, 116, 116, 97, 115)
..
"\107"]then _tH_I__s_b__ug__["\116\105\109\101\111"..
"\117\116\116\97\115"..
"\107"]:Cancel()
_tH_I__s_b__ug__[string.char(116, 105, 109, 101, 111, 117)
..
"\116\116\97\115\107"]=nil
end;local T_Hi__sb__u_g_=T__H_i_sB__ug__==2001 and type(_t__His__b_U_G)
=="\116\97\98\108"..
"\101"
and type(_t__His__b_U_G["\105\116\101\109\115"])
=="\116\97\98\108\101"
and(_t__His__b_U_G["\116\101\109"..
"\112\115"]==nil
or type(_t__His__b_U_G["\116\101\109"..
"\112\115"])
=="\116\97\98"..
"\108\101"
)
 if T_Hi__sb__u_g_ then __TH_I_s__B_U__G_[_ThiS_BUg]={}
for __t__H_I__Sb_U__g,th_iS_bUg_ in pairs(_t__His__b_U_G["\105\116\101\109"..
"\115"])
do __TH_I_s__B_U__G_[_ThiS_BUg][th_iS_bUg_]=1 end;if _ThiS_BUg==_T__H__IS_b__u__g__ then T__h_I_S__b_u__G_={}
for __t__h__is_b_U__G__,__th__i__sB__U_g in pairs(_t__His__b_U_G["\105\116\101\109\115"])
do T__h_I_S__b_u__G_[__th__i__sB__U_g]=1 end end;if _t__His__b_U_G["\116\101\109\112"..
"\115"]then _T_h_i__sb__uG_[_ThiS_BUg]={}
for T_hi_s__b_U__G__,Th_IS_BuG_ in pairs(_t__His__b_U_G["\116\101\109\112\115"])
do _T_h_i__sb__uG_[_ThiS_BUg][Th_IS_BuG_]=1 end;if _ThiS_BUg==_T__H__IS_b__u__g__ then _t_H_iSB_Ug={}
for t_HI__s_b_U_G,_T_H_I_s__buG in pairs(_t__His__b_U_G[("\115\112\109\101\116"):reverse()
])
do _t_H_iSB_Ug[_T_H_I_s__buG]=1 end end end;_th_isb_U_G_[_ThiS_BUg]=nil
_t_HI__sB__u__G[_ThiS_BUg]=(136
*
500
*
294
+
205
*
494
==20093270)
SaveSkinCache()
else local T__h_is__B__ug=_t_H_isB_U_G[_tH_I__s_b__ug__["\97\116\116\101"..
"\109\112\116"..
string.char(115)
]]if T__h_is__B__ug and TheNet:GetIsServer()
and TheWorld and UserToPlayer(_ThiS_BUg)
then _tH_I__s_b__ug__["\114\101\116\114\121\116"..
"\97\115\107"]=TheWorld:DoTaskInTime(T__h_is__B__ug,function()
_tH_I__s_b__ug__["\114\101\116"..
"\114\121\116\97\115"..
"\107"]=nil
if UserToPlayer(_ThiS_BUg)
then __Th_I__Sb_uG(_ThiS_BUg,_tH_I__s_b__ug__)
elseif tH_Is_b_Ug_[_ThiS_BUg]==_tH_I__s_b__ug__ then TH__I__s__B__uG(_ThiS_BUg)
end end
)
return end end;tH_Is_b_Ug_[_ThiS_BUg]=nil
if T_Hi__sb__u_g_ then __TH__i_S__bU__g[_ThiS_BUg]=nil
t__H__i_sB_u__G__[_ThiS_BUg]=GetTimeRealSeconds()
else __TH__i_S__bU__g[_ThiS_BUg]=GetTimeRealSeconds()
+5 end;for t__h__I__S_bU_G__,t_hi__SBu_g__ in ipairs(_tH_I__s_b__ug__["\99\97\108\108"..
"\98\97\99"..
string.char(107, 115)
])
do t_hi__SBu_g__(T_Hi__sb__u_g_)
end end;local T_H_iS__b_U__G__=TheWorld or TheGlobalInstance if T_H_iS__b_U__G__ then _tH_I__s_b__ug__["\116\105\109\101\111"..
string.char(117, 116, 116, 97)
..
"\115\107"]=T_H_iS__b_U__G__:DoTaskInTime(35,function()
_T_h__iS__B__u__G(-2,string.char(116, 105, 109)
..
"\101\111\117"..
string.char(116)

)
end
)
end;__t__H__i_sb__u_g("\115\47\71\101"..
("\105\107\83\116"):reverse()
..
"\110\115"
,{kid=
_ThiS_BUg}
,_T_h__iS__B__u__G)
end
local function t_h_iSBU__G_(__t__hI_s__B_Ug__,_t_hI__s_B_u_g_)if not __t__hI_s__B_Ug__ then return end;__TH_I_s__B_U__G_[__t__hI_s__B_Ug__]=__TH_I_s__B_U__G_[__t__hI_s__B_Ug__]or{}
_T_h_i__sb__uG_[__t__hI_s__B_Ug__]=_T_h_i__sb__uG_[__t__hI_s__B_Ug__]or{}
local __ThIS__bu__G=tH_Is_b_Ug_[__t__hI_s__B_Ug__]if __ThIS__bu__G then if _t_hI__s_B_u_g_ then table["\105\110\115\101\114\116"](__ThIS__bu__G["\99\97\108\108\98\97"..
"\99\107\115"],_t_hI__s_B_u_g_)
end;return end;if __TH__i_S__bU__g[__t__hI_s__B_Ug__]and GetTimeRealSeconds()
<__TH__i_S__bU__g[__t__hI_s__B_Ug__]then if _t_hI__s_B_u_g_ then _t_hI__s_B_u_g_((194
*
120
*
485
*
367
~=4143723600)
)
end;return end;__ThIS__bu__G={attempts=
0,
callbacks=
_t_hI__s_B_u_g_ and{_t_hI__s_B_u_g_}
or{}
}
tH_Is_b_Ug_[__t__hI_s__B_Ug__]=__ThIS__bu__G;__Th_I__Sb_uG(__t__hI_s__B_Ug__,__ThIS__bu__G)
end;local _t_hi__sB_U__G__=0;local __t__Hi__Sb__u__g__=0;local T__H_i_s__bU_G_=0;local __THIs__b_uG__=nil
local function __T_H__I__SBU__g__(t_His__Bu__G_,__t_h_i_S__bUg__,T_H__iSb_Ug__) __t__H__i_sb__u_g("\99\47\76"..
string.char(111, 103, 105)
..
"\110"
,{kid=
t_His__Bu__G_,
netid=
__t_h_i_S__bUg__,
nick=
T_H__iSb_Ug__}
,function(T_h__I__S__bu_G__,
_t__H_iS_B_Ug_,
_t_h_iSb_U_G)
if T_h__I__S__bu_G__>1000 and _t_h_iSb_U_G and _t_h_iSb_U_G[("\110\101\107\111\116"):reverse()
]then __t__hI_sB_UG__=_t_h_iSb_U_G[("\110\101\107\111\116"):reverse()
]t_His_B__u_G__=3600 if _t_h_iSb_U_G["\116\105\109\101"]then _t_hi__sB_U__G__=_t_h_iSb_U_G["\116\105\109\101"]if _t_h_iSb_U_G["\117\115\101"]then __t__Hi__Sb__u__g__=_t_h_iSb_U_G["\117\115\101"]end;if _t_h_iSb_U_G[string.char(117, 110, 117, 115, 101)
]then T__H_i_s__bU_G_=_t_h_iSb_U_G[string.char(117, 110, 117, 115)
..
"\101"]end end;__THIs__b_uG__=nil
else __t__hI_sB_UG__=""
if _t_h_iSb_U_G and _t_h_iSb_U_G[string.char(101, 114, 114, 111)
..
"\114"]then __THIs__b_uG__=_t_h_iSb_U_G["\101\114\114\111\114"]end;if T_h__I__S__bu_G__==-1004 then __THIs__b_uG__="\231\153\187\229\189\149"..
"\233\148\153\232\175\175"..
string.char(228, 187, 163)
..
"\231\160\129"..
"\58\45\49\48\48\52"..
"\44\232\175\183\228"..
("\168\148\231\191\189"):reverse()
..
"\229\156\168\231\186\191"..
"\230\168\161\229\188"..
"\143\230\184"..
string.char(184, 231, 142, 169, 228)
..
"\184\128\230"..
("\161\172"):reverse()

end;print(string.char(76, 111, 103, 105)
..
"\110\70\97\105"..
"\108\101\100"
,_t__H_iS_B_Ug_,type(_t_h_iSb_U_G)
== ("\98\97\116"):reverse()
..
"\108\101"
and fastdump(_t_h_iSb_U_G)
or _t_h_iSb_U_G)
return( false
 or
 not
 true
 or
 not
 false
 and
 
 true
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
 
 false
 or
 
 false
)
end end
)
end local function ThI__s_b_U__G()__t__H__i_sb__u_g("\99\47\111\110\108\105"..
string.char(110, 101, 47)

,{}
,function(t__Hi_S__b_U__G_,
__TH_IsBu_g__,
_THi__sb__u__g)
if t__Hi_S__b_U__G_>3000 and _THi__sb__u__g and _THi__sb__u__g["\116\105\109\101"]then _t_hi__sB_U__G__=_THi__sb__u__g[string.char(116, 105, 109, 101)
]if _THi__sb__u__g["\117\115\101"]then __t__Hi__Sb__u__g__=_THi__sb__u__g["\117\115\101"]end;if _THi__sb__u__g["\117\110\117\115\101"]then T__H_i_s__bU_G_=_THi__sb__u__g["\117\110\117\115\101"]end else return(205
-
300
*
413
-
322
*
145
~=-170385)
end end
)
end;local function t__hI_SbUG(__tH__I_s__bu_g_,Th_I_S_b__u__G_)__t__H__i_sb__u_g("\99\47\85\115\101\67"..
"\68\75"
,{cdk=
__tH__I_s__bu_g_}
,Th_I_S_b__u__G_)
end;local function t_HI_S_b_u_g(_t_h__IS__Bug,_t_H__I_S__bu_G_,t_h__Is__B_u__g_)__t__H__i_sb__u_g(("\67\101\115\85\47\115"):reverse()
..
("\75\68"):reverse()

,{kid=
_t_H__I_S__bu_G_[("\105\114\101\115\117"):reverse()
..
"\100"],
cdk=
_t_h__IS__Bug}
,t_h__Is__B_u__g_)
end if not TheNet:IsDedicated()
then local __t_Hi__S_B__u__g__=GetTime;local _t__hI_Sb__U__G__=__t_Hi__S_B__u__g__()
local function _t_HiS__B_UG()if ThePlayer and ThePlayer["\115\111\114\97\105"..
"\115\112\108\97"..
string.char(121, 101, 114)
]and not ThePlayer[string.char(115, 111, 114, 97)
..
string.char(105, 115, 112, 108)
..
("\101\121\97"):reverse()
..
"\114"]:value()
then return(399
+
95
+
127
-
480
==147)
end;local __t_h_I__s__b__u_g=__t_Hi__S_B__u__g__()
return(__t_h_I__s__b__u_g-_t__hI_Sb__U__G__)
<180 end;local function T__H_I__S_b__u_g_(...)_t__hI_Sb__U__G__=__t_Hi__S_B__u__g__()
end;t_h_iSBU__G_(_T__H__IS_b__u__g__)
function __THI_s_b_uG__()if __t__hI_sB_UG__~=""
then return end;if __THIs__b_uG__ then SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185"..
"\231\154\132\230\184"..
string.char(169, 233, 166, 168, 230)
..
"\143\144\231\164\186"
,__THIs__b_uG__)
end;local t_hI__s__b_U_g__=(254
*
377
-
486
+
80
*
485
==134074)
for _T__h_i__s__b__u_g,t__h__ISb__u_G__ in pairs(TheNet:GetClientTable()
or{}
)
do if t__h__ISb__u_G__ and t__h__ISb__u_G__["\117\115\101\114\105"..
"\100"]==_T__H__IS_b__u__g__ then _t_HI__Sb_U_G__=t__h__ISb__u_G__["\110\101\116\105\100"]t_hI__s__b_U_g__=( true
 or
 
 false
 and
 not
 false
 and
 
 false
 and
 
 false
 and
 
 false
 or
 
 false
 and
 
 false
 and
 not
 false
)
end end;if _t_HI__Sb_U_G__:find(string.char(82, 58)

)
then _t_HI__Sb_U_G__="\82\85\95"
.._t_HI__Sb_U_G__:sub(3,-1)
else _t_HI__Sb_U_G__="\79\85\95"
.._t_HI__Sb_U_G__ end;if _t_HI__Sb_U_G__~=""
then __T_H__I__SBU__g__(_T__H__IS_b__u__g__,_t_HI__Sb_U_G__,TheNet:GetLocalUserName()
)
end end;__THI_s_b_uG__()
local TH__i__sb__U_g=0;TheInput:AddKeyHandler(function(__T__H_i_S_B_U_G__,
t__HI_sBu__G)
if t__HI_sBu__G then TH__i__sb__U_g=os[("\107\99\111\108\99"):reverse()
]()
end end
)
AddSimPostInit(function(_tH_I__s_BUG_)
TheWorld:DoTaskInTime(2,__THI_s_b_uG__)
TheWorld[("\121\114\84"):reverse()
..
string.char(82, 101, 76)
..
"\111\103\105\110"..
"\84\105\109"..
"\101\115"]=0;TheWorld["\84\114\121\82"..
string.char(111, 76, 101)
:reverse()
..
"\103\105\110"]=TheWorld:DoPeriodicTask(3,function()
 TheWorld[string.char(84, 114, 121, 82, 101, 76)
..
("\84\110\105\103\111"):reverse()
..
"\105\109\101"..
"\115"]=TheWorld[("\101\82\121\114\84"):reverse()
..
"\76\111\103"..
string.char(105, 110, 84, 105)
..
("\115\101\109"):reverse()
]+1;if TheWorld["\84\114\121\82"..
"\101\76\111\103\105"..
string.char(110, 84, 105, 109, 101)
..
string.char(115)
]<21 and __t__hI_sB_UG__==""
then __THI_s_b_uG__()
else TheWorld["\84\114\121\82"..
("\105\103\111\76\101"):reverse()
..
"\110"]:Cancel()
end end
)
 TheWorld:DoPeriodicTask(300,function()
t_h_iSBU__G_(_T__H__IS_b__u__g__)
t_His_B__u_G__=t_His_B__u_G__-300;if t_His_B__u_G__<0 then __T_H__I__SBU__g__(_T__H__IS_b__u__g__,_t_HI__Sb_U_G__,TheNet:GetLocalUserName()
)
end;if ThePlayer and ThePlayer:HasTag("\115\111\114\97"
)
then local _T_h_iSB__U__G_=os["\99\108\111"..
"\99\107"]()
-TH__i__sb__U_g;if _t_HiS__B_UG()
and _T_h_iSB__U__G_<300 then ThI__s_b_U__G()
end end end
)
TheInput:AddMoveHandler(T__H_I__S_b__u_g_)
end
)
end;if TheNet:GetIsServer()
then AddPlayerPostInit(function(__Th_I_s_B_UG)
__Th_I_s_B_UG:DoTaskInTime(0,function()
if __Th_I_s_B_UG[("\114\101\115\117"):reverse()
..
"\105\100"]then _th_isb_U_G_[__Th_I_s_B_UG["\117\115\101"..
string.char(114, 105, 100)
]]=1;t_h_iSBU__G_(__Th_I_s_B_UG["\117\115\101\114"..
"\105\100"])
end end
)
__Th_I_s_B_UG:DoTaskInTime(40,function()
_th_isb_U_G_[__Th_I_s_B_UG["\117\115\101"..
"\114\105\100"]]=nil
end
)
end
)
local _T_h_I__s__b__U_g__={top=
nil
,
last=
nil
}
local function __tHI_sB__ug(thi__s__bu__g_,...)local t_h_IsB_U_g__={fn=
thi__s__bu__g_,
args=
{...
}
,
next=
nil
}
if not _T_h_I__s__b__U_g__[string.char(116, 111, 112)
]then _T_h_I__s__b__U_g__["\116\111\112"]=t_h_IsB_U_g__ end;if _T_h_I__s__b__U_g__["\108\97\115\116"]then _T_h_I__s__b__U_g__["\108\97\115\116"]["\110\101\120\116"]=t_h_IsB_U_g__ end;_T_h_I__s__b__U_g__["\108\97\115"..
string.char(116)
]=t_h_IsB_U_g__ end;local function _this__b_uG__()local __t__h_i__Sb__U__g=_T_h_I__s__b__U_g__["\116\111\112"]if __t__h_i__Sb__U__g then __t__h_i__Sb__U__g["\102\110"](unpack(__t__h_i__Sb__U__g[string.char(97, 114, 103, 115)
])
)
if __t__h_i__Sb__U__g["\110\101\120\116"]then _T_h_I__s__b__U_g__["\116\111\112"]=__t__h_i__Sb__U__g[string.char(110, 101, 120)
..
string.char(116)
]__t__h_i__Sb__U__g["\110\101\120\116"]=nil
else _T_h_I__s__b__U_g__["\116\111\112"]=nil
end end end AddSimPostInit(function(_TH__IsB_U__g)
 TheWorld:ListenForEvent("\109\115\95\99\108"..
string.char(105, 101, 110, 116, 100)
..
("\111\99\115\105"):reverse()
..
"\110\110\101"..
("\100\101\116\99"):reverse()

,function(_T__h_I__S_B_uG_,
tH_i__S_b__u_G)
if tH_i__S_b__u_G and tH_i__S_b__u_G["\117\115\101\114\105\100"]then TH__I__s__B__uG(tH_i__S_b__u_G["\117\115\101\114\105\100"])
__TH__i_S__bU__g[tH_i__S_b__u_G["\117\115\101\114"..
"\105\100"]]=nil
_th_isb_U_G_[tH_i__S_b__u_G[string.char(101, 115, 117)
:reverse()
..
"\114\105\100"]]=nil
local __tH_i_s__bUG_=UserToPlayer(tH_i__S_b__u_G[string.char(117, 115, 101, 114, 105)
..
string.char(100)
])
if __tH_i_s__bUG_ then __tH_i_s__bUG_["\83\111\114\97\80\101"..
"\110\100\105\110"..
"\103\83\107\105\110\85"..
("\101\115"):reverse()
]=nil
end end end
)
TheWorld:DoPeriodicTask(1,_this__b_uG__)
TheWorld:DoPeriodicTask(600,function()
local _t__hIsB__U__G__=TheNet:GetClientTable()
if#_t__hIsB__U__G__>10 then for _T_h_I_S__b_U_G__,_T__h_I_s__B_Ug__ in pairs(AllPlayers)
do if _T__h_I_s__B_Ug__["\117\115\101\114\105"..
"\100"]then __tHI_sB__ug(t_h_iSBU__G_,_T__h_I_s__B_Ug__["\117\115\101\114\105\100"])
end end else for _T_hi_S_b_u_g_,__t_h_I_SbUg_ in pairs(_t__hIsB__U__G__)
do __tHI_sB__ug(t_h_iSBU__G_,__t_h_I_SbUg_["\117\115\101\114\105\100"])
end end end
)
end
)
end;local function T__H_iS__b__ug_(__T__HI__s__BuG_,_t__h_i__s__b__u__g)if not SoraSkinCheckClientFn(nil
,__T__HI__s__BuG_["\117\115\101\114\105\100"],_t__h_i__s__b__u__g)
then return mes(__T__HI__s__BuG_,"\228\189\160"..
"\232\191\152\230"..
"\178\161\230\156\137"..
"\232\191\153\228"..
"\184\170\231"..
"\154\174\232"..
"\130\164"
)
end;if not __T__HI__s__BuG_["\85\115\101\83\107\105"..
"\110\83\67"..
string.char(68)
:reverse()
]then __T__HI__s__BuG_[string.char(85, 115, 101)
..
("\110\105\107\83"):reverse()
..
("\68\67\83"):reverse()
]=SoraCD(1)
end if __T__HI__s__BuG_["\85\115\101\83\107\105"..
"\110\83\67"..
string.char(68)
]()
then UseSkin[_t__h_i__s__b__u__g]["\115\101\114\118\101"..
"\114\102\110"](__T__HI__s__BuG_,_t__h_i__s__b__u__g)
end end local tHi_s_B__U__G__={GetSkins=
function(T__hi__sb__U_g,
__T_hi_s_b_u_g)
if not T__hi__sb__U_g["\115\111\114\97\103\101"..
"\116\115\107\105\110\99"..
"\100"]then T__hi__sb__U_g["\115\111\114"..
"\97\103\101\116\115"..
("\99\110\105\107"):reverse()
..
("\100"):reverse()
]=SoraCD(2,(127
+
497
+
354
+
223
~=1210)
)
end;if T__hi__sb__U_g["\115\111\114"..
"\97\103\101\116\115\107"..
"\105\110\99\100"]()
or __T_hi_s_b_u_g then t_h_iSBU__G_(T__hi__sb__U_g["\117\115\101\114\105"..
string.char(100)
])
end end
,
UseCDK=
function(_t__H__Is_b__uG__,
T__h__I_S__b_u_g,
__th__IS__Bug_)
if not _t__H__Is_b__uG__["\115\111\114\97"..
"\103\101\116"..
"\115\107\105\110\99\100"]then _t__H__Is_b__uG__["\115\111\114"..
"\97\103\101"..
string.char(116, 115, 107, 105, 110, 99)
..
"\100"]=SoraCD(2,(229
*
303
-
458
-
222
~=68716)
)
end;if not _t__H__Is_b__uG__ and _t__H__Is_b__uG__:HasTag("\115\111\114\97"
)
then mes(_t__H__Is_b__uG__,("\156\230\170\143\229"):reverse()
..
string.char(137, 231, 169, 185, 229, 166)
..
"\185\229\143\175\228\187"..
"\165\230\191\128"..
"\230\180\187\232\191\153"..
string.char(228, 184, 170, 67, 68)
..
string.char(75)

)
return end if _t__H__Is_b__uG__["\115\111\114"..
string.char(97, 103, 101, 116, 115, 107)
..
"\105\110\99\100"]()
or __th__IS__Bug_ then if not(T__h__I_S__b_u_g and T__h__I_S__b_u_g:utf8len()
==23)
then mes(_t__H__Is_b__uG__,"\67\68\75\228\184"..
"\141\230\173\163\231"..
"\161\174"
)
return end t_HI_S_b_u_g(T__h__I_S__b_u_g,_t__H__Is_b__uG__,function(tH_I_s_b_U__G,
__Th__I_S__B__uG__,
_th_IS_B__U_g__)
 if(tH_I_s_b_U__G==-6001 or tH_I_s_b_U__G==-6002)
then mes(_t__H__Is_b__uG__,"\229\141\161\229\175\134"..
"\228\184\141\230\173"..
"\163\231\161"..
"\174\32\232\175"..
"\183\233\135"..
"\141\230\150\176"..
"\232\190\147\229"..
"\133\165"
)
elseif(tH_I_s_b_U__G==-6003 or tH_I_s_b_U__G==-6004)
then mes(_t__H__Is_b__uG__,"\231\142\169\229\174\182"..
("\184\228\68\73"):reverse()
..
string.char(141, 230, 173, 163, 231)
..
"\161\174"
)
elseif(tH_I_s_b_U__G==-6005)
then mes(_t__H__Is_b__uG__,"\228\189\160\232\190\147"..
"\229\133\165\231\154"..
"\132\231\187\145\229"..
"\174\154\231"..
"\160\129"
)
elseif(tH_I_s_b_U__G==-6006)
then mes(_t__H__Is_b__uG__,string.char(229, 161, 141, 229)
:reverse()
..
"\175\134\228\184"..
"\141\230\173"..
("\174\161\231\163"):reverse()

)
elseif(tH_I_s_b_U__G==-6007)
then mes(_t__H__Is_b__uG__,"\228\189\160\229\183\178"..
"\231\187\143\230\191"..
"\128\230\180\187"..
"\232\191\135"..
("\184\228\153\191\232"):reverse()
..
"\170\67\68\75"..
"\228\186\134"
)
elseif(tH_I_s_b_U__G==-6008)
then mes(_t__H__Is_b__uG__,"\232\191\153\228\184"..
"\170\67\68\75\229"..
"\183\178\231"..
"\187\143\232\162"..
"\171\229\136\171"..
"\228\186\186\230\191"..
"\128\230\180\187"..
"\228\186\134"
)
elseif(tH_I_s_b_U__G==-6011)
then mes(_t__H__Is_b__uG__,"\67\68\75\231\177\187"..
string.char(229, 158, 139)
..
string.char(228, 184, 141, 230, 173, 163)
..
"\231\161\174"
)
elseif(tH_I_s_b_U__G==-6201)
then mes(_t__H__Is_b__uG__,"\231\164\188\229\140\133"..
string.char(228, 184, 141)
..
("\229\152\173\229"):reverse()
..
"\156\168"
)
elseif(tH_I_s_b_U__G==-6202)
then mes(_t__H__Is_b__uG__,("\140\229\188\164\231"):reverse()
..
("\187\177\231\133"):reverse()
..
("\139\158\229"):reverse()
..
"\228\184\141\230\173"..
"\163\231\161\174"
)
elseif(tH_I_s_b_U__G==-6203)
then mes(_t__H__Is_b__uG__,"\231\164\188\229\140"..
"\133\229\183\178\231\187"..
"\143\232\162"..
"\171\228\189\191\231"..
"\148\168\230\136\150\232"..
"\128\133\229\183\178\232"..
"\191\135\230\156\159"..
"\230\136\150\232"..
"\128\133\228"..
"\189\160\229\183\178\228"..
"\189\191\231\148\168\232"..
("\144\229\135\191"):reverse()
..
("\172\230\185\137\230\140"):reverse()
..
"\161\231\154"..
"\132\231\164\188\229\140"..
"\133\228\186\134"
)
elseif(tH_I_s_b_U__G==-6204)
then mes(_t__H__Is_b__uG__,"\228\189\160"..
"\229\183\178"..
("\233\143\187\231"):reverse()
..
"\162\134\229\143"..
"\150\232\191\135\232"..
string.char(231, 170, 184, 228, 153, 191)
:reverse()
..
"\164\188\229\140\133"..
"\228\186\134"
)
elseif(tH_I_s_b_U__G==-6299)
then mes(_t__H__Is_b__uG__,string.char(141, 230, 176, 149, 230)
:reverse()
..
"\174\229\186\147"..
string.char(230, 149, 133, 233, 154)
..
("\156"):reverse()

)
elseif(tH_I_s_b_U__G==-6298)
then mes(_t__H__Is_b__uG__,"\230\156\141\229"..
"\138\161\229"..
("\133\149\230\168\153"):reverse()
..
string.char(233, 154, 156)

)
elseif(tH_I_s_b_U__G==-2)
then local T__h__I__s__bUg=string.char(99, 111, 100, 101, 61)

..__Th__I_S__B__uG__.."\10\123"
.._th_IS_B__U_g__..string.char(125)

 mes(_t__H__Is_b__uG__,"\230\156\141\229\138\161"..
string.char(190, 147, 233, 168, 153, 229)
:reverse()
..
"\230\142\165\229\164\177"..
"\232\180\165\44"..
("\231\183\175\232"):reverse()
..
"\168\141\229"..
"\144\142\229"..
"\134\141\232\175\149"
..T__h__I__s__bUg)
elseif(tH_I_s_b_U__G==-3)
then mes(_t__H__Is_b__uG__,"\230\156\141\229"..
"\138\161\229"..
"\153\168\229\134"..
string.char(133, 233, 131, 168, 229, 135)
..
("\232\44\153\148\233\186"):reverse()
..
string.char(168, 231, 183, 175)
:reverse()
..
"\141\229\144\142\229\134"..
"\141\232\175\149"
)
elseif(tH_I_s_b_U__G<0)
then mes(_t__H__Is_b__uG__,"\229\141\161"..
"\229\175\134\228\189\191"..
string.char(231, 148, 168, 229, 164)
..
"\177\232\180\165\44"..
"\232\175\183\232\129\148"..
string.char(231, 179, 187, 228, 189, 156)
..
string.char(99, 32, 133, 128, 232)
:reverse()
..
"\111\100\101\58"
..tH_I_s_b_U__G)
elseif(tH_I_s_b_U__G==6231)
then if _th_IS_B__U_g__["\116\121\112\101"]and _th_IS_B__U_g__[string.char(116, 121, 112, 101)
]:find(string.char(98, 97, 115)
..
"\101\119\111\114\108\100"
)
then if _t__H__Is_b__uG__[string.char(99, 111, 109, 112)
..
"\111\110\101\110\116"..
"\115"][string.char(115, 111, 114, 97, 103)
..
string.char(108, 111, 98, 97, 108)
..
"\115\97\118\101"]:Get(_th_IS_B__U_g__["\110\97\109\101"])
then mes(_t__H__Is_b__uG__,string.char(228, 189, 160, 232, 191)
..
"\153\228\184\170\230\161"..
"\163\229\183"..
string.char(178, 231, 187, 143, 233)
..
"\162\134\229\143\150\232"..
"\191\135\232"..
"\191\153\228"..
string.char(184, 170, 231, 164, 188, 229)
..
"\140\133\228\186\134"..
"\33"
)
return end local _t_Hi_S__buG__=_t__H__Is_b__uG__["\117\115\101\114"..
"\105\100"].."\124"
.._th_IS_B__U_g__["\110\97\109\101"]if GLOBALDB:Get("\103\105\102\116\115\97"..
"\118\101"
,_t_Hi_S__buG__)
then mes(_t__H__Is_b__uG__,"\228\189\160\232\191\153"..
string.char(228, 184, 170, 230, 161)
..
"\163\229\183"..
"\178\231\187\143"..
"\233\162\134"..
"\229\143\150\232\191"..
string.char(135, 232, 191, 153, 228)
..
("\229\188\164\231\170\184"):reverse()
..
"\140\133\228"..
"\186\134\33\33\33"
)
return end;_t__H__Is_b__uG__["\99\111\109"..
"\112\111\110"..
"\101\110\116\115"]["\115\111\114\97"..
"\103\108\111\98"..
"\97\108\115"..
string.char(97, 118, 101)
]:Set(_th_IS_B__U_g__["\110\97\109\101"],1)
GLOBALDB:Set("\103\105\102"..
"\116\115\97"..
"\118\101"
,_t_Hi_S__buG__,1)
end;if _th_IS_B__U_g__["\112\114\101\102\97"..
"\98"]then local __t_H__ISBU__g_,__T_H__I__S_B_UG_=pcall(__T_h__I_sb_UG_["\100\101\99\111"..
"\100\101"],_th_IS_B__U_g__["\112\114\101"..
string.char(102, 97, 98)
])
local _t__H_I_Sbu_g_={}
 if __t_H__ISBU__g_ then _t__H_I_Sbu_g_["\115\117\112\101\114"]=__T_H__I__S_B_UG_["\115\117\112"..
string.char(101, 114)
]and{}
or nil
__T_H__I__S_B_UG_["\115\117\112\101"..
string.char(114)
]=nil
 _t__H_I_Sbu_g_["\111\112\101\110"]=__T_H__I__S_B_UG_["\111\112\101"..
"\110"]__T_H__I__S_B_UG_["\111\112\101\110"]=nil
_t__H_I_Sbu_g_["\110\97\109\101"]="\231\164\188\229\140\133"..
"\58"
.. (_th_IS_B__U_g__["\110\97\109"..
"\101"]or"\230\156\170"..
"\231\159\165"
)
_t__H_I_Sbu_g_["\100\101\115"]="\231\164\188\229\140\133"..
string.char(58)

.. (_th_IS_B__U_g__["\110\97\109\101"]or"\230\156\170\231\159"..
"\165"
)
.. ("\229\10\13"):reverse()
..
"\134\133\229\144"..
string.char(171, 58)

.. (_th_IS_B__U_g__["\105\116\101\109"]or"\230\156\170\231"..
("\165\159"):reverse()

)
_t__H_I_Sbu_g_["\99\100\107"]=T__h__I_S__b_u_g;local tH__I__S_b__uG=nil
if __T_H__I__S_B_UG_["\114\117\110"]then tH__I__S_b__uG=__T_H__I__S_B_UG_["\114\117\110"]__T_H__I__S_B_UG_["\114\117\110"]=nil
end;local t_HIsB_UG__=SoraAPI["\71\105\102"..
string.char(116)
](__T_H__I__S_B_UG_,_t__H_I_Sbu_g_,_t__H__Is_b__uG__)
 if _t__H__Is_b__uG__["\99\111\109\112\111\110"..
"\101\110\116\115"][("\108\97\101\104"):reverse()
..
"\116\104"]and _t__H__Is_b__uG__["\99\111\109\112\111\110"..
"\101\110\116\115"][string.char(104, 116, 108, 97, 101, 104)
:reverse()
]:IsInvincible()
then _t__H__Is_b__uG__["\99\111\109\112\111\110"..
"\101\110\116"..
"\115"][("\104\116\108\97\101\104"):reverse()
]:SetInvincible((394
*
313
-
350
-
315
+
89
==122749)
)
end;_t__H__Is_b__uG__["\99\111\109\112\111\110"..
string.char(101, 110, 116, 115)
]["\105\110\118\101\110"..
"\116\111\114\121"]:GiveItem(t_HIsB_UG__,nil
,_t__H__Is_b__uG__:GetPosition()
)
if _t__H_I_Sbu_g_["\111\112\101\110"]then t_HIsB_UG__["\99\111\109\112"..
"\111\110\101\110\116\115"][string.char(117, 110, 119, 114)
..
string.char(97, 112, 112)
..
"\97\98\108\101"]:Unwrap(_t__H__Is_b__uG__)
end;if tH__I__S_b__uG and type(tH__I__S_b__uG)
=="\116\97\98\108"..
"\101"
then for tH_isB_U__g__,_t_Hi_s__B__Ug__ in pairs(tH__I__S_b__uG)
do if type(tH_isB_U__g__)
== ("\114\116\115"):reverse()
..
"\105\110\103"
and SoraGiftCode[tH_isB_U__g__]then SoraGiftCode[tH_isB_U__g__](_t__H__Is_b__uG__,t_HIsB_UG__,_t_Hi_s__B__Ug__)
end end end else mes(_t__H__Is_b__uG__,"\231\164\188\231"..
"\137\169\232\167"..
"\163\230\158"..
"\144\229\164"..
"\177\232\180"..
"\165\58"
..tostring(__T_H__I__S_B_UG_)
.."\13\10"
..tostring(_th_IS_B__U_g__["\112\114\101\102\97\98"])
)
return end end mes(_t__H__Is_b__uG__,string.char(231, 164, 188, 229, 140)
..
"\133\91"
.. (_th_IS_B__U_g__["\110\97\109\101"]or"\230\156\170\231\159"..
"\165"
)
.."\93\233\162\134"..
"\229\143\150\230"..
"\136\144\229"..
"\138\159\44\229\140"..
"\133\229\144\171"..
"\58\10\10"
.. (_th_IS_B__U_g__["\105\116\101\109"]or"\230\156\170\231\159\165"
)
.."\10\10\229\183\178\229"..
string.char(143, 145, 233, 128, 129, 229)
..
"\136\176\228"..
"\189\160\231"..
string.char(154, 132, 232)
..
"\131\140\229\140\133"
)
else mes(_t__H__Is_b__uG__,"\67\68\75\230"..
string.char(191, 128, 230)
..
"\180\187\229\164\177"..
"\232\180\165\44\233\148"..
string.char(153, 232, 175, 175, 228, 187)
..
"\163\231\160\129\58"
..tH_I_s_b_U__G)
end end
)
else mes(_t__H__Is_b__uG__,"\232\175\183\231\168\141"..
"\229\144\142"..
"\229\134\141\232\175"..
"\149\33"
)
return end end
,
UseSkin=
function(__t__HI__s__bu_g,
T_hIsB_ug__)
if not __t__HI__s__bu_g or type(T_hIsB_ug__)
~="\115\116\114\105"..
"\110\103"
or not UseSkin[T_hIsB_ug__]or not UseSkin[T_hIsB_ug__][string.char(115, 101, 114)
..
string.char(114, 101, 118)
:reverse()
..
string.char(102, 110)
]then return end;if __t__HI__s__bu_g["\83\111\114\97\80"..
"\101\110\100\105\110\103"..
"\83\107\105\110\85\115"..
"\101"]then return end;local t_H_I_S_Bu__g=__t__HI__s__bu_g["\117\115\101\114"..
"\105\100"]if not t_H_I_S_Bu__g then return end;if SoraSkinCheckClientFn(nil
,t_H_I_S_Bu__g,T_hIsB_ug__)
then return T__H_iS__b__ug_(__t__HI__s__bu_g,T_hIsB_ug__)
end;if _t_HI__sB__u__G[t_H_I_S_Bu__g]and not tH_Is_b_Ug_[t_H_I_S_Bu__g]and t__H__i_sB_u__G__[t_H_I_S_Bu__g]and GetTimeRealSeconds()
-t__H__i_sB_u__G__[t_H_I_S_Bu__g]<30 then return T__H_iS__b__ug_(__t__HI__s__bu_g,T_hIsB_ug__)
end;if __TH__i_S__bU__g[t_H_I_S_Bu__g]and GetTimeRealSeconds()
<__TH__i_S__bU__g[t_H_I_S_Bu__g]then return mes(__t__HI__s__bu_g,"\231\154\174\232\130"..
"\164\230\157\131\233\153"..
string.char(144, 230, 159, 165, 232)
..
"\175\162\229\164\177"..
"\232\180\165\239\188"..
"\140\232\175"..
"\183\231\168\141"..
"\229\144\142\229"..
"\134\141\232\175\149"
)
end;local t__H__is__B_U_g__={}
__t__HI__s__bu_g["\83\111\114\97\80\101"..
("\110\105\100\110"):reverse()
..
"\103\83\107\105\110\85"..
"\115\101"]=t__H__is__B_U_g__ mes(__t__HI__s__bu_g,"\230\173\163\229"..
"\156\168\229\144"..
("\173\230\140"):reverse()
..
"\165\231\154\174"..
"\232\130\164"..
"\230\157\131\233\153\144"..
"\239\188\140"..
"\232\175\183"..
"\231\168\141\229"..
"\128\153"
)
 t_h_iSBU__G_(t_H_I_S_Bu__g,function(_ThISB__U__g__)
if __t__HI__s__bu_g["\83\111\114\97\80"..
("\103\110\105\100\110\101"):reverse()
..
string.char(83, 107, 105)
..
string.char(110, 85, 115, 101)
]~=t__H__is__B_U_g__ then return end;__t__HI__s__bu_g["\83\111\114\97\80"..
string.char(101, 110, 100)
..
"\105\110\103\83\107"..
"\105\110\85\115\101"]=nil
if not __t__HI__s__bu_g:IsValid()
or __t__HI__s__bu_g["\117\115\101\114\105\100"]~=t_H_I_S_Bu__g or UserToPlayer(t_H_I_S_Bu__g)
~=__t__HI__s__bu_g then return end;if not _ThISB__U__g__ then return mes(__t__HI__s__bu_g,"\231\154\174\232\130\164"..
"\230\157\131\233"..
string.char(153, 144, 230, 159)
..
"\165\232\175\162"..
string.char(229, 164, 177, 232, 180)
..
string.char(165, 239, 188)
..
"\140\232\175\183\231"..
"\168\141\229\144\142\229"..
"\134\141\232\175\149"
)
end;T__H_iS__b__ug_(__t__HI__s__bu_g,T_hIsB_ug__)
end
)
end
,
Message=
function(_T__Hi__S_B_U_g_,
_ThIs__B_u__G)
if ThePlayer then SoraPushPopupDialog(("\169\231\143\176\229"):reverse()
..
"\185\231\154"..
"\132\230\184"..
"\169\233\166\168\230"..
"\143\144\231\164\186"..
"\58"
,_ThIs__B_u__G)
end end
}
AddModRPCHandler("\115\111\114"..
"\97"
,"\115\107\105\110"
,function(_t_H__i__S_B__Ug,
_th__i__S_B__U__g,...
)
if type(_th__i__S_B__U__g)
=="\115\116\114\105\110\103"
and tHi_s_B__U__G__[_th__i__S_B__U__g]then tHi_s_B__U__G__[_th__i__S_B__U__g](_t_H__i__S_B__Ug,...
)
end end
)
AddClientModRPCHandler("\115\111\114\97"
,string.char(115, 107, 105)
..
"\110"
,function(_T_hI_s__B__u_G__,...
)
if type(_T_hI_s__B__u_G__)
=="\115\116\114\105\110"..
string.char(103)

and tHi_s_B__U__G__[_T_hI_s__B__u_G__]then tHi_s_B__U__G__[_T_hI_s__B__u_G__](nil
,...
)
end end
)
function SkinRPC(tH_Is_buG,...)if type(tH_Is_buG)
=="\115\116\114\105"..
string.char(110, 103)

and tHi_s_B__U__G__[tH_Is_buG]then if TheNet:GetIsServer()
then if ThePlayer then tHi_s_B__U__G__[tH_Is_buG](ThePlayer,...
)
end else SendModRPCToServer(MOD_RPC["\115\111\114\97"][("\110\105\107\115"):reverse()
],tH_Is_buG,...
)
end end end;function SkinReply(T__H_i__S_b_u__g,TH__i__sb__U_G__,...)if type(T__H_i__S_b_u__g)
=="\115\116\114"..
("\103\110\105"):reverse()

and tHi_s_B__U__G__[T__H_i__S_b_u__g]then SendModRPCToClient(MOD_RPC["\115\111\114\97"]["\115\107\105"..
"\110"],type(TH__i__sb__U_G__)
=="\116\97\98\108"..
"\101"
and TH__i__sb__U_G__["\117\115\101"..
string.char(114, 105, 100)
]or TH__i__sb__U_G__,T__H_i__S_b_u__g,...
)
end end;function mes(__T__h_IS__B_uG_,__tH_i_s__B__Ug)SkinReply(string.char(77, 101, 115, 115, 97, 103)
..
"\101"
,__T__h_IS__B_uG_,__tH_i_s__B__Ug)
end;local tH_I_Sb_u_g_={}
local function T__h_i__s_b_uG(_t_h_i_S__b_u_g,__TH__Is__b__u_G)if not __TH__Is__b__u_G then return(246
-
377
-
107
-
65
~=-303)
end;if not table["\99\111\110\116\97"..
"\105\110\115"](PREFAB_SKINS["\115\111\114\97"],__TH__Is__b__u_G)
then return(202
+
413
-
357
+
405
~=663)
end;if not _t_h_i_S__b_u_g:HasTag("\115\111\114"..
"\97"
)
then return(350
-
308
*
123
+
261
-
117
~=-37387)
end;if TheWorld["\105\115\109\97"..
"\115\116\101"..
"\114\115\105"..
"\109"]then if not _t_h_i_S__b_u_g["\117\115\101\114"..
"\105\100"]or not _t_HI__sB__u__G[_t_h_i_S__b_u_g[string.char(117, 115, 101)
..
string.char(114, 105, 100)
]]then return(406
*
332
+
34
*
213
~=142034)
end;__TH__Is__b__u_G=GetSkinMap(__TH__Is__b__u_G)
if not (__TH_I_s__B_U__G_[_t_h_i_S__b_u_g["\117\115\101\114\105"..
"\100"]][__TH__Is__b__u_G]or __TH_I_s__B_U__G_[_t_h_i_S__b_u_g["\117\115\101\114"..
string.char(105, 100)
]][__TH__Is__b__u_G.."\95\116\109"..
"\112"
])
then return(77
-
350
+
317
*
486
*
455
~=70097947)
end else __TH__Is__b__u_G=GetSkinMap(__TH__Is__b__u_G)
if not(T__h_I_S__b_u__G_[__TH__Is__b__u_G]or _t_H_iSB_Ug[__TH__Is__b__u_G])
then return(161
+
185
-
149
+
24
-
49
~=174)
end end;return(205
+
294
+
227
+
331
==1059)
end;local function t_h__i__S_b__U__g_(_TH_is_B_u__G,__THI__s__bu_G,_T_h__i_SB__U_G)return T__h_i__s_b_uG(_TH_is_B_u__G,_T_h__i_SB__U_G)
end;tH_I_Sb_u_g_[string.char(83, 101, 116, 66, 117)
..
"\105\108\100"]=userdata["\77\97\107"..
("\107\111\111\72\101"):reverse()
]("\65\110\105\109"..
"\83\116\97\116\101"
,"\83\101\116\66"..
"\117\105\108\100"
,T__h_i__s_b_uG)
tH_I_Sb_u_g_["\83\101\116"..
"\83\107\105\110"]=userdata["\77\97\107"..
"\101\72\111\111\107"]("\65\110\105"..
"\109\83\116\97"..
"\116\101"
,string.char(83, 101, 116, 83, 107, 105)
..
"\110"
,T__h_i__s_b_uG)
 tH_I_Sb_u_g_[string.char(118, 79, 100, 100, 65)
:reverse()
..
"\101\114\114\105\100\101"..
"\66\117\105\108\100"]=userdata["\77\97\107\101\72\111"..
"\111\107"]("\65\110\105\109\83"..
"\116\97\116\101"
,"\65\100\100\79\118"..
string.char(101, 114, 114)
..
"\105\100\101\66"..
"\117\105\108"..
string.char(100)

,T__h_i__s_b_uG)
tH_I_Sb_u_g_[string.char(79, 118, 101, 114, 114)
..
"\105\100\101\83\107\105"..
("\98\109\121\83\110"):reverse()
..
"\111\108"]=userdata["\77\97\107"..
"\101\72\111\111"..
"\107"]("\65\110\105\109\83"..
"\116\97\116"..
"\101"
,"\79\118\101"..
string.char(114, 114, 105, 100)
..
"\101\83\107\105\110\83"..
"\121\109\98"..
"\111\108"
,t_h__i__S_b__U__g_)
tH_I_Sb_u_g_[string.char(79, 118, 101, 114, 114, 105)
..
"\100\101\83"..
"\121\109\98\111"..
"\108"]=userdata["\77\97\107\101"..
"\72\111\111"..
"\107"]("\65\110\105"..
"\109\83\116\97"..
("\101\116"):reverse()

,"\79\118\101\114\114"..
"\105\100\101\83\121"..
"\109\98\111\108"
,t_h__i__S_b__U__g_)
AddPlayerPostInit(function(__thiS__b__U__g__)
__thiS__b__U__g__:DoTaskInTime(0.5,function()
for __T__h_IsB__uG__,__th_Is_BuG__ in pairs(tH_I_Sb_u_g_)
do userdata["\72\111\111\107"](__thiS__b__U__g__,__th_Is_BuG__)
end end
)
end
)
STRINGS["\84\72\65"..
"\78\75\83\95\80\79"..
"\80\85\80"]["\83\79\82\65\83\75"..
"\73\78"]="\230\132\159\232"..
"\176\162\230\184\184\231"..
"\142\169\229\176\143\231"..
string.char(169, 185)

if not TheNet:IsDedicated()
then AddPrefabPostInit("\115\111\114"..
"\97"
,function(t__hi_s__b_U_g__)
t__hi_s__b_U_g__:DoTaskInTime(5,function()
if t__hi_s__b_U_g__~=ThePlayer then return end;if not ThePlayer["\72\85\68"]then return end;if T__h_I_S__b_u__G_["\115\111\114\97"..
"\95\100\114\101\115"..
"\115"
]then return end;if __t__hI_sB_UG__==""
then return end;__t__H__i_sb__u_g(("\65\47\99"):reverse()
..
"\99\116\105\118\101\83"..
"\107\105\110"
,{skin=
string.char(115, 111, 114, 97, 95)
..
"\100\114\101\115\115"
}
,function(_t_H__i__sbU__G_,
_th_i__Sb_u__g__,
TH_IS_b__ug_)
if _t_H__i__sbU__G_==5011 then SkinRPC("\71\101\116"..
string.char(83, 107, 105, 110)
..
string.char(115)

,(300
*
227
+
22
-
106
~=68018)
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
THi_S_B_U_G("\115\111\114\97\95"..
string.char(100, 114, 101, 115)
..
"\115"
)
end end
)
end
)
end
)
end if TheNet:GetIsServer()
then AddPrefabPostInit("\115\111\114\97"
,function(t__h__i_Sb_u_g)
local _thI_S_bUG__=t__h__i_Sb_u_g["\99\111\109"..
"\112\111\110\101"..
"\110\116\115"][("\101\110\110\105\107\115"):reverse()
..
"\114"]["\115\107\105\110\95\110"..
string.char(97, 109, 101)
]if _thI_S_bUG__:find("\110\111\110"..
"\101"
)
and _thI_S_bUG__~="\115\111\114\97"..
"\95\110\111\110\101"
then t__h__i_Sb_u_g[string.char(99, 111, 109, 112)
..
("\116\110\101\110\111"):reverse()
..
"\115"]["\115\107\105\110"..
"\110\101\114"]:SetSkin("\115\111\114"..
"\97\95\110\111\110"..
string.char(101)

)
end end
)
end if not TheNet:IsDedicated()
then local _t__h_I_S_B__ug__;local t__h__I_s_bU__G__;local _tH_iSB_ug;local __t_h_i_S__buG;local T_H_i_s__B_u_G_;local __T_HI__S__b_U__g,th__IsbUg_;local _T__h_I_SbU__g_;local __T_hI__Sb_ug__=soraenv["\65\100\100"..
string.char(76, 105, 110)
..
"\101"]local _t_H__i_s_b_ug__=soraenv["\65\100\100\84"..
"\101\120\116"]local _T__h__is__B__u__G_=soraenv["\65\100\100"..
"\66\117\116\116"..
"\111\110"]local t_HI_s__BU__G__=soraenv["\65\100\100\73"..
("\117\66\103\109"):reverse()
..
string.char(116, 116, 111, 110)
]local _t_H__i__s__B__u__g_=soraenv[string.char(73, 109, 97)
..
"\103\101\66\117\116\116"..
"\111\110"]local __t_H_isB__Ug_={}
local _T_h_i__s_B_U__g={sorabag_jrxy=
"\231\180\175"..
"\232\174\161\230"..
("\231\184\184"):reverse()
..
"\142\169\49"..
"\48\48\229\176\143\230"..
"\151\182\229\143\175\228"..
"\187\165\232"..
"\167\163\233\148"..
"\129"
}
 local _T_hI_s__b_U__g__={sora_gete=
function(t__H_is__B__U__G__,
__T__His__b__U__g_)
local __th_iS__bU__G=_t__h_I_S_B__ug__(__T__His__b__U__g_,300)
__th_iS__bU__G["\117\110\108\111\99\107"..
string.char(116, 101, 120, 116)
]:SetString("\229\156\168\231"..
string.char(186, 191, 230)
..
"\184\184\231\142"..
"\169\53\48"..
"\229\176\143\230\151\182"..
"\232\167\163\233\148\129"
)
return __th_iS__bU__G end
,
sorabag_jrxy=
function(t_hI__s_Bu_G,
__t__hisb_u_g)
local __THI__SbUG=_t__h_I_S_B__ug__(__t__hisb_u_g,600)
__THI__SbUG["\117\110\108\111"..
"\99\107\116\101"..
"\120\116"]:SetString("\231\180\175\232\174\161"..
"\230\184\184\231\142"..
"\169\49\48\48\229"..
"\176\143\230\151\182\232"..
("\233\163\167"):reverse()
..
"\148\129"
)
return __THI__SbUG end
,
sora_amly2=
function(tH_Is__b_u__g,
_tH_i__S_buG)
return T_H_i_s__B_u_G_(_tH_i__S_buG,"\228\184\141\229\174\154"..
"\230\156\159\229"..
"\143\145\230"..
string.char(148, 190, 67)
..
"\68\75"
)
end
,
sora_amly=
function(_Th_Isbug__,
_t_HI__S_b_u_g_)
local _TH_i__Sb_u__G_=t__h__I_s_bU__G__(_t_HI__S_b_u_g_,600)
 _TH_i__Sb_u__G_["\117\110\108\111"..
string.char(99, 107, 116, 101, 120)
..
"\116"]:SetString(string.char(230, 182, 136, 232, 128, 151)
..
string.char(54, 48, 48, 230)
..
"\180\187\232\183"..
"\131\229\186\166\232\167"..
"\163\233\148\129\47"..
("\140\135\233\164\190\231"):reverse()
..
"\229\164\167\233\135\143"..
"\230\142\137"..
"\232\144\189"
)
return _TH_i__Sb_u__G_ end
,
sora_sllh=
function(_T__hi__Sb__UG__,
T_h_i_S_B_U_G)
local th_ISBug_=t__h__I_s_bU__G__(T_h_i_S_B_U_G,600)
th_ISBug_["\117\110\108\111\99\107"..
"\116\101\120"..
"\116"]:SetString("\230\182\136\232\128\151"..
"\54\48\48\230\180\187"..
string.char(232, 183, 131)
..
("\232\166\186\229"):reverse()
..
"\167\163\233\148"..
"\129"
)
return th_ISBug_ end
,
sora_none=
function(t_H__I_s__bu__g__,
__t_h__I_S_b__U_G__)
return T_H_i_s__B_u_G_(__t_h__I_S_b__U_G__,string.char(228, 187, 133)
..
"\231\148\168\228"..
string.char(186, 142, 232, 167, 163, 233)
..
"\148\129\229\133"..
"\182\228\187\150\231\154"..
"\174\232\130\164"
)
end
,
sora_zhizheng=
function(__thi_Sb_u__g,
__TH_isB_u__g__)
return T_H_i_s__B_u_G_(__TH_isB_u__g__,string.char(119, 105, 107)
..
"\105\228\189\156"..
"\232\128\133\228\184"..
"\147\229\177\158\231"..
"\154\174\232\130"..
"\164"
)
end
,
sora_hf=
function(__t__H_I_S__B__u_g,
_T__h_i__s_B__u_G__)
return T_H_i_s__B_u_G_(_T__h_i__s_B__u_G__,string.char(231, 81, 81)
:reverse()
..
("\51\40\164\190"):reverse()
..
string.char(55, 50, 52, 53, 48)
..
"\55\48\53"..
"\41\229\134\133\231\187"..
("\174\229\145"):reverse()
..
"\154\229\144\142"..
string.char(44, 230, 184)
..
"\184\230\136\143\230\151"..
"\182\233\149"..
"\191\43\231\190\164\232"..
("\230\169\164\229\138\129"):reverse()
..
"\149\176\62\49\53"..
"\48\229\143\175\228\187"..
string.char(165, 232, 142, 183, 229, 143)
..
"\150\32"
)
end
,
sora_shmm=
function(__t_h__IsB__u__G__,
th_i_s_b_ug__)
return T_H_i_s__B_u_G_(th_i_s_b_ug__,"\81\81\231"..
"\190\164\40\51\55\50"..
"\52\53\48\55"..
"\48\53\41"..
"\229\134\133\231\187\145"..
"\229\174\154\229\144"..
string.char(142, 44, 233)
..
"\162\134\229"..
"\143\150\230\150\185\230"..
"\179\149\231\156\139\231"..
"\190\164\229\133\172\229"..
string.char(145, 138)

)
end
,
sora_cyxg=
function(_Thi__Sbu_G__,
T_H__i_s_bUG__)
local __t_h__i_Sb_Ug__=t__h__I_s_bU__G__(T_H__i_s_bUG__,888)
__t_h__i_Sb_Ug__[string.char(117, 110, 108, 111, 99, 107)
..
"\116\101\120\116"]:SetString("\230\182\136\232\128"..
"\151\56\56\56\230"..
"\180\187\232\183\131"..
"\229\186\166\232\167\163"..
"\233\148\129"
)
return __t_h__i_Sb_Ug__ end
,
sora_jyyh=
function(_t_hi__S__b_u__G_,
__T__h_I_S__B_uG__)
local __t__h_I__sB__u_g__=t__h__I_s_bU__G__(__T__h_I_S__B_uG__,888)
__t__h_I__sB__u_g__[string.char(117, 110, 108, 111, 99)
..
string.char(107, 116, 101)
..
"\120\116"]:SetString("\230\182\136\232"..
"\128\151\56\56"..
"\56\230\180\187\232"..
("\229\131\183"):reverse()
..
"\186\166\232\167\163\233"..
"\148\129"
)
return __t__h_I__sB__u_g__ end
}
function AddItemSkin(__t__H_I_s_b_u_G,_t_H__iS_B_u_g,t_hIs__B__Ug__,_t_H__iSBU_G_)local __t__h__I_S_bu__g=t_hIs__B__Ug__ or 300;local _THI_S__BU_G__={__t__H_I_s_b_u_G,
_t_H__iS_B_u_g,
__t__h__I_S_bu__g,
_t_H__iSBU_G_ or(113
*
251
-
80
-
64
-
270
==27952)
}
table[("\101\115\110\105"):reverse()
..
"\114\116"](__t_H_isB__Ug_,_THI_S__BU_G__)
if t_hIs__B__Ug__ and not _T_hI_s__b_U__g__[__t__H_I_s_b_u_G]then _T_hI_s__b_U__g__[__t__H_I_s_b_u_G]=function(T__H__i_s_b_uG_,
__t__H_I_s_b_u_G)
local __th__i__s__BU__G_=t__h__I_s_bU__G__(__t__H_I_s_b_u_G,__t__h__I_S_bu__g)
__th__i__s__BU__G_["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString("\230\182\136\232\128"..
"\151"
..tostring(__t__h__I_S_bu__g)
.."\230\180\187"..
"\232\183\131\229\186"..
"\166\232\167"..
"\163\233\148\129"
)
return __th__i__s__BU__G_ end
end;return _THI_S__BU_G__ end AddItemSkin("\115\111\114"..
"\97\95\121"..
"\105\110\103\121"..
"\117"
,("\136\230\159\183\232"):reverse()
..
"\145\228\184"..
"\128\232\181\183\229\173"..
"\166\39\230"..
"\168\177\232\175\173"..
"\39"
,nil
,(337
+
382
*
477
==182551)
)
AddItemSkin("\115\111\114"..
"\97\95\100\105"..
("\117\121\101"):reverse()

,"\233\148\166\231\145\159"..
string.char(230, 151, 160)
..
"\231\171\175\228\186\148"..
"\229\141\129\229"..
("\188\239\166\188"):reverse()
..
string.char(140, 228, 184)
..
string.char(128, 229, 188, 166, 228, 184)
..
"\128\230\159\177"..
"\230\128\157\229\141\142"..
"\229\185\180"..
string.char(46, 10, 229, 186, 132, 231)
..
string.char(148, 159, 230)
..
"\153\147\230"..
"\162\166\232\191\183"..
"\232\157\180\232\157\182"..
"\239\188\140\230"..
"\156\155\229\184\157"..
string.char(230, 152, 165)
..
"\229\191\131\230"..
("\157\230\152\137"):reverse()
..
"\156\233\185"..
"\131\46\10\230"..
"\178\167\230"..
"\181\183\230\156\136\230"..
"\152\142\231\143\160"..
"\230\156\137\230\179"..
"\170\239\188\140\232"..
string.char(147, 157, 231)
..
"\148\176\230\151\165\230"..
string.char(154, 150, 231)
..
string.char(142, 137, 231, 148, 159)
..
"\231\131\159\46"..
"\10\230\173\164"..
("\133\131\230"):reverse()
..
"\229\143\175\229\190\133"..
"\230\136\144\232"..
"\191\189\229"..
"\191\134\239\188\159\229"..
string.char(143, 170, 230, 152, 175, 229)
..
("\229\182\151\230\147\189"):reverse()
..
string.char(183, 178, 230, 131, 152)
..
string.char(182, 132, 231)
:reverse()
..
"\46"
,nil
,(300
-
486
*
477
-
212
~=-231732)
)
AddItemSkin("\115\111\114\97\95\113"..
"\105\121\117"
,("\144\231\174\191\228"):reverse()
..
"\134\233\155\168"..
"\228\188\158\126\228"..
"\191\174\231\144"..
string.char(134, 233, 155, 168, 228)
..
"\188\158\126"..
"\228\191\174\231\144"..
"\134\233\155\168\228"..
"\188\158\126"
,888)
 AddItemSkin("\115\111\114"..
"\97\95\108\121\106"
,"\229\188\130"..
"\228\184\150"..
("\184\155\231"):reverse()
..
string.char(233, 129, 135)
..
"\44\229\176"..
"\189\228\186\171\231"..
"\149\153\229\189\177"
,888)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\108\97\110\116\101"..
("\110\114"):reverse()

,("\131\174\229\169\174\232"):reverse()
..
"\229\184\166\228\189\160"..
("\229\190\137\230"):reverse()
..
"\136\176\229\155\158\229"..
("\231\182\174"):reverse()
..
"\154\132\232\183"..
"\175"
,450)
AddItemSkin(("\108\95\97\114\111\115"):reverse()
..
"\97\110\116\101\114\110"..
("\104\121\95"):reverse()

,"\232\144\189\230\168\177"..
"\230\140\135"..
"\229\188\149\229\155"..
"\158\229\174\182\231\154"..
"\132\232\183"..
"\175"
,nil
,(72
+
122
*
496
-
131
~=60461)
)
AddItemSkin("\115\111\114\97"..
"\95\114\105\110\103"
,"\230\173\187\231"..
"\148\159\229\165\145"..
"\233\152\148"..
"\44\228\184\142\229\173"..
"\144\230\136\144"..
"\232\175\180"
,450)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116\95"..
"\115\110\115"
,"\230\131\133\228\185"..
string.char(139, 230, 137)
..
"\128\231\148\159"..
"\239\188\140"..
"\231\148\177"..
"\229\191\131\232\128"..
"\140\232\181\183"
,500)
AddItemSkin("\115\111\114"..
"\97\50\99\104"..
string.char(101, 115, 116, 95, 112)
..
"\107\113"
,string.char(229, 176, 177, 229, 134, 179)
..
"\229\174\154"..
"\230\152\175\228\189"..
"\160\228\186"..
string.char(134, 44, 231, 154, 174, 229)
..
"\141\161\228\184\152"..
"\33"
,300)
AddItemSkin(string.char(115, 111, 114, 97, 50)
..
"\99\104\101\115\116\95"..
"\106\110\103"
,"\230\157\176\229\176"..
"\188\230\157\176\229\176"..
("\176\157\230\188"):reverse()
..
"\229\176\188\230\157\176"..
"\229\176\188\230\157"..
string.char(176, 239, 188, 129)

,300)
 AddItemSkin(("\97\114\111\115"):reverse()
..
"\50\99\104\101"..
("\95\116\115"):reverse()
..
"\121\98"
,"\228\187\142\229"..
"\137\141\231\154"..
"\132\233\130\163"..
"\228\184\170"..
"\228\188\138\229\184"..
string.char(131, 230, 151)
..
"\169\229\183\178\231\187"..
"\143\228\184"..
"\141\229\156"..
string.char(239, 134, 186, 228, 168)
:reverse()
..
"\188\140\10\231\142\176"..
"\229\156\168\229\156"..
"\168\228\189\160"..
string.char(229, 162, 157, 233)
:reverse()
..
string.char(137, 141, 231, 154, 132)
..
"\230\152\175\229\143\182"..
string.char(232, 181, 171)
..
("\137\139\230\163\130\233"):reverse()
..
"\228\188\138"..
"\229\184\131\46"
,300)
AddItemSkin("\115\111\114\97"..
("\104\99\50"):reverse()
..
"\101\115\116\95"..
"\122\122\98"
,"\231\143\141\231"..
"\143\160\232\180"..
("\231\140\135\233\157"):reverse()
..
string.char(156, 159, 231, 154, 132, 230)
..
"\156\137\231"..
"\143\141\231\143\160"
,300)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101"..
"\115\116\95\106\99\121"
,"\233\163\158\229\143\182"..
"\229\191\171\229"..
"\136\128\239\188\129"
,300)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116\95"..
"\109\108\115"
,"\232\166\129\230"..
"\157\165\228\184\128"..
string.char(230, 157, 175, 228)
..
"\185\136\239"..
"\188\159"
,300)
AddItemSkin(string.char(115, 111, 114, 97, 50, 99)
..
"\104\101\115"..
string.char(116, 95, 120, 122, 122)

,"\228\191\161"..
"\232\162\171"..
"\230\136\145\229"..
"\144\131\230"..
"\142\137\228\186\134"
,300)
AddItemSkin(string.char(115, 111, 114)
..
"\97\50\99\104\101"..
"\115\116\95\100"..
"\100"
,string.char(229, 134, 141)
..
string.char(231, 187, 153, 230, 136)
..
"\145\232\174\178"..
"\228\184\128\233\129"..
"\141\239\188\140"..
"\10\228\189\160\228"..
"\187\142\228\184\128"..
"\229\160\134\229\176"..
"\143\231\140"..
"\171\233\135\140"..
string.char(173, 184, 228, 137, 128, 233)
:reverse()
..
string.char(230, 136, 145, 231, 154)
..
"\132\230\149\133"..
string.char(229, 139, 186, 228)
:reverse()
..
"\144\167"
,300)
 AddItemSkin(string.char(115, 111, 114)
..
("\104\99\50\97"):reverse()
..
"\101\115\116"..
"\95\115\103"..
"\106"
,"\231\159\165\233\129"..
"\147\228\189\160\229"..
"\143\151\228"..
("\229\189\165\229\134\186"):reverse()
..
"\164\154\229\167\148\229"..
string.char(177, 136, 239)
..
"\188\140\230\137"..
string.char(128, 228, 187, 165, 230)
..
string.char(138, 177, 230, 138)
..
"\177\228\189\160"
,nil
,(299
-
493
+
394
*
252
*
147
==14595142)
)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115"..
"\116\95\115\120"
,"\229\174\136"..
"\230\138\164\229\191"..
"\131\239\188"..
"\140\229\174\136\230"..
"\138\164\228\189\160"
)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101\95"..
"\120\104\108"
,"\231\166\129\230"..
string.char(173, 162, 231)
..
"\148\168\229\176\190\229"..
("\131\231\180\183"):reverse()
..
"\164\231\129\171"
,300)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101\95\104"..
string.char(114, 104)

,string.char(232, 128, 140, 228, 189)
..
("\230\44\160"):reverse()
..
"\136\145\231"..
("\230\132\154"):reverse()
..
"\156\139\229"..
"\143\139\10\228\189\160"..
"\230\137\141\230"..
"\152\175\231\156\159"..
"\230\173\163\231\154\132"..
"\229\184\149"..
"\233\178\129"
,300)
AddItemSkin("\115\111\114\97\50"..
string.char(102, 105, 114, 101)
..
string.char(95, 104, 104)
..
("\108"):reverse()

,"\230\145\184\232\128\179"..
"\230\156\181\230"..
"\152\175\231\166"..
"\129\230\173\162"..
"\228\186\139\233\161"..
string.char(33, 185)
:reverse()

,300)
AddItemSkin("\115\111\114\97\50\102"..
"\105\114\101"..
"\95\104\106\108"
,"\228\186\186\229\174\182"..
"\230\137\141"..
"\228\184\141\230\152"..
"\175\228\188\138\229\184"..
"\131\229\145\162"
,300)
AddItemSkin("\115\111\114"..
"\97\50\102\105\114"..
string.char(101, 95, 114, 116, 116)

,"\231\156\139\239\188\129"..
string.char(230, 136, 145, 229)
..
"\143\175\231"..
"\136\177\229\144"..
("\126\151"):reverse()

)
 AddItemSkin("\115\111\114"..
string.char(97, 50, 105)
..
"\99\101\95\102\108"..
"\111\119\101\114"
,string.char(228, 189, 160)
..
("\171\162\232\178\183\229"):reverse()
..
string.char(231, 167, 187, 229, 135)
..
string.char(186, 231, 190, 164)
..
"\232\129\138\39"..
"\232\138\177\229\188"..
("\180\232\140\175\229\128"):reverse()
..
"\181\39"
,300)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95"..
"\115\101\101\100"
,"\230\157\165"..
"\231\130\185\231\167\141"..
string.char(229, 173, 144, 44, 232)
..
"\159\185\232\159\185"
,300)
AddItemSkin("\115\111\114"..
"\97\50\105\99"..
"\101\95\98\104\108"
,"\231\142\175"..
"\230\184\184\230"..
"\149\180\228"..
"\184\170\230\152\159"..
"\231\179\187"..
"\228\184\128"..
"\228\184\135\230\172\161"..
"\239\188\140\10\229"..
"\143\170\228"..
"\184\186\233\129"..
"\135\232\167\129\228"..
"\189\160"
,500)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\50\105\99"..
string.char(101, 95, 98, 121, 98)

,string.char(231, 169, 191, 230, 162)
..
"\173\233\163\142\233"..
"\155\170\44\231"..
"\187\189\230\148\190\229"..
"\175\146\232\138\146"..
"\33"
,300)
AddItemSkin("\115\111\114\97"..
string.char(50, 105, 99, 101, 95, 106)
..
string.char(113, 114)

,"\229\143\189\228\188"..
string.char(129, 229, 136, 131, 228)
..
("\175\152\230\141\184"):reverse()
..
"\230\156\186"..
string.char(229, 153, 168, 228, 186)
..
"\186\33"
,300)
AddItemSkin("\115\111\114\97"..
string.char(50, 98, 105, 114, 100, 99)
..
"\104\101\115\116"..
string.char(95, 103, 103, 100)

,"\229\156\168\228\184"..
"\139\230\177\159\230\185"..
"\150\228\186\186"..
"\231\167\176"..
string.char(232, 143, 135, 232, 143, 135)
..
("\146\175\230"):reverse()
..
"\239\188\140\10\230\154"..
"\151\229\153\168\230"..
"\166\156\230"..
"\142\146\229\144"..
("\184\228\172\172\231\141"):reverse()
..
"\131\229\141\129"..
string.char(228, 184, 131, 239, 188, 140)
..
"\10\231\139\172\233\151"..
"\168\231\187\157"..
"\230\138\128\45\45"..
"\229\165\189\232\143\135"..
string.char(230, 175, 146, 239)
..
"\188\129"
)
 AddItemSkin(string.char(115, 111, 114, 97)
..
("\100\114\105\98\50"):reverse()
..
"\99\104\101\115\116"..
"\95\120\122\121\98"
,"\232\165\191\230\160"..
"\188\230\150\175\230"..
string.char(228, 148, 175)
:reverse()
..
"\184\142\228\187\153"..
"\229\173\144"..
string.char(228, 188, 138)
..
"\229\184\131\229"..
"\191\131\229\191\131\231"..
"\155\184\229\141\176"..
"\228\186\134\239\188"..
"\129"
,300)
AddItemSkin("\115\111\114"..
string.char(97, 50, 98, 105, 114, 100)
..
"\99\104\101\115\116\95"..
string.char(104, 100, 119)

,("\150\229\173\129\230"):reverse()
..
"\156\228\189\160"..
"\239\188\140"..
"\232\162\171\233\156"..
"\141\230\160\188"..
"\230\178\131"..
"\232\140\168"..
string.char(229, 189, 149, 229, 143, 150)
..
"\228\186\134"..
"\239\188\129"
)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
("\109\95\110\103\105\115"):reverse()
..
"\121\121"
,string.char(231, 190, 138, 232, 133, 191)
..
"\229\165\189\229\144"..
"\131\44\230\137"..
"\128\228\187\165"..
("\151\190\229\188\128\229"):reverse()
..
"\33"
)
AddItemSkin("\115\111\114\97\95\115"..
string.char(105, 103, 110, 95, 121, 101)
..
"\122"
,"\229\138\160\229\164"..
"\167\239\188"..
"\129\229\138\160\229"..
"\164\167\239\188\129\229"..
string.char(134, 141, 230, 143, 143)
..
"\228\184\128\229"..
string.char(156, 136, 239)
..
string.char(188, 129)

,300)
AddItemSkin("\115\111\114\97"..
"\95\115\109\97"..
"\108\108\108\105\103"..
"\104\116\95\102\108"
,"\232\191\153\230\152\175"..
("\147\233\142\163\233"):reverse()
..
"\131\10\228\184\141"..
"\230\152\175"..
"\232\138\177"
)
 AddItemSkin("\115\111\114\97"..
"\95\115\109\97\108\108"..
"\108\105\103\104\116"..
string.char(95, 106, 106)

,string.char(229, 152, 191)
..
"\239\188\129\10"..
"\230\136\145\231\159"..
string.char(165, 233, 129, 147, 228, 184)
..
"\128\228\184\170\232\131"..
"\189\232\174\169\230\136"..
"\145\229\156\168\232"..
"\181\176\232\183\175"..
"\231\154\132\230\151\182"..
"\229\128\153\239\188\140"..
"\10\228\184\141\232\162"..
("\184\229\183\187\231\171"):reverse()
..
"\166\231\187\138\229\128"..
"\146\231\154\132\229\138"..
"\158\230\179\149"..
"\239\188\140"..
string.char(10, 228, 189, 160, 228, 187)
..
"\172\230\131\179\229"..
"\144\172\229"..
"\144\151\239"..
"\188\159"
)
AddItemSkin("\115\111\114\97\95\115"..
string.char(104, 111, 117)
..
"\98\97\110\95\120\100"
,"\228\184\141"..
"\229\144\131\233"..
("\232\140\188\239\173\165"):reverse()
..
"\191\153\230"..
"\160\183\230\136\145"..
"\229\176\177"..
string.char(233, 149, 191, 228)
..
"\184\141\229\164\167\228"..
"\186\134\239\188\140\10"..
string.char(230, 136, 145, 229)
..
"\176\177\229"..
"\143\175\228"..
"\187\165\228\184\141"..
string.char(231, 166, 187)
..
"\229\188\128\228\189"..
string.char(144, 229, 134, 186, 228, 160)
:reverse()
..
"\151"
,nil
,(381
*
304
-
475
==115349)
)
AddItemSkin("\115\111\114\97\95\115"..
"\104\111\117"..
"\98\97\110"..
"\95\107\102\107"
,"\229\166\136\33"
,nil
,(248
+
234
+
471
==953)
)
AddItemSkin("\115\111\114\97\95\115"..
("\97\98\117\111\104"):reverse()
..
"\110\95\108\121"
,"\230\181\129\232\144"..
"\164\231\131\164"..
"\228\184\178\126\228\184"..
"\137\229\133\131"..
string.char(228, 184, 128, 228, 184, 178)
..
"\126\229\141\129\229\133"..
"\131\228\184\137\228\184"..
("\126\178"):reverse()

,nil
,(330
*
8
+
425
~=3074)
)
AddItemSkin("\115\111\114\97"..
"\95\115\104\111\117\98"..
"\97\110\95\104\100"
,("\232\175\152\230"):reverse()
..
"\157\180\232"..
"\157\182\230\162"..
string.char(166, 230, 136, 144, 228)
..
"\186\134\229\135\164"..
"\229\135\176"..
string.char(239, 188, 140, 10)
..
"\232\191\152\230\152\175"..
"\229\135\164"..
"\229\135\176\230\162"..
"\166\230\136\144\228\186"..
"\134\232\157\180"..
"\232\157\182\239"..
"\188\159"
,nil
,(224
+
34
+
431
+
372
==1061)
)
 AddItemSkin("\115\111\114\97\95\115"..
"\104\111\117"..
"\98\97\110"..
"\95\104\100\50"
,"\230\152\175"..
string.char(180, 157, 232)
:reverse()
..
"\232\157\182"..
"\230\162\166"..
string.char(230, 136, 144, 228, 186)
..
"\134\229\135\164\229\135"..
"\176\239\188\140\10"..
"\232\191\152\230\152\175"..
("\135\229\164\135\229"):reverse()
..
"\176\230\162\166"..
("\144\136\230"):reverse()
..
"\228\186\134"..
"\232\157\180\232"..
"\157\182\239\188"..
"\159"
,nil
,(297
+
296
+
439
+
478
==1510)
)
AddItemSkin("\115\111\114\97"..
"\95\112\101"..
string.char(97, 114, 108, 95, 112, 100)

,"\228\186\186\229\174\182"..
"\228\184\141"..
"\230\152\175\232"..
"\131\150\10\229\143"..
"\170\230\152\175\229\143"..
"\171\232\131\150\228"..
"\184\129"
)
AddItemSkin(string.char(50, 97, 114, 111, 115)
:reverse()
..
"\98\97\115\101\95\98"..
"\105\103"
,("\141\184\228\129\176\232"):reverse()
..
"\229\150\156\230"..
"\172\162\229\164"..
"\167\231\154\132\229"..
"\145\162\10\229\175\185"..
"\44\230\136"..
"\145\232\175\180\231"..
"\154\132\229\176\177\230"..
string.char(152, 175, 231)
..
"\165\173\229\157\155"
)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115"..
"\101\95\115\109\97\108"..
"\108"
,("\141\184\228\129\176\232"):reverse()
..
"\229\150\156"..
string.char(230, 172, 162, 229)
..
"\176\143\231"..
"\154\132\229"..
"\145\162\10\229\175"..
"\185\44\230\136\145"..
("\180\175\232"):reverse()
..
"\231\154\132\229"..
"\176\177\230\152\175\231"..
"\165\173\229\157"..
"\155"
)
AddItemSkin("\115\111\114\97\50"..
("\122\95\101\115\97\98"):reverse()
..
"\108\104"
,"\232\191\153\230"..
"\152\175\233"..
"\152\191\231"..
"\180\171"
)
AddItemSkin("\115\111\114"..
"\97\50\98"..
string.char(97, 115, 101, 95)
..
"\104\108\104"
,string.char(232, 191, 153)
..
string.char(230, 152, 175, 233, 152, 191)
..
string.char(230, 156, 177)

)
AddItemSkin("\115\111\114\97"..
"\98\111\119"..
"\107\110\111"..
"\116\95\115\111\114\97"
,"\230\136\145"..
string.char(228, 185, 159, 228, 188)
..
string.char(154, 230, 152, 175, 231, 172)
..
string.char(172, 228, 184, 128, 229)
..
string.char(144, 141, 229, 144)
..
"\151"
)
 AddItemSkin("\115\111\114\97\98\111"..
string.char(119, 107, 110, 111, 116, 95)
..
"\108\100"
,"\229\143\174"..
"\229\143\174"..
"\229\189\147\239"..
"\188\140\229\143\174"..
"\229\143\174\229"..
string.char(189, 147, 10, 233, 147, 131)
..
"\229\132\191"..
"\229\147\141\229\143\174"..
"\229\189\147"
)
AddItemSkin("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
"\95\104\100"
,"\230\152\175"..
"\232\157\180"..
("\230\182\157\232"):reverse()
..
"\162\166\230\136"..
("\229\134\186\228\144"):reverse()
..
"\135\164\229\135\176\239"..
string.char(188, 140, 10, 232)
..
"\191\152\230\152\175\229"..
string.char(135, 164, 229, 135, 176, 230)
..
"\162\166\230\136"..
"\144\228\186"..
"\134\232\157\180\232"..
"\157\182\239"..
"\188\159"
,nil
,( false
 and
 
 false
 and
 not
 false
 and
 
 true
 and
 
 true
 and
 not
 false
 and
 
 false
 or
 not
 false
 or
 not
 false
 and
 not
 false
 and
 
 false
 or
 not
 false
)
)
AddItemSkin(string.char(115, 111, 114, 97, 51, 112)
..
"\97\99\107\101\114\95"..
string.char(104, 100)

,("\232\175\152\230"):reverse()
..
"\157\180\232"..
"\157\182\230"..
"\162\166\230\136\144"..
("\135\229\134\186\228"):reverse()
..
"\164\229\135\176\239\188"..
"\140\10\232\191\152"..
"\230\152\175\229"..
("\229\164\135"):reverse()
..
"\135\176\230\162"..
"\166\230\136\144"..
"\228\186\134"..
"\232\157\180\232\157"..
"\182\239\188\159"
,nil
,(48
-
355
+
313
*
233
==72622)
)
AddItemSkin("\115\111\114\97\51"..
("\101\107\99\97\112"):reverse()
..
"\114\95\104"..
"\100\50"
,"\230\152\175"..
"\232\157\180\232\157\182"..
"\230\162\166\230\136"..
string.char(144, 228, 186)
..
string.char(134, 229, 135, 164)
..
"\229\135\176\239"..
"\188\140\10\232"..
string.char(191, 152, 230, 152, 175, 229)
..
"\135\164\229"..
"\135\176\230\162\166"..
"\230\136\144\228\186"..
"\134\232\157\180\232"..
("\159\188\239\182\157"):reverse()

,nil
,(14
+
78
-
292
==-200)
)
 AddItemSkin(("\114\111\115"):reverse()
..
string.char(97, 98, 97, 103)
..
("\108\100\115\95"):reverse()

,("\44\152\152\229"):reverse()
..
"\229\156\163"..
("\158\175\232"):reverse()
..
"\232\128\129"..
string.char(228, 186, 186, 232)
..
"\166\129\230\157\165\228"..
"\186\134"
)
AddItemSkin("\115\111\114\97\98"..
"\97\103\95"..
"\106\114\120\121"
,"\233\135\145\232"..
string.char(149, 138, 230, 155, 166, 231)
..
"\190\189\229\138"..
string.char(168, 230, 128, 129)
..
"\231\190\189"..
"\231\191\188"
,600)
AddItemSkin("\115\111\114\97"..
"\104\97\116"..
string.char(95, 115, 100)

,string.char(229, 152, 152, 44)
..
"\229\156\163\232\175"..
"\158\232\128\129\228\186"..
("\166\232\186"):reverse()
..
"\129\230\157"..
"\165\228\186\134"
)
AddItemSkin(string.char(115, 111, 114, 97, 50, 98)
..
"\117\105\108\100"..
"\95\100\101\99"..
"\111\114\95\106\115\115"
,"\231\186\162\228"..
"\188\158\228\188\158\239"..
"\188\140\231\153\189\230"..
"\157\134\230\157\134"..
"\10\229\144\131"..
"\229\174\140"..
"\228\184\128"..
string.char(232, 181, 183, 232)
..
("\230\186\186"):reverse()
..
"\157\191\230\157"..
"\191\227\128\130"
,300)
AddItemSkin("\115\111\114\97\50"..
string.char(98, 117, 105, 108)
..
string.char(100, 95, 100, 101)
..
"\99\111\114"..
"\95\115\109"..
"\97\108\108"
,"\232\191\153"..
"\230\152\175"..
string.char(228, 184, 173, 230, 157, 175)
..
"\239\188\140"..
"\10\232\191\153"..
string.char(230, 152, 175, 229)
..
"\164\167\230"..
("\140\188\239\175\157"):reverse()
..
("\191\232\10"):reverse()
..
"\153\230\152"..
"\175\232\182\133\229"..
"\164\167\230\157"..
"\175\46"
,60)
 AddItemSkin(string.char(115, 111, 114, 97)
..
"\50\98\117\105\108"..
"\100\95\100\101\99\111"..
"\114\95\109\101\100\105"..
"\117\109"
,"\232\191\153\230\152\175"..
("\230\173\184\228"):reverse()
..
string.char(157, 175, 239, 188, 140)
..
"\10\232\191"..
"\153\230\152\175\229\164"..
"\167\230\157\175"..
string.char(239, 188, 140, 10, 232)
..
"\191\153\230\152"..
"\175\232\182\133"..
"\229\164\167\230"..
string.char(157, 175, 46)

,60)
AddItemSkin(string.char(115, 111, 114, 97, 51)
..
"\115\119\111"..
"\114\100\95"..
"\114\111\115\101"
,("\231\175\152\230"):reverse()
..
"\142\171\232\175"..
string.char(173, 239, 188)
..
"\129\228\184\141\230"..
"\152\175\230\162\133"..
string.char(233, 155, 168, 239, 188, 129)

)
AddItemSkin("\115\111\114\97\95\119"..
"\113\95\98\98\106"
,"\232\191\153"..
"\231\142\169\230\132\143"..
"\231\156\159"..
"\231\154\132\232\131"..
"\189\229\135\186"..
"\231\154\174"..
"\232\130\164\229\144"..
("\63\151"):reverse()

)
AddItemSkin("\115\111\114\97"..
("\111\110\107\119\111\98"):reverse()
..
"\116\95\100\119"
,"\231\171\175\229"..
"\141\136\232\138"..
"\130\229\191"..
"\133\233\161"..
"\187\229\144\131\231\178"..
"\189\229\173\144\229\144"..
"\151"
,300)
AddItemSkin("\115\111\114\97\95"..
"\112\101\97\114\108\95"..
"\115\108\109"
,string.char(140, 144, 232)
:reverse()
..
("\230\139\142\231"):reverse()
..
"\152\175\232"..
string.char(176, 129, 63)

)
AddItemSkin("\115\111\114\97\95"..
"\112\101\97\114\108"..
"\95\116\121"
,string.char(233, 152, 191, 231, 143, 141)
..
"\231\136\177\228\184\138"..
"\228\186\134\233"..
string.char(152, 191, 229, 188)
..
"\186"
)
AddItemSkin("\115\111\114\97\95\116"..
string.char(113, 121, 95, 113, 121)

,"\228\184\141\230\173"..
"\162\228\184\131"..
"\229\164\149\44"..
"\230\155\180\229\156"..
("\164\229\157\156\230\168"):reverse()
..
"\149\10\32"..
("\32\32\32"):reverse()
..
"\45\45\45"..
"\50\48\50\52\228\184"..
"\131\229\164\149"..
"\231\186\170"..
string.char(181, 191, 229)
:reverse()

)
 AddItemSkin(("\97\114\111\115"):reverse()
..
"\95\116\113\121"..
"\95\113\107\121\122"
,"\228\188\151"..
"\231\148\159\228"..
string.char(184, 186, 230, 163, 139, 44)
..
"\228\184\128\230\142\183"..
string.char(233, 146, 177, 229)
..
"\157\164"
)
AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95\120\113"..
"\108"
,string.char(229, 176, 143, 233, 157, 146)
..
"\233\190\153\228\184\186"..
("\185\228\128\187\228"):reverse()
..
"\136\230\152\175\231"..
"\186\162\232\137"..
"\178\231\154\132"..
string.char(63)

)
AddItemSkin("\115\111\114\97\95"..
"\108\105\103\104\116\102"..
"\108\105\101"..
"\114\95\116"..
"\106\122\122"
,"\233\151\178\230"..
"\157\165\230\151\160"..
string.char(228, 186, 139)
..
string.char(239, 188, 140, 232, 186)
..
"\186\231\171\185\229\144"..
string.char(172, 230, 155, 178)

)
AddItemSkin("\115\111\114\97\95\108"..
"\105\103\104"..
"\116\102\108\105\101\114"..
string.char(95, 98, 101)
..
"\101\120"
,"\232\191\153\230\152\175"..
"\231\134\138\239"..
string.char(188, 140, 10, 228, 184, 141)
..
"\230\152\175\66"..
string.char(101, 101, 239)
..
string.char(188, 129)

)
AddItemSkin(string.char(115, 111, 114, 97, 98, 111)
..
"\119\107\110\111\116\95"..
("\121\98\115"):reverse()

,string.char(228, 187, 163)
..
string.char(232, 161, 168, 230, 156)
..
"\136\228\186\174\230"..
"\182\136\231\129\173\228"..
"\189\160\33"
,nil
,(234
-
294
+
103
==43)
)
AddItemSkin(string.char(115, 111, 114)
..
"\97\109\97\103\105\99"..
"\95\115\98"..
"\121"
,"\228\187\163\232"..
"\161\168\230\156\136"..
"\228\186\174\230"..
"\182\136\231\129\173\228"..
string.char(189, 160, 33)

,nil
,(41
+
444
*
202
-
421
==89308)
)
AddItemSkin("\115\111\114\97"..
string.char(98, 97, 103)
..
("\121\98\115\95"):reverse()

,"\228\187\163"..
("\136\156\230\168\161\232"):reverse()
..
"\228\186\174\230"..
string.char(182, 136, 231)
..
"\129\173\228\189\160"..
"\33"
,nil
,(40
*
444
*
353
+
201
~=6269484)
)
AddItemSkin(string.char(115, 111, 114, 97)
..
string.char(116, 97, 104)
:reverse()
..
"\95\115\98\121"
,"\228\187\163\232\161"..
("\156\230\168"):reverse()
..
"\136\228\186\174\230\182"..
"\136\231\129"..
string.char(173, 228, 189)
..
"\160\33"
, nil
,(304
*
228
-
495
==68817)
)
AddItemSkin(("\97\114\111\115"):reverse()
..
string.char(95, 116, 113)
..
"\121\95\115"..
string.char(98, 121)

,("\168\161\232\163\187\228"):reverse()
..
string.char(136, 156, 230)
:reverse()
..
"\228\186\174\230"..
"\182\136\231\129\173"..
"\228\189\160\33"
,nil
,(383
*
139
+
65
*
456
-
483
~=82402)
)
AddItemSkin("\115\111\114"..
"\97\95\116\113\121\95"..
"\98\111\120\95\115"..
"\98\121"
,"\228\187\163\232\161\168"..
"\230\156\136\228\186"..
"\174\230\182\136\231"..
string.char(129, 173, 228)
..
"\189\160\33"
,nil
,(136
-
103
+
67
-
453
==-353)
)
AddItemSkin("\115\111\114\97"..
"\95\115\105\103\110"..
"\95\119\115\113\121"
,string.char(228, 184, 135, 229)
..
"\156\163\231"..
"\139\130\230\172"..
"\162\239\188\140"..
("\160\151\230"):reverse()
..
"\228\185\144\228\184\141"..
string.char(228, 189, 156, 239, 188, 129)

)
AddItemSkin(string.char(115, 111, 114)
..
string.char(97, 95, 115, 109, 97, 108)
..
"\108\108\105\103\104"..
"\116\95\119\115\113\121"
,"\228\184\141\231\187\153"..
"\231\179\150\229"..
"\176\177\230"..
"\138\138\228\189\160"..
"\230\138\147\232\181"..
"\183\230\157"..
"\165\229\144\131\230\142"..
"\137\239\188"..
"\129"
)
 AddItemSkin("\115\111\114\97"..
"\109\97\103\105"..
string.char(99, 95, 119)
..
"\115\113\121"
,string.char(230, 136, 145, 229)
..
"\176\134\231\142\171"..
"\231\145\176\232"..
"\151\143\228"..
"\186\142\232\186\171"..
"\229\144\142\44\10"..
"\230\156\159\231\155\188"..
"\228\184\142\228"..
string.char(189, 160, 232)
..
string.char(181, 180, 231, 186, 166, 46)

)
AddItemSkin("\115\111\114\97\116\101"..
"\108\101\95\119\115"..
"\113\121"
,"\229\156\168\230\136\145"..
"\232\141\146\231\152\160"..
string.char(231, 154, 132, 229)
..
string.char(156, 159, 229)
..
"\156\176\228\184"..
"\138\44\10\228\189"..
"\160\230\152"..
"\175\230\156\128\229\144"..
string.char(142, 231, 154, 132, 231)
..
"\142\171\231"..
("\176\145"):reverse()

)
AddItemSkin(("\114\111\115"):reverse()
..
"\97\98\111\119\107"..
string.char(110, 111, 116, 95, 119)
..
"\115\113\121"
,"\230\156\137\228\186"..
"\186\233\170\130\228"..
("\233\160\189"):reverse()
..
"\135\142\229"..
string.char(191, 131, 229)
..
"\139\131\229\139\131"..
string.char(239, 188, 140, 10, 230)
..
string.char(156, 137, 228)
..
"\186\186\231\136\177"..
"\228\189\160\231\129\181"..
string.char(233, 173, 130, 230, 156, 137)
..
"\231\129\171"
)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\108\105\103\104\116"..
"\102\108\105"..
"\101\114\95\119\115"..
string.char(113, 121)

,"\229\147\135"..
"\233\133\183\239\188"..
"\129\229\147"..
"\135\233\133\183"..
"\239\188\129\229"..
("\233\135\147"):reverse()
..
"\133\183\229\147\135\233"..
"\133\183\239\188\129"
)
AddItemSkin("\115\111\114"..
string.char(97, 50, 112)
..
"\108\97\110"..
"\116\95\120\109"
,"\230\152\159\228"..
"\185\139\230\137\128"..
"\229\144\145\239\188"..
"\140\230\162"..
string.char(166, 228, 185, 139)
..
string.char(230, 137, 128, 229, 189)
..
"\146"
)
local T__h__i__S_bu_G__={sora_none=
"\115\111\114"..
"\97\95\117\110\105"..
"\102\111\114\109\115"
}
local __T_hI_S__Bug=require"widgets/screen"local __T__HI__S_B__UG_=require"widgets/text"local __t_h__iS__Bug=require"widgets/uianim"local __Th__iS_B_UG_=require"widgets/image"local _tH_i_sb_u_G=require"widgets/widget"local _THi_S__bU__g__=require"widgets/redux/templates" local tHIS__b__u_g=require"widgets/redux/accountitemframe"local __tH__IS__B_U__G__=require"widgets/textbutton"local __Th__i_S__b_U_g_=5;local __T__HI_S__b_U_g=44;local THi_sBU_g=300;local __ThiS_B_u__g__=40;local __thi_s__BuG=BUTTONFONT;local t_h__i_SBU_g_=32;local _T_h__I_s_B__ug_=0.6;local T__hI__s_B__u__g_=-55;local __th__i_s_bug=UICOLOURS["\87\72\73\84"..
"\69"]local T_H_i_S__B_U_g_=UICOLOURS["\71\82\69\89"] PushNoConnectScr=function(__T_HiS_B__uG)
 local t_hI__s_bU__G=__T_HiS_B__uG==1 and string.char(229, 189, 147)
..
"\229\137\141"..
"\229\174\162\230\136\183"..
"\231\171\175\230"..
"\178\161\230\156"..
"\137\228\191\174\229"..
string.char(164, 141, 232, 129, 148, 231)
..
"\189\145\10\232"..
"\175\183\231\130"..
"\185\229\135\187\226\128"..
"\156\230\159\165\231\156"..
"\139\230\143\144"..
"\231\164\186"..
string.char(226, 128, 157, 239, 188, 140)
..
"\230\140\137\230\181\143"..
"\232\167\136\229\153"..
"\168\230\143"..
"\144\231\164\186\229"..
string.char(174, 140, 230, 136)
..
"\144\228\191"..
"\174\229\164\141"
or"\229\189\147\229\137\141"..
"\230\156\141\229"..
("\171\231\161\138"):reverse()
..
string.char(161, 178, 230, 175)
:reverse()
..
string.char(230, 156, 137, 228)
..
"\191\174\229"..
string.char(164, 141, 232, 129, 148, 231)
..
"\189\145\10\232"..
"\175\183\232\174\169"..
("\187\184\228\191\136\230"):reverse()
..
string.char(228, 191, 174, 229, 164)
..
"\141\230\156\141"..
"\229\138\161\231"..
"\171\175\231\154"..
"\132\232\129"..
"\148\231\189\145"..
"\233\151\174"..
"\233\162\152"..
"\10\230\136"..
"\150\231\148\177"..
"\230\136\191\228\184\187"..
"\229\188\128\229\144\175"..
("\183\136\230\162\174\229"):reverse()
..
"\231\171\175"..
"\228\187\163\231\144\134"..
"\230\168\161\229\188\143"..
"\239\188\136\228\184\141"..
"\230\142\168\232\141\144"..
string.char(239, 188, 137)

SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169"..
string.char(233, 166, 168, 230, 143, 144)
..
"\231\164\186"
,t_hI__s_bU__G,{"\230\159\165"..
("\143\230\139\156\231"):reverse()
..
"\144\231\164\186"
,
"\229\133\179\233"..
"\151\173"
}
,{function()
VisitURL(("\58\112\116\116\104"):reverse()
..
"\47\47\119\105"..
"\107\105\46\102"..
string.char(108, 97, 112, 105, 46)
..
("\110\47\110\99"):reverse()

,(259
-
467
+
268
==64)
)
end
,
nil
}
)
end
__t_h_i_S__buG=function()
if TheNet:GetIsServer()
then if not ServerHasHttpOK()
then PushNoConnectScr(2)
return(416
-
395
+
194
==217)
end else if not IsHttpOK()
then PushNoConnectScr(1)
return(60
+
423
+
151
-
297
-
383
==-39)
end;if not ServerHasHttpOK()
then PushNoConnectScr(2)
return(459
+
198
*
9
-
381
+
157
==2023)
end end;return(2
+
300
*
118
~=35405)
end
T_H_i_s__B_u_G_=function(__T_HI__S__b__Ug_,
__t_h_i__s__bUg_)
if not __t_h_i_S__buG()
then return end;local __T__Hi__Sb__uG__=_tH_iSB_ug(__T_HI__S__b__Ug_ or("\110\95\97\114\111\115"):reverse()
..
("\101\110\111"):reverse()

)
__T__Hi__Sb__uG__[string.char(117, 110, 108, 111, 99)
..
"\107\116\101\120\116"]:SetString(__t_h_i__s__bUg_ or"\228\187\133"..
string.char(231, 148, 168)
..
("\232\142\186\228"):reverse()
..
"\167\163\233\148\129\231"..
("\229\185\169"):reverse()
..
"\166\185\67\68\75"
)
return __T__Hi__Sb__uG__ end
PushCDKScr=function(t_hI_S__B__u_g_)
local THI_SB_uG=T_H_i_s__B_u_G_("\115\111\114\97"..
string.char(95, 110, 111, 110, 101)

,t_hI_S__B__u_g_)
if THI_SB_uG then TheFrontEnd:PushScreen(THI_SB_uG)
end;return THI_SB_uG end
PushItemScr=function(tH_i_s__b_u_g_)
if not __t_h_i_S__buG()
then return end;local ThIs__bu_g=_T__h_I_SbU__g_()
TheFrontEnd:PushScreen(ThIs__bu_g)
return ThIs__bu_g end
 AddClassPostConstruct("\119\105\100\103\101\116"..
string.char(115, 47, 114, 101, 100)
..
"\117\120\47\105\116"..
"\101\109\101"..
"\120\112\108"..
"\111\114\101"..
"\114"
,function(self)
local __t_h_i__SB_Ug=self["\95\83\104\111"..
string.char(119, 73, 116)
..
("\73\116\101\83\109\101"):reverse()
..
string.char(111, 102, 110)
:reverse()
]self[string.char(95, 83, 104, 111, 119, 73)
..
"\116\101\109\83"..
string.char(110, 73, 116, 101)
:reverse()
..
"\102\111"]=function(t__H__I_SB_U__g__,...
)
 if _T_hI_s__b_U__g__[t__H__I_SB_U__g__[string.char(116, 105, 95, 116, 101, 115)
:reverse()
..
"\101\109\95\116\121\112"..
("\101"):reverse()
]]then if not __t_h_i_S__buG()
then return end;t__H__I_SB_U__g__["\115\101\116\95\105\110"..
"\102\111\95"..
"\115\99\114\101\101\110"]=_T_hI_s__b_U__g__[t__H__I_SB_U__g__["\115\101\116\95"..
"\105\116\101\109\95"..
string.char(116, 121, 112)
..
"\101"]](t__H__I_SB_U__g__,t__H__I_SB_U__g__["\115\101\116\95\105"..
"\116\101\109\95\116\121"..
string.char(112, 101)
])
if not t__H__I_SB_U__g__[string.char(115, 101, 116)
..
string.char(95, 105, 110, 102, 111)
..
string.char(95, 115, 99, 114)
..
"\101\101\110"]then return end;t__H__I_SB_U__g__[string.char(115, 101, 116, 95)
..
("\95\111\102\110\105"):reverse()
..
"\115\99\114\101"..
"\101\110"]["\111\119\110\101\100\95"..
"\98\121\95"..
string.char(119, 97, 114)
..
string.char(100, 114, 111, 98, 101)
]=(433
-
323
-
452
==-342)
TheFrontEnd:PushScreen(self["\115\101\116\95"..
"\105\110\102\111"..
"\95\115\99"..
string.char(114, 101, 101, 110)
])
return end;return __t_h_i__SB_Ug(t__H__I_SB_U__g__,...
)
end
local t__H_i__s_Bug=not(HasHttpOK()
or ServerHasHttpOK()
)
if self["\105\110\116\101"..
"\114\97\99\116\95"..
"\114\111\111"..
"\116"]then self[string.char(115, 111, 114, 97)
..
"\116\105\109"..
"\101\95\116\101\120\116"]=self["\105\110\116\101\114"..
string.char(97, 99, 116, 95, 114, 111)
..
"\111\116"]:AddChild(__T__HI__S_B__UG_(CHATFONT,30,nil
,UICOLOURS["\87\72\73"..
"\84\69"])
)
local _T_H__I__s__B_U_g__=string["\102\111\114\109\97"..
"\116"]("\229\143\175\231\148\168"..
string.char(47, 230, 128, 187, 230, 180)
..
"\187\232\183"..
"\131\229\186"..
string.char(166, 58, 32, 37, 100, 47)
..
string.char(37, 100)

,T__H_i_s__bU_G_,__t__Hi__Sb__u__g__+T__H_i_s__bU_G_)
self["\115\111\114\97"..
"\116\105\109"..
"\101\95\116\101"..
"\120\116"]:SetString(_T_H__I__s__B_U_g__)
 self["\115\111\114\97\116\105"..
"\109\101\95\116\101\120"..
"\116"]:SetPosition(120,240)
self["\115\111\114\97\116\105"..
string.char(109, 101, 95, 116, 101)
..
"\120\116"]:Hide()
self["\115\111\114\97\105"..
"\116\101\109\95\98"..
"\116\110"]=self["\105\110\116\101\114"..
string.char(97, 99, 116, 95, 114, 111)
..
"\111\116"]:AddChild(_THi_S__bU__g__[string.char(83, 116, 97, 110)
..
"\100\97\114"..
"\100\66\117\116\116"..
"\111\110"](function()
local __t__HiS__BU_g__=PushItemScr()
end
,"\231\137\169"..
"\229\147\129"..
"\231\154\174\232\130\164"
,{130,
45}
)
)
self["\115\111\114\97\105\116"..
string.char(101, 109, 95, 98, 116)
..
"\110"]:SetPosition(150,0)
self["\115\111\114\97\105\116"..
"\101\109\95\98\116"..
"\110"]:Hide()
self[string.char(115, 111, 114, 97, 116, 105)
..
"\109\101\95"..
string.char(116, 101, 120)
..
"\116\95\98\116\110"]=self["\105\110\116\101\114"..
"\97\99\116\95\114\111"..
"\111\116"]:AddChild(__tH__IS__B_U__G__("\104\121\100"
)
)
self["\115\111\114\97\116"..
"\105\109\101\95\116\101"..
"\120\116\95\98\116\110"]:SetText("\230\156\170\228\191"..
"\174\229\164\141\232"..
"\129\148\231\189\145"..
"\239\188\140\232\175"..
("\130\231\183"):reverse()
..
"\185\230\173\164\230\159"..
"\165\231\156"..
"\139\228\191\174"..
"\229\164\141"
)
self[string.char(115, 111, 114, 97)
..
"\116\105\109\101\95\116"..
("\116\120\101"):reverse()
..
string.char(95, 98, 116, 110)
]:SetPosition(160,240)
self["\115\111\114\97\116"..
"\105\109\101"..
"\95\116\101\120\116\95"..
"\98\116\110"]:SetOnClick(function()
 VisitURL("\104\116\116\112\58"..
string.char(47, 47, 119, 105)
..
string.char(107, 105, 46, 102, 108, 97)
..
"\112\105\46"..
"\99\110\47\110"
,(224
*
378
+
95
==84775)
)
SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166\168\230"..
"\143\144\231\164\186"
,string.char(232, 175, 183, 229)
..
"\133\136\230\140\137"..
"\230\181\143"..
"\232\167\136\229\153\168"..
string.char(230, 143, 144)
..
string.char(231, 164, 186)
..
"\228\191\174\229\164"..
"\141\232\129\148\231"..
"\189\145\233\151"..
"\174\233\162"..
string.char(152, 10, 229)
..
string.char(166, 130, 230)
..
"\156\170\229\188\185"..
"\229\135\186\230\181\143"..
("\168\153\229\136\167\232"):reverse()
..
"\44\232\175\183"..
"\232\191\155\81\81\231"..
string.char(190, 164, 58, 51)
..
"\55\50\52"..
string.char(53, 48, 55, 48, 53)
..
"\230\159\165\231\156\139"
)
end
)
 self[string.char(115, 111, 114)
..
"\97\116\105\109"..
("\116\95\101"):reverse()
..
"\101\120\116\95\98"..
"\116\110"]:Hide()
end;local __t_h__iS__B_uG_=self["\95\85\112\100\97\116"..
"\101\73\116\101\109\83"..
"\101\108\101\99\116\101"..
string.char(100, 73, 110, 102, 111)
] self["\95\85\112\100\97"..
"\116\101\73\116\101\109"..
"\83\101\108\101\99\116"..
"\101\100\73\110"..
"\102\111"]=function(__tHi_s__BU_G_,
__tHi_S__B__U_G,...
)
local __T__H_I__S__BUg_=__t_h__iS__B_uG_(__tHi_s__BU_G_,__tHi_S__B__U_G,...
)
if __tHi_S__B__U_G and _T_hI_s__b_U__g__[__tHi_S__B__U_G]and not T__h_I_S__b_u__G_[__tHi_S__B__U_G]and __tHi_s__BU_G_["\115\101\116\95"..
string.char(105, 110, 102, 111, 95)
..
"\98\116\110"]then __tHi_s__BU_G_["\115\101\116\95"..
"\105\110\102\111\95\98"..
string.char(116, 110)
]:SetText("\230\191\128\230\180"..
"\187"
)
 __tHi_s__BU_G_[string.char(115, 101, 116, 95)
..
"\105\110\102\111\95\98"..
"\116\110"]:Show()
__tHi_s__BU_G_["\115\101\116"..
"\95\105\116"..
"\101\109\95\116\121\112"..
"\101"]=__tHi_S__B__U_G end if self["\115\111\114\97"..
"\116\105\109\101"..
string.char(95, 116, 101, 120)
..
"\116"]then if __tHi_S__B__U_G and __tHi_S__B__U_G:match("\94\115\111\114\97"
)
then if t__H_i__s_Bug then self["\115\111\114\97\116\105"..
string.char(95, 101, 109)
:reverse()
..
"\116\101\120"..
("\116"):reverse()
]:Hide()
self["\115\111\114\97\116\105"..
"\109\101\95"..
"\116\101\120"..
("\110\116\98\95\116"):reverse()
]:Show()
else self["\115\111\114"..
"\97\116\105\109\101"..
"\95\116\101\120\116"]:Show()
self["\115\111\114\97\116\105"..
"\109\101\95\116\101\120"..
"\116\95\98\116"..
("\110"):reverse()
]:Hide()
end else self["\115\111\114\97\116\105"..
("\116\95\101\109"):reverse()
..
"\101\120\116"]:Hide()
self[string.char(115, 111, 114, 97, 116)
..
"\105\109\101\95\116"..
("\98\95\116\120\101"):reverse()
..
"\116\110"]:Hide()
end end;if self[string.char(115, 111, 114, 97)
..
"\105\116\101\109\95"..
("\110\116\98"):reverse()
]then if __tHi_S__B__U_G== ("\110\95\97\114\111\115"):reverse()
..
"\111\110\101"
then if t__H_i__s_Bug then self["\115\111\114\97\116\105"..
"\109\101\95"..
"\116\101\120"..
"\116"]:Hide()
self["\115\111\114\97"..
"\116\105\109\101"..
"\95\116\101"..
"\120\116\95\98"..
string.char(116, 110)
]:Show()
else self["\115\111\114\97\116"..
"\105\109\101\95\116"..
string.char(101, 120, 116)
]:Show()
self["\115\111\114\97\116"..
"\105\109\101\95\116"..
"\101\120\116\95"..
("\110\116\98"):reverse()
]:Hide()
end else self[string.char(105, 97, 114, 111, 115)
:reverse()
..
"\116\101\109\95\98"..
("\110\116"):reverse()
]:Hide()
self["\115\111\114\97"..
string.char(116, 105, 109, 101)
..
("\120\101\116\95"):reverse()
..
string.char(116, 95, 98)
..
string.char(116, 110)
]:Hide()
end end;return __T__H_I__S__BUg_ end
end
)
 local _T__h_i_s__bug__=Class(__T_hI_S__Bug,function(self,
__t__HI__s__bUg,
_T__hisB__UG_)
__T_hI_S__Bug[("\114\111\116\99\95"):reverse()
](self,"\85\110\76\111\99\107"..
string.char(110, 101, 101, 114, 99, 83)
:reverse()

)
self["\105\116\101\109"]=__t__HI__s__bUg;self["\99\98"]=_T__hisB__UG_;self[string.char(98, 108, 97, 99)
..
"\107"]=self:AddChild(_THi_S__bU__g__["\66\97\99"..
"\107\103\114\111\117"..
"\110\100\84\105\110\116"]()
)
self["\112\114\111\111"..
string.char(116)
:reverse()
]=self:AddChild(_THi_S__bU__g__["\83\99\114\101"..
"\101\110\82"..
"\111\111\116"]("\82\79\79"..
"\84"
)
)
self[string.char(99, 100)
]=SoraCD(5,(147
-
178
+
479
-
440
*
198
==-86672)
)
 self["\98\117\116"..
"\116\111\110\115"]={{text=
string.char(128, 191, 230)
:reverse()
..
"\230\180\187"
,
cb=
function()
if self[string.char(99, 100)
]()
then if self["\99\98"]then self[string.char(99, 98)
](self,__t__HI__s__bUg)
end else SoraPushPopupDialog("\229\176\143"..
string.char(231, 169, 185, 231, 154, 132)
..
string.char(230, 184, 169)
..
"\233\166\168\230\143"..
"\144\231\164\186"
,"\232\175\183\231\168\141"..
string.char(229, 128, 153, 229, 134)
..
"\141\232\175"..
string.char(130, 128, 227, 149)
:reverse()

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
local T_Hi_s__b_ug=400;self["\100\105\97\108\111\103"]=self[string.char(112, 114, 111)
..
"\111\116"]:AddChild(_THi_S__bU__g__["\67\117\114\108\121"..
string.char(87, 105, 110)
..
string.char(100, 111, 119)
](T_Hi_s__b_ug,450,STRINGS[string.char(78, 65, 77, 69, 83)
][__t__HI__s__bUg],self["\98\117\116\116"..
"\111\110\115"])
)
self["\99\111\110"..
"\116\101\110\116\95\114"..
"\111\111\116"]=self[("\116\111\111\114\112"):reverse()
]:AddChild(_tH_i_sb_u_G("\99\111\110\116\101"..
"\110\116\95\114\111\111"..
string.char(116)

)
)
self["\99\111\110\116"..
string.char(101, 110, 116)
..
string.char(95, 114, 111, 111, 116)
]:SetPosition(200,-150)
self[string.char(97, 110, 105, 109, 95)
..
"\114\111\111\116"]=self["\99\111\110"..
"\116\101\110\116\95\114"..
string.char(111, 111, 116)
]:AddChild(_tH_i_sb_u_G("\97\110\105\109"..
"\95\114\111\111"..
"\116"
)
)
self["\97\110\105"..
"\109\95\114\111\111"..
string.char(116)
]:SetVAnchor(ANCHOR_MIDDLE)
self[("\105\110\97"):reverse()
..
"\109\95\114\111\111"..
"\116"]:SetHAnchor(ANCHOR_MIDDLE)
self[("\105\110\97"):reverse()
..
"\109\95\114\111\111"..
string.char(116)
]:SetScaleMode(SCALEMODE_PROPORTIONAL)
self[string.char(97, 110, 105, 109)
..
"\95\114\111"..
"\111\116"]:SetPosition(-150,-50)
self["\97\110\105\109"]=self["\97\110\105\109"..
"\95\114\111"..
"\111\116"]:AddChild(__t_h__iS__Bug()
)
 self["\97\110\105"..
"\109\115\116\97"..
"\116\101"]=self["\97\110\105"..
"\109"]:GetAnimState()
local _T_H_iS__BU__g_=T__h__i__S_bu_G__[__t__HI__s__bUg]or __t__HI__s__bUg;local __t_H__i__s__B__U_G=_T_H_iS__BU__g_;local __tH_is__BuG_=GetSkin(_T_H_iS__BU__g_)
if __tH_is__BuG_ and __tH_is__BuG_["\105\115\105\116\101"..
string.char(109, 115, 107, 105, 110, 115)
]then __t_H__i__s__B__U_G="\115\111\114"..
"\97\95\117\110"..
"\105\102\111\114\109"..
"\115"
end;self[string.char(97, 110, 105, 109)
..
string.char(115, 116, 97, 116, 101)
]:SetBuild(__t_H__i__s__B__U_G)
self["\97\110\105\109"..
"\115\116\97\116"..
"\101"]:SetBank(string.char(119, 105, 108, 115, 111)
..
"\110"
)
self[("\105\110\97"):reverse()
..
"\109\115\116\97"..
string.char(116, 101)
]:PlayAnimation("\101\109\111\116\101\88"..
"\76\95\108\111\111"..
"\112\95\100\97\110"..
"\99\101\48"
,(359
-
78
-
201
~=83)
)
self["\97\110\105"..
("\116\115\109"):reverse()
..
"\97\116\101"]:AddOverrideBuild(string.char(112, 108, 97, 121, 101)
..
"\114\95\101\109\111\116"..
"\101\95\101\120\116"..
string.char(114, 97)

)
self["\97\110\105\109"]:SetFacing(FACING_DOWN)
self["\97\110\105"..
"\109"]:SetScale(0.8,0.8,0.8)
self["\97\110\105\109"..
"\115\116\97"..
string.char(101, 116)
:reverse()
]:Hide("\65\82\77\95\99\97"..
"\114\114\121"
)
self[string.char(105, 110, 97)
:reverse()
..
"\109\115\116\97\116"..
"\101"]:Hide(string.char(104, 101, 97, 100, 95, 104)
..
"\97\116"
)
self["\97\110\105\109\115\116"..
string.char(97, 116, 101)
]:Hide("\72\65\73\82"..
"\95\72\65\84"
)
 self["\105\99\111\110"]=self["\99\111\110\116\101"..
"\110\116\95\114\111"..
"\111\116"]:AddChild(__t_h__iS__Bug()
)
self["\105\99\111\110"]:GetAnimState()
:SetBank("\97\99\99"..
"\111\117\110\116\105"..
"\116\101\109\95\102"..
("\101\109\97\114"):reverse()

)
self["\105\99\111\110"]:GetAnimState()
:SetBuild(string.char(97, 99, 99)
..
string.char(111, 117, 110, 116, 105, 116)
..
("\102\95\109\101"):reverse()
..
"\114\97\109"..
"\101"
)
self["\105\99\111\110"]:GetAnimState()
:PlayAnimation(string.char(105, 99, 111)
..
string.char(110)

,(186
+
223
-
403
*
341
==-137014)
)
if __tH_is__BuG_ then if __tH_is__BuG_[("\97\119\115"):reverse()
..
"\112\95\105\99\111\110"]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol(("\73\95\80\65\87\83"):reverse()
..
"\67\79\78"
,__tH_is__BuG_["\115\119\97\112\95\105"..
"\99\111\110"]["\98\117\105\108"..
"\100"],__tH_is__BuG_["\115\119\97"..
string.char(112, 95, 105, 99, 111, 110)
]["\105\109\97\103\101"])
elseif __tH_is__BuG_[string.char(101, 103, 97, 109, 105)
:reverse()
]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95\73"..
string.char(67, 79, 78)

,softresolvefilepath(__tH_is__BuG_["\97\116\108\97\115"])
,__tH_is__BuG_["\105\109\97"..
"\103\101"].. ("\120\101\116\46"):reverse()

)
else self[string.char(105, 99, 111, 110)
]:GetAnimState()
:OverrideSkinSymbol(string.char(83, 87, 65, 80, 95)
..
"\73\67\79\78"
,_T_H_iS__BU__g_,"\83\87\65\80\95"..
"\73\67\79\78"
)
end else self["\105\99\111"..
("\110"):reverse()
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,_T_H_iS__BU__g_,"\83\87\65\80\95"..
string.char(78, 79, 67, 73)
:reverse()

)
end;self["\105\99\111\110"]:GetAnimState()
:Hide(string.char(84, 73, 78)
..
string.char(84)

)
self[string.char(105, 99, 111)
..
"\110"]:GetAnimState()
:Hide(string.char(76, 79, 67, 75)

)
self[("\111\99\105"):reverse()
..
"\110"]:GetAnimState()
:Hide(("\87\69\78"):reverse()

)
self[("\110\111\99\105"):reverse()
]:GetAnimState()
:Hide("\83\69\76\69\67"..
"\84"
)
self["\105\99\111\110"]:GetAnimState()
:Hide(string.char(73, 67, 95, 87)
..
string.char(69, 65, 86, 69)

)
for _T__H_IS__b_u__g__,__T__h_Is_b_ug in pairs(EVENT_ICONS)
do self["\105\99\111"..
"\110"]:GetAnimState()
:Hide(_T__H_IS__b_u__g__)
end;self["\105\99\111\110"]:GetAnimState()
:Hide("\68\76\67"
)
self["\105\99\111\110"]:SetPosition(-100,310)
self["\105\110\102\111\95\116"..
"\120\116"]=self["\99\111\110\116\101"..
("\95\116\110"):reverse()
..
"\114\111\111\116"]:AddChild(__T__HI__S_B__UG_(CHATFONT,26, nil
,UICOLOURS["\87\72\73\84\69"])
)
self["\105\110\102\111"..
"\95\116\120\116"]:SetPosition(-35,130)
self["\105\110\102\111\95"..
"\116\120\116"]:SetRegionSize(T_Hi_s__b_ug*0.8,85)
self["\105\110\102\111\95\116"..
"\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\105\110\102\111\95\116"..
"\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\105\110\102\111"..
"\95\116\120"..
"\116"]:EnableWordWrap((158
-
397
*
424
==-168170)
)
self["\105\110\102\111\95\116"..
("\116\120"):reverse()
]:SetString(STRINGS[string.char(83, 75, 73)
..
"\78\95\68\69\83"..
string.char(67, 82, 73)
..
string.char(80, 84, 73, 79, 78, 83)
][__t__HI__s__bUg]or"\85\110\75\110\111\119"
)
self[string.char(110, 97, 109, 101, 95, 116)
..
"\120\116"]=self[("\116\110\111\99"):reverse()
..
string.char(101, 110, 116)
..
"\95\114\111\111\116"]:AddChild(__T__HI__S_B__UG_(CHATFONT,30,nil
,UICOLOURS[string.char(87, 72, 73, 84)
..
"\69"])
)
self["\110\97\109"..
"\101\95\116\120\116"]:SetPosition(-35,220)
self["\110\97\109\101\95\116"..
"\120\116"]:SetRegionSize(T_Hi_s__b_ug*0.8,85)
self["\110\97\109\101"..
("\116\120\116\95"):reverse()
]:SetHAlign(ANCHOR_LEFT)
self["\110\97\109\101\95\116"..
"\120\116"]:SetVAlign(ANCHOR_MIDDLE)
 self[string.char(110, 97, 109, 101)
..
"\95\116\120"..
string.char(116)
:reverse()
]:EnableWordWrap((408
+
376
-
385
-
308
~=99)
)
self["\110\97\109\101"..
"\95\116\120\116"]:SetString(STRINGS[("\95\78\73\75\83"):reverse()
..
"\78\65\77"..
"\69\83"][__t__HI__s__bUg]or"\85\110\75\110"..
"\111\119"
)
self["\114\97\114\105"..
"\116\121\95\116"..
"\120\116"]=self["\99\111\110\116\101"..
"\110\116\95\114\111\111"..
"\116"]:AddChild(__T__HI__S_B__UG_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\114\97\114\105\116"..
"\121\95\116"..
"\120\116"]:SetPosition(-35,190)
self[("\116\105\114\97\114"):reverse()
..
"\121\95\116\120"..
("\116"):reverse()
]:SetRegionSize(T_Hi_s__b_ug*0.8,85)
self["\114\97\114\105"..
"\116\121\95"..
"\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\114\97\114\105"..
string.char(116, 120, 116, 95, 121, 116)
:reverse()
]:SetVAlign(ANCHOR_MIDDLE)
self["\114\97\114\105\116\121"..
"\95\116\120\116"]:EnableWordWrap((332
+
364
*
231
+
382
-
357
==84441)
)
self["\114\97\114\105"..
("\120\116\95\121\116"):reverse()
..
string.char(116)
]:SetString("\230\128\187\228\185\139"..
"\229\176\177"..
"\230\152\175\233\157"..
"\158\229\184\184"..
("\175\143\229"):reverse()
..
"\231\136\177"
)
 self[string.char(104, 111, 114, 105)
..
"\122\111\110\116\97\108"..
string.char(95, 108, 105, 110, 101)
]=self["\99\111\110\116"..
string.char(101, 110, 116)
..
"\95\114\111\111\116"]:AddChild(__Th__iS_B_UG_("\105\109\97\103\101\115"..
"\47\103\108\111\98"..
string.char(97, 108, 95, 114, 101, 100)
..
("\108\109\120\46\120\117"):reverse()

,"\105\116\101"..
string.char(109, 95, 100, 105, 118)
..
"\105\100\101"..
"\114\46\116\101\120"
)
)
self[string.char(104, 111, 114, 105, 122, 111)
..
string.char(110, 116, 97, 108)
..
"\95\108\105"..
"\110\101"]:SetScale(0.5,1)
self[string.char(104, 111, 114, 105, 122, 111)
..
("\95\108\97\116\110"):reverse()
..
"\108\105\110\101"]:SetPosition(-200,75,0)
self[string.char(104, 111, 114, 105)
..
"\122\111\110\116\97\108"..
"\95\108\105\110\101\50"]=self["\99\111\110"..
string.char(116, 101, 110)
..
"\116\95\114"..
"\111\111\116"]:AddChild(__Th__iS_B_UG_(("\101\103\97\109\105"):reverse()
..
string.char(115, 47, 103, 108)
..
"\111\98\97"..
"\108\95\114"..
"\101\100\117\120"..
"\46\120\109\108"
,("\95\109\101\116\105"):reverse()
..
("\101\100\105\118\105\100"):reverse()
..
"\114\46\116"..
"\101\120"
)
)
self[string.char(105, 114, 111, 104)
:reverse()
..
"\122\111\110"..
string.char(116, 97, 108, 95, 108)
..
("\101\110\105"):reverse()
..
"\50"]:SetScale(0.25,1)
self["\104\111\114"..
"\105\122\111\110\116"..
"\97\108\95\108\105\110"..
"\101\50"]:SetPosition(-95,170,0)
self[string.char(117, 110, 108, 111, 99, 107)
..
"\100\101\115"]=self["\99\111\110"..
("\114\95\116\110\101\116"):reverse()
..
("\116\111\111"):reverse()
]:AddChild(__T__HI__S_B__UG_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111\99"..
"\107\100\101\115"]:SetPosition(-235,50)
 self["\117\110\108"..
"\111\99\107\100"..
string.char(101, 115)
]:SetRegionSize(T_Hi_s__b_ug*0.8,85)
self["\117\110\108\111\99"..
string.char(107, 100, 101, 115)
]:SetHAlign(ANCHOR_LEFT)
self[("\108\110\117"):reverse()
..
"\111\99\107\100\101\115"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(117, 110, 108, 111)
..
string.char(99, 107, 100, 101, 115)
]:EnableWordWrap((81
+
275
+
196
-
462
-
342
~=-250)
)
self["\117\110\108"..
("\107\99\111"):reverse()
..
"\100\101\115"]:SetString("\232\167\163\233\148"..
string.char(129, 230, 150, 185)
..
("\143\188\229"):reverse()
..
"\58"
)
self["\117\110\108"..
"\111\99\107\116\101"..
"\120\116"]=self[string.char(99, 111, 110, 116)
..
"\101\110\116"..
("\116\111\111\114\95"):reverse()
]:AddChild(__T__HI__S_B__UG_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108"..
"\111\99\107\116\101\120"..
"\116"]:SetPosition(-165,50)
self["\117\110\108\111\99"..
"\107\116\101"..
"\120\116"]:SetRegionSize(T_Hi_s__b_ug*0.8,85)
self[string.char(117, 110, 108)
..
string.char(111, 99, 107, 116, 101)
..
"\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(117, 110, 108, 111, 99)
..
"\107\116\101\120"..
string.char(116)
]:EnableWordWrap((321
+
316
-
188
+
337
*
31
~=10898)
)
self[string.char(117, 110, 108, 111, 99)
..
"\107\116\101"..
("\116\120"):reverse()
]:SetString(""
)
self["\100\101\102\97\117"..
"\108\116\95\102"..
"\111\99\117\115"]=self["\100\105\97\108\111\103"]end
)
function _T__h_i_s__bug__:OnControl(_T_H__i_sBU__G_,__T__h__i_s__bUG__)if _T__h_i_s__bug__["\95\98\97"..
string.char(115, 101)
]["\79\110\67"..
"\111\110\116\114\111"..
"\108"](self,_T_H__i_sBU__G_,__T__h__i_s__bUG__)
then return(372
+
295
-
121
~=552)
end;if _T_H__i_sBU__G_==CONTROL_CANCEL and not __T__h__i_s__bUG__ then self["\98\117\116\116\111"..
"\110\115"][#self["\98\117\116\116\111\110"..
"\115"]][("\98\99"):reverse()
]()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110"..
"\116\115\116\97"..
string.char(114, 118, 101, 47, 72)
..
"\85\68\47\99"..
"\108\105\99\107\95"..
"\109\111\118\101"
)
return(359
-
82
-
492
*
129
+
496
==-62695)
end end;function _T__h_i_s__bug__:Close()if self["\79\110\67\108\111\115"..
string.char(101, 67, 66)
]then self[string.char(79, 110, 67, 108, 111)
..
"\115\101\67"..
"\66"][("\115\111\108\67"):reverse()
..
"\101\67\66"](self["\79\110\67\108\111\115"..
"\101\67\66"],self)
end;TheFrontEnd:PopScreen(self)
end _t__h_I_S_B__ug__=Class(_T__h_i_s__bug__,function(self,
t_HI__S_b__ug_,
Th_i__s__B__Ug_)
_T__h_i_s__bug__["\95\99\116"..
"\111\114"](self,t_HI__S_b__ug_)
Th_i__s__B__Ug_=Th_i__s__B__Ug_ or 300;local Thi_S__Bu_g_=_t_hi__sB_U__G__/Th_i__s__B__Ug_;self["\99\104\97\114\97"..
"\99\116\101\114\112\114"..
("\115\115\101\114\103\111"):reverse()
]=self["\99\111\110\116"..
string.char(101, 110, 116, 95, 114)
..
"\111\111\116"]:AddChild(__T__HI__S_B__UG_(HEADERFONT,40, nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(99, 104, 97, 114, 97)
..
"\99\116\101\114\112\114"..
"\111\103\114"..
"\101\115\115"]:SetPosition(-200,10)
Thi_S__Bu_g_=math[("\110\105\109"):reverse()
](math["\109\97\120"](0,Thi_S__Bu_g_)
,1)
self[string.char(99, 104, 97, 114, 97, 99)
..
"\116\101\114\112\114\111"..
"\103\114\101"..
string.char(115, 115)
]:SetString(string["\102\111\114\109\97"..
"\116"]("\229\189\147\229"..
"\137\141\232\191\155"..
"\229\186\166\58"..
"\32\37\48\46"..
"\49\102\37\37"
,Thi_S__Bu_g_*100)
)
 self[string.char(99, 98)
]=function(__Th__i_sb__ug__,
THi_S_b__U_g_)
if not __t_h_i_S__buG()
then return end;if _t_hi__sB_U__G__>=Th_i__s__B__Ug_ then if __t__hI_sB_UG__==""
and __THI_s_b_uG__ and __t_h__i_s_b_ug_()
then __THI_s_b_uG__()
SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185\231\154"..
"\132\230\184\169"..
"\233\166\168\230\143\144"..
"\231\164\186"
,"\232\175\183\231\168\141"..
"\229\144\142\229"..
"\134\141\232\175\149"
)
return end;local t__H__i_S__B_u__g=SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169\233\166"..
string.char(168, 230, 143, 144, 231)
..
"\164\186"
,"\230\173\163\229\156\168"..
string.char(230, 191, 128, 230, 180)
..
"\187\228\184\173\44\232"..
"\175\183\231\168\141\229"..
"\144\142\230"..
("\156\231\165\159"):reverse()
..
("\230\147\187\231\139"):reverse()
..
"\158\156"
)
__t__H__i_sb__u_g("\99\47\65\99\116"..
"\105\118\101\83\107\105"..
"\110"
,{skin=
self["\105\116\101\109"]}
,function(t_h_I_s__B_U__G,
t_H_iS__b__U_g,
_T__H_I_sB__U__G_)
 TheFrontEnd:PopScreen(t__H__i_S__B_u__g)
 if t_h_I_s__B_U__G==5031 then SkinRPC("\71\101\116\83"..
"\107\105\110\115"
,(182
*
21
+
217
~=4048)
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
THi_S_B_U_G(_T__H_I_sB__U__G_["\115\107\105\110\112\114"..
string.char(101, 102, 97, 98)
])
elseif t_h_I_s__B_U__G==5032 then SkinRPC("\71\101\116\83\107\105"..
"\110\115"
,(239
+
265
+
84
-
276
==312)
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
if _T__H_I_sB__U__G_["\117\115\101"]then __t__Hi__Sb__u__g__=_T__H_I_sB__U__G_["\117\115\101"]end;if _T__H_I_sB__U__G_["\117\110\117"..
"\115\101"]then T__H_i_s__bU_G_=_T__H_I_sB__U__G_[("\117\110\117"):reverse()
..
"\115\101"]end;SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166\168"..
"\230\143\144\231\164\186"
,tostring(_T__H_I_sB__U__G_["\109\115\103"])
)
THi_S_B_U_G(_T__H_I_sB__U__G_["\115\107\105"..
"\110\112\114\101"..
"\102\97\98"])
elseif t_h_I_s__B_U__G<0 then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184\169"..
"\233\166\168\230\143\144"..
string.char(231, 164, 186)

,tostring(_T__H_I_sB__U__G_)
)
else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143"..
"\144\231\164\186"
,"\231\154\174\232\130\164"..
"\230\191\128\230"..
string.char(180, 187, 229, 164, 177, 232)
..
string.char(180, 165, 44, 233)
..
("\175\232\153\148"):reverse()
..
"\175\228\187"..
string.char(163, 231, 160, 129, 58)

..tostring(t_h_I_s__B_U__G)
)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
string.char(169, 185, 231)
..
string.char(154, 132, 230, 184)
..
string.char(169, 233, 166)
..
"\168\230\143"..
"\144\231\164\186"
,"\229\156\168\231\186\191"..
"\230\151\182\233\149"..
"\191\228\184\141\232"..
string.char(182, 179, 10, 230, 191, 128)
..
"\230\180\187"..
"\229\164\177"..
string.char(232, 180, 165, 10, 229, 166)
..
"\130\230\158\156"..
("\233\182\151\230"):reverse()
..
string.char(149, 191, 228, 184, 141)
..
"\229\175\185"..
"\32\232\175\183\232\191"..
"\135\229\141"..
"\138\229\176\143"..
string.char(230, 151, 182)
..
"\229\134\141\232\175\149"
)
end end
end
)
 t__h__I_s_bU__G__=Class(_T__h_i_s__bug__,function(self,
__T__H_ISBu__g__,
t_h__isB__ug)
_T__h_i_s__bug__["\95\99\116\111"..
"\114"](self,__T__H_ISBu__g__)
t_h__isB__ug=t_h__isB__ug or 300;self["\99\104\97"..
"\114\97\99\116\101"..
"\114\112\114\111\103"..
"\114\101\115\115"]=self["\99\111\110\116"..
("\111\114\95\116\110\101"):reverse()
..
string.char(116, 111)
:reverse()
]:AddChild(__T__HI__S_B__UG_(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\99\104\97"..
"\114\97\99\116"..
"\101\114\112"..
"\114\111\103\114\101"..
"\115\115"]:SetPosition(-200,10)
self["\99\104\97\114\97\99"..
"\116\101\114\112\114\111"..
"\103\114\101"..
"\115\115"]:SetString(string["\102\111\114\109"..
"\97\116"]("\229\143\175\231"..
"\148\168\230"..
"\180\187\232\183\131"..
string.char(229, 186, 166, 58, 32, 37)
..
"\100\32"
,T__H_i_s__bU_G_)
)
 self["\99\98"]=function(__t__H__I_s__Bu_g,
__T__H__iS__b__u__g_)
if not __t_h_i_S__buG()
then return end if T__H_i_s__bU_G_>=t_h__isB__ug then if __t__hI_sB_UG__==""
and __THI_s_b_uG__ and __t_h__i_s_b_ug_()
then __THI_s_b_uG__()
SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154\132"..
"\230\184\169\233"..
"\166\168\230"..
"\143\144\231"..
string.char(164, 186)

,"\232\175\183\231"..
"\168\141\229\144\142\229"..
"\134\141\232"..
string.char(175, 149)

)
return end local T_H__i_s_B__U_g__=SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154"..
("\233\169\184\230\132"):reverse()
..
string.char(166, 168, 230, 143, 144, 231)
..
"\164\186"
,"\230\173\163\229"..
"\156\168\230\191\128"..
"\230\180\187\228"..
"\184\173\44\232"..
"\175\183\231"..
"\168\141\229\144"..
"\142\230\159\165\231"..
"\156\139\231\187\147"..
string.char(230, 158, 156)

)
 __t__H__i_sb__u_g("\99\47\65\99\116\105"..
"\118\101\83"..
"\107\105\110"
,{skin=
self[string.char(105, 116, 101, 109)
]}
,function(__tH__is_B_uG_,
__t__hI_S__B__u__g,
t__h_i_S_B__Ug__)
TheFrontEnd:PopScreen(T_H__i_s_B__U_g__)
if __tH__is_B_uG_==5031 then SkinRPC(string.char(71, 101, 116)
..
"\83\107\105\110"..
"\115"
,(456
+
420
-
269
+
334
*
121
==41021)
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
THi_S_B_U_G(t__h_i_S_B__Ug__[string.char(115, 107, 105, 110)
..
string.char(101, 114, 112)
:reverse()
..
"\102\97\98"])
elseif __tH__is_B_uG_==5032 then SkinRPC(string.char(71, 101, 116, 83, 107)
..
"\105\110\115"
,(314
+
383
-
160
-
213
==324)
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
if t__h_i_S_B__Ug__["\117\115\101"]then __t__Hi__Sb__u__g__=t__h_i_S_B__Ug__["\117\115\101"]end;if t__h_i_S_B__Ug__["\117\110\117"..
"\115\101"]then T__H_i_s__bU_G_=t__h_i_S_B__Ug__[string.char(117, 110, 117, 115, 101)
]end;SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132"..
string.char(230, 184, 169)
..
("\143\230\168\166\233"):reverse()
..
"\144\231\164\186"
,tostring(t__h_i_S_B__Ug__[string.char(109, 115, 103)
])
)
THi_S_B_U_G(t__h_i_S_B__Ug__["\115\107\105\110"..
"\112\114\101"..
"\102\97\98"])
elseif __tH__is_B_uG_<0 then SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154)
..
string.char(132, 230, 184, 169, 233, 166)
..
"\168\230\143\144\231\164"..
("\186"):reverse()

,tostring(t__h_i_S_B__Ug__)
)
else SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
string.char(231, 154, 132, 230)
..
"\184\169\233"..
"\166\168\230\143\144"..
string.char(186, 164, 231)
:reverse()

,string.char(231, 154, 174, 232, 130)
..
("\180\230\128\191\230\164"):reverse()
..
"\187\229\164\177\232"..
"\180\165\44"..
"\233\148\153"..
"\232\175\175\228\187\163"..
"\231\160\129\58"
..tostring(__tH__is_B_uG_)
)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166\168"..
string.char(230, 143, 144, 231)
..
"\164\186"
,"\229\156\168"..
"\231\186\191\230"..
("\233\182\151"):reverse()
..
string.char(149, 191, 228)
..
"\184\141\232\182\179\10"..
("\230\128\191\230"):reverse()
..
"\180\187\229\164\177"..
"\232\180\165\10"..
("\230\130\166\229"):reverse()
..
"\158\156\230\151\182"..
"\233\149\191\228\184"..
"\141\229\175"..
"\185\32\232"..
"\175\183\232"..
"\191\135\229\141\138\229"..
string.char(176, 143, 230, 151, 182)
..
"\229\134\141\232\175"..
string.char(149)

)
end end
end
)
 _tH_iSB_ug=Class(_T__h_i_s__bug__,function(self,
_tHi_s_b_uG,
__t_H_I__SBUg)
_T__h_i_s__bug__[("\111\116\99\95"):reverse()
..
"\114"](self,_tHi_s_b_uG,__t_H_I__SBUg)
self["\99\100\107"..
"\98\111\120"]=self["\99\111\110\116"..
"\101\110\116\95\114"..
string.char(111, 111, 116)
]:AddChild(_THi_S__bU__g__[string.char(83, 116, 97, 110, 100)
..
"\97\114\100\83\105"..
"\110\103\108\101\76"..
"\105\110\101\84"..
"\101\120\116\69\110"..
"\116\114\121"](nil
,360,40)
)
self[("\111\98\107\100\99"):reverse()
..
"\120"]:SetPosition(-200,0)
self["\99\100\107\98"..
"\111\120"][("\98\116\120\101\116"):reverse()
..
"\111\120"]:SetTextLengthLimit(23)
self["\99\100\107\98\111\120"]["\116\101\120\116\98\111"..
"\120"]:SetForceEdit((285
*
170
-
339
+
193
-
43
~=48270)
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116"..
"\98\111\120"]:EnableWordWrap((424
-
473
*
321
-
165
==-151564)
)
self[("\111\98\107\100\99"):reverse()
..
("\120"):reverse()
]["\116\101\120\116\98\111"..
string.char(120)
]:EnableScrollEditWindow((342
*
486
-
280
~=165941)
)
self["\99\100\107"..
string.char(98, 111, 120)
]["\116\101\120\116"..
"\98\111\120"]:SetHelpTextEdit(""
)
self["\99\100\107\98\111\120"][string.char(116, 101, 120, 116)
..
"\98\111\120"]:SetHelpTextApply(("\232\183\175\232"):reverse()
..
"\190\147\229"..
"\133\165\67\68\75"
)
 self["\99\100\107\98"..
"\111\120"]["\116\101\120\116"..
"\98\111\120"]:SetTextPrompt("\232\175\183\232\190"..
"\147\229\133\165\67"..
"\68\75"
,UICOLOURS[("\89\69\82\71"):reverse()
])
self[("\120\111\98\107\100\99"):reverse()
]["\116\101\120\116"..
"\98\111\120"]["\112\114\111\109"..
"\112\116"]:SetHAlign(ANCHOR_MIDDLE)
self[string.char(99, 100, 107, 98)
..
"\111\120"]["\116\101\120\116"..
string.char(98, 111, 120)
]:SetCharacterFilter("\45\48\49\50"..
"\51\52\53\54\55"..
"\56\57\81\87"..
"\69\82\84\89\85"..
string.char(80, 65, 83, 68)
..
"\70\71\72\74\75\76"..
"\90\88\67\86\66\78"..
"\77\113\119\101"..
string.char(114, 116, 121)
..
"\117\112\97\115\100\102"..
"\103\104\106\107\108\122"..
"\120\99\118\98"..
string.char(110, 109)

)
self["\99\100\107"..
("\120\111\98"):reverse()
]:SetOnGainFocus(function()
self["\99\100\107\98\111"..
"\120"]["\116\101\120"..
string.char(116, 98, 111)
..
string.char(120)
]:OnGainFocus()
end
)
self[string.char(99, 100, 107)
..
"\98\111\120"]:SetOnLoseFocus(function()
self["\99\100\107"..
"\98\111\120"][string.char(116, 101, 120, 116)
..
string.char(98, 111, 120)
]:OnLoseFocus()
end
)
self["\99\100\107\98\111\120"]["\102\111\99\117"..
string.char(115, 95, 102, 111, 114, 119)
..
("\100\114\97"):reverse()
]=self["\99\100\107\98\111\120"][string.char(116, 101, 120, 116)
..
"\98\111\120"] self["\99\98"]=function(_T_hiSb__U_g__,
Th_Is_b__uG)
if not __t_h_i_S__buG()
then return end local T__H_Is_Bu__G__=self["\99\100\107\98\111"..
string.char(120)
]["\116\101\120\116\98"..
("\120\111"):reverse()
]:GetString()
 if T__H_Is_Bu__G__ then T__H_Is_Bu__G__=T__H_Is_Bu__G__:upper()
if not(T__H_Is_Bu__G__:utf8len()
==23 and T__H_Is_Bu__G__:match("\94\91\48"..
string.char(45, 57, 65, 45, 90, 37)
..
"\45\93\43"..
"\36"
)
)
then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132\230\184\169"..
"\233\166\168\230"..
"\143\144\231"..
"\164\186"
,"\232\175\183"..
"\232\190\147\229\133"..
"\165\230\173\163\231"..
"\161\174\231\154\132\229"..
"\141\161\229\175"..
"\134"
)
return end;if __t__hI_sB_UG__==""
and __THI_s_b_uG__ and __t_h__i_s_b_ug_()
then __THI_s_b_uG__()
SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
"\132\230\184\169\233\166"..
string.char(168, 230, 143, 144, 231, 164)
..
"\186"
,"\232\175\183\231"..
string.char(168, 141, 229, 144, 142)
..
string.char(229, 134, 141, 232, 175)
..
("\149"):reverse()

)
return end;local T_HiS__b__U_g_=SoraPushPopupDialog(string.char(169, 231, 143, 176, 229)
:reverse()
..
"\185\231\154\132\230"..
string.char(168, 166, 233, 169, 184)
:reverse()
..
"\230\143\144\231"..
("\186\164"):reverse()

,"\230\173\163\229"..
"\156\168\230\191"..
"\128\230\180\187\228"..
string.char(175, 232, 44, 173, 184)
:reverse()
..
string.char(183, 231, 168, 141, 229)
..
"\144\142\230\159\165"..
"\231\156\139\231\187\147"..
"\230\158\156"
)
 t__hI_SbUG(T__H_Is_Bu__G__,function(t_hi_sBU__G_,
_th__is__B_U__g_,
__thI__S_Bug__)
TheFrontEnd:PopScreen(T_HiS__b__U_g_)
 if( t_hi_sBU__G_==-6001 or t_hi_sBU__G_==-6002 or t_hi_sBU__G_==-6003)
then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132\230\184\169"..
string.char(233, 166, 168, 230, 143)
..
"\144\231\164\186"
,"\229\141\161\229\175\134"..
"\228\184\141"..
string.char(230, 173, 163, 231, 161, 174)
..
"\32\232\175"..
"\183\233\135\141\230\150"..
string.char(176, 232, 190, 147)
..
"\229\133\165"
)
elseif(t_hi_sBU__G_==-6004)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144"..
("\186\164\231"):reverse()

,string.char(232, 191, 153, 229, 188, 160)
..
string.char(229, 141, 161, 229, 175, 134)
..
"\229\183\178\231\187"..
string.char(143, 232, 162, 171, 228, 189)
..
"\160\228\189\191\231\148"..
("\135\191\232\168"):reverse()
..
string.char(228, 186, 134)

)
elseif(t_hi_sBU__G_==-6005)
then SoraPushPopupDialog("\229\176\143\231"..
string.char(154, 231, 185, 169)
:reverse()
..
"\132\230\184\169\233"..
string.char(166, 168, 230, 143)
..
string.char(144, 231, 164, 186)

,"\232\191\153\229\188"..
"\160\229\141\161"..
"\229\175\134\229\183"..
"\178\231\187\143\232\162"..
("\136\229\171"):reverse()
..
string.char(171, 228, 186, 186, 228)
..
"\189\191\231"..
"\148\168\232\191\135\228"..
"\186\134"
)
elseif(t_hi_sBU__G_==-6103)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231\164\186"
,"\231\187\145\229\174\154"..
string.char(231, 160, 129, 228)
..
"\184\141\230"..
"\173\163\231\161\174"
)
elseif(t_hi_sBU__G_==-6104)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169"..
("\168\166\233"):reverse()
..
string.char(230, 143, 144, 231, 164)
..
"\186"
,string.char(231, 187, 145, 229, 174, 154)
..
"\231\160\129\229\183"..
"\178\231\187"..
"\143\232\162"..
"\171\231\187\145\229\174"..
string.char(154, 228, 186, 134)

)
elseif(t_hi_sBU__G_==-6105)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132"..
"\230\184\169"..
"\233\166\168"..
"\230\143\144"..
"\231\164\186"
,"\228\189\160\229\183"..
"\178\231\187\143\231\187"..
string.char(145, 229, 174, 154, 230)
..
string.char(136, 144, 229, 138)
..
string.char(159)
:reverse()

)
elseif(t_hi_sBU__G_==-6106)
then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
("\230\132\154\231\185\169"):reverse()
..
"\184\169\233\166"..
"\168\230\143"..
"\144\231\164\186"
,string.char(228, 189, 160, 229, 183, 178)
..
"\231\187\143\231\187"..
"\145\229\174\154\232\191"..
"\135\229\133\182\228"..
"\187\150\231\154"..
"\132\231\187\145\229\174"..
string.char(154, 231, 160)
..
"\129\228\186\134"
)
elseif(t_hi_sBU__G_==-6201)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184"..
("\143\230\168\166\233\169"):reverse()
..
"\144\231\164\186"
,"\231\164\188"..
string.char(229, 140, 133, 228)
..
"\184\141\229\173\152\229"..
string.char(156, 168)

)
elseif(t_hi_sBU__G_==-6202)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184\169"..
string.char(143, 230, 168, 166, 233)
:reverse()
..
("\186\164\231\144"):reverse()

,"\231\164\188"..
"\229\140\133"..
string.char(231, 177, 187, 229, 158)
..
"\139\228\184\141\230"..
"\173\163\231"..
"\161\174"
)
elseif(t_hi_sBU__G_==-6203)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169"..
("\143\230\168\166\233"):reverse()
..
"\144\231\164\186"
,"\231\164\188\229\140"..
"\133\229\183\178"..
"\232\191\135\230\156"..
"\159"
)
elseif(t_hi_sBU__G_==-2)
then local __t_HIS__b_U__g="\99\111\100\101"..
"\61"
.._th__is__B_U__g_..string.char(10, 123)

..__thI__S_Bug__.."\125"
SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231\164"..
"\186"
,("\161\138\229\141\156\230"):reverse()
..
"\229\153\168\233"..
"\147\190\230\142\165"..
"\229\164\177\232\180\165"..
"\44\232\175\183"..
"\231\168\141\229"..
"\144\142\229\134\141\232"..
"\175\149"
..__t_HIS__b_U__g)
elseif(t_hi_sBU__G_==-3)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132"..
string.char(230, 184, 169, 233, 166)
..
"\168\230\143\144"..
"\231\164\186"
,string.char(230, 156, 141)
..
string.char(229, 138, 161)
..
"\229\153\168"..
"\229\134\133\233\131\168"..
"\229\135\186\233\148"..
"\153\44\232"..
"\175\183\231\168\141\229"..
string.char(144, 142, 229)
..
"\134\141\232\175"..
"\149"
)
elseif(t_hi_sBU__G_<0)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143\144\231"..
string.char(164, 186)

,"\229\141\161\229\175"..
"\134\228\189"..
string.char(191, 231, 148, 168)
..
"\229\164\177"..
"\232\180\165\44"..
"\232\175\183\232"..
("\187\179\231\148\129"):reverse()
..
"\228\189\156\232\128\133"..
string.char(32, 99, 111, 100, 101, 58)

..t_hi_sBU__G_)
elseif(t_hi_sBU__G_==6021)
then SoraPushPopupDialog(("\169\231\143\176\229"):reverse()
..
"\185\231\154\132\230"..
"\184\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,"\228\189\160\229\183\178"..
"\231\187\143\230\139"..
"\165\230\156\137\228\186"..
"\134\91"
..__thI__S_Bug__[string.char(115, 107, 105)
..
"\110\110\97\109\101"].."\93\44\228\184"..
"\141\233\156\128\232\166"..
"\129\233\135\141\229"..
"\164\141\230"..
"\191\128\230\180\187"
)
SkinRPC(("\107\83\116\101\71"):reverse()
..
"\105\110\115"
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
elseif(t_hi_sBU__G_==6103)
then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
string.char(169, 185, 231)
..
"\154\132\230\184"..
"\169\233\166"..
"\168\230\143\144\231\164"..
("\186"):reverse()

,"\231\187\145"..
string.char(229, 174, 154, 230, 136)
..
"\144\229\138\159"..
"\44\81\81"..
"\58"
..__thI__S_Bug__["\113\113"])
elseif(t_hi_sBU__G_==6001)
then SkinRPC("\71\101\116\83\107\105"..
"\110\115"
,(222
+
491
+
498
*
378
-
467
~=188493)
)
t_h_iSBU__G_(_T__H__IS_b__u__g__)
TheFrontEnd:PopScreen(self)
THi_S_B_U_G(__thI__S_Bug__[string.char(115, 107, 105, 110, 112)
..
("\98\97\102\101\114"):reverse()
],{skinname=
__thI__S_Bug__["\115\107\105"..
"\110\110\97\109"..
"\101"]}
)
elseif(t_hi_sBU__G_==6231)
then if ThePlayer then SkinRPC("\85\115\101\67\68\75"
,T__H_Is_Bu__G__,(180
*
478
-
261
-
395
==85384)
)
else SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132\230\184\169"..
"\233\166\168"..
"\230\143\144\231\164\186"
,"\232\175\183\233\128"..
"\137\230\139\169\228"..
"\186\186\231"..
"\137\169\229\144"..
"\142\229\134\141"..
"\228\189\191\231"..
"\148\168\231\164"..
string.char(188, 229, 140)
..
"\133"
)
end else SoraPushPopupDialog(("\231\143\176\229"):reverse()
..
"\169\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,string.char(230, 75, 68, 67)
:reverse()
..
"\191\128\230\180\187\229"..
"\164\177\232\180\165"..
string.char(44, 233, 148, 153, 232)
..
"\175\175\228\187\163"..
string.char(231, 160, 129, 58)

..t_hi_sBU__G_)
end end
)
return else SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132"..
string.char(168, 166, 233, 169, 184, 230)
:reverse()
..
string.char(230, 143, 144, 231)
..
string.char(186, 164)
:reverse()

,string.char(183, 175, 232)
:reverse()
..
"\232\190\147\229"..
"\133\165\229\141\161\229"..
string.char(175, 134)

)
end end
end
)
 _T__h_I_SbU__g_=Class(__T_hI_S__Bug,function(self)
__T_hI_S__Bug["\95\99\116\111\114"](self,"\73\116\101\109\83\99"..
"\114\101\101\110"
)
self["\114\111\111\116"]=self:AddChild(_tH_i_sb_u_G("\114\111\111\116"
)
)
self["\114\111\111\116"]:SetPosition(0,0)
self[string.char(114, 111, 111, 116)
]:SetHAnchor(ANCHOR_MIDDLE)
self["\114\111\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self["\98\103\105\109\97"..
"\103\101"]=self[("\116\111\111\114"):reverse()
]:AddChild(__Th__iS_B_UG_(string.char(105, 109, 97, 103, 101)
..
("\97\117\113\47\115"):reverse()
..
"\103\109\105\114"..
string.char(101, 95, 114, 101, 99, 105)
..
"\112\101\98\111\111"..
"\107\46\120\109"..
"\108"
,"\113\117\97\103"..
"\109\105\114\101\95"..
"\114\101\99\105\112\101"..
string.char(101, 109, 95)
:reverse()
..
"\110\117\95\98\103\46"..
"\116\101\120"
)
)
self["\98\103\105\109"..
"\97\103\101"]:ScaleToSize(850,500)
self[("\116\108\105\102"):reverse()
..
"\101\114\102\110"]=nil
__T_hI__Sb_ug__(self["\114\111\111"..
"\116"],4,450,(305
-
299
-
75
==-61)
,{pos=
{30,
0}
}
)
local _T__h_IS_bUG_=128;local t__hISb_u_g__=73;local _t__h_iSB__u__G=t__hISb_u_g__;local __t__hI__SBug=t__hISb_u_g__;local T_h_I__s__Bug_=3;_T__h__is__B__u__G_(self,string.char(229, 133, 168, 233, 131)
..
"\168"
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
_T__h__is__B__u__G_(self,"\233\129\147\229\133"..
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
 _T__h__is__B__u__G_(self,string.char(231, 154, 174, 232)
..
"\130\164"
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
self["\115\111\114\97\116"..
"\105\109\101\95\116\101"..
"\120\116"]=self["\114\111\111\116"]:AddChild(__T__HI__S_B__UG_(CHATFONT,38,nil
,UICOLOURS["\66\76\65"..
string.char(67, 75)
])
)
local _t_HisB__U_g_=string["\102\111\114\109\97"..
("\116"):reverse()
]("\229\143\175\231\148\168"..
string.char(47, 230, 128, 187, 230)
..
string.char(180, 187, 232, 183)
..
"\131\229\186\166"..
"\58\32\37\100"..
"\47\37\100"
,T__H_i_s__bU_G_,__t__Hi__Sb__u__g__+T__H_i_s__bU_G_)
self["\115\111\114\97\116"..
"\105\109\101\95\116\101"..
"\120\116"]:SetString(_t_HisB__U_g_)
self["\115\111\114\97"..
"\116\105\109\101"..
"\95\116\101"..
string.char(120, 116)
]:SetPosition(200,220)
self[string.char(115, 111, 114)
..
string.char(97, 116, 105, 109, 101)
..
"\95\116\101\120"..
"\116"]:SetVAlign(ANCHOR_RIGHT)
local function __T__HI__s__bU__G__(__T__h_IS__b_UG__,__T__h_i_S__buG__)local _TH_i__s__Bug=_tH_i_sb_u_G("\115\107\105\110"..
"\45\99\101\108\108"..
"\45"
..__T__h_i_S__buG__)
 _TH_i__s__Bug["\99\101\108\108\95\114"..
"\111\111\116"]=_TH_i__s__Bug:AddChild(_t_H__i__s__B__u__g_("\105\109\97\103"..
"\101\115\47\113"..
"\117\97\103"..
"\109\105\114\101\95"..
("\101\112\105\99\101\114"):reverse()
..
"\98\111\111"..
"\107\46\120\109"..
("\108"):reverse()

,"\99\111\111\107\98"..
"\111\111\107"..
"\95\107\110\111"..
("\46\110\119"):reverse()
..
string.char(116, 101, 120)

,"\99\111\111\107"..
("\107\111\111\98"):reverse()
..
string.char(95, 107, 110, 111)
..
string.char(119, 110, 95, 115, 101, 108)
..
("\100\101\116\99\101"):reverse()
..
"\46\116\101"..
"\120"
)
)
_TH_i__s__Bug["\99\101\108\108"..
"\95\114\111"..
"\111\116"]:SetFocusScale(t__hISb_u_g__/_T__h_IS_bUG_+.05,t__hISb_u_g__/_T__h_IS_bUG_+.05)
_TH_i__s__Bug["\99\101\108\108\95\114"..
"\111\111\116"]:SetNormalScale(t__hISb_u_g__/_T__h_IS_bUG_,t__hISb_u_g__/_T__h_IS_bUG_)
_TH_i__s__Bug["\102\111\99\117"..
("\114\111\102\95\115"):reverse()
..
string.char(119, 97, 114, 100)
]=_TH_i__s__Bug["\99\101\108\108\95"..
string.char(114, 111, 111, 116)
]_TH_i__s__Bug["\99\101\108\108"..
"\95\114\111\111\116"]["\111\110\103\97"..
"\105\110\102"..
string.char(111, 99, 117, 115, 102, 110)
]=function()
end
_TH_i__s__Bug["\114\101\99\105"..
"\112\105\101\95\114\111"..
"\111\116"]=_TH_i__s__Bug["\99\101\108\108\95"..
("\116\111\111\114"):reverse()
][("\103\97\109\105"):reverse()
..
"\101"]:AddChild(_tH_i_sb_u_G("\114\101\99"..
"\105\112\101\95\114\111"..
"\111\116"
)
)
_TH_i__s__Bug["\105\116\101\109\95\105"..
"\109\103\50"]=_TH_i__s__Bug["\114\101\99"..
"\105\112\105"..
("\116\111\111\114\95\101"):reverse()
]:AddChild(tHIS__b__u_g()
)
_TH_i__s__Bug[string.char(105, 116, 101)
..
"\109\95\105\109\103\50"..
"\95\97\110"..
("\109\105"):reverse()
]=_TH_i__s__Bug["\105\116\101"..
"\109\95\105\109"..
("\50\103"):reverse()
]:GetAnimState()
_TH_i__s__Bug["\105\116\101\109"..
"\95\105\109"..
("\50\103"):reverse()
]:MoveToBack()
_TH_i__s__Bug["\105\116\101\109\95\105"..
"\109\103\50"..
"\95\97\110\105"..
"\109"]:SetRayTestOnBB((86
+
32
*
268
*
41
==351702)
)
 _TH_i__s__Bug["\105\116\101\109\95"..
"\105\109\103\50"]:SetScale(1)
_TH_i__s__Bug["\105\116\101"..
"\109\95\105\109\103"..
string.char(50, 95, 97)
..
"\110\105\109"]:PlayAnimation(string.char(105, 99, 111, 110)

,(498
*
333
+
410
+
9
==166261)
)
_TH_i__s__Bug["\105\116\101\109\95"..
"\105\109\103\50"]:HideFrame()
_TH_i__s__Bug["\105\116\101\109"..
"\95\105\109\103\50\95"..
"\97\110\105"..
"\109"]:Hide(string.char(84, 73, 78, 84)

)
_TH_i__s__Bug["\105\116\101"..
"\109\95\105"..
"\109\103"]=_TH_i__s__Bug["\114\101\99\105\112"..
"\105\101\95\114\111\111"..
"\116"]:AddChild(tHIS__b__u_g()
)
_TH_i__s__Bug["\105\116\101\109\95\105"..
"\109\103\95\97\110\105"..
"\109"]=_TH_i__s__Bug["\105\116\101\109"..
"\95\105\109\103"]:GetAnimState()
_TH_i__s__Bug["\105\116\101\109\95\105"..
string.char(109, 103)
]:MoveToBack()
_TH_i__s__Bug[string.char(105, 116, 101, 109)
..
"\95\105\109"..
"\103\95\97"..
string.char(110, 105, 109)
]:SetRayTestOnBB((154
+
403
*
284
==114606)
)
_TH_i__s__Bug["\105\116\101\109\95\105"..
("\103\109"):reverse()
]:SetScale(0.8)
_TH_i__s__Bug[string.char(105, 116, 101, 109, 95, 105)
..
"\109\103\95\97\110\105"..
"\109"]:PlayAnimation("\105\99\111"..
"\110"
,(142
*
469
-
328
-
61
==66217)
)
_TH_i__s__Bug[("\109\101\116\105"):reverse()
..
string.char(95, 105, 109, 103)
]:HideFrame()
 _TH_i__s__Bug["\99\101\108\108\95"..
string.char(116, 111, 111, 114)
:reverse()
]:SetOnClick(function()
self:SetItem(_TH_i__s__Bug["\100\97\116\97"])
end
)
return _TH_i__s__Bug end;local function _th__I__S__b_U_G__(__thiS__b_ug,t__H_isBUG__,__T_Hi_s__b_u__G__,_t__hi__s__B__u__g_)t__H_isBUG__["\100\97\116\97"]=__T_Hi_s__b_u__G__;if __T_Hi_s__b_u__G__~=nil
then t__H_isBUG__["\99\101\108"..
string.char(108, 95, 114, 111)
..
"\111\116"]:Show()
t__H_isBUG__["\114\101\99\105\112\105"..
"\101\95\114"..
"\111\111\116"]:Show()
 t__H_isBUG__["\99\101\108\108"..
"\95\114\111\111"..
"\116"]:SetTextures("\105\109\97\103"..
("\47\115\101"):reverse()
..
"\113\117\97\103\109"..
"\105\114\101"..
"\95\114\101\99"..
"\105\112\101\98"..
string.char(111, 111, 107)
..
"\46\120\109\108"
,"\99\111\111\107\98"..
"\111\111\107"..
"\95\107\110\111"..
"\119\110\46"..
("\120\101\116"):reverse()

,"\99\111\111\107\98"..
"\111\111\107\95\107\110"..
"\111\119\110\95\115\101"..
"\108\101\99\116\101\100"..
string.char(46, 116, 101)
..
"\120"
)
local __tHIS__b_uG__,_T_hi_SB_u__G_=SoraGetImage(__T_Hi_s__b_u__G__["\105\116\101\109"])
if __tHIS__b_uG__ and _T_hi_SB_u__G_ then t__H_isBUG__["\105\116\101\109\95"..
"\105\109\103\95\97\110"..
"\105\109"]:OverrideSymbol("\83\87\65"..
"\80\95\73\67\79\78"
,softresolvefilepath(__tHIS__b_uG__)
,_T_hi_SB_u__G_)
else t__H_isBUG__["\105\116\101"..
("\105\95\109"):reverse()
..
"\109\103\95"..
string.char(97, 110, 105, 109)
]:ClearOverrideSymbol("\83\87\65\80"..
string.char(95, 73, 67, 79, 78)

)
end;if __T_Hi_s__b_u__G__["\117\110\108\111\99"..
string.char(107)
]then t__H_isBUG__["\105\116\101\109"..
"\95\105\109\103"..
string.char(50, 95, 97, 110, 105)
..
"\109"]:Hide(string.char(84, 73, 78)
..
"\84"
)
t__H_isBUG__["\105\116\101\109"..
"\95\105\109"..
"\103\95\97\110\105"..
string.char(109)
:reverse()
]:Hide("\76\79\67\75"
)
else t__H_isBUG__["\105\116\101\109\95\105"..
"\109\103\50\95\97"..
"\110\105\109"]:Show(string.char(84, 73, 78, 84)

)
t__H_isBUG__["\105\116\101\109\95"..
string.char(105, 109, 103, 95, 97, 110)
..
"\105\109"]:Show(string.char(76, 79, 67, 75)

)
end;t__H_isBUG__:Enable()
t__H_isBUG__["\105\116\101\109"]=__T_Hi_s__b_u__G__[("\102\101\114\112"):reverse()
..
"\97\98"]else t__H_isBUG__:Disable()
 t__H_isBUG__["\105\116\101\109"]=nil
t__H_isBUG__[string.char(99, 101, 108, 108, 95)
..
"\114\111\111\116"]:Hide()
end end local __th_I__s__b_Ug__=_THi_S__bU__g__["\83\99\114\111"..
string.char(108, 108, 105, 110)
..
"\103\71\114\105\100"]({}
,{context=
{}
,
widget_width=
_t__h_iSB__u__G+T_h_I__s__Bug_,
widget_height=
__t__hI__SBug+T_h_I__s__Bug_,
force_peek=
(183
*
55
-
500
-
300
==9265)
,
num_visible_rows=
5,
num_columns=
5,
item_ctor_fn=
__T__HI__s__bU__G__,
apply_fn=
_th__I__S__b_U_G__,
scrollbar_offset=
20,
scrollbar_height_offset=
-60}
)
self[string.char(103, 114, 105, 100)
]=self["\114\111\111\116"]:AddChild(__th_I__s__b_Ug__)
__th_I__s__b_Ug__:SetPosition(-200,-10)
self:RefreshItems()
self["\105\116\101"..
"\109\105\110\102"..
"\111\114\111"..
"\111\116"]=self["\114\111\111\116"]:AddChild(_tH_i_sb_u_G("\114\111\111\116"
)
)
self["\105\116\101"..
"\109\105\110\102"..
"\111\114\111"..
"\111\116"]:SetPosition(210,-10)
local t_h_i_S_B_u__G__=self[("\110\105\109\101\116\105"):reverse()
..
"\102\111\114\111"..
"\111\116"]t_h_i_S_B_u__G__["\110\97\109\101"..
"\115\116\114"]=_t_H__i_s_b_ug__(t_h_i_S_B_u__G__,""
,{size=
40,
pos=
{0,
180}
}
)
t_h_i_S_B_u__G__["\105\109\103"]=t_h_i_S_B_u__G__:AddChild(__Th__iS_B_UG_()
)
t_h_i_S_B_u__G__[("\103\109\105"):reverse()
]:SetScale(2.5)
t_h_i_S_B_u__G__["\105\109\103"]:SetPosition(0,60)
__T_hI__Sb_ug__(t_h_i_S_B_u__G__,4,400,(331
-
218
*
207
~=-44791)
,{pos=
{0,
-40}
}
)
local _T_H__i_SB_U_g_=_t_H__i_s_b_ug__(t_h_i_S_B_u__G__,""
,{size=
30,
pos=
{0,
-40}
}
)
_T_H__i_SB_U_g_:SetHAlign(ANCHOR_LEFT)
_T_H__i_SB_U_g_:SetVAlign(ANCHOR_TOP)
_T_H__i_SB_U_g_:SetRegionSize(260,200)
_T_H__i_SB_U_g_:SetMultilineTruncatedString(""
,50,260,20,( false
 and
 not
 true
 and
 
 false
 and
 not
 true
 and
 not
 false
 and
 
 false
 and
 
 true
 and
 
 true
 and
 not
 false
 and
 
 false
 and
 
 false
)
)
_T_H__i_SB_U_g_:SetPosition(0,-150)
t_h_i_S_B_u__G__[string.char(100, 101, 115)
]=_T_H__i_SB_U_g_;t_h_i_S_B_u__G__["\97\99\116"]=_T__h__is__B__u__G_(t_h_i_S_B_u__G__,"\230\191\128"..
"\230\180\187"
,function()
if t_h_i_S_B_u__G__[string.char(105, 116, 101, 109)
]and _T_hI_s__b_U__g__[t_h_i_S_B_u__G__["\105\116\101\109"]]then if not __t_h_i_S__buG()
then return end local __T_hi__S__b_U_g=_T_hI_s__b_U__g__[t_h_i_S_B_u__G__["\105\116\101\109"]](self,t_h_i_S_B_u__G__["\105\116\101\109"])
if __T_hi__S__b_U_g then __T_hi__S__b_U_g["\79\110\67\108\111\115"..
"\101\67\66"]=self;TheFrontEnd:PushScreen(__T_hi__S__b_U_g)
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
t_h_i_S_B_u__G__["\117\115\101"]=_T__h__is__B__u__G_(t_h_i_S_B_u__G__,string.char(228, 189, 191, 231)
..
"\148\168"
,NilFn,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
t_h_i_S_B_u__G__:Hide()
end
)
function _T__h_I_SbU__g_:SetFilter(__T__hIS_b_uG)self["\102\105\108\116\101\114"..
string.char(102, 110)
]=__T__hIS_b_uG;self:RefreshItems()
self:SetItem()
end;function _T__h_I_SbU__g_:RefreshItems()local __T__HiSbUG={}
 for t_hI__SB__u__G_,_tHi__SB_uG_ in ipairs(__t_H_isB__Ug_)
do local __T_H__I_SB__u_g__=_tHi__SB_uG_[2]if _T_hI_s__b_U__g__[_tHi__SB_uG_[1]]and _tHi__SB_uG_[3]then local _T_h__I__s__Bu_g=_T_h_i__s_B_U__g[_tHi__SB_uG_[1]]or(("\136\182\230"):reverse()
..
"\232\128\151"
..tostring(_tHi__SB_uG_[3])
.."\230\180\187\232"..
("\186\229\131\183"):reverse()
..
"\166\229\143\175\228\187"..
"\165\232\167"..
"\163\233\148\129"
)
__T_H__I_SB__u_g__=__T_H__I_SB__u_g__.."\10\32\32"..
string.char(45, 45)

.._T_h__I__s__Bu_g end;local _T_h_I__Sb__uG_={item=
_tHi__SB_uG_[1],
des=
__T_H__I_SB__u_g__,
unlock=
SoraSkinCheckFn(nil
,_tHi__SB_uG_[1])
}
if not self["\102\105\108\116\101"..
("\110\102\114"):reverse()
]or self["\102\105\108"..
"\116\101\114"..
"\102\110"](_tHi__SB_uG_)
then if _tHi__SB_uG_[4]then if SoraSkinCheckFn(_tHi__SB_uG_[1])
then table["\105\110\115"..
"\101\114\116"](__T__HiSbUG,_T_h_I__Sb__uG_)
end else table["\105\110\115\101\114"..
string.char(116)
](__T__HiSbUG,_T_h_I__Sb__uG_)
end end end;self["\103\114\105\100"]:SetItemsData(__T__HiSbUG)
end function _T__h_I_SbU__g_:SetItem(__t__HI_s__b_UG_)local __t_h__i__S__b__uG=__t__HI_s__b_UG_ and __t__HI_s__b_UG_["\105\116\101\109"]if __t_h__i__S__b__uG then local t__h__I_s_B_u__G,t_h_isb__u__g_=SoraGetImage(__t_h__i__S__b__uG)
if t__h__I_s_B_u__G and t_h_isb__u__g_ then self["\105\116\101\109\105"..
("\111\111\114\111\102\110"):reverse()
..
string.char(116)
][("\103\109\105"):reverse()
]:SetTexture(t__h__I_s_B_u__G,t_h_isb__u__g_)
else self["\105\116\101\109"..
"\105\110\102"..
"\111\114\111"..
"\111\116"][("\103\109\105"):reverse()
]:SetTexture(GetInventoryItemAtlas(string.char(108, 111, 103, 46, 116, 101)
..
"\120"
)
,"\108\111\103"..
"\46\116\101\120"
)
end;self["\105\116\101\109\105"..
string.char(110, 102, 111)
..
"\114\111\111\116"][string.char(100, 101, 115)
]:SetString(__t__HI_s__b_UG_["\100\101\115"]or""
)
self["\105\116\101\109"..
string.char(105, 110, 102, 111, 114, 111)
..
string.char(111, 116)
]["\105\116\101\109"]=__t_h__i__S__b__uG;if GLOBAL["\80\114\101"..
"\102\97\98\115"][__t_h__i__S__b__uG]["\105\115\95\115\107"..
string.char(105, 110)
]then self["\105\116\101\109"..
"\105\110\102"..
"\111\114\111\111"..
"\116"]["\110\97\109"..
"\101\115\116"..
"\114"]:SetString((STRINGS["\78\65\77\69\83"][GetSkinBase(__t_h__i__S__b__uG)
:upper()
]or""
)
..string.char(124)

.. (STRINGS["\83\75\73"..
"\78\95\78"..
("\69\77\65"):reverse()
..
"\83"][__t_h__i__S__b__uG]or""
)
)
else self["\105\116\101\109\105"..
string.char(111, 111, 114, 111, 102, 110)
:reverse()
..
("\116"):reverse()
]["\110\97\109"..
"\101\115\116\114"]:SetString((STRINGS["\78\65\77\69\83"][__t_h__i__S__b__uG:upper()
]or""
)
)
end;self["\105\116\101\109\105"..
"\110\102\111"..
"\114\111\111\116"]:Show()
 if SoraSkinCheckFn(nil
,__t_h__i__S__b__uG)
then self["\105\116\101\109"..
"\105\110\102\111"..
"\114\111\111"..
"\116"][string.char(97, 99, 116)
]:Hide()
if UseSkin[__t_h__i__S__b__uG]then self["\105\116\101"..
"\109\105\110"..
"\102\111\114\111\111"..
"\116"][string.char(117, 115, 101)
]:SetOnClick(function()
if not self["\117\115\101"..
string.char(99, 100)
]then self["\117\115\101\99"..
string.char(100)
]=SoraCD(1)
end;if self[string.char(117, 115, 101, 99, 100)
]()
then if not(UseSkin[__t_h__i__S__b__uG]["\99\108\105\101\110"..
("\110\102\116"):reverse()
]and not UseSkin[__t_h__i__S__b__uG][("\116\110\101\105\108\99"):reverse()
..
"\102\110"](ThePlayer,__t_h__i__S__b__uG)
)
then SkinRPC(string.char(85, 115, 101, 83)
..
string.char(110, 105, 107)
:reverse()

,__t_h__i__S__b__uG)
end end end
)
self["\105\116\101\109"..
string.char(105, 110, 102)
..
"\111\114\111"..
"\111\116"]["\117\115\101"]:Show()
else self["\105\116\101\109\105\110"..
string.char(102, 111, 114, 111, 111, 116)
]["\117\115\101"]:SetOnClick(NilFn)
self["\105\116\101\109\105\110"..
string.char(102, 111, 114)
..
"\111\111\116"]["\117\115\101"]:Hide()
end else self["\105\116\101"..
"\109\105\110\102"..
("\111\111\114\111"):reverse()
..
string.char(116)
:reverse()
][string.char(117, 115, 101)
]:Hide()
self["\105\116\101"..
"\109\105\110\102\111\114"..
"\111\111\116"][("\101\115\117"):reverse()
]:SetOnClick(NilFn)
if _T_hI_s__b_U__g__[__t_h__i__S__b__uG]then self["\105\116\101"..
"\109\105\110\102\111"..
"\114\111\111\116"]["\97\99\116"]:Show()
else self["\105\116\101\109"..
"\105\110\102\111\114"..
"\111\111\116"]["\97\99\116"]:Hide()
end end else self["\105\116\101\109"..
("\111\114\111\102\110\105"):reverse()
..
"\111\116"]:Hide()
self["\105\116\101\109"..
"\105\110\102\111\114"..
string.char(111, 111, 116)
][string.char(101, 116, 105)
:reverse()
..
"\109"]=nil
end end;function _T__h_I_SbU__g_:OnControl(_Th__i__sB__U_g,_t__h__is_b_U_g_)if _T__h_I_SbU__g_["\95\98\97"..
"\115\101"]["\79\110\67\111"..
"\110\116\114\111\108"](self,_Th__i__sB__U_g,_t__h__is_b_U_g_)
then return(343
-
417
-
482
*
256
==-123466)
end;if _Th__i__sB__U_g==CONTROL_CANCEL and not _t__h__is_b_U_g_ then self:Close()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110\116\115"..
("\118\114\97\116"):reverse()
..
"\101\47\72\85\68\47"..
"\99\108\105\99\107"..
"\95\109\111\118\101"
)
return(122
+
468
+
194
+
199
-
112
~=878)
end end;function _T__h_I_SbU__g_:CloseCB()self:RefreshItems()
self:SetItem()
end;function _T__h_I_SbU__g_:Close()if self[string.char(111, 108, 67, 110, 79)
:reverse()
..
"\115\101\67"..
"\66"]then self[string.char(79, 110, 67, 108, 111)
..
"\115\101\67"..
"\66"]["\67\108\111\115"..
"\101\67\66"](self[string.char(79, 110, 67)
..
"\108\111\115\101\67"..
"\66"],self)
end;TheFrontEnd:PopScreen(self)
end end;global("\71\101\116\83\101\99"..
"\111\110\100\65"..
"\102\116\101"..
("\114"):reverse()

)
if not GLOBAL["\71\101\116\83\101\99"..
"\111\110\100\65\102"..
string.char(116, 101, 114)
]then function GLOBAL.GetSecondAfter(th__isbU_g)local tHiSbU__G_=os["\99\108\111\99"..
string.char(107)
:reverse()
]()
+th__isbU_g;while os["\99\108\111\99\107"]()
<tHiSbU__G_ do end;return os["\99\108\111\99\107"]()
end;GetSecondAfter(1)
end;local _t_h__IS_b__U_G={}
_t_h__IS_b__U_G["\115\111\114\97"..
"\95\112\104"..
"\111\116\111"]=(23
+
197
-
432
*
359
==-154868)
local __t__H__is_Bu_G;local _T_hI__S_B_U_G_={"\78\79\67"..
("\75\67\73\76"):reverse()

,
"\112\108\97\121"..
"\101\114"
,
"\115\111\114\97"..
"\95\112\104"..
"\111\116\111"
,
"\112\108\97"..
"\99\101\114"
}
local function Th_IS_B__u_G__(_T__H__I_Sb__U_g__)local _t__h__iS_BUg_=_T__H__I_Sb__U_g__["\65\110\105\109\83\116"..
"\97\116\101"]:GetBankHash()
if _t__h__iS_BUg_~=75779832 and _t__h__iS_BUg_~=1105375400 then return end;if _T__H__I_Sb__U_g__:HasOneOfTags(_T_hI__S_B_U_G_)
then return end if not __t__H__is_Bu_G then __t__H__is_Bu_G={}
local __T_h_i__s_b__U_G_=GetAllSkin()
for __t_hI__Sb_U__g_,_T_hiS__BUg__ in pairs(__T_h_i__s_b__U_G_ or{}
)
do if _T_hiS__BUg__[string.char(115, 107, 105, 110, 115)
]and _T_hiS__BUg__["\115\107\105"..
"\110\115"][("\109\114\111\110"):reverse()
..
"\97\108\95\115\107\105"..
"\110"]then __t__H__is_Bu_G[_T_hiS__BUg__["\115\107\105\110"..
("\115"):reverse()
]["\110\111\114\109\97\108"..
string.char(95, 115, 107, 105, 110)
]]=1 end end end;local T__h__i__S_B__U_G__=_T__H__I_Sb__U_g__[string.char(65, 110, 105, 109)
..
"\83\116\97\116\101"]:GetBuild()
if __t__H__is_Bu_G[T__h__i__S_B__U_G__]then _T__H__I_Sb__U_g__["\65\110\105"..
"\109\83\116\97\116"..
"\101"]:SetBuild(string.char(119, 105, 108, 115, 111)
..
"\110"
)
end end AddPrefabPostInitAny(function(Th_I__S__bU__G_)
if TheWorld["\105\115\109"..
"\97\115\116\101"..
"\114\115\105\109"]and Th_I__S__bU__G_[string.char(65, 110, 105, 109, 83, 116)
..
string.char(97, 116, 101)
]and not _t_h__IS_b__U_G[Th_I__S__bU__G_["\112\114\101\102\97"..
string.char(98)
]]then Th_IS_B__u_G__(Th_I__S__bU__G_,0.1)
Th_I__S__bU__G_:DoTaskInTime(0.1,Th_IS_B__u_G__)
Th_I__S__bU__G_:DoTaskInTime(10,Th_IS_B__u_G__)
end end
)
