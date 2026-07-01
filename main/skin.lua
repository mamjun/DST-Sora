--[[
授权级别:不授权
Copyright 2025 [FL]。
该文件仅限我自己使用 谢绝授权
]]-- 请勿破解本文件
local ThI_sBU_G={}
local _T_Hi__S__bu__G_={}
local _t_H_I_sB__Ug_={}
local T__H__I__SbuG__={}
local _t_H__is__bu__g__=SoraAPI["\106\115\111\110"]local _Th__I__sb_uG__={}
local t__HIS__B__u_g={}
local t_H__i_SBUG=TheNet:GetUserID()
local __Th__i__SB__U__g_=""
local _t__hI__S_B__ug__;local __tH__i_S__B__u_G={}
local function _TH__I_s__b__U_g_(thI__S__BUG)return string["\115\117\98"](thI__S__BUG,-5)
== ("\101\110\111\110\95"):reverse()

end;local __t__h__Is_b__u_G__=(376
+
346
-
207
+
478
~=993)
function SoraSkinCheckFn(__T_Hi__S_B_Ug,TH__I_S_B__U_G)if __T_Hi__S_B_Ug and not TH__I_S_B__U_G then TH__I_S_B__U_G=__T_Hi__S_B_Ug end;TH__I_S_B__U_G=GetSkinMap(TH__I_S_B__U_G)
return _TH__I_s__b__U_g_(TH__I_S_B__U_G)
or(_T_Hi__S__bu__G_[TH__I_S_B__U_G]or T__H__I__SbuG__[TH__I_S_B__U_G])
and(445
*
257
-
106
+
178
-
309
~=114132)
or(468
*
181
+
219
~=84927)
end;function SoraSkinCheckClientFn(_TH__IS_b_u__g,_t__hiS__B_Ug,t_H_I__S__b_u__g)local thi__s_b__u__g=t_H_I__S__b_u__g;t_H_I__S__b_u__g=GetSkinMap(t_H_I__S__b_u__g)
if _t__hiS__B_Ug and t_H_I__S__b_u__g then local __Th_I_S_B_uG_=GetSkin(t_H_I__S__b_u__g)
if not __Th_I_S_B_uG_ and not IsItem({t_H_I__S__b_u__g}
)
then return(155
+
150
*
250
+
31
==37688)
end;local __Thi__s__bu_G;if thi__s_b__u__g~=t_H_I__S__b_u__g then __Thi__s__bu_G=GetSkin(thi__s_b__u__g)
end;if __Th_I_S_B_uG_ and(__Thi__s__bu_G or __Th_I_S_B_uG_)
["\105\115\99\104"..
"\97\114\97\99\116\101"..
"\114\115\107\105"..
string.char(110, 115)
]then if __tH__i_S__B__u_G[_t__hiS__B_Ug]then return(305
-
104
-
272
*
60
*
56
==-913719)
end;if not _Th__I__sb_uG__[_t__hiS__B_Ug]then return(350
*
413
+
179
*
89
*
6
~=240146)
end end;if _Th__I__sb_uG__[_t__hiS__B_Ug]then if ThI_sBU_G[_t__hiS__B_Ug]and ThI_sBU_G[_t__hiS__B_Ug][t_H_I__S__b_u__g]then return(209
+
129
+
498
==836)
end;if _t_H_I_sB__Ug_[_t__hiS__B_Ug]and _t_H_I_sB__Ug_[_t__hiS__B_Ug][t_H_I__S__b_u__g]then return(234
*
147
*
1
==34398)
end end;return(292
*
449
-
27
*
125
==127742)
end;return _TH__I_s__b__U_g_(t_H_I__S__b_u__g)
or(148
*
369
+
403
*
404
-
353
==217073)
end;UseSkin={}
function IsItem(__THi_s__B_U_g__)local T__H_Isb__uG__=__THi_s__B_U_g__[1]if UseSkin[T__H_Isb__uG__]then return(489
*
344
+
208
*
1
+
42
==168466)
else return(278
-
429
*
432
+
403
~=-184647)
end end;function IsSkin(__t_h__Is_B_U__g__)return not IsItem(__t_h__Is_B_U__g__)
end;function RegUseSkinFN(_tHIsB__ug__,_T_HI_S_B__u_G__,__t__H_i_S__B_U_g__)UseSkin[_tHIsB__ug__]={serverfn=
_T_HI_S_B__u_G__,
clientfn=
__t__H_i_S__B_U_g__}
end;local T__his_BUg="\83\111\114"..
"\97\83\107\105"..
"\110\67\97\99\104"..
"\101"
local _t_H_i__S__B_U_G_=T__his_BUg.."\95\115\101\114\118"..
string.char(101, 114)

if TheNet:GetIsServer()
then TheSim:GetPersistentString(_t_H_i__S__B_U_G_,function(__TH__Is_Bu_g,
_T__h_IS_bU__g__)
if __TH__Is_Bu_g then local t__h_IS__Bu__G_,__Th__i_s__b_u_g__=pcall(_t_H__is__bu__g__[string.char(100, 101, 99, 111, 100)
..
"\101"],_T__h_IS_bU__g__)
if t__h_IS__Bu__G_ and __Th__i_s__b_u_g__["\116\109\112"]and __Th__i_s__b_u_g__["\111\119\110\101\114"]then for t__h__iS_B__u__g,_t_Hi_SB__U__G__ in pairs(__Th__i_s__b_u_g__["\111\119\110"..
"\101\114"])
do if type(_t_Hi_SB__U__G__)
=="\116\97\98"..
"\108\101"
then ThI_sBU_G[t__h__iS_B__u__g]=_t_Hi_SB__U__G__ end end;for T_hI_S_B__u__g__,t_HI_sBU__G__ in pairs(__Th__i_s__b_u_g__["\116\109\112"])
do if type(t_HI_sBU__G__)
=="\116\97\98\108\101"
then _t_H_I_sB__Ug_[T_hI_S_B__u__g__]=t_HI_sBU__G__ end end end end end
)
end;if not TheNet:IsDedicated()
then TheSim:GetPersistentString(T__his_BUg,function(__T__h_i_s_B_u_G__,
__TH_Is_b__u_G_)
if __T__h_i_s_B_u_G__ then local _tH__I_s_bU__G,tH_Is_Bu_g=pcall(_t_H__is__bu__g__["\100\101\99\111"..
"\100\101"],__TH_Is_b__u_G_)
if _tH__I_s_bU__G and tH_Is_Bu_g[string.char(116, 109, 112)
]and tH_Is_Bu_g["\111\119\110"..
"\101\114"]then for _tHIs_Bu_G__,th__is__b__U_g__ in pairs(tH_Is_Bu_g["\111\119\110"..
"\101\114"])
do if type(_tHIs_Bu_G__)
== ("\114\116\115"):reverse()
..
"\105\110\103"
and th__is__b__U_g__==1 then _T_Hi__S__bu__G_[_tHIs_Bu_G__]=th__is__b__U_g__ end end;for T__HI_s_B_uG_,__t__H__i__S__b_U__g in pairs(tH_Is_Bu_g[string.char(116, 109, 112)
])
do if type(T__HI_s_B_uG_)
==string.char(115, 116, 114, 105)
..
"\110\103"
and __t__H__i__S__b_U__g==1 then T__H__I__SbuG__[T__HI_s_B_uG_]=__t__H__i__S__b_U__g end end end end end
)
end;function SaveSkinCache()if TheNet:GetIsServer()
then local __t__h_iS__B__U__G,_th_i__s_b_UG=pcall(_t_H__is__bu__g__["\101\110\99\111\100"..
"\101"],{owner=
ThI_sBU_G,
tmp=
_t_H_I_sB__Ug_}
)
if __t__h_iS__B__U__G then TheSim:SetPersistentString(_t_H_i__S__B_U_G_,_th_i__s_b_UG,(310
-
44
*
280
-
317
*
329
==-116303)
)
end end;local _thI__s__B__U__g,__T_h__IsB_U_G=pcall(_t_H__is__bu__g__["\101\110\99\111\100\101"],{owner=
_T_Hi__S__bu__G_,
tmp=
T__H__I__SbuG__}
)
if _thI__s__B__U__g then TheSim:SetPersistentString(T__his_BUg,__T_h__IsB_U_G,(391
*
277
-
392
==107915)
)
end end;local TH__i_sBU_G__={sora_mysora=
1,
sora_mysora_r=
1,
sora_yhjd=
1,
sora_sby=
1}
RegUseSkinFN(("\114\111\115"):reverse()
..
"\97\95\121\105"..
"\110\103\121"..
"\117"
,function(t__H_iS__Bug_,
T__H__i_s_B__uG)
if t__H_iS__Bug_ and t__H_iS__Bug_["\99\111\109"..
"\112\111\110"..
string.char(101, 110, 116, 115)
][("\116\105\97\114\111\115"):reverse()
..
"\101\109\99\111"..
"\110\116\114\111\108"]then t__H_iS__Bug_["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114\97\105"..
string.char(116, 101, 109, 99)
..
string.char(111, 110, 116, 114, 111, 108)
]:CreateItem("\115\111\114\97\95"..
"\121\105\110\103\121"..
"\117"
)
end end
)
 RegUseSkinFN("\115\111\114"..
string.char(97, 95, 100, 105, 101, 121)
..
"\117"
,function(T__Hi__SB_u__g__,
_T_h__i__Sb_U_G)
if T__Hi__SB_u__g__ and T__Hi__SB_u__g__["\99\111\109\112"..
"\111\110\101"..
"\110\116\115"]["\115\111\114\97\105\116"..
"\101\109\99\111\110\116"..
"\114\111\108"]then T__Hi__SB_u__g__[string.char(99, 111, 109, 112)
..
"\111\110\101\110\116"..
"\115"]["\115\111\114"..
("\109\101\116\105\97"):reverse()
..
("\114\116\110\111\99"):reverse()
..
("\108\111"):reverse()
]:CreateItem("\115\111\114\97\95\100"..
"\105\101\121"..
string.char(117)

)
end end
)
RegUseSkinFN("\115\111\114\97\95\113"..
"\105\121\117"
,function(__Thi__sb_Ug_,
Th_I_S__B_ug)
if __Thi__sb_Ug_ and __Thi__sb_Ug_[string.char(99, 111, 109)
..
string.char(112, 111, 110, 101, 110, 116)
..
"\115"][("\116\105\97\114\111\115"):reverse()
..
"\101\109\99\111\110"..
"\116\114\111"..
"\108"]then __Thi__sb_Ug_[string.char(99, 111, 109, 112, 111)
..
string.char(110, 101, 110, 116)
..
"\115"][("\105\97\114\111\115"):reverse()
..
"\116\101\109\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114\97"..
"\95\113\105\121\117"
)
end end
)
RegUseSkinFN(string.char(115, 111, 114, 97)
..
"\95\108\121\106"
,function(_Th__is__BU_g,
T_h__I_sb_U__g_)
 if _Th__is__BU_g and _Th__is__BU_g["\99\111\109"..
"\112\111\110\101\110"..
"\116\115"][string.char(115, 111, 114)
..
"\97\105\116\101\109"..
"\99\111\110\116\114\111"..
"\108"]then _Th__is__BU_g["\99\111\109"..
string.char(112, 111, 110)
..
"\101\110\116\115"]["\115\111\114\97\105\116"..
"\101\109\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114\97\95"..
"\108\121\106"
)
end end
)
RegUseSkinFN("\115\111\114\97\95"..
"\108\97\110\116"..
("\110\114\101"):reverse()

,function(_T_h_Isb__ug,
_tHI__S_B__U__g)
if _T_h_Isb__ug and _T_h_Isb__ug["\99\111\109\112\111"..
string.char(110, 101, 110, 116)
..
("\115"):reverse()
]["\115\111\114\97\105\116"..
"\101\109\99\111"..
"\110\116\114\111\108"]then _T_h_Isb__ug[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116\115"]["\115\111\114\97"..
"\105\116\101\109\99\111"..
"\110\116\114\111\108"]:CreateItem("\115\111\114"..
string.char(97, 95, 108, 97, 110)
..
"\116\101\114"..
"\110"
)
end end
)
RegUseSkinFN("\115\111\114\97"..
("\97\108\95"):reverse()
..
"\110\116\101\114"..
"\110\95\121\104"
,function(__th__is__B__u__G,
T__H__i__S__B__U_g)
if __th__is__B__u__G and __th__is__B__u__G[string.char(99, 111, 109, 112)
..
("\115\116\110\101\110\111"):reverse()
]["\115\111\114"..
"\97\105\116"..
string.char(101, 109, 99)
..
("\114\116\110\111"):reverse()
..
"\111\108"]then __th__is__B__u__G["\99\111\109"..
"\112\111\110\101"..
"\110\116\115"]["\115\111\114\97"..
"\105\116\101\109"..
"\99\111\110"..
"\116\114\111\108"]:CreateItem(string.char(115, 111, 114, 97, 95, 108)
..
("\110\114\101\116\110\97"):reverse()

,string.char(115, 111, 114, 97, 95, 108)
..
string.char(97, 110, 116)
..
"\101\114\110\95"..
"\121\104"
)
end end
)
RegUseSkinFN("\115\111\114\97"..
"\95\114\105\110\103"
,function(t__H__Is__bU__G_,
__Th_i__S__b_U__g__)
if t__H__Is__bU__G_ and t__H__Is__bU__G_["\99\111\109\112\111\110"..
"\101\110\116\115"][string.char(115, 111, 114)
..
"\97\105\116"..
"\101\109\99\111\110"..
"\116\114\111\108"]then t__H__Is__bU__G_["\99\111\109\112"..
string.char(115, 116, 110, 101, 110, 111)
:reverse()
]["\115\111\114\97\105"..
"\116\101\109"..
"\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114\97"..
"\95\114\105\110"..
"\103"
)
end end
)
local function __T__h__I__s_b_uG__(_T__h_i_s__b_U_G_,__Th__i_s__BU__G__,__tH_I__sb__U_G)local __T__h_i__SB_U__g__={}
__T__h_i__SB_U__g__["\113\117\111\116\101"..
string.char(115)
]="\230\149\162\229\138"..
"\168\230\136\145\229\176"..
string.char(177, 230, 157, 128, 228)
..
string.char(186, 134, 228, 189)
..
string.char(160, 229, 147, 166)

__T__h_i__SB_U__g__["\114\97\114\105\116"..
"\121"]="\230\149\162"..
"\229\138\168\230\136"..
"\145\229\176\177\230"..
"\157\128\228\186\134"..
"\228\189\160\229\147\166"
__T__h_i__SB_U__g__["\114\97\114\105"..
"\116\121\99\111\114"..
"\108\111\114"]={255/255,
215/255,
0/255,
1}
__T__h_i__SB_U__g__["\114\97\114"..
"\105\116\121\111\114"..
string.char(100, 101, 114)
]=100;__T__h_i__SB_U__g__[("\108\101\114"):reverse()
..
"\101\97\115\101\95\103"..
"\114\111\117\112"]=-1006;__T__h_i__SB_U__g__["\115\107\105"..
"\110\95\116\97"..
"\103\115"]={"\66\65\83\69"
,
"\115\111\114"..
"\97"
,
"\67\72\65\82\65\67"..
"\84\69\82"
}
__T__h_i__SB_U__g__["\115\107\105\110\115"]={normal_skin=
_T__h_i_s__b_U_G_,
ghost_skin=
"\103\104\111"..
string.char(111, 115, 95, 116, 115)
:reverse()
..
string.char(114, 97, 95, 98, 117, 105)
..
"\108\100"
}
__T__h_i__SB_U__g__[string.char(99, 104, 101, 99, 107)
..
"\102\110"]=SoraSkinCheckFn;__T__h_i__SB_U__g__["\99\104\101"..
"\99\107\99\108"..
string.char(116, 110, 101, 105)
:reverse()
..
"\102\110"]=SoraSkinCheckClientFn __T__h_i__SB_U__g__["\115\104\97\114\101"..
"\95\98\105"..
"\103\112\111"..
"\114\116\114"..
string.char(97, 105, 116, 95)
..
"\110\97\109"..
"\101"]=("\97\114\111\115"):reverse()

__T__h_i__SB_U__g__["\70\114\97"..
("\121\83\101\109"):reverse()
..
"\109\98\111\108"]="\68\105\115\116"..
"\105\110\103"..
string.char(117, 105, 115, 104)
..
string.char(101, 100)

for __thisB_uG,__Thi__sbU_g__ in pairs(__Th__i_s__BU__G__)
do __T__h_i__SB_U__g__[__thisB_uG]=__Thi__sbU_g__ end;if __T__h_i__SB_U__g__[string.char(105, 115, 95)
..
string.char(108, 111, 110, 103)
..
"\104\97\105\114"]then __T__h_i__SB_U__g__["\115\107\105\110\115"]["\103\104\111\115"..
string.char(116, 95, 115)
..
"\107\105\110"]=("\116\115\111\104\103"):reverse()
..
"\95\115\111\114\97"..
("\95\114\95"):reverse()
..
("\100\108\105\117\98"):reverse()

end;MakeCharacterSkin(("\114\111\115"):reverse()
..
"\97"
,_T__h_i_s__b_U_G_,__T__h_i__SB_U__g__)
 if not __tH_I__sb__U_G then local _t__h_I__sB_uG_=shallowcopy(__T__h_i__SB_U__g__)
_t__h_I__sB_uG_["\114\97\114\105\116"..
string.char(121)
]="\233\153\144\230"..
string.char(228, 182, 151)
:reverse()
..
"\189\147\233\170\140"
_t__h_I__sB_uG_["\114\97\114"..
"\105\116\121\111\114"..
"\100\101\114"]=80;_t__h_I__sB_uG_["\114\97\114\105\116"..
"\121\99\111\114\108"..
"\111\114"]={0.957,
0.769,
0.188,
1}
_t__h_I__sB_uG_[("\97\114\70"):reverse()
..
"\109\101\83\121"..
string.char(109, 98, 111, 108)
]=string.char(104, 101, 105, 114)
..
string.char(108, 111, 111, 109)

_t__h_I__sB_uG_["\110\97\109\101"]=__Th__i_s__BU__G__["\110\97\109"..
string.char(101)
:reverse()
]..string.char(40, 233, 153)
..
"\144\230\151"..
"\182\41"
SoraAPI[string.char(77, 97, 107, 101, 67, 104)
..
"\97\114\97\99\116\101"..
"\114\83\107\105\110"]("\115\111\114\97"
,_T__h_i_s__b_U_G_.."\95\116\109"..
"\112"
,_t__h_I__sB_uG_)
end end;__T__h__I__s_b_uG__("\115\111\114\97"..
"\95\109\121"..
"\115\111\114\97"
,{name=
"\232\138\177\229\171"..
"\129"
,
des=
("\144\173\229\167\137\230"):reverse()
..
"\228\185\139\230"..
string.char(137, 139, 44, 228, 184, 142)
..
string.char(229, 173, 144)
..
string.char(229, 129, 149, 232)
..
"\128\129"
}
)
 __T__h__I__s_b_uG__("\115\111\114\97\95\109"..
"\121\115\111\114\97\95"..
"\114"
,{name=
string.char(232, 138, 177)
..
"\229\171\129"..
"\45\233\149\191"..
"\229\143\145"
,
is_longhair=
(314
-
14
+
297
~=601)
,
des=
("\173\229\167\137\230"):reverse()
..
"\144\228\185\139\230"..
string.char(137, 139, 44, 228, 184, 142)
..
"\229\173\144\229"..
"\129\149\232\128"..
"\129"
}
)
 __T__h__I__s_b_uG__("\115\111\114"..
string.char(97, 95, 115, 98, 121)

,{name=
"\230\176\184"..
"\230\129\146\230\176"..
"\180\229\133\181"..
"\230\156\136"
,
des=
"\228\187\163\232"..
"\161\168\230\156"..
"\136\228\186\174\230\182"..
"\136\231\129\173"..
"\228\189\160"
,
init_fn=
function(T_h_i_s__BUg)
if T_h_i_s__BUg and TheWorld["\105\115\109\97\115"..
"\116\101\114\115\105\109"]then T_h_i_s__BUg[string.char(115, 111, 114, 97, 102)
..
"\111\111\116\95\102"..
string.char(120)
]=SpawnPrefab("\115\111\114\97\95\102"..
"\111\111\116\95\102"..
"\120\95\115\98\121"
)
T_h_i_s__BUg["\115\111\114"..
"\97\102\111"..
"\111\116\95\102"..
"\120"][string.char(101, 110, 116, 105)
..
string.char(116, 121)
]:SetParent(T_h_i_s__BUg[("\121\116\105\116\110\101"):reverse()
])
T_h_i_s__BUg["\115\111\114"..
"\97\102\111\111\116\95"..
"\102\120"][string.char(111, 119, 110, 101, 114)
]=T_h_i_s__BUg;T_h_i_s__BUg[("\100\97\114\111\115"):reverse()
..
"\97\110\99"..
"\101\102\120"..
("\97\102\101\114\112"):reverse()
..
"\98"]="\115\111\114"..
string.char(97, 95, 102, 120, 95, 102)
..
"\101\97\116\104\101"..
"\114"
end end
,
clear_fn=
function(_T__h__I__sb__U__g__)
if _T__h__I__sb__U__g__ and _T__h__I__sb__U__g__[string.char(115, 111, 114, 97)
..
"\102\111\111\116\95"..
"\102\120"]and TheWorld["\105\115\109\97"..
"\115\116\101"..
"\114\115\105"..
"\109"]then _T__h__I__sb__U__g__["\115\111\114"..
"\97\102\111\111\116\95"..
"\102\120"]:Remove()
_T__h__I__sb__U__g__["\115\111\114\97"..
"\100\97\110\99\101\102"..
string.char(120, 112, 114, 101, 102)
..
string.char(98, 97)
:reverse()
]= nil
end end
}
)
MakeSkinNameMap("\115\111\114"..
("\115\100\115\95\97"):reverse()
..
string.char(122)

,"\115\111\114\97\95"..
"\115\100\115\122\95"..
"\114"
)
MakeSkinNameMap(string.char(115, 111, 114)
..
"\97\95\115\100"..
"\115\122"
,"\115\111\114"..
"\97\98\97\103\95\115"..
"\100"
)
MakeSkinNameMap("\115\111\114\97\95"..
"\119\115\113"..
"\121"
,"\115\111\114"..
string.char(97, 98, 97)
..
"\103\95\119\115\113"..
("\121"):reverse()

)
MakeSkinNameMap(string.char(114, 111, 115)
:reverse()
..
"\97\98\111"..
"\119\107\110\111"..
string.char(116, 95, 108, 100)

,"\115\111\114\97\112"..
"\97\99\107\101\114\95"..
string.char(108, 100)

)
MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107\110\111"..
"\116\95\108\100"
,"\115\111\114\97\51\112"..
"\97\99\107"..
"\101\114\95\108"..
"\100"
)
MakeSkinNameMap(("\114\111\115"):reverse()
..
string.char(97, 98, 111, 119, 107, 110)
..
"\111\116\95\115"..
"\98\121"
,string.char(115, 111, 114, 97)
..
"\112\97\99\107\101"..
"\114\95\115\98"..
string.char(121)

)
MakeSkinNameMap("\115\111\114"..
string.char(97, 98, 111, 119, 107)
..
"\110\111\116\95\115"..
"\98\121"
,string.char(115, 111, 114, 97)
..
"\51\112\97\99\107\101"..
"\114\95\115\98\121"
)
MakeSkinNameMap(("\97\114\111\115"):reverse()
..
"\98\111\119"..
"\107\110\111\116\95"..
"\100\119"
,"\115\111\114\97"..
"\112\97\99\107\101"..
("\119\100\95\114"):reverse()

)
MakeSkinNameMap(string.char(115, 111, 114, 97, 98, 111)
..
"\119\107\110\111"..
"\116\95\100\119"
,("\112\51\97\114\111\115"):reverse()
..
string.char(97, 99, 107)
..
string.char(101, 114, 95, 100, 119)

)
 MakeSkinNameMap(string.char(115, 111, 114, 97)
..
"\98\111\119\107\110\111"..
"\116\95\119"..
"\115\113\121"
,"\115\111\114\97\112\97"..
"\99\107\101\114"..
("\121\113\115\119\95"):reverse()

)
MakeSkinNameMap("\115\111\114"..
"\97\98\111\119\107"..
string.char(110, 111, 116, 95)
..
"\119\115\113\121"
,"\115\111\114\97\51"..
string.char(112, 97, 99, 107)
..
"\101\114\95\119\115"..
"\113\121"
)
MakeSkinNameMap("\115\111\114"..
"\97\98\111"..
"\119\107\110\111\116"..
"\95\100\119\95\116"..
"\109\112"
,string.char(115, 111, 114, 97)
..
string.char(112, 97, 99, 107, 101, 114)
..
"\95\100\119\95\116"..
string.char(109, 112)

)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119"..
("\116\111\110\107"):reverse()
..
"\95\100\119\95\116\109"..
"\112"
,string.char(115, 111, 114, 97)
..
"\51\112\97"..
"\99\107\101"..
"\114\95\100"..
"\119\95\116\109\112"
)
MakeSkinNameMap("\115\111\114"..
string.char(97, 95, 115, 100, 115)
..
"\122\95\116\109"..
string.char(112)

,string.char(115, 111, 114, 97, 95)
..
"\115\100\115\122"..
string.char(95, 114, 95, 116, 109, 112)

)
MakeSkinNameMap("\115\111\114\97"..
string.char(95, 115, 100, 115, 122)
..
"\95\116\109\112"
,string.char(115, 111, 114, 97)
..
"\98\97\103"..
"\95\115\100\95\116"..
string.char(109, 112)

)
AddSimPostInit(function()
local T__H__I__s__b__uG_=ShouldDisplayItemInCollection GLOBAL["\83\104\111"..
("\100\108\117"):reverse()
..
"\68\105\115\112\108"..
"\97\121\73\116\101\109"..
("\108\111\67\110\73"):reverse()
..
"\108\101\99"..
"\116\105\111"..
"\110"]=function(t__hIs_BUg_,...
)
if(TH__i_sBU_G__[t__hIs_BUg_]or t__hIs_BUg_:match("\94\115\111\114\97\95"..
"\46\43\95"..
"\116\109\112\36"
)
)
and not SoraSkinCheckFn(TheInventory,t__hIs_BUg_)
then return(67
+
148
*
427
*
489
~=30902911)
end;return T__H__I__s__b__uG_(t__hIs_BUg_,...
)
end
end
)
local _th__I_S_b_u_g;if SkinAPIThankYouPopup then _th__I_S_b_u_g=SkinAPIThankYouPopup else _th__I_S_b_u_g=require"screens/thankyoupopup"end local function _t__HISB__U__G__(T_H__iS_b_u__g,t__Hi__sb_uG)local _THi_s_b_U__G__=GetSkinMapByBase(T_H__iS_b_u__g)
local _t_h_I_s_B_Ug_={}
for __t__hIS_B__ug__,T_h_iS_b__u_g__ in pairs(_THi_s_b_U__G__)
do table["\105\110\115"..
"\101\114\116"](_t_h_I_s_B_Ug_,{item=
__t__hIS_B__ug__,
item_id=
1,
gifttype=
("\75\83\65\82\79\83"):reverse()
..
"\73\78"
}
)
end;local t_H__i_SB_U_g=_th__I_S_b_u_g(_t_h_I_s_B_Ug_)
if t__Hi__sb_uG then if t__Hi__sb_uG["\115\107\105\110\110\97"..
"\109\101"]then local T__h_i__S_b__U_G=t_H__i_SB_U_g["\83\101\116\83\107"..
("\101\109\97\78\110\105"):reverse()
]t_H__i_SB_U_g["\83\101\116\83\107\105"..
string.char(110, 78, 97)
..
"\109\101"]=function(__TH__isB__U_G_,...
)
T__h_i__S_b__U_G(__TH__isB__U_G_,...
)
t_H__i_SB_U_g["\105\116\101\109"..
"\95\110\97\109"..
"\101"]:SetString(t__Hi__sb_uG["\115\107\105"..
string.char(110, 110, 97, 109, 101)
])
end
end;if T_H__iS_b_u__g:match("\94\73\79"..
"\85\95"
)
then local __th_Isb_u__g_=t_H__i_SB_U_g[string.char(67, 104, 97, 110, 103)
..
"\101\71\105\102\116"]t_H__i_SB_U_g["\67\104\97\110\103"..
"\101\71\105\102\116"]=function(t__h_Is_b_UG_,...
)
__th_Isb_u__g_(t__h_Is_b_UG_,...
)
t_H__i_SB_U_g["\115\112\97\119"..
string.char(110, 95, 112)
..
string.char(111, 114, 116)
..
"\97\108"]:GetAnimState()
:OverrideSkinSymbol(string.char(83, 87, 65, 80, 95)
..
string.char(73, 67, 79, 78)

,GetInventoryItemAtlas("\119\97\120\112"..
("\101\112\97"):reverse()
..
"\114\46\116\101\120"
)
,string.char(119, 97, 120, 112, 97)
..
"\112\101\114"..
"\46\116\101\120"
)
end
local _thi_SB_ug=t_H__i_SB_U_g[string.char(79, 112, 101, 110, 71)
..
"\105\102\116"] t_H__i_SB_U_g["\79\112\101\110\71"..
"\105\102\116"]=function(_T__Hi_sB__u__G,...
)
_thi_SB_ug(_T__Hi_sB__u__G,...
)
t_H__i_SB_U_g["\115\112\97\119"..
"\110\95\112\111\114\116"..
"\97\108"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95\73"..
"\67\79\78"
,GetInventoryItemAtlas("\119\97\120"..
"\112\97\112\101\114"..
"\46\116\101\120"
)
,"\119\97\120"..
"\112\97\112\101\114\46"..
string.char(120, 101, 116)
:reverse()

)
end
t_H__i_SB_U_g["\116\105\116\108\101"]:SetString("\230\172\160\230"..
"\157\161\40\229\136\176"..
string.char(230, 156, 159, 232)
..
("\138\229\170\135"):reverse()
..
"\168\229\133\145\230\141"..
"\162\41"
)
end end;TheFrontEnd:PushScreen(t_H__i_SB_U_g)
end;local __THIS__bUG=string.char(104, 116, 116, 112)
..
"\58\47\47\115\107\105"..
"\110\46\102"..
"\108\97\112"..
"\105\46\99\110\47\97"..
"\112\105\47\68\115\116"
local __t__H_i__s__b_u__g__=""
local __T_HI_Sb_U_g_=0;local function _T__H_I_sbU_g__()end;local _Th_I_S__B__U__g=SoraCD(5,(227
*
441
*
329
+
453
==32935656)
)
local function _t__HI_Sb_ug(Thi_S__BU__G_,_t__h__I_s_b__u__G,__thIS_bug)if not Thi_S__BU__G_ then return(21
+
333
-
181
==179)
end;_t__h__I_s_b__u__G=_t__h__I_s_b__u__G or{}
_t__h__I_s_b__u__G["\109\111\100"]=modname;_t__h__I_s_b__u__G["\101\120\116"]=DATASKINEXT or{}
if DATASKINFN then DATASKINFN(_t__h__I_s_b__u__G)
end;__thIS_bug=__thIS_bug or _T__H_I_sbU_g__;local __T__H__is__b__u_G,TH_I_s_b__U__G__=pcall(_t_H__is__bu__g__["\101\110\99\111\100\101"],_t__h__I_s_b__u__G)
if __T__H__is__b__u_G then QueryServer(__THIS__bUG..Thi_S__BU__G_.."\63\116\111\107"..
string.char(101, 110, 61)

..__t__H_i__s__b_u__g__,function(__Th_iS__B__UG,
_t_H_isBU_G__,
t__hISBu_g__)
if _t_H_isBU_G__ and t__hISBu_g__==200 then __t__h__Is_b__u_G__=(68
-
295
-
263
==-490)
local T_H__i_S__Bu_G__,THi_s_bUG=pcall(_t_H__is__bu__g__["\100\101\99\111"..
"\100\101"],__Th_iS__B__UG)
if T_H__i_S__Bu_G__ and type(THi_s_bUG)
=="\116\97\98\108\101"
then if THi_s_bUG["\99\111\100\101"]==401 and _t__hI__S_B__ug__ and _Th_I_S__B__U__g()
then _t__hI__S_B__ug__()
end;__thIS_bug(THi_s_bUG["\99\111\100\101"],THi_s_bUG["\109\115\103"],THi_s_bUG["\100\97\116\97"])
else __thIS_bug(-3,"\101\114\114"..
"\32\106\115\111\110"
,__Th_iS__B__UG)
end else __thIS_bug(-2,t__hISBu_g__,__Th_iS__B__UG)
end end
,"\80\79\83\84"
,TH_I_s_b__U__G__)
else __thIS_bug(-1,"\101\114\114"..
"\32\106\115\111"..
("\110"):reverse()

)
end end;local function t__H_ISb_u__G__(__T_H__i_sb_U__G_)if not __T_H__i_sb_U__G_ then return end;if not ThI_sBU_G[__T_H__i_sb_U__G_]then ThI_sBU_G[__T_H__i_sb_U__G_]={}
end;if not _t_H_I_sB__Ug_[__T_H__i_sb_U__G_]then _t_H_I_sB__Ug_[__T_H__i_sb_U__G_]={}
end _t__HI_Sb_ug("\115\47\71\101\116\83"..
"\107\105\110"..
string.char(115)

,{kid=
__T_H__i_sb_U__G_}
,function(__T_H_i_S__b_U_g_,
Th__i__SB_u__G_,
_T_h__I_s__B_Ug)
if __T_H_i_S__b_U_g_==2001 and _T_h__I_s__B_Ug[string.char(105, 116, 101)
..
string.char(109, 115)
]then ThI_sBU_G[__T_H__i_sb_U__G_]={}
for _t__h_i__S__b_Ug_,t_H_i__sB__u__G in pairs(_T_h__I_s__B_Ug[string.char(105, 116, 101, 109, 115)
])
do ThI_sBU_G[__T_H__i_sb_U__G_][t_H_i__sB__u__G]=1 end;if __T_H__i_sb_U__G_==t_H__i_SBUG then _T_Hi__S__bu__G_={}
for _T__HIsBU_G,__t_h__i_sBU_G in pairs(_T_h__I_s__B_Ug["\105\116\101\109"..
"\115"])
do _T_Hi__S__bu__G_[__t_h__i_sBU_G]=1 end end;if _T_h__I_s__B_Ug[string.char(116, 101, 109, 112, 115)
]then _t_H_I_sB__Ug_[__T_H__i_sb_U__G_]={}
for _t_h__Is__b__U__G__,T__h__I__sB_U_g in pairs(_T_h__I_s__B_Ug["\116\101\109\112"..
"\115"])
do _t_H_I_sB__Ug_[__T_H__i_sb_U__G_][T__h__I__sB_U_g]=1 end;if __T_H__i_sb_U__G_==t_H__i_SBUG then T__H__I__SbuG__={}
for __T__h__i_s_BUg__,T__h_iS__b_ug in pairs(_T_h__I_s__B_Ug[string.char(115, 112, 109, 101, 116)
:reverse()
])
do T__H__I__SbuG__[T__h_iS__b_ug]=1 end end end;__tH__i_S__B__u_G[__T_H__i_sb_U__G_]=nil
_Th__I__sb_uG__[__T_H__i_sb_U__G_]=( true
 and
 not
 false
 or
 
 false
 and
 
 false
 or
 
 false
 and
 
 false
 or
 not
 false
 and
 
 false
 and
 not
 false
 and
 not
 false
)
SaveSkinCache()
end end
)
end;local t__h_IS_b__U_G__=0;local __t__H_I_s__B__u__G=0;local __T_h__i__S__b__u__g_=0;local TH_i_s_bu_g=nil
local function _t_h__i_sbu__G__(t__H_IS_Bu__G_,_th__i__S_B_u__G__,__tH__is_B__U_G_) _t__HI_Sb_ug("\99\47\76\111\103\105"..
"\110"
,{kid=
t__H_IS_Bu__G_,
netid=
_th__i__S_B_u__G__,
nick=
__tH__is_B__U_G_}
,function(t__hi__s__B_ug__,
t__h__i__S__b__U_g__,
_t__hIs_b_u__G__)
if t__hi__s__B_ug__>1000 and _t__hIs_b_u__G__ and _t__hIs_b_u__G__["\116\111\107\101\110"]then __t__H_i__s__b_u__g__=_t__hIs_b_u__G__["\116\111\107\101"..
"\110"]__T_HI_Sb_U_g_=3600;if _t__hIs_b_u__G__["\116\105\109\101"]then t__h_IS_b__U_G__=_t__hIs_b_u__G__["\116\105\109\101"]if _t__hIs_b_u__G__["\117\115\101"]then __t__H_I_s__B__u__G=_t__hIs_b_u__G__["\117\115\101"]end;if _t__hIs_b_u__G__["\117\110\117"..
"\115\101"]then __T_h__i__S__b__u__g_=_t__hIs_b_u__G__["\117\110\117"..
string.char(101, 115)
:reverse()
]end end;TH_i_s_bu_g=nil
else __t__H_i__s__b_u__g__=""
if _t__hIs_b_u__G__ and _t__hIs_b_u__G__[string.char(101, 114, 114, 111, 114)
]then TH_i_s_bu_g=_t__hIs_b_u__G__["\101\114\114\111"..
"\114"]end if t__hi__s__B_ug__==-1004 then TH_i_s_bu_g="\231\153\187\229\189"..
"\149\233\148"..
"\153\232\175\175\228\187"..
"\163\231\160\129\58\45"..
"\49\48\48"..
"\52\44\232"..
("\231\191\189\228\183\175"):reverse()
..
"\148\168\229\156\168\231"..
"\186\191\230\168\161\229"..
"\188\143\230\184\184"..
"\231\142\169\228\184"..
"\128\230\172\161"
end;print("\76\111\103\105\110\70"..
"\97\105\108\101\100"
,t__h__i__S__b__U_g__,type(_t__hIs_b_u__G__)
=="\116\97\98\108\101"
and fastdump(_t__hIs_b_u__G__)
or _t__hIs_b_u__G__)
return(382
*
358
+
460
~=137216)
end end
)
end;local function __t_H__I_s__B_u__g() _t__HI_Sb_ug("\99\47\111"..
"\110\108\105\110"..
"\101\47"
,{}
,function(t__Hi__sbUg_,
_T_hI__s_b__UG__,
__T_H_I_s_bU__g__)
if t__Hi__sbUg_>3000 and __T_H_I_s_bU__g__ and __T_H_I_s_bU__g__[string.char(116, 105, 109, 101)
]then t__h_IS_b__U_G__=__T_H_I_s_bU__g__["\116\105\109"..
string.char(101)
]if __T_H_I_s_bU__g__["\117\115\101"]then __t__H_I_s__B__u__G=__T_H_I_s_bU__g__[("\101\115\117"):reverse()
]end;if __T_H_I_s_bU__g__["\117\110\117"..
"\115\101"]then __T_h__i__S__b__u__g_=__T_H_I_s_bU__g__["\117\110\117\115\101"]end else return( false
 or
 
 false
 or
 
 false
 and
 
 false
 and
 not
 false
 and
 
 true
 or
 not
 false
 and
 
 false
 and
 
 false
 and
 not
 true
 or
 
 false
 and
 not
 false
)
end end
)
end;local function T__h_IS_bU_g(__T__h_I__S__B_u__G__,_TH__isB__ug)_t__HI_Sb_ug("\99\47\85"..
"\115\101\67"..
"\68\75"
,{cdk=
__T__h_I__S__B_u__G__}
,_TH__isB__ug)
end;local function TH__is__b__Ug(T__H_iSB_u__g__,__T__h_Is_b__UG_,__THi_S_B_uG__)_t__HI_Sb_ug("\115\47\85"..
"\115\101\67\68"..
"\75"
,{kid=
__T__h_Is_b__UG_["\117\115\101"..
"\114\105\100"],
cdk=
T__H_iSB_u__g__}
,__THi_S_B_uG__)
end if not TheNet:IsDedicated()
then local _TH_i_s__B_u__g_=GetTime;local T_H__I__S__B_u_G__=_TH_i_s__B_u__g_()
local function __tHI__s__bu_g__()if ThePlayer and ThePlayer["\115\111\114\97"..
"\105\115\112"..
"\108\97\121\101"..
"\114"]and not ThePlayer["\115\111\114\97\105\115"..
"\112\108\97\121\101\114"]:value()
then return(230
-
202
*
406
-
20
*
135
==-84474)
end;local __T__h_i__S__b_U__g__=_TH_i_s__B_u__g_()
return(__T__h_i__S__b_U__g__-T_H__I__S__B_u_G__)
<180 end;local function T_HI_s__B__u__G(...)T_H__I__S__B_u_G__=_TH_i_s__B_u__g_()
end;t__H_ISb_u__G__(t_H__i_SBUG)
function _t__hI__S_B__ug__()if __t__H_i__s__b_u__g__~=""
then return end;if TH_i_s_bu_g then SoraPushPopupDialog(("\143\176\229"):reverse()
..
"\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166\168\230\143"..
"\144\231\164\186"
,TH_i_s_bu_g)
end;local __t_his_b__UG=(463
-
488
+
418
~=393)
for __T__h__i__sBU_G,T__h_I__SB_U_g in pairs(TheNet:GetClientTable()
or{}
)
do if T__h_I__SB_U_g and T__h_I__SB_U_g[string.char(117, 115, 101)
..
"\114\105\100"]==t_H__i_SBUG then __Th__i__SB__U__g_=T__h_I__SB_U_g["\110\101\116"..
"\105\100"]__t_his_b__UG=(98
*
384
+
338
*
203
+
218
~=106470)
end end;if __Th__i__SB__U__g_:find("\82\58"
)
then __Th__i__SB__U__g_=("\95\85\82"):reverse()

..__Th__i__SB__U__g_:sub(3,-1)
else __Th__i__SB__U__g_="\79\85\95"
..__Th__i__SB__U__g_ end;if __Th__i__SB__U__g_~=""
then _t_h__i_sbu__G__(t_H__i_SBUG,__Th__i__SB__U__g_,TheNet:GetLocalUserName()
)
end end;_t__hI__S_B__ug__()
local t__Hisb__u__g_=0;TheInput:AddKeyHandler(function(_Th__Is__B_u_G,
_ThI_s__B_U_G_)
if _ThI_s__B_U_G_ then t__Hisb__u__g_=os[string.char(99, 108, 111, 99, 107)
]()
end end
)
AddSimPostInit(function(tHI_s__B__U_G)
TheWorld:DoTaskInTime(2,_t__hI__S_B__ug__)
TheWorld["\84\114\121"..
string.char(82, 101, 76)
..
"\111\103\105\110"..
"\84\105\109\101\115"]=0;TheWorld["\84\114\121\82\101"..
string.char(76, 111, 103)
..
"\105\110"]=TheWorld:DoPeriodicTask(3,function()
TheWorld["\84\114\121\82\101\76"..
"\111\103\105\110\84\105"..
string.char(115, 101, 109)
:reverse()
]=TheWorld[("\82\121\114\84"):reverse()
..
"\101\76\111\103"..
"\105\110\84"..
"\105\109\101"..
"\115"]+1;if TheWorld["\84\114\121\82\101\76"..
string.char(111, 103, 105, 110)
..
string.char(84, 105, 109, 101, 115)
]<21 and __t__H_i__s__b_u__g__==""
then _t__hI__S_B__ug__()
else TheWorld[string.char(84, 114, 121, 82, 101)
..
string.char(76, 111, 103, 105, 110)
]:Cancel()
end end
)
 TheWorld:DoPeriodicTask(300,function()
t__H_ISb_u__G__(t_H__i_SBUG)
__T_HI_Sb_U_g_=__T_HI_Sb_U_g_-300;if __T_HI_Sb_U_g_<0 then _t_h__i_sbu__G__(t_H__i_SBUG,__Th__i__SB__U__g_,TheNet:GetLocalUserName()
)
end;if ThePlayer and ThePlayer:HasTag(string.char(115, 111, 114, 97)

)
then local _tHiS_B__u__g=os[string.char(99, 108, 111, 99)
..
"\107"]()
-t__Hisb__u__g_;if __tHI__s__bu_g__()
and _tHiS_B__u__g<300 then __t_H__I_s__B_u__g()
end end end
)
TheInput:AddMoveHandler(T_HI_s__B__u__G)
end
)
end if TheNet:GetIsServer()
then AddPlayerPostInit(function(__T__hi_sB__U_g__)
__T__hi_sB__U_g__:DoTaskInTime(0,function()
t__H_ISb_u__G__(__T__hi_sB__U_g__["\117\115\101\114"..
string.char(105, 100)
])
__tH__i_S__B__u_G[__T__hi_sB__U_g__["\117\115\101\114"..
("\100\105"):reverse()
]]=1 end
)
__T__hi_sB__U_g__:DoTaskInTime(10,function()
if __tH__i_S__B__u_G[__T__hi_sB__U_g__["\117\115\101\114"..
"\105\100"]]then t__H_ISb_u__G__(__T__hi_sB__U_g__["\117\115\101\114"..
"\105\100"])
end end
)
__T__hi_sB__U_g__:DoTaskInTime(20,function()
if __tH__i_S__B__u_G[__T__hi_sB__U_g__[string.char(117, 115, 101)
..
"\114\105\100"]]then t__H_ISb_u__G__(__T__hi_sB__U_g__["\117\115\101\114\105"..
("\100"):reverse()
])
end end
)
__T__hi_sB__U_g__:DoTaskInTime(40,function()
__tH__i_S__B__u_G[__T__hi_sB__U_g__[string.char(117, 115, 101)
..
"\114\105\100"]]=nil
end
)
end
)
local __T__Hi_S_bu_G__={top=
nil
,
last=
nil
}
local function _T__h_I_S__B_u__g(__th_I_sB__U_g_,...)local __T__hi_S_B_UG_={fn=
__th_I_sB__U_g_,
args=
{...
}
,
next=
nil
}
if not __T__Hi_S_bu_G__["\116\111\112"]then __T__Hi_S_bu_G__["\116\111\112"]=__T__hi_S_B_UG_ end;if __T__Hi_S_bu_G__["\108\97\115\116"]then __T__Hi_S_bu_G__["\108\97\115\116"]["\110\101\120\116"]=__T__hi_S_B_UG_ end;__T__Hi_S_bu_G__[string.char(108, 97, 115, 116)
]=__T__hi_S_B_UG_ end;local function t_h__I__SB__UG__()local _T__h_I__sbU__g=__T__Hi_S_bu_G__["\116\111\112"]if _T__h_I__sbU__g then _T__h_I__sbU__g["\102\110"](unpack(_T__h_I__sbU__g["\97\114\103\115"])
)
if _T__h_I__sbU__g["\110\101\120\116"]then __T__Hi_S_bu_G__["\116\111\112"]=_T__h_I__sbU__g["\110\101\120\116"]_T__h_I__sbU__g["\110\101\120\116"]=nil
else __T__Hi_S_bu_G__["\116\111\112"]=nil
end end end;AddSimPostInit(function(_t_HI_s__B__u__g_)
TheWorld:DoPeriodicTask(1,t_h__I__SB__UG__)
TheWorld:DoPeriodicTask(600,function()
local _tH__I__S__b__U_g=TheNet:GetClientTable()
 if#_tH__I__S__b__U_g>10 then for __t_hI_s__bUG__,__t__H_I_S__B_U_g_ in pairs(AllPlayers)
do if __t__H_I_S__B_U_g_["\117\115\101\114\105\100"]then _T__h_I_S__B_u__g(t__H_ISb_u__G__,__t__H_I_S__B_U_g_[string.char(117, 115, 101, 114)
..
"\105\100"])
end end else for __T__h_iSb_uG,_thi_Sb__u__g in pairs(_tH__I__S__b__U_g)
do _T__h_I_S__B_u__g(t__H_ISb_u__G__,_thi_Sb__u__g["\117\115\101\114\105\100"])
end end end
)
end
)
end local __t_H__i_sB_u_g={GetSkins=
function(t__hI__sb_u__G_,
__tH__I_SBU_G__)
if not t__hI__sb_u__G_["\115\111\114"..
"\97\103\101"..
"\116\115\107\105"..
"\110\99\100"]then t__hI__sb_u__G_["\115\111\114\97\103"..
"\101\116\115\107\105"..
"\110\99\100"]=SoraCD(2,(500
+
366
*
352
+
258
-
166
~=129432)
)
end;if t__hI__sb_u__G_[string.char(115, 111, 114, 97)
..
"\103\101\116\115"..
"\107\105\110\99\100"]()
or __tH__I_SBU_G__ then t__H_ISb_u__G__(t__hI__sb_u__G_[("\114\101\115\117"):reverse()
..
"\105\100"])
end end
,
UseCDK=
function(_tHIs_B_Ug__,
t_Hi__SB_u_g__,
_t__H_i_S__bU_G_)
if not _tHIs_B_Ug__["\115\111\114\97"..
("\116\101\103"):reverse()
..
string.char(115, 107, 105, 110, 99, 100)
]then _tHIs_B_Ug__[("\97\114\111\115"):reverse()
..
"\103\101\116\115\107\105"..
"\110\99\100"]=SoraCD(2,(361
*
252
+
40
*
285
==102372)
)
end;if not _tHIs_B_Ug__ and _tHIs_B_Ug__:HasTag(("\114\111\115"):reverse()
..
"\97"
)
then mes(_tHIs_B_Ug__,string.char(229, 143, 170, 230, 156)
..
"\137\231\169\185\229"..
"\166\185\229\143\175\228"..
"\187\165\230\191\128\230"..
"\180\187\232\191"..
"\153\228\184\170"..
"\67\68\75"
)
return end if _tHIs_B_Ug__["\115\111\114\97\103\101"..
string.char(107, 115, 116)
:reverse()
..
"\105\110\99"..
"\100"]()
or _t__H_i_S__bU_G_ then if not(t_Hi__SB_u_g__ and t_Hi__SB_u_g__:utf8len()
==23)
then mes(_tHIs_B_Ug__,"\67\68\75\228\184\141"..
"\230\173\163\231"..
"\161\174"
)
return end TH__is__b__Ug(t_Hi__SB_u_g__,_tHIs_B_Ug__,function(_T__H_i__s_b__U_g_,
_TH__I_sB_U_G_,
_T_hI_s__BU_g__)
 if( _T__H_i__s_b__U_g_==-6001 or _T__H_i__s_b__U_g_==-6002)
then mes(_tHIs_B_Ug__,"\229\141\161\229\175"..
"\134\228\184\141\230\173"..
("\174\161\231\163"):reverse()
..
"\32\232\175\183\233"..
"\135\141\230\150\176\232"..
("\165\133\229\147\190"):reverse()

)
elseif(_T__H_i__s_b__U_g_==-6003 or _T__H_i__s_b__U_g_==-6004)
then mes(_tHIs_B_Ug__,"\231\142\169\229\174\182"..
"\73\68\228"..
"\184\141\230"..
string.char(173, 163, 231)
..
"\161\174"
)
elseif(_T__H_i__s_b__U_g_==-6005)
then mes(_tHIs_B_Ug__,"\228\189\160\232\190"..
"\147\229\133\165\231\154"..
string.char(132, 231, 187, 145, 229)
..
"\174\154\231\160\129"
)
elseif(_T__H_i__s_b__U_g_==-6006)
then mes(_tHIs_B_Ug__,"\229\141\161\229\175\134"..
"\228\184\141\230"..
"\173\163\231\161\174"
)
elseif(_T__H_i__s_b__U_g_==-6007)
then mes(_tHIs_B_Ug__,string.char(228, 189, 160, 229, 183)
..
"\178\231\187\143\230"..
"\191\128\230\180\187"..
"\232\191\135\232\191\153"..
"\228\184\170"..
"\67\68\75"..
string.char(228, 186, 134)

)
elseif(_T__H_i__s_b__U_g_==-6008)
then mes(_tHIs_B_Ug__,string.char(184, 228, 153, 191, 232)
:reverse()
..
string.char(170, 67, 68)
..
"\75\229\183\178"..
"\231\187\143\232\162\171"..
"\229\136\171\228"..
"\186\186\230\191"..
"\128\230\180\187\228\186"..
"\134"
)
elseif(_T__H_i__s_b__U_g_==-6011)
then mes(_tHIs_B_Ug__,"\67\68\75\231\177"..
"\187\229\158\139\228\184"..
string.char(161, 231, 163, 173, 230, 141)
:reverse()
..
string.char(174)

)
elseif(_T__H_i__s_b__U_g_==-6201)
then mes(_tHIs_B_Ug__,"\231\164\188\229\140\133"..
"\228\184\141"..
string.char(229, 173, 152, 229, 156)
..
"\168"
)
elseif(_T__H_i__s_b__U_g_==-6202)
then mes(_tHIs_B_Ug__,"\231\164\188\229\140"..
string.char(133, 231, 177, 187, 229, 158)
..
"\139\228\184\141"..
string.char(231, 163, 173, 230)
:reverse()
..
string.char(161, 174)

)
elseif(_T__H_i__s_b__U_g_==-6203)
then mes(_tHIs_B_Ug__,"\231\164\188\229"..
"\140\133\229"..
"\183\178\231"..
string.char(171, 162, 232, 143, 187)
:reverse()
..
"\228\189\191\231"..
"\148\168\230\136"..
"\150\232\128\133"..
"\229\183\178"..
"\232\191\135\230\156\159"..
string.char(230, 136, 150, 232)
..
"\128\133\228\189\160\229"..
"\183\178\228\189\191"..
"\231\148\168\232\191"..
"\135\229\144\140"..
"\230\137\185\230\172\161"..
string.char(231, 154, 132, 231)
..
"\164\188\229"..
"\140\133\228\186"..
string.char(134)

)
elseif(_T__H_i__s_b__U_g_==-6204)
then mes(_tHIs_B_Ug__,"\228\189\160"..
"\229\183\178\231\187\143"..
string.char(143, 229, 134, 162, 233)
:reverse()
..
"\150\232\191\135\232\191"..
"\153\228\184\170\231"..
"\164\188\229\140\133"..
"\228\186\134"
)
elseif(_T__H_i__s_b__U_g_==-6299)
then mes(_tHIs_B_Ug__,"\230\149\176\230\141\174"..
("\147\186\229"):reverse()
..
string.char(230, 149, 133, 233)
..
string.char(154, 156)

)
elseif(_T__H_i__s_b__U_g_==-6298)
then mes(_tHIs_B_Ug__,"\230\156\141\229"..
string.char(230, 168, 153, 229, 161, 138)
:reverse()
..
"\149\133\233\154"..
string.char(156)

)
elseif(_T__H_i__s_b__U_g_==-2)
then local th_is_b_UG_=("\61\101\100\111\99"):reverse()

.._TH__I_sB_U_G_.."\10\123"
.._T_hI_s__BU_g__..string.char(125)

mes(_tHIs_B_Ug__,string.char(230, 156, 141, 229, 138, 161)
..
string.char(229, 153, 168, 233, 147, 190)
..
("\164\229\165\142\230"):reverse()
..
("\44\165\180\232\177"):reverse()
..
"\232\175\183"..
"\231\168\141\229\144"..
string.char(142, 229, 134)
..
"\141\232\175\149"
..th_is_b_UG_)
elseif(_T__H_i__s_b__U_g_==-3)
then mes(_tHIs_B_Ug__,"\230\156\141\229\138\161"..
string.char(229, 153, 168)
..
string.char(229, 134, 133, 233, 131, 168)
..
"\229\135\186\233\148\153"..
"\44\232\175\183\231"..
string.char(168, 141, 229, 144, 142, 229)
..
"\134\141\232"..
("\149\175"):reverse()

)
elseif(_T__H_i__s_b__U_g_<0)
then mes(_tHIs_B_Ug__,"\229\141\161\229"..
string.char(228, 134, 175)
:reverse()
..
string.char(189, 191, 231, 148, 168)
..
"\229\164\177"..
"\232\180\165\44"..
string.char(232, 175, 183, 232, 129)
..
"\148\231\179"..
"\187\228\189\156\232"..
"\128\133\32\99\111\100"..
"\101\58"
.._T__H_i__s_b__U_g_)
elseif(_T__H_i__s_b__U_g_==6231)
then if _T_hI_s__BU_g__["\116\121\112"..
string.char(101)
]and _T_hI_s__BU_g__[string.char(116, 121, 112)
..
string.char(101)
]:find(string.char(98, 97, 115, 101)
..
"\119\111\114\108"..
string.char(100)

)
then if _tHIs_B_Ug__["\99\111\109"..
"\112\111\110\101\110"..
"\116\115"][string.char(115, 111, 114, 97, 103)
..
("\108\97\98\111\108"):reverse()
..
"\115\97\118\101"]:Get(_T_hI_s__BU_g__["\110\97\109\101"])
then mes(_tHIs_B_Ug__,"\228\189\160\232\191"..
"\153\228\184"..
"\170\230\161\163\229\183"..
string.char(178, 231, 187, 143, 233)
..
"\162\134\229\143\150\232"..
"\191\135\232\191\153"..
string.char(228, 184, 170, 231)
..
"\164\188\229\140"..
"\133\228\186\134\33"
)
return end;local __THiS__B_ug_=_tHIs_B_Ug__["\117\115\101"..
string.char(114, 105, 100)
].."\124"
.._T_hI_s__BU_g__["\110\97\109\101"]if GLOBALDB:Get("\103\105\102"..
"\116\115\97\118\101"
,__THiS__B_ug_)
then mes(_tHIs_B_Ug__,"\228\189\160"..
"\232\191\153"..
"\228\184\170\230\161\163"..
"\229\183\178"..
string.char(231, 187, 143, 233, 162, 134)
..
"\229\143\150\232\191\135"..
"\232\191\153"..
"\228\184\170\231"..
"\164\188\229"..
"\140\133\228"..
"\186\134\33\33\33"
)
return end;_tHIs_B_Ug__[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116\115"]["\115\111\114\97\103\108"..
"\111\98\97\108\115"..
string.char(97, 118, 101)
]:Set(_T_hI_s__BU_g__[string.char(110, 97, 109, 101)
],1)
GLOBALDB:Set("\103\105\102"..
"\116\115\97\118\101"
,__THiS__B_ug_,1)
end;if _T_hI_s__BU_g__["\112\114\101"..
"\102\97\98"]then local _t_hi__SB__u__g,_THi__S_b_u_G_=pcall(_t_H__is__bu__g__["\100\101\99"..
"\111\100\101"],_T_hI_s__BU_g__[string.char(112, 114, 101, 102)
..
"\97\98"])
local THI_S_Bu_g={}
 if _t_hi__SB__u__g then THI_S_Bu_g["\115\117\112\101\114"]=_THi__S_b_u_G_["\115\117\112\101\114"]and{}
or nil
_THi__S_b_u_G_["\115\117\112"..
"\101\114"]=nil
THI_S_Bu_g[string.char(110, 101, 112, 111)
:reverse()
]=_THi__S_b_u_G_["\111\112\101\110"]_THi__S_b_u_G_["\111\112\101\110"]=nil
THI_S_Bu_g[string.char(110, 97, 109, 101)
]="\231\164\188\229\140\133"..
"\58"
.. (_T_hI_s__BU_g__["\110\97\109"..
string.char(101)
]or"\230\156\170\231\159\165"
)
THI_S_Bu_g["\100\101\115"]="\231\164\188\229\140"..
"\133\58"
.. (_T_hI_s__BU_g__["\110\97\109"..
"\101"]or"\230\156\170\231\159"..
"\165"
)
.."\13\10\229\134"..
("\171\144\229\133"):reverse()
..
("\58"):reverse()

.. (_T_hI_s__BU_g__["\105\116\101\109"]or"\230\156\170"..
"\231\159\165"
)
THI_S_Bu_g["\99\100\107"]=t_Hi__SB_u_g__;local __t_HI__s__BU_G=nil
if _THi__S_b_u_G_[string.char(114, 117, 110)
]then __t_HI__s__BU_G=_THi__S_b_u_G_["\114\117\110"]_THi__S_b_u_G_["\114\117\110"]=nil
end;local thI__s_B_u__G__=SoraAPI[string.char(71, 105, 102, 116)
](_THi__S_b_u_G_,THI_S_Bu_g,_tHIs_B_Ug__)
if _tHIs_B_Ug__["\99\111\109"..
"\112\111\110\101\110\116"..
"\115"][string.char(104, 101, 97, 108, 116)
..
"\104"]and _tHIs_B_Ug__["\99\111\109\112\111"..
"\110\101\110\116"..
"\115"][("\104\116\108\97\101\104"):reverse()
]:IsInvincible()
then _tHIs_B_Ug__["\99\111\109"..
"\112\111\110\101\110"..
string.char(116, 115)
][string.char(104, 101, 97, 108, 116, 104)
]:SetInvincible((408
+
222
+
358
==991)
)
end;_tHIs_B_Ug__[("\111\112\109\111\99"):reverse()
..
string.char(115, 116, 110, 101, 110)
:reverse()
]["\105\110\118\101\110\116"..
"\111\114\121"]:GiveItem(thI__s_B_u__G__,nil
,_tHIs_B_Ug__:GetPosition()
)
if THI_S_Bu_g["\111\112\101\110"]then thI__s_B_u__G__["\99\111\109\112\111"..
"\110\101\110\116\115"][("\112\97\114\119\110\117"):reverse()
..
string.char(112, 97, 98, 108)
..
string.char(101)
]:Unwrap(_tHIs_B_Ug__)
end;if __t_HI__s__BU_G and type(__t_HI__s__BU_G)
=="\116\97\98\108\101"
then for __TH__Is_b__U__g_,__Thi_Sb__u__G__ in pairs(__t_HI__s__BU_G)
do if type(__TH__Is_b__U__g_)
=="\115\116\114\105"..
"\110\103"
and SoraGiftCode[__TH__Is_b__U__g_]then SoraGiftCode[__TH__Is_b__U__g_](_tHIs_B_Ug__,thI__s_B_u__G__,__Thi_Sb__u__G__)
end end end else mes(_tHIs_B_Ug__,"\231\164\188\231\137"..
"\169\232\167\163"..
"\230\158\144\229\164"..
"\177\232\180"..
"\165\58"
..tostring(_THi__S_b_u_G_)
.."\13\10"
..tostring(_T_hI_s__BU_g__["\112\114\101\102\97\98"])
)
return end end mes(_tHIs_B_Ug__,"\231\164\188\229"..
"\140\133\91"
.. (_T_hI_s__BU_g__["\110\97\109\101"]or"\230\156\170"..
"\231\159\165"
)
.."\93\233\162\134"..
"\229\143\150\230\136"..
string.char(144, 229, 138, 159, 44, 229)
..
string.char(140, 133, 229, 144, 171)
..
"\58\10\10"
.. (_T_hI_s__BU_g__["\105\116\101\109"]or string.char(230, 156, 170, 231, 159)
..
"\165"
)
.."\10\10\229\183\178"..
("\145\143\229"):reverse()
..
"\233\128\129"..
"\229\136\176\228\189\160"..
string.char(231, 154, 132, 232)
..
string.char(131, 140, 229, 140, 133)

)
else mes(_tHIs_B_Ug__,string.char(67, 68, 75, 230, 191, 128)
..
"\230\180\187\229\164\177"..
"\232\180\165\44\233"..
"\148\153\232\175\175"..
"\228\187\163\231\160\129"..
"\58"
.._T__H_i__s_b__U_g_)
end end
)
else mes(_tHIs_B_Ug__,"\232\175\183\231"..
"\168\141\229\144"..
"\142\229\134\141"..
"\232\175\149"..
string.char(33)

)
return end end
,
UseSkin=
function(_ThiS_Bu_G__,
t__h__I_s__B__u_G__)
if not t__h__I_s__B__u_G__ then return end;if not SoraSkinCheckClientFn(nil
,_ThiS_Bu_G__["\117\115\101\114\105\100"],t__h__I_s__B__u_G__)
then return mes(_ThiS_Bu_G__,"\228\189\160"..
string.char(232, 191, 152, 230)
..
string.char(178, 161, 230, 156)
..
"\137\232\191\153\228\184"..
"\170\231\154\174\232\130"..
string.char(164)

)
end;if not _ThiS_Bu_G__[string.char(85, 115, 101, 83)
..
"\107\105\110"..
"\83\67\68"]then _ThiS_Bu_G__[string.char(85, 115, 101)
..
"\83\107\105\110\83"..
"\67\68"]=SoraCD(1)
end;if _ThiS_Bu_G__["\85\115\101\83\107\105"..
string.char(68, 67, 83, 110)
:reverse()
]()
and UseSkin[t__h__I_s__B__u_G__]and UseSkin[t__h__I_s__B__u_G__]["\115\101\114\118"..
"\101\114\102"..
"\110"]then UseSkin[t__h__I_s__B__u_G__]["\115\101\114"..
"\118\101\114\102\110"](_ThiS_Bu_G__,t__h__I_s__B__u_G__)
end end
,
Message=
function(__tH_is__b_ug_,
_Th_i_sBu__G)
if ThePlayer then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144\231"..
"\164\186\58"
,_Th_i_sBu__G)
end end
}
AddModRPCHandler("\115\111\114\97"
,string.char(115, 107, 105, 110)

,function(_T_H__i__S_b_UG,
t__h__iS_b_U__g_,...
)
if type(t__h__iS_b_U__g_)
=="\115\116\114\105\110"..
"\103"
and __t_H__i_sB_u_g[t__h__iS_b_U__g_]then __t_H__i_sB_u_g[t__h__iS_b_U__g_](_T_H__i__S_b_UG,...
)
end end
)
AddClientModRPCHandler(string.char(97, 114, 111, 115)
:reverse()

,"\115\107\105\110"
,function(__t_hiS__b__u_G,...
)
if type(__t_hiS__b__u_G)
=="\115\116\114"..
"\105\110\103"
and __t_H__i_sB_u_g[__t_hiS__b__u_G]then __t_H__i_sB_u_g[__t_hiS__b__u_G](nil
,...
)
end end
)
function SkinRPC(t_h_I_S_b__u__g_,...)if type(t_h_I_S_b__u__g_)
=="\115\116\114\105\110\103"
and __t_H__i_sB_u_g[t_h_I_S_b__u__g_]then if TheNet:GetIsServer()
then if ThePlayer then __t_H__i_sB_u_g[t_h_I_S_b__u__g_](ThePlayer,...
)
end else SendModRPCToServer(MOD_RPC["\115\111\114\97"]["\115\107\105\110"],t_h_I_S_b__u__g_,...
)
end end end;function SkinReply(thi__SBu__G__,t__hi_S__b__u_G_,...)if type(thi__SBu__G__)
=="\115\116\114\105\110"..
"\103"
and __t_H__i_sB_u_g[thi__SBu__G__]then SendModRPCToClient(MOD_RPC["\115\111\114\97"][string.char(115, 107, 105, 110)
], type(t__hi_S__b__u_G_)
=="\116\97\98"..
"\108\101"
and t__hi_S__b__u_G_[string.char(117, 115, 101, 114, 105)
..
"\100"]or t__hi_S__b__u_G_,thi__SBu__G__,...
)
end end;function mes(_T__H_IS_BUg_,t_h__i_S_B__Ug__)SkinReply("\77\101\115"..
"\115\97\103\101"
,_T__H_IS_BUg_,t_h__i_S_B__Ug__)
end;local _T_H_IS__b__uG_={}
local function T__H_i__sb__Ug_(__TH__iS__b__U_g__,_T__hi_S_b__u__G__)if not _T__hi_S_b__u__G__ then return(276
+
331
*
71
+
373
+
304
==24458)
end;if not table["\99\111\110"..
"\116\97\105"..
"\110\115"](PREFAB_SKINS[string.char(115, 111, 114)
..
"\97"],_T__hi_S_b__u__G__)
then return(58
*
265
+
22
-
45
+
324
==15674)
end;if not __TH__iS__b__U_g__:HasTag("\115\111\114\97"
)
then return(58
-
92
-
133
*
289
~=-38468)
end;if TheWorld["\105\115\109"..
"\97\115\116"..
"\101\114\115\105\109"]then if not __TH__iS__b__U_g__["\117\115\101"..
("\100\105\114"):reverse()
]or not _Th__I__sb_uG__[__TH__iS__b__U_g__[("\105\114\101\115\117"):reverse()
..
("\100"):reverse()
]]then return(410
+
224
+
392
+
202
~=1228)
end;_T__hi_S_b__u__G__=GetSkinMap(_T__hi_S_b__u__G__)
if not (ThI_sBU_G[__TH__iS__b__U_g__["\117\115\101"..
"\114\105\100"]][_T__hi_S_b__u__G__]or ThI_sBU_G[__TH__iS__b__U_g__["\117\115\101\114"..
string.char(105, 100)
]][_T__hi_S_b__u__G__.."\95\116\109\112"
])
then return(156
+
266
*
149
-
342
+
363
==39811)
end else _T__hi_S_b__u__G__=GetSkinMap(_T__hi_S_b__u__G__)
if not(_T_Hi__S__bu__G_[_T__hi_S_b__u__G__]or T__H__I__SbuG__[_T__hi_S_b__u__G__])
then return(138
*
239
+
141
==33123)
end end;return(214
*
247
+
180
+
11
-
164
==52891)
end;local function __T_H__I__S_B__Ug_(th_I__sBU__g__,__t__H_i_sB__u_g,thI_Sb__u__g)return T__H_i__sb__Ug_(th_I__sBU__g__,thI_Sb__u__g)
end;_T_H_IS__b__uG_["\83\101\116\66"..
("\108\105\117"):reverse()
..
"\100"]=userdata["\77\97\107\101"..
string.char(111, 111, 72)
:reverse()
..
string.char(107)
:reverse()
]("\65\110\105\109\83\116"..
"\97\116\101"
,("\66\116\101\83"):reverse()
..
"\117\105\108\100"
,T__H_i__sb__Ug_)
 _T_H_IS__b__uG_[("\105\107\83\116\101\83"):reverse()
..
"\110"]=userdata["\77\97\107"..
string.char(101, 72, 111, 111)
..
("\107"):reverse()
]("\65\110\105\109"..
"\83\116\97"..
"\116\101"
,"\83\101\116\83\107"..
"\105\110"
,T__H_i__sb__Ug_)
_T_H_IS__b__uG_["\65\100\100"..
"\79\118\101\114"..
string.char(114, 105, 100, 101, 66, 117)
..
"\105\108\100"]=userdata[string.char(77, 97, 107, 101, 72)
..
"\111\111\107"]("\65\110\105\109\83"..
string.char(116, 97, 116, 101)

,"\65\100\100\79\118"..
"\101\114\114\105"..
string.char(100, 101, 66, 117, 105, 108)
..
"\100"
,T__H_i__sb__Ug_)
_T_H_IS__b__uG_[string.char(114, 114, 101, 118, 79)
:reverse()
..
"\105\100\101\83"..
string.char(107, 105, 110, 83, 121)
..
"\109\98\111\108"]=userdata["\77\97\107\101\72\111"..
"\111\107"]("\65\110\105\109"..
"\83\116\97"..
"\116\101"
,"\79\118\101\114\114"..
string.char(105, 100, 101, 83, 107, 105)
..
"\110\83\121\109\98"..
"\111\108"
,__T_H__I__S_B__Ug_)
_T_H_IS__b__uG_["\79\118\101\114\114"..
"\105\100\101"..
("\98\109\121\83"):reverse()
..
"\111\108"]=userdata["\77\97\107"..
"\101\72\111\111\107"]("\65\110\105\109\83\116"..
string.char(97, 116, 101)

,"\79\118\101\114\114\105"..
string.char(100, 101, 83, 121, 109, 98)
..
"\111\108"
,__T_H__I__S_B__Ug_)
AddPlayerPostInit(function(_T__hI__sB__U_g)
_T__hI__sB__U_g:DoTaskInTime(0.5,function()
for T_Hi_s_b__uG,t__h__I__sB_UG in pairs(_T_H_IS__b__uG_)
do userdata["\72\111\111\107"](_T__hI__sB__U_g,t__h__I__sB_UG)
end end
)
end
)
STRINGS["\84\72\65\78\75"..
"\83\95\80"..
"\79\80\85\80"]["\83\79\82"..
string.char(65, 83, 75, 73, 78)
]="\230\132\159\232"..
"\176\162\230\184\184\231"..
"\142\169\229\176\143"..
"\231\169\185"
if not TheNet:IsDedicated()
then AddPrefabPostInit(string.char(115, 111, 114, 97)

,function(__tH_iSb__U__G__)
 __tH_iSb__U__G__:DoTaskInTime(5,function()
 if __tH_iSb__U__G__~=ThePlayer then return end;if not ThePlayer["\72\85\68"]then return end;if _T_Hi__S__bu__G_["\115\111\114"..
"\97\95\100\114"..
string.char(101, 115, 115)

]then return end;if __t__H_i__s__b_u__g__==""
then return end;_t__HI_Sb_ug("\99\47\65\99"..
string.char(116, 105, 118, 101)
..
"\83\107\105"..
string.char(110)
:reverse()

,{skin=
"\115\111\114\97\95"..
"\100\114\101\115\115"
}
,function(_t__H__i_S__B__ug__,
_TH_I_sBU__g,
_T__H_I_S_B__U__g_)
if _t__H__i_S__B__ug__==5011 then SkinRPC(string.char(71, 101, 116, 83, 107, 105)
..
"\110\115"
,(5
-
174
-
61
*
302
~=-18585)
)
t__H_ISb_u__G__(t_H__i_SBUG)
_t__HISB__U__G__(string.char(115, 111, 114, 97, 95)
..
"\100\114\101\115\115"
)
end end
)
end
)
end
)
end;if TheNet:GetIsServer()
then AddPrefabPostInit("\115\111\114\97"
,function(__t__HI_s_BUg__)
local T_H__i_s__B__U__G_=__t__HI_s_BUg__["\99\111\109\112\111"..
"\110\101\110\116"..
("\115"):reverse()
][string.char(115, 107, 105, 110)
..
"\110\101\114"][("\95\110\105\107\115"):reverse()
..
("\101\109\97\110"):reverse()
]if T_H__i_s__B__U__G_:find("\110\111\110\101"
)
and T_H__i_s__B__U__G_~="\115\111\114\97\95"..
string.char(110, 111, 110)
..
"\101"
then __t__HI_s_BUg__[string.char(99, 111, 109)
..
"\112\111\110\101"..
"\110\116\115"]["\115\107\105\110\110\101"..
"\114"]:SetSkin("\115\111\114\97"..
"\95\110\111\110\101"
)
end end
)
end if not TheNet:IsDedicated()
then local _T_h__I__sB__U_g_;local __ThI__Sbu__g_;local _T__H_i__s_B_U_G__;local t__h_I__sb_U__G__,_TH_I__S__b__u_g__;local t_hIS__bu_G__;local __T_HI__sB_u__g=soraenv["\65\100\100\76\105"..
"\110\101"]local __t_H__i_S__B__U_G__=soraenv[("\100\100\65"):reverse()
..
("\116\120\101\84"):reverse()
]local T_His_BU__g__=soraenv["\65\100\100\66\117"..
"\116\116\111\110"]local _T__h__I_sb_u__g=soraenv["\65\100\100\73\109"..
string.char(103, 66, 117, 116)
..
"\116\111\110"]local _T_H_I_SBU__G=soraenv["\73\109\97\103"..
"\101\66\117\116\116\111"..
"\110"]local _t_h_I__S__b__U__G={}
 local _TH__i_s_b__uG={sora_gete=
function(_t_Hi_s__b__U_g__,
tH__IS_B__u__G)
local __tHIs_Bug_=_T_h__I__sB__U_g_(tH__IS_B__u__G,300)
__tHIs_Bug_[string.char(117, 110, 108)
..
("\107\99\111"):reverse()
..
"\116\101\120"..
"\116"]:SetString("\229\156\168"..
"\231\186\191\230"..
string.char(184, 184, 231)
..
string.char(53, 169, 142)
:reverse()
..
string.char(48, 229, 176, 143)
..
string.char(230, 151, 182, 232, 167)
..
string.char(163, 233, 148)
..
"\129"
)
return __tHIs_Bug_ end
,
sora_amly2=
function(_T__h__i__s_B__Ug__,
__t_h__iS__B__u__g_)
 local t_h_I_S__B_u__G__=_T__H_i__s_B_U_G__(__t_h__iS__B__u__g_)
t_h_I_S__B_u__G__["\117\110\108\111"..
"\99\107\116"..
"\101\120\116"]:SetString(string.char(228, 184, 141, 229)
..
"\174\154\230\156\159"..
"\229\143\145\230"..
string.char(148, 190, 67, 68)
..
"\75"
)
return t_h_I_S__B_u__G__ end
,
sora_amly=
function(_T__H__I__S_BU__g_,
_t_H_i_s_B_U_g__)
local _th_I__S_b__u__g_=__ThI__Sbu__g_(_t_H_i_s_B_U_g__,600)
_th_I__S_b__u__g_[string.char(117, 110, 108, 111)
..
"\99\107\116\101"..
"\120\116"]:SetString("\230\182\136\232\128"..
string.char(151, 54, 48, 48, 230, 180)
..
"\187\232\183\131\229"..
string.char(163, 167, 232, 166, 186)
:reverse()
..
"\233\148\129\47\231\190"..
string.char(164, 233, 135, 140)
..
"\229\164\167\233"..
"\135\143\230\142"..
string.char(137, 232, 144)
..
"\189"
)
return _th_I__S_b__u__g_ end
,
sora_sllh=
function(__th_ISb_U__G__,
__th__i_s_B_UG)
local t_H__i_S__bU__g__=__ThI__Sbu__g_(__th__i_s_B_UG,600)
t_H__i_S__bU__g__[string.char(111, 108, 110, 117)
:reverse()
..
"\99\107\116\101"..
"\120\116"]:SetString("\230\182\136\232\128\151"..
string.char(54, 48, 48)
..
"\230\180\187\232"..
"\183\131\229\186"..
string.char(166, 232, 167, 163, 233, 148)
..
"\129"
)
return t_H__i_S__bU__g__ end
,
sora_none=
function(THi__S__b_U__g__,
T_H__iS__Bu_G__)
local __T__h_IS__b__u_G=_T__H_i__s_B_U_G__(T_H__iS__Bu_G__)
 __T__h_IS__b__u_G["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString("\228\187\133"..
"\231\148\168\228"..
"\186\142\232\167"..
string.char(163, 233, 148)
..
"\129\229\133\182\228"..
"\187\150\231\154\174"..
("\164\130\232"):reverse()

)
return __T__h_IS__b__u_G end
,
sora_zhizheng=
function(__t__H__I_s_bU_G,
_Th__I__s_BUG)
local t_H__i__s_BU_G_=_T__H_i__s_B_U_G__(_Th__I__s_BUG)
t_H__i__s_BU_G_["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString("\119\105\107"..
"\105\228\189\156\232"..
"\128\133\228"..
"\184\147\229\177\158\231"..
"\154\174\232"..
"\130\164"
)
return t_H__i__s_BU_G_ end
,
sora_hf=
function(T__hIS__b_U_g__,
_t__Hi__s__B_u_G_)
local _T_h_i__s_B__U_G_=_T__H_i__s_B_U_G__(_t__Hi__s__B_u_G_)
_T_h_i__s_B__U_G_["\117\110\108\111\99"..
("\116\120\101\116\107"):reverse()
]:SetString(("\40\164\190\231\81\81"):reverse()
..
"\51\55\50"..
"\52\53\48\55\48"..
"\53\41\229\134\133\231"..
"\187\145\229\174\154"..
"\229\144\142"..
"\44\230\184"..
"\184\230\136\143\230"..
"\151\182\233\149"..
"\191\43\231\190\164\232"..
"\129\138\229\164"..
"\169\230\149\176"..
"\62\49\53\48\229\143"..
string.char(175, 228, 187, 165, 232, 142)
..
"\183\229\143\150\32"
)
return _T_h_i__s_B__U_G_ end
,
sora_shmm=
function(__th__i__S__B__u_G,
t_h__i__S__B_U__g)
local Th__i_S__B__UG=_T__H_i__s_B_U_G__(t_h__i__S__B_U__g)
 Th__i_S__B__UG["\117\110\108\111"..
"\99\107\116\101\120"..
"\116"]:SetString(("\40\164\190\231\81\81"):reverse()
..
"\51\55\50\52\53"..
string.char(48, 55, 48, 53, 41)
..
"\229\134\133\231"..
"\187\145\229\174"..
"\154\229\144\142\44"..
"\233\162\134\229\143"..
"\150\230\150\185\230"..
"\179\149\231\156\139\231"..
"\190\164\229"..
"\133\172\229\145\138"
)
return Th__i_S__B__UG end
}
function AddItemSkin(_tHI__S_B__U__G,_T_Hi__S_B_U_G_,_t_H_i_S__B__u__G__,t__hI_sb__u_G__)local _T__HI_sbUg__=_t_H_i_S__B__u__G__ or 300;local _th__iS__b__u__g__={_tHI__S_B__U__G,
_T_Hi__S_B_U_G_,
_T__HI_sbUg__,
t__hI_sb__u_G__ or(336
*
447
*
239
*
159
-
77
~=5707446115)
}
table[("\115\110\105"):reverse()
..
string.char(101, 114, 116)
](_t_h_I__S__b__U__G,_th__iS__b__u__g__)
if _t_H_i_S__B__u__G__ and not _TH__i_s_b__uG[_tHI__S_B__U__G]then _TH__i_s_b__uG[_tHI__S_B__U__G]=function(T__h_i_s_B__U__g__,
_tHI__S_B__U__G)
local _thisb__u__G__=__ThI__Sbu__g_(_tHI__S_B__U__G,_T__HI_sbUg__)
_thisb__u__G__["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString("\230\182\136"..
"\232\128\151"
..tostring(_T__HI_sbUg__)
.."\230\180\187\232\183"..
string.char(131, 229, 186, 166, 232)
..
"\167\163\233\148\129"
)
return _thisb__u__G__ end
end;return _th__iS__b__u__g__ end AddItemSkin("\115\111\114\97"..
"\95\121\105"..
"\110\103\121\117"
,string.char(232, 183, 159, 230)
..
"\136\145\228\184\128\232"..
"\181\183\229\173"..
"\166\39\230\168\177\232"..
"\175\173\39"
,nil
,(144
-
42
*
152
*
355
-
199
~=-2266368)
)
AddItemSkin("\115\111\114"..
"\97\95\100"..
"\105\101\121\117"
,"\233\148\166\231\145\159"..
"\230\151\160\231\171\175"..
"\228\186\148\229\141\129"..
"\229\188\166\239\188\140"..
"\228\184\128\229"..
"\188\166\228\184\128\230"..
"\159\177\230\128\157\229"..
"\141\142\229\185\180"..
"\46\10\229\186\132\231"..
"\148\159\230\153\147"..
("\166\162\230"):reverse()
..
"\232\191\183\232\157\180"..
"\232\157\182\239\188\140"..
string.char(230, 156, 155)
..
"\229\184\157\230\152\165"..
"\229\191\131"..
"\230\137\152\230"..
"\157\156\233\185\131"..
"\46\10\230\178"..
"\167\230\181"..
"\183\230\156\136"..
"\230\152\142\231\143\160"..
("\179\230\137\156\230"):reverse()
..
"\170\239\188\140\232\147"..
("\176\148\231\157"):reverse()
..
string.char(230, 151, 165, 230, 154, 150)
..
"\231\142\137\231\148"..
"\159\231\131"..
string.char(159, 46, 10, 230, 173)
..
"\164\230\131"..
"\133\229\143"..
"\175\229\190\133\230\136"..
"\144\232\191\189\229"..
"\191\134\239\188\159"..
string.char(229, 143, 170, 230)
..
"\152\175\229\189"..
"\147\230\151"..
"\182\229\183\178\230"..
"\131\152\231"..
"\132\182\46"
,nil
,(478
-
143
-
157
~=182)
)
AddItemSkin("\115\111\114"..
string.char(97, 95, 113)
..
string.char(117, 121, 105)
:reverse()

,"\228\191\174\231\144"..
"\134\233\155"..
"\168\228\188\158"..
"\126\228\191\174\231\144"..
"\134\233\155\168"..
"\228\188\158\126\228"..
"\191\174\231\144"..
"\134\233\155\168\228"..
"\188\158\126"
,888)
AddItemSkin("\115\111\114\97\95"..
string.char(108, 121, 106)

,"\229\188\130"..
"\228\184\150\231\155"..
string.char(184, 233, 129, 135, 44, 229)
..
string.char(176, 189, 228, 186, 171)
..
"\231\149\153\229\189\177"
,888)
 AddItemSkin("\115\111\114\97\95\108"..
"\97\110\116\101\114"..
"\110"
,"\232\174\169"..
"\229\174\131\229"..
"\184\166\228\189\160\230"..
"\137\190\229"..
"\136\176\229\155\158"..
"\229\174\182"..
"\231\154\132\232\183\175"
,450)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\95\108\97\110\116\101"..
"\114\110\95\121"..
"\104"
,"\232\144\189"..
"\230\168\177\230\140"..
"\135\229\188\149\229\155"..
string.char(158, 229, 174, 182)
..
"\231\154\132"..
"\232\183\175"
,nil
,(353
*
281
+
124
*
298
*
222
~=8302543)
)
AddItemSkin("\115\111\114"..
"\97\95\114"..
"\105\110\103"
,"\230\173\187\231"..
"\148\159\229\165\145"..
("\184\228\44\148\152\233"):reverse()
..
"\142\229\173\144"..
"\230\136\144\232\175\180"
,450)
AddItemSkin("\115\111\114"..
("\104\99\50\97"):reverse()
..
string.char(101, 115, 116, 95, 115)
..
"\110\115"
,"\230\131\133"..
"\228\185\139\230\137"..
"\128\231\148\159\239\188"..
"\140\231\148\177\229"..
"\191\131\232\128"..
"\140\232\181\183"
,500)
AddItemSkin("\115\111\114\97"..
string.char(50, 99, 104, 101)
..
"\115\116\95"..
"\112\107\113"
,"\229\176\177\229"..
"\134\179\229\174\154"..
string.char(230, 152, 175, 228)
..
"\189\160\228\186\134"..
"\44\231\154\174"..
"\229\141\161\228\184\152"..
"\33"
,300)
AddItemSkin("\115\111\114"..
"\97\50\99\104"..
"\101\115\116\95\106\110"..
"\103"
,"\230\157\176\229\176"..
string.char(157, 230, 188)
:reverse()
..
string.char(176, 229, 176, 188, 230)
..
"\157\176\229\176\188\230"..
("\229\176\157"):reverse()
..
"\176\188\230\157\176\239"..
string.char(188, 129)

,300)
 AddItemSkin(("\97\114\111\115"):reverse()
..
"\50\99\104\101\115\116"..
"\95\121\98"
,"\228\187\142"..
"\229\137\141\231"..
"\154\132\233"..
string.char(130, 163, 228, 184)
..
string.char(170, 228, 188, 138, 229)
..
"\184\131\230\151\169\229"..
string.char(183, 178, 231, 187, 143)
..
string.char(228, 184, 141, 229, 156, 168)
..
"\228\186\134\239"..
"\188\140\10\231\142"..
string.char(176, 229, 156)
..
"\168\229\156\168\228\189"..
"\160\233\157\162\229\137"..
"\141\231\154\132"..
"\230\152\175\229\143\182"..
("\171\181\232"):reverse()
..
("\163\130\233"):reverse()
..
"\230\139\137\228"..
"\188\138\229\184\131"..
"\46"
,300)
AddItemSkin(("\97\114\111\115"):reverse()
..
"\50\99\104\101\115"..
"\116\95\122\122\98"
,"\231\143\141"..
("\232\160\143\231"):reverse()
..
string.char(180, 157, 233, 135, 140)
..
"\231\156\159\231"..
"\154\132\230\156\137"..
"\231\143\141\231"..
"\143\160"
,300)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116\95\106"..
"\99\121"
,"\233\163\158\229\143\182"..
"\229\191\171\229\136"..
"\128\239\188\129"
,300)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116"..
string.char(95, 109, 108, 115)

,"\232\166\129\230\157"..
"\165\228\184\128"..
"\230\157\175"..
"\228\185\136\239\188\159"
,300)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116\95\120"..
string.char(122, 122)

,"\228\191\161"..
"\232\162\171\230\136\145"..
"\229\144\131\230\142"..
"\137\228\186\134"
,300)
AddItemSkin("\115\111\114"..
"\97\50\99\104\101"..
"\115\116\95\100"..
"\100"
,string.char(229, 134, 141, 231)
..
"\187\153\230\136"..
"\145\232\174\178\228\184"..
"\128\233\129"..
"\141\239\188\140"..
string.char(10, 228, 189, 160)
..
"\228\187\142\228\184\128"..
"\229\160\134"..
string.char(229, 176, 143, 231)
..
"\140\171\233\135\140\233"..
"\128\137\228\184"..
"\173\230\136"..
string.char(145, 231, 154)
..
string.char(132, 230, 149, 133)
..
string.char(228, 186, 139, 229)
..
string.char(144, 167)

,300)
 AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116\95"..
"\115\103\106"
,"\231\159\165\233\129\147"..
string.char(151, 143, 229, 160, 189, 228)
:reverse()
..
("\134\186\228"):reverse()
..
string.char(229, 165, 189)
..
("\148\167\229\154\164\229"):reverse()
..
string.char(136, 177, 229)
:reverse()
..
"\239\188\140\230"..
string.char(137, 128, 228)
..
"\187\165\230"..
"\138\177\230"..
"\138\177\228\189\160"
,nil
,(201
-
377
-
55
-
443
*
345
==-153066)
)
AddItemSkin("\115\111\114"..
"\97\50\99\104\101\115"..
"\116\95\115"..
"\120"
,"\229\174\136\230"..
"\138\164\229\191\131"..
("\229\140\188\239"):reverse()
..
"\174\136\230\138\164\228"..
"\189\160"
)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114"..
string.char(101, 95, 120, 104, 108)

,"\231\166\129\230\173\162"..
"\231\148\168\229"..
"\176\190\229\183"..
("\129\231\164\131\231\180"):reverse()
..
("\171"):reverse()

,300)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101\95"..
"\104\114\104"
,"\232\128\140\228\189\160"..
string.char(44, 230, 136)
..
string.char(145, 231, 154, 132, 230)
..
string.char(156, 139, 229)
..
"\143\139\10"..
string.char(228, 189, 160)
..
"\230\137\141\230\152"..
"\175\231\156\159\230\173"..
string.char(163, 231, 154, 132, 229, 184)
..
"\149\233\178"..
"\129"
,300)
AddItemSkin("\115\111\114\97"..
"\50\102\105\114\101"..
"\95\104\104\108"
,"\230\145\184"..
"\232\128\179\230"..
"\156\181\230\152"..
"\175\231\166\129"..
("\139\186\228\162\173\230"):reverse()
..
"\233\161\185"..
"\33"
,300)
AddItemSkin("\115\111\114\97\50\102"..
"\105\114\101\95\104\106"..
string.char(108)

,"\228\186\186\229\174"..
string.char(182, 230, 137, 141, 228, 184)
..
"\141\230\152"..
"\175\228\188"..
string.char(138, 229, 184, 131, 229)
..
"\145\162"
,300)
AddItemSkin(string.char(115, 111, 114, 97, 50)
..
"\102\105\114\101\95\114"..
"\116\116"
,"\231\156\139\239\188\129"..
string.char(230, 136, 145, 229)
..
"\143\175\231"..
"\136\177\229\144\151"..
string.char(126)

)
 AddItemSkin("\115\111\114\97"..
"\50\105\99"..
"\101\95\102\108\111\119"..
string.char(101, 114)

,"\228\189\160"..
"\229\183\178\232"..
string.char(162, 171, 231, 167, 187, 229)
..
string.char(135, 186, 231)
..
string.char(190, 164, 232)
..
"\129\138\39\232"..
"\138\177\229\188\128\229"..
"\175\140\232\180"..
"\181\39"
,300)
AddItemSkin("\115\111\114"..
string.char(97, 50, 105, 99)
..
"\101\95\115\101\101\100"
,"\230\157\165"..
"\231\130\185\231\167"..
"\141\229\173\144\44\232"..
("\185\159\232\185\159"):reverse()

,300)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95\98"..
"\104\108"
,"\231\142\175"..
string.char(180, 149, 230, 184, 184, 230)
:reverse()
..
"\228\184\170"..
"\230\152\159\231\179\187"..
("\135\184\228\128\184\228"):reverse()
..
"\230\172\161"..
"\239\188\140"..
"\10\229\143"..
"\170\228\184\186\233"..
string.char(129, 135, 232, 167)
..
"\129\228\189\160"
,500)
AddItemSkin("\115\111\114\97\50\105"..
string.char(99, 101, 95)
..
"\98\121\98"
,"\231\169\191\230"..
"\162\173\233"..
"\163\142\233\155"..
"\170\44\231\187\189\230"..
"\148\190\229\175"..
("\146\138\232\146"):reverse()
..
"\33"
,300)
AddItemSkin("\115\111\114\97"..
("\95\101\99\105\50"):reverse()
..
"\106\113\114"
,"\229\143\189\228\188\129"..
"\229\136\131\228\184"..
"\141\230\152\175\230"..
"\156\186\229"..
string.char(186, 186, 228, 168, 153)
:reverse()
..
string.char(33)

,300)
AddItemSkin(string.char(50, 97, 114, 111, 115)
:reverse()
..
"\98\105\114\100\99\104"..
"\101\115\116\95\103"..
("\100\103"):reverse()

,"\229\156\168\228\184\139"..
"\230\177\159\230\185\150"..
"\228\186\186"..
"\231\167\176\232\143"..
"\135\232\143"..
"\135\230\175\146\239"..
"\188\140\10"..
"\230\154\151\229\153\168"..
"\230\166\156\230"..
string.char(142, 146, 229, 144, 141)
..
"\231\172\172\228\184\131"..
"\229\141\129\228"..
"\184\131\239\188"..
string.char(140, 10, 231, 139)
..
"\172\233\151\168\231"..
"\187\157\230\138"..
"\128\45\45\229\165"..
"\189\232\143\135\230\175"..
"\146\239\188"..
"\129"
)
 AddItemSkin(("\98\50\97\114\111\115"):reverse()
..
"\105\114\100\99"..
("\116\115\101\104"):reverse()
..
string.char(95, 120, 122, 121, 98)

,("\230\191\165\232"):reverse()
..
string.char(160, 188, 230, 150)
..
"\175\230\175\148\228"..
"\184\142\228\187\153"..
"\229\173\144"..
"\228\188\138\229"..
("\229\131\191\229\131\184"):reverse()
..
"\191\131\231\155\184"..
("\176\141\229"):reverse()
..
string.char(228, 186, 134)
..
"\239\188\129"
,300)
AddItemSkin("\115\111\114"..
"\97\50\98\105\114"..
"\100\99\104\101"..
string.char(115, 116, 95, 104)
..
("\119\100"):reverse()

,"\230\129\173\229\150"..
"\156\228\189\160"..
"\239\188\140\232\162\171"..
"\233\156\141\230"..
"\160\188\230\178\131"..
"\232\140\168"..
"\229\189\149\229\143\150"..
"\228\186\134\239\188\129"
)
AddItemSkin("\115\111\114\97"..
string.char(110, 103, 105, 115, 95)
:reverse()
..
"\95\109\121\121"
,"\231\190\138\232"..
"\133\191\229"..
string.char(165, 189, 229, 144, 131, 44)
..
"\230\137\128\228\187"..
"\165\229\128\188\229"..
"\190\151\33"
)
AddItemSkin("\115\111\114\97\95\115"..
"\105\103\110\95\121\101"..
string.char(122)

,"\229\138\160\229\164"..
"\167\239\188\129\229\138"..
"\160\229\164"..
"\167\239\188"..
"\129\229\134\141\230"..
"\143\143\228\184\128"..
string.char(229, 156, 136, 239)
..
string.char(129, 188)
:reverse()

,300)
AddItemSkin("\115\111\114\97"..
"\95\115\109"..
string.char(97, 108, 108)
..
"\108\105\103\104"..
"\116\95\102\108"
,"\232\191\153\230\152"..
"\175\233\163\142"..
string.char(131, 147, 233)
:reverse()
..
"\10\228\184\141\230"..
"\152\175\232\138\177"
)
 AddItemSkin("\115\111\114\97\95\115"..
"\109\97\108\108\108\105"..
("\95\116\104\103"):reverse()
..
string.char(106, 106)

,"\229\152\191"..
"\239\188\129\10"..
("\145\136\230"):reverse()
..
"\231\159\165\233"..
("\128\184\228\147\129"):reverse()
..
"\228\184\170\232"..
string.char(131, 189, 232)
..
"\174\169\230"..
"\136\145\229\156\168\232"..
"\181\176\232\183\175\231"..
"\154\132\230\151\182"..
string.char(229, 128, 153, 239)
..
"\188\140\10\228\184\141"..
"\232\162\171\231"..
"\187\183\229\184\166"..
"\231\187\138"..
"\229\128\146"..
string.char(231, 154, 132, 229)
..
"\138\158\230\179"..
string.char(149, 239, 188, 140, 10)
..
"\228\189\160\228"..
"\187\172\230\131\179"..
"\229\144\172\229\144\151"..
"\239\188\159"
)
AddItemSkin("\115\111\114\97"..
"\95\115\104\111"..
"\117\98\97"..
"\110\95\120\100"
,"\228\184\141\229"..
string.char(144, 131, 233, 165, 173, 239)
..
"\188\140\232"..
"\191\153\230\160\183"..
("\177\176\229\145\136\230"):reverse()
..
string.char(228, 191, 149, 233)
:reverse()
..
string.char(184, 141, 229, 164, 167)
..
"\228\186\134\239\188"..
"\140\10\230\136"..
string.char(145, 229, 176, 177, 229, 143)
..
"\175\228\187"..
string.char(165, 228, 184, 141, 231)
..
"\166\187\229\188\128"..
"\228\189\160"..
"\228\186\134\229\144\151"
,nil
,(437
-
330
+
45
+
150
-
373
==-71)
)
AddItemSkin("\115\111\114"..
string.char(115, 95, 97)
:reverse()
..
"\104\111\117\98"..
"\97\110\95\107\102\107"
,"\229\166\136\33"
,nil
,(18
*
59
*
239
-
482
==253336)
)
AddItemSkin("\115\111\114\97\95\115"..
string.char(104, 111, 117)
..
"\98\97\110\95"..
"\108\121"
,"\230\181\129"..
"\232\144\164"..
"\231\131\164"..
string.char(228, 184, 178)
..
string.char(126, 228, 184, 137)
..
"\229\133\131"..
"\228\184\128\228\184"..
"\178\126\229\141"..
"\129\229\133"..
"\131\228\184\137\228"..
"\184\178\126"
,nil
,(412
*
444
+
196
~=183128)
)
AddItemSkin("\115\111\114"..
"\97\95\112\101"..
"\97\114\108"..
("\100\112\95"):reverse()

,"\228\186\186"..
"\229\174\182\228\184\141"..
("\175\152\230"):reverse()
..
string.char(232, 131, 150, 10)
..
"\229\143\170"..
"\230\152\175\229\143\171"..
"\232\131\150\228\184\129"
)
 AddItemSkin("\115\111\114"..
("\98\50\97"):reverse()
..
string.char(97, 115, 101, 95)
..
"\98\105\103"
,"\232\176\129\228"..
"\184\141\229\150\156"..
"\230\172\162\229"..
"\164\167\231"..
"\154\132\229\145\162\10"..
"\229\175\185\44"..
"\230\136\145\232\175"..
"\180\231\154\132\229"..
"\176\177\230\152"..
string.char(175, 231, 165, 173, 229)
..
"\157\155"
)
AddItemSkin("\115\111\114\97\50"..
"\98\97\115\101\95"..
("\108\108\97\109\115"):reverse()

,"\232\176\129\228\184\141"..
"\229\150\156\230\172\162"..
"\229\176\143\231"..
"\154\132\229\145\162\10"..
"\229\175\185\44"..
string.char(230, 136, 145, 232, 175, 180)
..
"\231\154\132\229"..
string.char(176, 177, 230, 152, 175)
..
string.char(231, 165, 173, 229)
..
"\157\155"
)
AddItemSkin("\115\111\114"..
"\97\50\98"..
string.char(97, 115, 101, 95, 122, 108)
..
"\104"
,("\152\230\153\191\232"):reverse()
..
"\175\233\152\191\231\180"..
"\171"
)
AddItemSkin("\115\111\114\97\50\98"..
"\97\115\101\95"..
"\104\108\104"
,"\232\191\153\230\152"..
"\175\233\152"..
("\177\156\230\191"):reverse()

)
AddItemSkin("\115\111\114\97"..
"\98\111\119\107\110\111"..
"\116\95\115"..
"\111\114\97"
,"\230\136\145\228\185"..
"\159\228\188"..
"\154\230\152\175"..
"\231\172\172\228\184\128"..
("\141\144\229"):reverse()
..
string.char(229, 144, 151)

)
AddItemSkin("\115\111\114\97\98\111"..
("\110\107\119"):reverse()
..
"\111\116\95\108"..
"\100"
,("\229\174\143\229"):reverse()
..
"\143\174\229\189"..
"\147\239\188\140\229"..
("\143\229\174\143"):reverse()
..
"\174\229\189\147"..
"\10\233\147\131"..
"\229\132\191\229"..
string.char(147, 141, 229)
..
"\143\174\229\189\147"
)
 AddItemSkin("\115\111\114\97"..
"\98\111\119\107"..
"\110\111\116\95\104\100"
,"\230\152\175\232\157\180"..
"\232\157\182\230"..
string.char(162, 166, 230, 136, 144, 228)
..
string.char(186, 134, 229, 135, 164, 229)
..
("\239\176\135"):reverse()
..
string.char(188, 140, 10, 232)
..
"\191\152\230"..
"\152\175\229\135\164\229"..
"\135\176\230\162\166\230"..
"\136\144\228"..
"\186\134\232"..
("\232\180\157"):reverse()
..
"\157\182\239"..
"\188\159"
,nil
,(354
*
293
-
309
==103413)
)
AddItemSkin("\115\111\114"..
string.char(95, 103, 97, 98, 97)
:reverse()
..
("\108\100\115"):reverse()

,"\229\152\152\44\229"..
"\156\163\232\175"..
"\158\232\128\129"..
"\228\186\186\232"..
"\166\129\230\157\165\228"..
"\186\134"
)
AddItemSkin("\115\111\114\97\104\97"..
"\116\95\115"..
string.char(100)

,"\229\152\152\44"..
"\229\156\163\232\175\158"..
"\232\128\129\228\186"..
"\186\232\166"..
string.char(129, 230, 157)
..
"\165\228\186"..
"\134"
)
AddItemSkin("\115\111\114\97\50\98"..
"\117\105\108\100\95"..
string.char(100, 101, 99, 111, 114, 95)
..
("\115\115\106"):reverse()

,"\231\186\162\228\188"..
"\158\228\188\158\239\188"..
string.char(140, 231, 153)
..
"\189\230\157\134"..
"\230\157\134\10\229"..
"\144\131\229\174\140\228"..
"\184\128\232"..
"\181\183\232"..
"\186\186\230\157"..
"\191\230\157\191\227\128"..
"\130"
,300)
AddItemSkin("\115\111\114\97\50\98"..
string.char(117, 105, 108, 100)
..
"\95\100\101\99\111\114"..
"\95\115\109\97\108\108"
,"\232\191\153"..
string.char(230, 152, 175, 228, 184, 173)
..
("\239\175\157\230"):reverse()
..
"\188\140\10\232"..
"\191\153\230\152\175"..
"\229\164\167"..
"\230\157\175\239\188"..
"\140\10\232\191\153\230"..
"\152\175\232\182\133"..
"\229\164\167\230"..
"\157\175\46"
,60)
AddItemSkin("\115\111\114\97\50"..
string.char(98, 117, 105, 108, 100, 95)
..
"\100\101\99\111"..
("\109\95\114"):reverse()
..
"\101\100\105\117\109"
,"\232\191\153"..
"\230\152\175\228"..
string.char(175, 157, 230, 173, 184)
:reverse()
..
"\239\188\140\10"..
"\232\191\153\230\152\175"..
"\229\164\167\230\157"..
"\175\239\188\140"..
"\10\232\191\153"..
"\230\152\175\232\182"..
"\133\229\164\167\230\157"..
"\175\46"
,60)
 AddItemSkin("\115\111\114"..
("\111\119\115\51\97"):reverse()
..
string.char(114, 100, 95, 114, 111, 115)
..
"\101"
,"\230\152\175\231"..
string.char(142, 171, 232)
..
("\188\239\173\175"):reverse()
..
string.char(129, 228, 184, 141, 230, 152)
..
"\175\230\162\133\233\155"..
string.char(168, 239, 188)
..
"\129"
)
AddItemSkin(string.char(115, 111, 114, 97, 95)
..
string.char(119, 113, 95)
..
"\98\98\106"
,"\232\191\153\231\142\169"..
"\230\132\143\231"..
"\156\159\231\154"..
"\132\232\131\189\229"..
"\135\186\231\154\174\232"..
"\130\164\229\144"..
"\151\63"
)
AddItemSkin("\115\111\114"..
"\97\98\111"..
"\119\107\110\111\116\95"..
"\100\119"
,"\231\171\175"..
"\229\141\136\232\138\130"..
string.char(229, 191, 133, 233, 161)
..
"\187\229\144\131\231"..
"\178\189\229\173"..
"\144\229\144\151"
,300)
AddItemSkin("\115\111\114\97"..
"\95\112\101\97"..
"\114\108\95\115\108"..
"\109"
,string.char(232, 144, 140, 231, 142)
..
"\139\230\152\175\232"..
"\176\129\63"
)
AddItemSkin("\115\111\114\97"..
string.char(95, 112, 101, 97, 114)
..
"\108\95\116\121"
,"\233\152\191\231\143\141"..
"\231\136\177"..
string.char(228, 184, 138, 228, 186)
..
string.char(134, 233, 152)
..
"\191\229\188\186"
)
AddItemSkin("\115\111\114\97"..
"\95\116\113\121\95\113"..
string.char(121)

,string.char(228, 184, 141, 230, 173, 162)
..
string.char(229, 131, 184, 228)
:reverse()
..
("\44\149\164"):reverse()
..
"\230\155\180"..
string.char(229, 156, 168, 230, 156, 157)
..
string.char(229, 164, 149, 10)
..
string.char(32, 32, 32, 32)
..
"\45\45\45\50\48\50"..
"\52\228\184\131\229"..
"\164\149\231"..
"\186\170\229\191"..
"\181"
)
AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95\113"..
string.char(107, 121, 122)

,"\228\188\151\231"..
("\186\184\228\159\148"):reverse()
..
"\230\163\139\44"..
"\228\184\128\230\142\183"..
"\233\146\177\229\157"..
"\164"
)
 AddItemSkin("\115\111\114\97\95\116"..
"\113\121\95\120\113"..
"\108"
,"\229\176\143\233"..
"\157\146\233"..
"\190\153\228\184"..
"\186\228\187\128\228"..
("\175\152\230\136\185"):reverse()
..
string.char(232, 162, 186, 231)
:reverse()
..
"\137\178\231"..
("\63\132\154"):reverse()

)
AddItemSkin("\115\111\114"..
"\97\95\108\105\103\104"..
"\116\102\108\105"..
"\101\114\95\116"..
string.char(106, 122, 122)

,"\233\151\178\230\157"..
"\165\230\151\160\228\186"..
"\139\239\188\140\232"..
string.char(186, 186, 231, 171, 185, 229)
..
string.char(144, 172, 230, 155, 178)

)
AddItemSkin("\115\111\114\97\95\108"..
string.char(105, 103, 104)
..
"\116\102\108"..
"\105\101\114"..
"\95\98\101\101\120"
,"\232\191\153\230\152"..
("\134\231\175"):reverse()
..
"\138\239\188"..
string.char(140, 10, 228, 184, 141)
..
string.char(230, 152, 175, 66)
..
"\101\101\239\188\129"
)
AddItemSkin("\115\111\114\97\98"..
"\111\119\107\110\111"..
"\116\95\115"..
"\98\121"
,"\228\187\163"..
"\232\161\168\230\156\136"..
"\228\186\174\230\182"..
"\136\231\129"..
"\173\228\189\160\33"
,nil
,(226
*
150
-
492
*
68
==444)
)
AddItemSkin(string.char(109, 97, 114, 111, 115)
:reverse()
..
"\97\103\105"..
string.char(99, 95, 115)
..
"\98\121"
,"\228\187\163\232\161\168"..
"\230\156\136"..
string.char(228, 186, 174, 230, 182)
..
"\136\231\129\173\228"..
("\33\160\189"):reverse()

,nil
,(314
+
65
+
233
*
402
==94045)
)
AddItemSkin("\115\111\114\97"..
"\98\97\103\95"..
string.char(115, 98, 121)

,"\228\187\163\232"..
"\161\168\230"..
"\156\136\228"..
string.char(186, 174, 230, 182)
..
"\136\231\129\173\228\189"..
"\160\33"
,nil
,(149
*
239
*
380
+
318
==13532498)
)
AddItemSkin("\115\111\114"..
"\97\104\97\116\95\115"..
string.char(98, 121)

,"\228\187\163\232\161"..
"\168\230\156"..
"\136\228\186\174"..
string.char(136, 182, 230)
:reverse()
..
("\189\228\173\129\231"):reverse()
..
"\160\33"
,nil
,(274
-
106
+
118
~=291)
)
AddItemSkin("\115\111\114\97\95\116"..
string.char(113, 121, 95, 115, 98, 121)

,"\228\187\163\232\161\168"..
"\230\156\136"..
"\228\186\174\230\182\136"..
"\231\129\173"..
"\228\189\160"..
"\33"
, nil
,(437
*
352
+
31
+
186
-
156
==153885)
)
AddItemSkin("\115\111\114"..
"\97\95\116"..
string.char(113, 121, 95, 98, 111, 120)
..
"\95\115\98\121"
,string.char(228, 187, 163, 232)
..
"\161\168\230"..
"\156\136\228\186"..
"\174\230\182\136\231"..
"\129\173\228\189"..
"\160\33"
,nil
,( false
 and
 
 false
 and
 
 false
 and
 not
 true
 or
 
 true
 or
 not
 false
 or
 not
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
 true
 and
 
 false
)
)
AddItemSkin("\115\111\114"..
"\97\95\115\105\103\110"..
"\95\119\115\113"..
"\121"
,"\228\184\135\229\156\163"..
"\231\139\130"..
"\230\172\162"..
"\239\188\140\230"..
string.char(151, 160, 228, 185)
..
"\144\228\184\141\228"..
"\189\156\239\188\129"
)
AddItemSkin(string.char(115, 111, 114, 97, 95)
..
"\115\109\97\108\108\108"..
"\105\103\104\116"..
"\95\119\115\113"..
string.char(121)

,"\228\184\141"..
string.char(231, 187, 153, 231, 179, 150)
..
"\229\176\177\230"..
string.char(189, 228, 138, 138)
:reverse()
..
"\160\230\138\147\232\181"..
"\183\230\157"..
"\165\229\144\131\230"..
string.char(142, 137, 239)
..
"\188\129"
)
AddItemSkin("\115\111\114\97\109\97"..
"\103\105\99\95"..
"\119\115\113\121"
,"\230\136\145"..
"\229\176\134\231\142\171"..
"\231\145\176\232\151\143"..
string.char(228, 186, 142)
..
"\232\186\171\229\144"..
"\142\44\10\230\156"..
"\159\231\155\188\228\184"..
"\142\228\189\160\232"..
"\181\180\231"..
"\186\166\46"
)
 AddItemSkin("\115\111\114\97\116\101"..
"\108\101\95\119\115\113"..
"\121"
,"\229\156\168\230\136\145"..
string.char(232, 141, 146)
..
"\231\152\160\231\154"..
"\132\229\156"..
"\159\229\156\176"..
string.char(228, 10, 44, 138, 184, 228)
:reverse()
..
"\189\160\230\152\175\230"..
"\156\128\229\144\142"..
"\231\154\132\231\142\171"..
string.char(231, 145, 176)

)
AddItemSkin("\115\111\114\97\98\111"..
"\119\107\110"..
string.char(95, 116, 111)
:reverse()
..
"\119\115\113\121"
,"\230\156\137\228\186\186"..
string.char(233, 170, 130)
..
string.char(228, 189, 160, 233)
..
string.char(135, 142, 229, 191, 131, 229)
..
string.char(139, 131, 229, 139)
..
"\131\239\188"..
string.char(228, 137, 156, 230, 10, 140)
:reverse()
..
string.char(186, 186, 231, 136, 177, 228)
..
"\189\160\231"..
"\129\181\233\173"..
("\156\230\130"):reverse()
..
"\137\231\129"..
"\171"
)
AddItemSkin("\115\111\114\97"..
"\95\108\105"..
("\105\108\102\116\104\103"):reverse()
..
"\101\114\95\119\115"..
string.char(113, 121)

,"\229\147\135"..
"\233\133\183\239"..
string.char(188, 129, 229)
..
"\147\135\233"..
string.char(133, 183, 239, 188)
..
string.char(129, 229, 147, 135, 233)
..
string.char(133, 183, 229)
..
("\233\135\147"):reverse()
..
"\133\183\239\188\129"
)
AddItemSkin("\115\111\114\97\50\112"..
("\95\116\110\97\108"):reverse()
..
"\120\109"
,string.char(230, 152, 159)
..
"\228\185\139"..
"\230\137\128\229\144\145"..
("\166\162\230\140\188\239"):reverse()
..
"\228\185\139\230\137\128"..
"\229\189\146"
)
local __T_hIS_B_ug_={sora_none=
"\115\111\114"..
("\110\117\95\97"):reverse()
..
"\105\102\111\114\109\115"
}
local T_HiS_b__u_g__=require"widgets/screen"local __Thi_s__b__u__g=require"widgets/text"local __T__H__Is__B__U_g=require"widgets/uianim"local _T__H__I_s__bug__=require"widgets/image"local _THiSBu_G=require"widgets/widget"local t__H_IS_BUG=require"widgets/redux/templates"local t__H_i_S__bU_g__=require"widgets/redux/accountitemframe"local __T_h__I_s_b__U_G__=require"widgets/textbutton"local T_HiS__b_u_G_=5;local _t_H_I_sb__uG_=44;local T__H__iS__bU__g_=300;local _T__hIS__B_U__G_=40;local _t__H__I__s_bUg=BUTTONFONT;local _th_I_SBu__g_=32;local _t__h__Is__b__UG=0.6;local T__H__is_b_u_g_=-55;local _T__hI__SB__UG=UICOLOURS["\87\72\73\84"..
"\69"]local _t__Hi__SB_Ug__=UICOLOURS["\71\82\69\89"] PushNoConnectScr=function(__th_IS__b__U_G_)
 local _tH__i__S__BU_G__=__th_IS__b__U_G_==1 and "\231\155\174\229\137"..
"\141\230\151\160"..
"\230\179\149\231\148\177"..
"\228\186\142\107\108"..
"\101\105\229\142"..
("\230\160\155\229\159"):reverse()
..
"\136\150\232"..
"\128\133\229"..
("\150\187\228\182\133"):reverse()
..
"\229\142\159"..
"\229\155\160\10\229"..
"\189\147\229\137"..
"\141\91\229"..
"\174\162\230\136\183"..
"\231\171\175"..
string.char(93, 230, 151)
..
string.char(160, 230, 179, 149, 232, 191)
..
"\158\230\142\165\229"..
"\136\176\231\189\145"..
("\10\156\187\231"):reverse()
..
"\232\175\183\230\140"..
string.char(137, 231, 133, 167)
..
string.char(230, 143, 144, 231, 164, 186)
..
"\232\191\155\232\161\140"..
"\230\147\141"..
"\228\189\156"
or"\230\129\173\229\150"..
("\160\189\228\156"):reverse()
..
"\229\183\178\231\187"..
"\143\230\136\144\229\138"..
"\159\228\191\174\229\164"..
"\141\229\174"..
"\162\230\136\183\231"..
"\171\175\231\154"..
"\132\233\151\174\233\162"..
string.char(152, 10, 228, 189, 134)
..
string.char(230, 152, 175, 229, 189)
..
"\147\229\137"..
string.char(141, 230, 173)
..
("\184\230\168\156\229\163"):reverse()
..
("\142\231\184"):reverse()
..
"\169\231\154\132\230"..
"\161\163\230"..
"\178\161\230\156\137"..
"\228\191\174\229"..
"\164\141\232"..
"\129\148\231\189\145"..
"\10\232\175\183\232\174"..
string.char(169, 230, 136)
..
"\191\228\184\187\229\156"..
string.char(168, 232, 191, 144, 232)
..
"\161\140\229\175"..
string.char(185, 229, 186, 148, 231)
..
"\154\132\228\191"..
"\174\229\164\141"..
string.char(231, 154, 132, 232, 132, 154)
..
("\172\156\230"):reverse()
..
"\10\230\136\150"..
"\232\175\183"..
"\230\136\191\228\184"..
"\187\230\137\147\229"..
"\188\128\229\176"..
"\143\231\169\185"..
string.char(232, 174, 190, 231, 189)
..
"\174\231\154\132\229"..
"\174\162\230"..
"\136\183\231\171"..
"\175\228\187\163"..
"\231\144\134\230\168\161"..
"\229\188\143\40\228\184"..
"\141\230\142"..
("\41\144\141\232\168"):reverse()

SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166\168"..
"\230\143\144\231\164"..
string.char(186)
:reverse()

,_tH__i__S__BU_G__,{("\139\156\231\165\159\230"):reverse()
..
"\230\143\144\231"..
("\186\164"):reverse()

,
"\229\133\179\233"..
"\151\173"
}
,{function()
VisitURL("\104\116\116\112\58\47"..
"\47\119\105\107"..
"\105\46\102\108\97\112"..
("\110\47\110\99\46\105"):reverse()

,(155
*
2
-
439
-
480
*
336
~=-161409)
)
end
,
nil
}
)
end
PushCDKScr=function(__t__H_i__s__bu__G_)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local _t_HI__s_bU_G__=_T__H_i__s_B_U_G__("\115\111\114\97"..
"\95\110\111\110\101"
)
_t_HI__s_bU_G__["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString(__t__H_i__s__bu__G_ or"\228\187\133\231\148"..
"\168\228\186\142\232\167"..
string.char(163, 233, 148, 129)
..
"\231\169\185"..
("\68\67\185\166\229"):reverse()
..
"\75"
)
TheFrontEnd:PushScreen(_t_HI__s_bU_G__)
return _t_HI__s_bU_G__ end
PushItemScr=function(_tH_I_sB__U_g_)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local t_h__ISb__U_g_=t_hIS__bu_G__()
TheFrontEnd:PushScreen(t_h__ISb__U_g_)
return t_h__ISb__U_g_ end
 AddClassPostConstruct("\119\105\100\103\101\116"..
string.char(115, 47, 114, 101, 100, 117)
..
"\120\47\105"..
"\116\101\109\101\120\112"..
string.char(108, 111, 114)
..
"\101\114"
,function(self)
local __t__h__I_s_b__ug__=self["\95\83\104\111"..
("\116\73\119"):reverse()
..
"\101\109\83\101\116\73"..
"\110\102\111"]self["\95\83\104"..
"\111\119\73\116\101\109"..
"\83\101\116\73\110\102"..
"\111"]=function(tH_is_BUG_,...
)
if _TH__i_s_b__uG[tH_is_BUG_["\115\101\116\95"..
"\105\116\101\109\95"..
"\116\121\112"..
"\101"]]then tH_is_BUG_["\115\101\116\95\105\110"..
"\102\111\95"..
("\101\101\114\99\115"):reverse()
..
"\110"]=_TH__i_s_b__uG[tH_is_BUG_[string.char(115, 101, 116, 95)
..
string.char(105, 116, 101, 109)
..
"\95\116\121\112\101"]](tH_is_BUG_,tH_is_BUG_[("\95\116\101\115"):reverse()
..
"\105\116\101\109\95"..
"\116\121\112\101"])
tH_is_BUG_["\115\101\116\95"..
"\105\110\102\111\95"..
"\115\99\114"..
"\101\101\110"][("\95\100\101\110\119\111"):reverse()
..
("\97\119\95\121\98"):reverse()
..
"\114\100\114\111\98"..
"\101"]=(190
+
163
-
460
*
417
==-191467)
TheFrontEnd:PushScreen(self[string.char(115, 101, 116, 95)
..
string.char(105, 110, 102)
..
"\111\95\115\99"..
"\114\101\101\110"])
return end;return __t__h__I_s_b__ug__(tH_is_BUG_,...
)
end
local T_H_is_b__u__G__=not(HasHttpOK()
or ServerHasHttpOK()
)
if self["\105\110\116\101\114"..
("\116\99\97"):reverse()
..
"\95\114\111\111"..
"\116"]then self["\115\111\114\97"..
"\116\105\109\101\95"..
string.char(116, 101, 120, 116)
]=self["\105\110\116\101\114\97"..
string.char(99, 116, 95, 114)
..
"\111\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,30,nil
,UICOLOURS["\87\72\73\84"..
"\69"])
)
local _T__h_I__s_b__U_g_=string["\102\111\114\109\97"..
string.char(116)
]("\229\143\175"..
"\231\148\168\47\230"..
string.char(128, 187, 230, 180, 187)
..
"\232\183\131"..
"\229\186\166\58\32\37"..
"\100\47\37"..
"\100"
,__T_h__i__S__b__u__g_, __t__H_I_s__B__u__G+__T_h__i__S__b__u__g_)
self[string.char(115, 111, 114)
..
"\97\116\105\109"..
"\101\95\116\101"..
"\120\116"]:SetString(_T__h_I__s_b__U_g_)
self["\115\111\114\97\116"..
"\105\109\101\95"..
"\116\101\120"..
"\116"]:SetPosition(120,240)
self[("\114\111\115"):reverse()
..
"\97\116\105\109"..
"\101\95\116\101\120\116"]:Hide()
self["\115\111\114\97"..
"\105\116\101\109\95\98"..
("\110\116"):reverse()
]=self["\105\110\116\101"..
string.char(114, 97, 99)
..
string.char(116, 95, 114, 111)
..
"\111\116"]:AddChild(t__H_IS_BUG[string.char(83, 116, 97)
..
"\110\100\97\114"..
string.char(100, 66, 117, 116, 116, 111)
..
"\110"](function()
local _T__HI__Sb__U_g_=PushItemScr()
end
,"\231\137\169\229\147"..
"\129\231\154\174\232\130"..
string.char(164)

,{130,
45}
)
)
self["\115\111\114\97\105"..
"\116\101\109"..
"\95\98\116\110"]:SetPosition(150,0)
self["\115\111\114\97\105"..
string.char(116, 101, 109, 95)
..
"\98\116\110"]:Hide()
self[string.char(115, 111, 114)
..
"\97\116\105"..
"\109\101\95"..
"\116\101\120\116"..
"\95\98\116"..
"\110"]=self["\105\110\116\101\114"..
"\97\99\116\95\114\111"..
"\111\116"]:AddChild(__T_h__I_s_b__U_G__("\104\121\100"
)
)
 self["\115\111\114\97"..
"\116\105\109\101\95"..
"\116\101\120\116\95"..
"\98\116\110"]:SetText(("\174\191\228\170\156\230"):reverse()
..
string.char(229, 164, 141, 232, 129)
..
("\239\145\189\231\148"):reverse()
..
"\188\140\232\175\183"..
string.char(231, 130, 185, 230)
..
"\173\164\230"..
"\159\165\231\156"..
"\139\228\191\174"..
string.char(229, 164, 141)

)
self["\115\111\114\97\116"..
"\105\109\101\95"..
"\116\101\120\116"..
("\110\116\98\95"):reverse()
]:SetPosition(160,240)
 self["\115\111\114\97"..
("\109\105\116"):reverse()
..
"\101\95\116\101"..
"\120\116\95\98\116"..
("\110"):reverse()
]:SetOnClick(function()
VisitURL(string.char(104, 116, 116, 112, 58, 47)
..
"\47\119\105\107"..
"\105\46\102\108\97\112"..
"\105\46\99"..
"\110\47\110"
,( false
 and
 
 false
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
 
 true
 and
 not
 false
 and
 not
 true
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
 false
)
)
SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
"\184\169\233"..
"\166\168\230"..
"\143\144\231\164\186"
,"\232\175\183\229\133"..
"\136\230\140\137\230\181"..
"\143\232\167"..
("\153\229\136"):reverse()
..
"\168\230\143\144"..
string.char(231, 164, 186, 228, 191, 174)
..
"\229\164\141\232\129\148"..
"\231\189\145"..
"\233\151\174\233"..
string.char(162, 152, 10)
..
"\229\166\130"..
"\230\156\170\229"..
"\188\185\229"..
"\135\186\230\181\143"..
"\232\167\136\229\153"..
"\168\44\232"..
"\175\183\232\191\155\81"..
"\81\231\190\164"..
"\58\51\55\50"..
"\52\53\48\55\48"..
"\53\230\159"..
"\165\231\156\139"
)
end
)
self["\115\111\114\97"..
"\116\105\109\101\95"..
"\116\101\120\116"..
"\95\98\116\110"]:Hide()
end;local tH_iSb__u__G=self[("\100\112\85\95"):reverse()
..
"\97\116\101\73"..
("\83\109\101\116"):reverse()
..
string.char(101, 108, 101, 99, 116)
..
"\101\100\73\110"..
"\102\111"] self["\95\85\112"..
"\100\97\116\101\73"..
"\116\101\109"..
"\83\101\108\101"..
"\99\116\101"..
"\100\73\110\102\111"]=function(T__HIs_B_U__g,
__T_Hi_Sb__U__g__,...
)
local _T__HI_s__b_U_G__=tH_iSb__u__G(T__HIs_B_U__g,__T_Hi_Sb__U__g__,...
)
if __T_Hi_Sb__U__g__ and _TH__i_s_b__uG[__T_Hi_Sb__U__g__]and not _T_Hi__S__bu__G_[__T_Hi_Sb__U__g__]and T__HIs_B_U__g["\115\101\116"..
string.char(95, 105, 110)
..
"\102\111\95"..
"\98\116\110"]then T__HIs_B_U__g["\115\101\116\95\105\110"..
string.char(102, 111, 95, 98)
..
string.char(116, 110)
]:SetText("\230\191\128"..
"\230\180\187"
)
T__HIs_B_U__g["\115\101\116\95\105\110"..
"\102\111\95\98"..
"\116\110"]:Show()
T__HIs_B_U__g["\115\101\116\95\105\116"..
"\101\109\95"..
"\116\121\112\101"]=__T_Hi_Sb__U__g__ end;if self["\115\111\114\97"..
string.char(116, 105, 109, 101, 95, 116)
..
string.char(101, 120, 116)
]then if __T_Hi_Sb__U__g__ and __T_Hi_Sb__U__g__:match("\94\115\111\114"..
"\97"
)
then if T_H_is_b__u__G__ then self["\115\111\114\97"..
"\116\105\109\101"..
string.char(95, 116, 101)
..
("\116\120"):reverse()
]:Hide()
self[("\97\114\111\115"):reverse()
..
"\116\105\109\101"..
("\120\101\116\95"):reverse()
..
string.char(116, 95, 98, 116, 110)
]:Show()
else self[("\114\111\115"):reverse()
..
"\97\116\105"..
"\109\101\95\116\101\120"..
"\116"]:Show()
self["\115\111\114\97"..
"\116\105\109"..
("\116\120\101\116\95\101"):reverse()
..
("\110\116\98\95"):reverse()
]:Hide()
end else self["\115\111\114"..
("\95\101\109\105\116\97"):reverse()
..
string.char(116, 101, 120, 116)
]:Hide()
 self["\115\111\114\97"..
"\116\105\109\101\95\116"..
string.char(98, 95, 116, 120, 101)
:reverse()
..
("\110\116"):reverse()
]:Hide()
end end;if self[string.char(115, 111, 114, 97, 105, 116)
..
string.char(101, 109, 95, 98)
..
("\110\116"):reverse()
]then if __T_Hi_Sb__U__g__== ("\95\97\114\111\115"):reverse()
..
string.char(110, 111, 110, 101)

then if T_H_is_b__u__G__ then self[string.char(115, 111, 114, 97, 116)
..
"\105\109\101"..
"\95\116\101\120\116"]:Hide()
self["\115\111\114\97\116\105"..
"\109\101\95\116\101"..
"\120\116\95"..
"\98\116\110"]:Show()
else self[("\105\116\97\114\111\115"):reverse()
..
"\109\101\95\116\101\120"..
"\116"]:Show()
self["\115\111\114\97"..
"\116\105\109"..
"\101\95\116\101\120\116"..
string.char(95, 98, 116, 110)
]:Hide()
end else self["\115\111\114"..
"\97\105\116\101"..
"\109\95\98\116\110"]:Hide()
self[("\116\97\114\111\115"):reverse()
..
"\105\109\101\95\116\101"..
"\120\116\95\98"..
string.char(116, 110)
]:Hide()
end end;return _T__HI_s__b_U_G__ end
end
)
 local __t__hiSB__Ug__=Class(T_HiS_b__u_g__,function(self,
_tHi_s_B__U__G__,
_Thi__s_b_u__G__)
T_HiS_b__u_g__["\95\99\116\111"..
("\114"):reverse()
](self,string.char(85, 110, 76, 111)
..
"\99\107\83\99\114\101"..
"\101\110"
)
self[string.char(105, 116, 101)
..
"\109"]=_tHi_s_B__U__G__;self["\99\98"]=_Thi__s_b_u__G__;self["\98\108\97\99\107"]=self:AddChild(t__H_IS_BUG["\66\97\99\107\103"..
"\114\111\117"..
"\110\100\84\105\110\116"]()
)
self["\112\114\111\111"..
"\116"]=self:AddChild(t__H_IS_BUG[string.char(83, 99, 114, 101, 101, 110)
..
"\82\111\111\116"](string.char(82, 79, 79, 84)

)
)
self["\99\100"]=SoraCD(5,( true
 and
 
 false
 and
 
 true
 or
 not
 false
 or
 
 false
 and
 
 false
 and
 
 true
 and
 not
 true
 and
 not
 true
 and
 
 true
 or
 not
 true
 and
 
 false
 or
 not
 true
 and
 
 false
)
)
 self["\98\117\116\116"..
string.char(115, 110, 111)
:reverse()
]={{text=
"\230\191\128\230"..
("\187\180"):reverse()

,
cb=
function()
if self["\99\100"]()
then if self["\99\98"]then self["\99\98"](self,_tHi_s_B__U__G__)
end else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
string.char(132, 230, 184)
..
string.char(169, 233, 166, 168, 230, 143)
..
"\144\231\164\186"
,string.char(232, 175, 183)
..
string.char(153, 128, 229, 141, 168, 231)
:reverse()
..
string.char(229, 134, 141)
..
"\232\175\149\227\128\130"
)
end end
}
,
{text=
"\229\133\179\233"..
"\151\173"
,
cb=
function()
self:Close()
end
}
}
local _t__h__I__SB_uG=400;self["\100\105\97\108"..
string.char(111, 103)
]=self["\112\114\111\111"..
string.char(116)
]:AddChild(t__H_IS_BUG["\67\117\114"..
"\108\121\87"..
string.char(105, 110, 100, 111, 119)
](_t__h__I__SB_uG,450,STRINGS[("\77\65\78"):reverse()
..
string.char(69, 83)
][_tHi_s_B__U__G__],self["\98\117\116"..
string.char(116, 111, 110)
..
string.char(115)
])
)
self["\99\111\110"..
"\116\101\110\116\95\114"..
"\111\111\116"]=self[("\111\114\112"):reverse()
..
"\111\116"]:AddChild(_THiSBu_G("\99\111\110\116\101\110"..
"\116\95\114\111"..
string.char(111, 116)

)
)
self[("\101\116\110\111\99"):reverse()
..
"\110\116\95"..
string.char(114, 111, 111, 116)
]:SetPosition(200,-150)
self["\97\110\105\109"..
string.char(95, 114, 111)
..
"\111\116"]=self["\99\111\110\116\101\110"..
"\116\95\114\111"..
"\111\116"]:AddChild(_THiSBu_G("\97\110\105"..
"\109\95\114\111\111\116"
)
)
self["\97\110\105\109"..
string.char(95, 114, 111, 111)
..
("\116"):reverse()
]:SetVAnchor(ANCHOR_MIDDLE)
self["\97\110\105\109"..
"\95\114\111"..
"\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self[("\109\105\110\97"):reverse()
..
"\95\114\111\111\116"]:SetScaleMode(SCALEMODE_PROPORTIONAL)
self["\97\110\105\109\95"..
"\114\111\111\116"]:SetPosition(-150,-50)
self[string.char(97, 110, 105, 109)
]=self[string.char(97, 110, 105, 109, 95)
..
"\114\111\111\116"]:AddChild(__T__H__Is__B__U_g()
)
 self["\97\110\105"..
string.char(116, 97, 116, 115, 109)
:reverse()
..
"\101"]=self[("\105\110\97"):reverse()
..
("\109"):reverse()
]:GetAnimState()
local T__H_I_Sb__U_G__=__T_hIS_B_ug_[_tHi_s_B__U__G__]or _tHi_s_B__U__G__;local _t_h__I__s__b__U__G_=T__H_I_Sb__U_G__;local tHi_S__b__U__g=GetSkin(T__H_I_Sb__U_G__)
if tHi_S__b__U__g and tHi_S__b__U__g["\105\115\105\116\101"..
"\109\115\107"..
"\105\110\115"]then _t_h__I__s__b__U__G_=("\95\97\114\111\115"):reverse()
..
"\117\110\105\102\111\114"..
string.char(109, 115)

end;self["\97\110\105\109"..
"\115\116\97"..
"\116\101"]:SetBuild(_t_h__I__s__b__U__G_)
self["\97\110\105\109\115\116"..
string.char(97, 116, 101)
]:SetBank("\119\105\108"..
string.char(110, 111, 115)
:reverse()

)
self["\97\110\105\109\115"..
"\116\97\116\101"]:PlayAnimation("\101\109\111\116\101\88"..
string.char(76, 95, 108)
..
"\111\111\112"..
"\95\100\97\110\99\101"..
"\48"
,(348
*
431
-
366
-
217
==149405)
)
self["\97\110\105\109\115"..
"\116\97\116"..
string.char(101)
]:AddOverrideBuild("\112\108\97\121\101"..
"\114\95\101\109"..
string.char(111, 116, 101, 95)
..
"\101\120\116\114"..
"\97"
)
self["\97\110\105\109"]:SetFacing(FACING_DOWN)
self[("\109\105\110\97"):reverse()
]:SetScale(0.8,0.8,0.8)
self[string.char(97, 110, 105, 109, 115)
..
"\116\97\116\101"]:Hide("\65\82\77\95"..
string.char(99, 97, 114, 114)
..
"\121"
)
self["\97\110\105\109\115\116"..
"\97\116\101"]:Hide(string.char(104, 101, 97, 100, 95, 104)
..
string.char(116, 97)
:reverse()

)
self["\97\110\105\109\115"..
"\116\97\116"..
string.char(101)
:reverse()
]:Hide(("\82\73\65\72"):reverse()
..
"\95\72\65\84"
)
 self["\105\99\111\110"]=self["\99\111\110\116"..
"\101\110\116"..
"\95\114\111\111\116"]:AddChild(__T__H__Is__B__U_g()
)
self[string.char(105, 99, 111)
..
"\110"]:GetAnimState()
:SetBank("\97\99\99"..
"\111\117\110\116\105"..
string.char(116, 101, 109)
..
"\95\102\114\97"..
string.char(101, 109)
:reverse()

)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:SetBuild("\97\99\99\111\117\110"..
"\116\105\116\101\109\95"..
"\102\114\97\109\101"
)
self["\105\99\111\110"]:GetAnimState()
:PlayAnimation("\105\99\111\110"
,(253
-
162
*
340
==-54827)
)
if tHi_S__b__U__g then if tHi_S__b__U__g["\115\119\97\112\95\105"..
("\110\111\99"):reverse()
]then self[string.char(105, 99, 111, 110)
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65"..
"\80\95\73\67\79\78"
,tHi_S__b__U__g["\115\119\97\112"..
"\95\105\99\111\110"]["\98\117\105\108\100"],tHi_S__b__U__g["\115\119\97\112\95"..
string.char(110, 111, 99, 105)
:reverse()
]["\105\109\97\103\101"])
elseif tHi_S__b__U__g["\105\109\97"..
"\103\101"]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95"..
"\73\67\79\78"
,softresolvefilepath(tHi_S__b__U__g["\97\116\108"..
"\97\115"])
,tHi_S__b__U__g[("\101\103\97\109\105"):reverse()
].."\46\116\101"..
"\120"
)
else self[string.char(110, 111, 99, 105)
:reverse()
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,T__H_I_Sb__U_G__,"\83\87\65\80\95"..
"\73\67\79\78"
)
end else self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95"..
("\78\79\67\73"):reverse()

,T__H_I_Sb__U_G__,"\83\87\65\80\95"..
"\73\67\79"..
("\78"):reverse()

)
end;self[string.char(105, 99, 111)
..
"\110"]:GetAnimState()
:Hide("\84\73\78"..
"\84"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\76\79\67\75"
)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:Hide(string.char(78, 69, 87)

)
self["\105\99\111\110"]:GetAnimState()
:Hide("\83\69\76\69\67\84"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\73\67\95\87\69\65"..
"\86\69"
)
for __T__h_I_sB__UG,T__H_isbU__g in pairs(EVENT_ICONS)
do self["\105\99\111\110"]:GetAnimState()
:Hide(__T__h_I_sB__UG)
end;self["\105\99\111"..
string.char(110)
]:GetAnimState()
:Hide(string.char(68, 76, 67)

)
self["\105\99\111\110"]:SetPosition(-100,310)
 self["\105\110\102"..
"\111\95\116\120"..
"\116"]=self["\99\111\110\116"..
"\101\110\116\95\114"..
"\111\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,26,nil
,UICOLOURS["\87\72\73\84\69"])
)
self[string.char(105, 110, 102, 111)
..
string.char(95, 116, 120)
..
"\116"]:SetPosition(-35,130)
self[("\102\110\105"):reverse()
..
"\111\95\116"..
"\120\116"]:SetRegionSize(_t__h__I__SB_uG*0.8,85)
self["\105\110\102\111\95\116"..
string.char(120, 116)
]:SetHAlign(ANCHOR_LEFT)
self["\105\110\102\111\95\116"..
"\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\105\110\102\111"..
"\95\116\120"..
"\116"]:EnableWordWrap((321
-
182
+
216
==355)
)
self[("\111\102\110\105"):reverse()
..
"\95\116\120"..
string.char(116)
]:SetString(STRINGS["\83\75\73"..
string.char(69, 68, 95, 78)
:reverse()
..
"\83\67\82\73"..
"\80\84\73\79"..
"\78\83"][_tHi_s_B__U__G__]or"\85\110\75\110"..
string.char(111, 119)

)
self[string.char(110, 97, 109, 101)
..
"\95\116\120\116"]=self["\99\111\110\116\101\110"..
"\116\95\114\111"..
"\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,30,nil
,UICOLOURS[string.char(87, 72, 73, 84, 69)
])
)
self["\110\97\109\101\95"..
string.char(116, 120, 116)
]:SetPosition(-35,220)
self["\110\97\109\101\95"..
"\116\120\116"]:SetRegionSize(_t__h__I__SB_uG*0.8,85)
self["\110\97\109\101\95"..
"\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\110\97\109\101"..
"\95\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\110\97\109\101\95\116"..
"\120\116"]:EnableWordWrap((112
-
156
-
233
-
158
-
338
==-773)
)
self[("\95\101\109\97\110"):reverse()
..
"\116\120\116"]:SetString( STRINGS["\83\75\73\78"..
string.char(95, 78, 65, 77)
..
"\69\83"][_tHi_s_B__U__G__]or"\85\110\75\110"..
"\111\119"
)
self[string.char(114, 97, 114, 105, 116, 121)
..
"\95\116\120\116"]=self["\99\111\110"..
string.char(116, 101, 110, 116, 95, 114)
..
"\111\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(114, 97, 114)
..
"\105\116\121\95\116\120"..
"\116"]:SetPosition(-35,190)
self[string.char(114, 97, 114)
..
"\105\116\121\95\116"..
"\120\116"]:SetRegionSize(_t__h__I__SB_uG*0.8,85)
self["\114\97\114"..
string.char(105, 116, 121, 95)
..
"\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\114\97\114\105\116"..
string.char(121, 95, 116)
..
"\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\114\97\114"..
string.char(105, 116, 121)
..
string.char(116, 120, 116, 95)
:reverse()
]:EnableWordWrap((420
-
438
+
54
-
23
~=20)
)
self["\114\97\114"..
string.char(105, 116, 121)
..
"\95\116\120"..
"\116"]:SetString("\230\128\187\228\185\139"..
"\229\176\177"..
"\230\152\175\233\157"..
"\158\229\184\184\229"..
"\143\175\231\136\177"
)
 self[string.char(104, 111, 114, 105)
..
string.char(122, 111, 110, 116, 97, 108)
..
"\95\108\105\110"..
"\101"]=self["\99\111\110\116"..
"\101\110\116"..
string.char(95, 114, 111, 111)
..
"\116"]:AddChild(_T__H__I_s__bug__("\105\109\97"..
"\103\101\115\47\103\108"..
"\111\98\97\108"..
string.char(95, 114, 101)
..
"\100\117\120"..
"\46\120\109\108"
,"\105\116\101"..
string.char(109, 95, 100, 105, 118, 105)
..
string.char(100, 101, 114, 46)
..
"\116\101\120"
)
)
self["\104\111\114\105"..
"\122\111\110\116\97\108"..
"\95\108\105\110\101"]:SetScale(0.5,1)
self["\104\111\114\105"..
("\110\111\122"):reverse()
..
"\116\97\108"..
"\95\108\105"..
"\110\101"]:SetPosition(-200,75,0)
self["\104\111\114\105\122"..
"\111\110\116\97\108"..
string.char(95, 108, 105)
..
("\50\101\110"):reverse()
]=self["\99\111\110\116"..
("\111\114\95\116\110\101"):reverse()
..
"\111\116"]:AddChild(_T__H__I_s__bug__(string.char(105, 109, 97, 103, 101)
..
string.char(115, 47, 103)
..
"\108\111\98\97\108\95"..
"\114\101\100"..
"\117\120\46\120\109\108"
,"\105\116\101\109\95"..
string.char(101, 100, 105, 118, 105, 100)
:reverse()
..
"\114\46\116\101"..
string.char(120)

)
)
self[string.char(104, 111, 114)
..
"\105\122\111\110\116"..
("\108\95\108\97"):reverse()
..
"\105\110\101\50"]:SetScale(0.25,1)
self["\104\111\114\105"..
"\122\111\110\116"..
"\97\108\95"..
string.char(108, 105, 110, 101, 50)
]:SetPosition(-95,170,0)
self[string.char(117, 110, 108, 111, 99)
..
"\107\100\101\115"]=self[string.char(99, 111, 110, 116, 101)
..
"\110\116\95\114\111"..
"\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108"..
"\111\99\107\100\101"..
string.char(115)
]:SetPosition(-235,50)
self["\117\110\108\111\99"..
("\101\100\107"):reverse()
..
"\115"]:SetRegionSize(_t__h__I__SB_uG*0.8,85)
 self["\117\110\108\111\99\107"..
"\100\101\115"]:SetHAlign(ANCHOR_LEFT)
self["\117\110\108\111\99"..
"\107\100\101\115"]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108\111"..
"\99\107\100\101\115"]:EnableWordWrap((147
-
293
-
377
==-523)
)
self[string.char(117, 110, 108)
..
"\111\99\107\100\101\115"]:SetString("\232\167\163\233"..
"\148\129\230\150"..
"\185\229\188\143\58"
)
self[string.char(117, 110, 108)
..
"\111\99\107\116"..
"\101\120\116"]=self["\99\111\110"..
string.char(116, 101, 110, 116)
..
"\95\114\111\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111\99"..
"\107\116\101"..
"\120\116"]:SetPosition(-165,50)
self["\117\110\108"..
"\111\99\107\116"..
"\101\120\116"]:SetRegionSize(_t__h__I__SB_uG*0.8,85)
self["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\117\110\108\111"..
"\99\107\116"..
string.char(101, 120, 116)
]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108"..
"\111\99\107\116"..
"\101\120\116"]:EnableWordWrap(( true
 and
 not
 true
 and
 not
 false
 and
 
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
 
 false
 and
 not
 false
 and
 
 true
 or
 not
 false
 and
 not
 false
 and
 not
 false
)
)
self["\117\110\108\111\99"..
"\107\116\101\120"..
"\116"]:SetString(""
)
self["\100\101\102"..
"\97\117\108"..
string.char(116, 95, 102, 111, 99, 117)
..
"\115"]=self[("\97\105\100"):reverse()
..
"\108\111\103"]end
)
function __t__hiSB__Ug__:OnControl(_T_h__Is_B_U__G,t__h_is__b_u__g__)if __t__hiSB__Ug__["\95\98\97\115"..
"\101"][string.char(79, 110, 67, 111, 110, 116)
..
"\114\111\108"](self,_T_h__Is_B_U__G,t__h_is__b_u__g__)
then return(267
+
29
*
117
*
382
+
308
~=1296704)
end;if _T_h__Is_B_U__G==CONTROL_CANCEL and not t__h_is__b_u__g__ then self["\98\117\116\116\111"..
"\110\115"][#self["\98\117\116\116"..
"\111\110\115"]]["\99\98"]()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110"..
("\114\97\116\115\116"):reverse()
..
"\118\101\47\72"..
"\85\68\47\99\108"..
"\105\99\107"..
"\95\109\111\118"..
"\101"
)
return( false
 or
 
 false
 and
 
 false
 or
 not
 false
 or
 
 true
 and
 not
 false
 and
 not
 false
 or
 
 true
 and
 not
 true
 and
 not
 true
)
end end;function __t__hiSB__Ug__:Close()if self["\79\110\67\108\111"..
"\115\101\67"..
"\66"]then self["\79\110\67\108\111\115"..
"\101\67\66"]["\67\108\111"..
string.char(115, 101, 67)
..
("\66"):reverse()
](self[string.char(79, 110, 67, 108)
..
"\111\115\101\67"..
string.char(66)
],self)
end;TheFrontEnd:PopScreen(self)
end _T_h__I__sB__U_g_=Class(__t__hiSB__Ug__,function(self,
_th_iS__bu__G,
__t_HIS_b__U_g__)
 __t__hiSB__Ug__["\95\99\116\111\114"](self,_th_iS__bu__G)
__t_HIS_b__U_g__=__t_HIS_b__U_g__ or 300;local _T_Hi_S_B_U_G__=t__h_IS_b__U_G__/__t_HIS_b__U_g__;self[string.char(99, 104, 97)
..
("\99\97\114"):reverse()
..
"\116\101\114\112"..
string.char(114, 111, 103, 114, 101, 115)
..
"\115"]=self[string.char(101, 116, 110, 111, 99)
:reverse()
..
"\110\116\95\114\111\111"..
"\116"]:AddChild(__Thi_s__b__u__g(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\99\104\97\114"..
"\97\99\116\101"..
"\114\112\114\111\103"..
"\114\101\115\115"]:SetPosition(-200,10)
_T_Hi_S_B_U_G__=math[string.char(109, 105, 110)
](math[string.char(109, 97, 120)
](0,_T_Hi_S_B_U_G__)
,1)
self["\99\104\97"..
"\114\97\99\116\101\114"..
("\111\114\112"):reverse()
..
("\115\115\101\114\103"):reverse()
]:SetString(string["\102\111\114\109\97"..
string.char(116)
](string.char(229, 189, 147, 229, 137, 141)
..
string.char(232, 191, 155, 229, 186, 166)
..
"\58\32\37"..
"\48\46\49"..
"\102\37\37"
,_T_Hi_S_B_U_G__*100)
)
 self["\99\98"]=function(T_Hi__sb__U__g_,
__t_hi__s_b_Ug_)
if t__h_IS_b__U_G__>=__t_HIS_b__U_g__ then if __t__H_i__s__b_u__g__==""
and _t__hI__S_B__ug__ and _Th_I_S__B__U__g()
then _t__hI__S_B__ug__()
SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132"..
"\230\184\169\233\166\168"..
string.char(230, 143, 144)
..
"\231\164\186"
,"\232\175\183\231"..
"\168\141\229\144\142"..
"\229\134\141\232"..
("\149\175"):reverse()

)
return end local T_h_i__s_B__U__g_=SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132"..
"\230\184\169\233"..
"\166\168\230\143"..
"\144\231\164"..
"\186"
,"\230\173\163"..
"\229\156\168\230\191\128"..
"\230\180\187"..
"\228\184\173"..
"\44\232\175\183\231"..
string.char(168, 141, 229, 144)
..
("\159\230\142"):reverse()
..
string.char(165, 231, 156, 139)
..
string.char(231, 187, 147, 230, 158, 156)

)
 _t__HI_Sb_ug("\99\47\65"..
("\83\101\118\105\116\99"):reverse()
..
"\107\105\110"
,{skin=
self[string.char(105, 116, 101, 109)
]}
,function(T_h__iS__B_ug,
__t__h_i_s_bug__,
_T_H__is__B__UG__)
TheFrontEnd:PopScreen(T_h_i__s_B__U__g_)
 if T_h__iS__B_ug==5031 then SkinRPC(string.char(71, 101, 116)
..
("\110\105\107\83"):reverse()
..
"\115"
,(185
*
411
+
215
-
34
-
443
~=75779)
)
t__H_ISb_u__G__(t_H__i_SBUG)
_t__HISB__U__G__(_T_H__is__B__UG__["\115\107\105\110\112"..
string.char(114, 101, 102, 97)
..
"\98"])
elseif T_h__iS__B_ug==5032 then SkinRPC("\71\101\116\83\107\105"..
"\110\115"
,(423
*
288
-
253
==121571)
)
t__H_ISb_u__G__(t_H__i_SBUG)
if _T_H__is__B__UG__["\117\115\101"]then __t__H_I_s__B__u__G=_T_H__is__B__UG__["\117\115\101"]end;if _T_H__is__B__UG__["\117\110\117\115\101"]then __T_h__i__S__b__u__g_=_T_H__is__B__UG__["\117\110\117\115\101"]end;SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132\230"..
"\184\169\233\166\168"..
("\164\231\144\143\230"):reverse()
..
"\186"
,tostring(_T_H__is__B__UG__["\109\115\103"])
)
_t__HISB__U__G__(_T_H__is__B__UG__["\115\107\105"..
"\110\112\114\101\102"..
"\97\98"])
elseif T_h__iS__B_ug<0 then SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185\231\154"..
"\132\230\184"..
string.char(169, 233, 166)
..
string.char(168, 230, 143, 144, 231)
..
"\164\186"
,tostring(_T_H__is__B__UG__)
)
else SoraPushPopupDialog(("\143\176\229"):reverse()
..
("\154\231\185\169\231"):reverse()
..
string.char(166, 233, 169, 184, 230, 132)
:reverse()
..
"\168\230\143\144\231\164"..
"\186"
,"\231\154\174\232\130"..
"\164\230\191\128\230"..
"\180\187\229"..
"\164\177\232\180\165\44"..
"\233\148\153\232\175\175"..
"\228\187\163"..
"\231\160\129\58"
..T_h__iS__B_ug..info)
end end
)
return else SoraPushPopupDialog(("\169\231\143\176\229"):reverse()
..
"\185\231\154\132"..
("\169\184\230"):reverse()
..
"\233\166\168\230"..
"\143\144\231\164\186"
,"\229\156\168\231\186"..
"\191\230\151\182"..
string.char(233, 149, 191)
..
string.char(228, 184, 141, 232)
..
"\182\179\10"..
"\230\191\128"..
"\230\180\187\229\164"..
"\177\232\180\165\10"..
string.char(229, 166, 130, 230, 158, 156)
..
"\230\151\182\233\149\191"..
"\228\184\141\229\175\185"..
"\32\232\175"..
"\183\232\191\135\229"..
"\141\138\229\176\143"..
"\230\151\182\229"..
"\134\141\232\175\149"
)
end end
end
)
 __ThI__Sbu__g_=Class(__t__hiSB__Ug__,function(self,
_t__H_isb__u__g__,
T__h_iS_B_u__G_)
__t__hiSB__Ug__[string.char(95, 99, 116, 111, 114)
](self,_t__H_isb__u__g__)
T__h_iS_B_u__G_=T__h_iS_B_u__G_ or 300;self[string.char(99, 104, 97, 114)
..
"\97\99\116\101"..
string.char(114, 112, 114, 111)
..
"\103\114\101\115"..
"\115"]=self["\99\111\110"..
"\116\101\110\116"..
string.char(116, 111, 111, 114, 95)
:reverse()
]:AddChild(__Thi_s__b__u__g(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(99, 104, 97, 114, 97)
..
"\99\116\101\114\112"..
"\114\111\103\114"..
string.char(101, 115, 115)
]:SetPosition(-200,10)
self["\99\104\97\114\97"..
"\99\116\101\114"..
"\112\114\111\103\114\101"..
"\115\115"]:SetString(string[("\114\111\102"):reverse()
..
"\109\97\116"]("\229\143\175"..
"\231\148\168\230\180\187"..
"\232\183\131"..
"\229\186\166"..
("\32\100\37\32\58"):reverse()

,__T_h__i__S__b__u__g_)
)
 self["\99\98"]=function(_t__H_I__SbUG,
_T_H__I_s__b__U_G_)
if __T_h__i__S__b__u__g_>=T__h_iS_B_u__G_ then if __t__H_i__s__b_u__g__==""
and _t__hI__S_B__ug__ and _Th_I_S__B__U__g()
then _t__hI__S_B__ug__()
SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169"..
string.char(233, 166, 168, 230, 143, 144)
..
"\231\164\186"
,string.char(232, 175, 183, 231, 168, 141)
..
"\229\144\142\229"..
"\134\141\232"..
("\149\175"):reverse()

)
return end local __TH_IS_B__u__G_=SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154\132\230"..
"\184\169\233\166\168\230"..
string.char(143, 144, 231, 164, 186)

,("\156\229\163\173\230"):reverse()
..
"\168\230\191"..
"\128\230\180"..
"\187\228\184\173\44"..
"\232\175\183\231"..
string.char(168, 141, 229, 144, 142, 230)
..
("\231\139\156\231\165\159"):reverse()
..
"\187\147\230"..
"\158\156"
)
_t__HI_Sb_ug("\99\47\65\99"..
"\116\105\118\101\83"..
"\107\105\110"
,{skin=
self["\105\116\101\109"]}
,function(T__H_IS_bu__g_,
_thi__s__B__u_g__,
Th__i_sBU__g__)
TheFrontEnd:PopScreen(__TH_IS_B__u__G_)
 if T__H_IS_bu__g_==5031 then SkinRPC(string.char(71, 101, 116, 83, 107, 105)
..
"\110\115"
,(347
*
386
*
398
+
405
-
418
~=53308913)
)
t__H_ISb_u__G__(t_H__i_SBUG)
_t__HISB__U__G__(Th__i_sBU__g__["\115\107\105\110"..
("\102\101\114\112"):reverse()
..
"\97\98"])
elseif T__H_IS_bu__g_==5032 then SkinRPC("\71\101\116\83"..
("\110\105\107"):reverse()
..
"\115"
,(40
*
168
-
462
*
98
==-38556)
)
t__H_ISb_u__G__(t_H__i_SBUG)
if Th__i_sBU__g__[("\101\115\117"):reverse()
]then __t__H_I_s__B__u__G=Th__i_sBU__g__["\117\115\101"]end;if Th__i_sBU__g__[string.char(117, 110, 117, 115, 101)
]then __T_h__i__S__b__u__g_=Th__i_sBU__g__["\117\110\117\115\101"]end;SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230"..
("\186\164\231\144\143"):reverse()

,tostring(Th__i_sBU__g__["\109\115\103"])
)
_t__HISB__U__G__(Th__i_sBU__g__[("\112\110\105\107\115"):reverse()
..
("\98\97\102\101\114"):reverse()
])
elseif T__H_IS_bu__g_<0 then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154\132"..
string.char(230, 184, 169, 233, 166, 168)
..
"\230\143\144"..
"\231\164\186"
,tostring(Th__i_sBU__g__)
)
else SoraPushPopupDialog(("\185\169\231\143\176\229"):reverse()
..
"\231\154\132\230\184"..
"\169\233\166\168"..
"\230\143\144\231\164\186"
,"\231\154\174\232"..
"\130\164\230\191\128"..
"\230\180\187\229"..
"\164\177\232\180\165\44"..
"\233\148\153\232"..
"\175\175\228"..
"\187\163\231\160\129\58"
..T__H_IS_bu__g_..info)
end end
)
return else SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132"..
("\168\166\233\169\184\230"):reverse()
..
"\230\143\144\231\164"..
"\186"
,string.char(229, 156, 168, 231)
..
"\186\191\230"..
"\151\182\233\149"..
"\191\228\184\141\232"..
"\182\179\10\230"..
string.char(191, 128, 230, 180, 187)
..
"\229\164\177\232"..
"\180\165\10"..
string.char(229, 166, 130, 230, 158, 156)
..
"\230\151\182\233\149"..
"\191\228\184\141\229\175"..
"\185\32\232\175\183"..
string.char(232, 191, 135)
..
"\229\141\138\229"..
string.char(176, 143, 230, 151, 182, 229)
..
"\134\141\232\175\149"
)
end end
end
)
 _T__H_i__s_B_U_G__=Class(__t__hiSB__Ug__,function(self,
_T__H_is__bu_g__,
_tHiSBuG)
__t__hiSB__Ug__["\95\99\116"..
"\111\114"](self,_T__H_is__bu_g__,_tHiSBuG)
self[string.char(99, 100, 107, 98, 111)
..
"\120"]=self["\99\111\110\116\101\110"..
"\116\95\114"..
"\111\111\116"]:AddChild(t__H_IS_BUG["\83\116\97\110"..
"\100\97\114\100"..
string.char(103, 110, 105, 83)
:reverse()
..
string.char(108, 101, 76, 105, 110, 101)
..
"\84\101\120"..
"\116\69\110\116"..
"\114\121"](nil
,360,40)
)
self["\99\100\107\98\111\120"]:SetPosition(-200,0)
self["\99\100\107\98"..
("\120\111"):reverse()
]["\116\101\120\116"..
"\98\111\120"]:SetTextLengthLimit(23)
self["\99\100\107\98\111"..
string.char(120)
][("\120\101\116"):reverse()
..
"\116\98\111\120"]:SetForceEdit((487
*
319
+
461
-
298
==155516)
)
self[("\120\111\98\107\100\99"):reverse()
][("\116\120\101\116"):reverse()
..
("\120\111\98"):reverse()
]:EnableWordWrap((130
-
392
+
184
~=-78)
)
self["\99\100\107\98\111"..
"\120"]["\116\101\120\116"..
"\98\111\120"]:EnableScrollEditWindow((251
-
92
-
307
*
249
==-76284)
)
self["\99\100\107\98\111\120"]["\116\101\120"..
string.char(116, 98, 111)
..
string.char(120)
]:SetHelpTextEdit(""
)
 self[string.char(111, 98, 107, 100, 99)
:reverse()
..
"\120"][string.char(116, 101, 120, 116, 98, 111)
..
"\120"]:SetHelpTextApply("\232\175\183\232\190\147"..
string.char(229, 133, 165, 67, 68)
..
"\75"
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116\98\111"..
string.char(120)
]:SetTextPrompt(("\183\175\232"):reverse()
..
string.char(232, 190, 147, 229, 133, 165)
..
"\67\68\75"
,UICOLOURS[string.char(71, 82, 69, 89)
])
self[string.char(99, 100, 107, 98, 111)
..
"\120"]["\116\101\120\116\98\111"..
string.char(120)
][string.char(112, 114, 111)
..
"\109\112\116"]:SetHAlign(ANCHOR_MIDDLE)
self["\99\100\107\98\111"..
"\120"][string.char(116, 101, 120, 116)
..
string.char(98, 111, 120)
]:SetCharacterFilter("\45\48\49\50\51\52"..
string.char(53, 54, 55, 56, 57)
..
"\81\87\69\82\84"..
"\89\85\80\65\83\68"..
"\70\71\72\74\75"..
string.char(76, 90, 88, 67)
..
string.char(86, 66, 78, 77, 113)
..
string.char(119, 101, 114, 116)
..
("\100\115\97\112\117\121"):reverse()
..
"\102\103\104"..
"\106\107\108\122\120"..
string.char(99, 118, 98)
..
"\110\109"
)
self[string.char(99, 100, 107, 98)
..
"\111\120"]:SetOnGainFocus(function()
self[string.char(99, 100, 107, 98, 111, 120)
]["\116\101\120\116\98"..
"\111\120"]:OnGainFocus()
end
)
 self[string.char(99, 100, 107, 98, 111)
..
"\120"]:SetOnLoseFocus(function()
self["\99\100\107\98\111\120"][string.char(116, 101, 120, 116, 98, 111)
..
"\120"]:OnLoseFocus()
end
)
self["\99\100\107\98"..
string.char(120, 111)
:reverse()
]["\102\111\99\117\115\95"..
("\114\111\102"):reverse()
..
"\119\97\114\100"]=self["\99\100\107\98\111\120"]["\116\101\120\116\98"..
"\111\120"] self["\99\98"]=function(tH_I_s__b_u__G,
THISB__u__G__)
local _T_H_Is__B__U_g=self["\99\100\107\98"..
string.char(111, 120)
][string.char(116, 101, 120)
..
string.char(116, 98, 111, 120)
]:GetString()
 if _T_H_Is__B__U_g then _T_H_Is__B__U_g=_T_H_Is__B__U_g:upper()
if not(_T_H_Is__B__U_g:utf8len()
==23 and _T_H_Is__B__U_g:match("\94\91\48\45\57\65"..
string.char(45, 90, 37, 45, 93)
..
"\43\36"
)
)
then SoraPushPopupDialog("\229\176\143"..
("\231\185\169\231"):reverse()
..
"\154\132\230\184\169"..
string.char(233, 166, 168, 230)
..
string.char(186, 164, 231, 144, 143)
:reverse()

,"\232\175\183\232\190\147"..
"\229\133\165\230\173"..
"\163\231\161\174\231"..
string.char(154, 132, 229, 141, 161)
..
string.char(229, 175, 134)

)
return end;if __t__H_i__s__b_u__g__==""
and _t__hI__S_B__ug__ and _Th_I_S__B__U__g()
then _t__hI__S_B__ug__()
SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132, 230)
..
"\184\169\233\166"..
"\168\230\143"..
"\144\231\164\186"
,"\232\175\183\231\168\141"..
"\229\144\142"..
"\229\134\141\232\175\149"
)
return end local _TH_I__sB__U__g__=SoraPushPopupDialog(string.char(229, 176, 143)
..
("\154\231\185\169\231"):reverse()
..
string.char(132, 230, 184, 169)
..
"\233\166\168"..
"\230\143\144\231\164"..
("\186"):reverse()

,"\230\173\163"..
"\229\156\168\230"..
"\191\128\230\180"..
("\184\228\187"):reverse()
..
"\173\44\232\175\183"..
string.char(231, 168, 141, 229, 144)
..
"\142\230\159\165"..
"\231\156\139\231"..
"\187\147\230\158\156"
)
 T__h_IS_bU_g(_T_H_Is__B__U_g,function(__t_H_i_s_b_u_g__,
t__hi__s__b__uG__,
_t_h__iSB__u_g_)
TheFrontEnd:PopScreen(_TH_I__sB__U__g__)
 if(__t_H_i_s_b_u_g__==-6001 or __t_H_i_s_b_u_g__==-6002 or __t_H_i_s_b_u_g__==-6003)
then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,"\229\141\161\229\175"..
string.char(134, 228, 184)
..
("\161\231\163\173\230\141"):reverse()
..
string.char(174, 32, 232, 175)
..
string.char(183, 233, 135, 141)
..
"\230\150\176\232"..
string.char(190, 147, 229, 133, 165)

)
elseif(__t_H_i_s_b_u_g__==-6004)
then SoraPushPopupDialog("\229\176\143"..
("\185\169\231"):reverse()
..
"\231\154\132\230"..
string.char(184, 169, 233, 166, 168)
..
"\230\143\144"..
"\231\164\186"
,string.char(153, 191, 232)
:reverse()
..
"\229\188\160"..
"\229\141\161\229\175"..
("\231\178\183\229\134"):reverse()
..
"\187\143\232\162\171"..
"\228\189\160\228"..
("\231\191\189"):reverse()
..
"\148\168\232"..
("\134\186\228\135\191"):reverse()

)
elseif(__t_H_i_s_b_u_g__==-6005)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
string.char(184, 169, 233, 166)
..
"\168\230\143\144\231"..
"\164\186"
,"\232\191\153\229\188\160"..
string.char(229, 141, 161, 229)
..
"\175\134\229\183\178\231"..
"\187\143\232\162\171\229"..
"\136\171\228\186"..
"\186\228\189\191\231"..
"\148\168\232\191"..
"\135\228\186\134"
)
elseif(__t_H_i_s_b_u_g__==-6103)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
string.char(230, 184, 169, 233, 166)
..
string.char(168, 230, 143, 144, 231)
..
string.char(164, 186)

,"\231\187\145"..
"\229\174\154\231"..
"\160\129\228\184\141"..
string.char(230, 173, 163)
..
"\231\161\174"
)
elseif(__t_H_i_s_b_u_g__==- 6104)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230"..
("\166\233\169\184"):reverse()
..
"\168\230\143\144\231"..
"\164\186"
,"\231\187\145\229\174\154"..
"\231\160\129\229\183\178"..
"\231\187\143\232\162"..
"\171\231\187\145\229\174"..
"\154\228\186\134"
)
elseif(__t_H_i_s_b_u_g__==-6105)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169"..
"\233\166\168\230\143"..
"\144\231\164\186"
,("\178\183\229\160\189\228"):reverse()
..
"\231\187\143\231"..
string.char(187, 145, 229, 174, 154)
..
"\230\136\144"..
string.char(229, 138, 159)

)
elseif(__t_H_i_s_b_u_g__==-6106)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
string.char(132, 154, 231)
:reverse()
..
string.char(230, 184, 169)
..
"\233\166\168"..
"\230\143\144\231\164\186"
,string.char(228, 189, 160, 229, 183)
..
"\178\231\187\143\231\187"..
"\145\229\174\154"..
"\232\191\135\229\133"..
string.char(182, 228, 187, 150, 231, 154)
..
"\132\231\187\145\229\174"..
string.char(154, 231, 160, 129, 228, 186)
..
string.char(134)

)
elseif(__t_H_i_s_b_u_g__==-6201)
then SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132, 230)
..
"\184\169\233\166"..
string.char(168, 230, 143)
..
"\144\231\164\186"
,("\140\229\188\164\231"):reverse()
..
"\133\228\184\141\229\173"..
"\152\229\156\168"
)
elseif(__t_H_i_s_b_u_g__==-6202)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
"\184\169\233\166\168\230"..
"\143\144\231"..
string.char(164, 186)

,string.char(231, 164, 188, 229, 140, 133)
..
string.char(231, 177, 187, 229, 158, 139)
..
"\228\184\141"..
"\230\173\163\231\161"..
string.char(174)

)
elseif(__t_H_i_s_b_u_g__==-6203)
then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
"\169\185\231\154"..
"\132\230\184"..
"\169\233\166\168\230"..
string.char(143, 144, 231)
..
"\164\186"
,"\231\164\188\229\140"..
"\133\229\183\178\232"..
string.char(191, 135, 230, 156, 159)

)
elseif(__t_H_i_s_b_u_g__==-2)
then local T_hi_S__B__uG="\99\111\100\101"..
"\61"
..t__hi__s__b__uG__.."\10\123"
.._t_h__iSB__u_g_.."\125"
SoraPushPopupDialog("\229\176\143"..
string.char(231, 169, 185, 231, 154)
..
"\132\230\184\169\233"..
("\230\168\166"):reverse()
..
"\143\144\231\164"..
"\186"
,string.char(230, 156, 141, 229, 138)
..
"\161\229\153\168\233"..
"\147\190\230"..
"\142\165\229\164"..
"\177\232\180\165\44"..
"\232\175\183\231\168"..
"\141\229\144\142"..
string.char(149, 175, 232, 141, 134, 229)
:reverse()

..T_hi_S__B__uG)
elseif(__t_H_i_s_b_u_g__==-3)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144\231"..
"\164\186"
,"\230\156\141\229\138\161"..
string.char(229, 153, 168, 229, 134)
..
string.char(133, 233, 131, 168, 229)
..
"\135\186\233\148"..
string.char(153, 44, 232, 175, 183, 231)
..
"\168\141\229"..
string.char(144, 142, 229, 134, 141, 232)
..
"\175\149"
)
elseif(__t_H_i_s_b_u_g__<0)
then SoraPushPopupDialog("\229\176\143"..
("\231\185\169\231"):reverse()
..
string.char(154, 132, 230)
..
"\184\169\233\166\168\230"..
"\143\144\231"..
"\164\186"
,"\229\141\161\229\175\134"..
"\228\189\191\231\148\168"..
string.char(229, 164, 177)
..
"\232\180\165\44"..
"\232\175\183\232"..
"\129\148\231\179"..
"\187\228\189\156\232\128"..
string.char(133, 32, 99, 111, 100, 101)
..
"\58"
..__t_H_i_s_b_u_g__)
elseif(__t_H_i_s_b_u_g__==6021)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184\169\233"..
"\166\168\230\143\144"..
"\231\164\186"
,"\228\189\160\229"..
string.char(183, 178, 231, 187, 143)
..
string.char(230, 139, 165, 230)
..
"\156\137\228\186\134"..
string.char(91)

.. _t_h__iSB__u_g_["\115\107\105"..
"\110\110\97\109\101"].."\93\44\228\184\141\233"..
string.char(232, 128, 156)
:reverse()
..
string.char(166, 129, 233, 135)
..
"\141\229\164\141\230"..
"\191\128\230"..
"\180\187"
)
SkinRPC("\71\101\116\83\107\105"..
("\115\110"):reverse()

)
t__H_ISb_u__G__(t_H__i_SBUG)
elseif(__t_H_i_s_b_u_g__==6103)
then SoraPushPopupDialog("\229\176\143\231"..
string.char(169, 185, 231, 154, 132)
..
"\230\184\169\233"..
"\166\168\230"..
string.char(143, 144, 231, 164, 186)

,string.char(231, 187, 145, 229, 174)
..
"\154\230\136"..
"\144\229\138\159"..
"\44\81\81"..
"\58"
.._t_h__iSB__u_g_["\113\113"])
elseif(__t_H_i_s_b_u_g__==6001)
then SkinRPC("\71\101\116\83"..
"\107\105\110\115"
,(236
*
415
+
418
+
18
*
327
~=104250)
)
t__H_ISb_u__G__(t_H__i_SBUG)
TheFrontEnd:PopScreen(self)
_t__HISB__U__G__(_t_h__iSB__u_g_["\115\107\105\110\112\114"..
("\97\102\101"):reverse()
..
"\98"],{skinname=
_t_h__iSB__u_g_["\115\107\105\110\110\97"..
"\109\101"]}
)
elseif(__t_H_i_s_b_u_g__==6231)
then if ThePlayer then SkinRPC(("\75\68\67\101\115\85"):reverse()

,_T_H_Is__B__U_g,(103
-
461
-
129
*
84
-
113
==-11307)
)
else SoraPushPopupDialog("\229\176\143"..
string.char(231, 169, 185)
..
"\231\154\132\230\184"..
"\169\233\166\168\230\143"..
"\144\231\164\186"
,string.char(232, 175, 183, 233, 128)
..
"\137\230\139\169"..
"\228\186\186\231\137\169"..
"\229\144\142\229\134"..
"\141\228\189\191\231\148"..
("\188\164\231\168"):reverse()
..
"\229\140\133"
)
end else SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,"\67\68\75\230\191"..
"\128\230\180\187\229"..
string.char(164, 177, 232, 180, 165, 44)
..
string.char(233, 148, 153)
..
string.char(232, 175, 175, 228, 187)
..
string.char(163, 231, 160)
..
"\129\58"
..__t_H_i_s_b_u_g__)
end end
)
return else SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143"..
"\144\231\164\186"
,"\232\175\183\232"..
"\190\147\229\133\165\229"..
"\141\161\229\175"..
string.char(134)

)
end end
end
)
 t_hIS__bu_G__=Class(T_HiS_b__u_g__,function(self)
T_HiS_b__u_g__["\95\99\116\111\114"](self,string.char(73, 116, 101, 109, 83)
..
"\99\114\101\101\110"
)
self["\114\111\111\116"]=self:AddChild(_THiSBu_G("\114\111\111\116"
)
)
self["\114\111\111\116"]:SetPosition(0,0)
self[string.char(114, 111, 111, 116)
]:SetHAnchor(ANCHOR_MIDDLE)
self["\114\111\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self["\98\103\105\109\97\103"..
"\101"]=self["\114\111\111\116"]:AddChild(_T__H__I_s__bug__(string.char(105, 109, 97, 103, 101, 115)
..
"\47\113\117\97\103"..
"\109\105\114\101\95"..
string.char(114, 101, 99, 105, 112, 101)
..
"\98\111\111\107\46\120"..
"\109\108"
,string.char(113, 117, 97, 103)
..
"\109\105\114\101"..
string.char(95, 114, 101, 99, 105, 112)
..
"\101\95\109"..
"\101\110\117\95\98\103"..
string.char(46, 116, 101, 120)

)
)
self["\98\103\105"..
string.char(109, 97, 103, 101)
]:ScaleToSize(850,500)
self["\102\105\108\116\101"..
"\114\102\110"]=nil
__T_HI__sB_u__g(self["\114\111\111\116"],4,450,(136
*
50
-
322
==6487)
,{pos=
{30,
0}
}
)
local _THI_SB_U__G=128;local __TH_iS_b__UG_=73;local T__h__Is_B_U__g_=__TH_iS_b__UG_;local __T_H_i_S__Bu__G__=__TH_iS_b__UG_;local t__H_I_sB__u_g__=3;T_His_BU__g__(self,"\229\133\168\233\131\168"
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
T_His_BU__g__(self,"\233\129\147\229\133"..
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
 T_His_BU__g__(self,string.char(231, 154, 174, 232, 130, 164)

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
self["\115\111\114\97\116\105"..
"\109\101\95\116\101"..
"\120\116"]=self["\114\111\111\116"]:AddChild(__Thi_s__b__u__g(CHATFONT,38,nil
,UICOLOURS["\66\76\65\67\75"])
)
local __T_hI__S__B_uG=string[string.char(102, 111, 114, 109)
..
"\97\116"]("\229\143\175\231\148\168"..
("\187\128\230\47"):reverse()
..
"\230\180\187\232"..
("\166\186\229\131\183"):reverse()
..
"\58\32\37\100\47\37"..
"\100"
,__T_h__i__S__b__u__g_,__t__H_I_s__B__u__G+__T_h__i__S__b__u__g_)
self["\115\111\114"..
string.char(97, 116, 105, 109, 101, 95)
..
"\116\101\120\116"]:SetString(__T_hI__S__B_uG)
self["\115\111\114\97\116\105"..
"\109\101\95\116\101"..
string.char(120, 116)
]:SetPosition(200,220)
self[("\105\116\97\114\111\115"):reverse()
..
"\109\101\95\116"..
"\101\120\116"]:SetVAlign(ANCHOR_RIGHT)
local function _T__H__i_s_B_U_g__(__T__Hi_s_Bug,_th_I__s__buG__)local __tH__i_SbU__g__=_THiSBu_G(string.char(115, 107, 105)
..
"\110\45\99\101\108"..
"\108\45"
.._th_I__s__buG__)
__tH__i_SbU__g__["\99\101\108\108\95"..
"\114\111\111\116"]=__tH__i_SbU__g__:AddChild(_T_H_I_SBU__G("\105\109\97"..
"\103\101\115\47\113\117"..
"\97\103\109\105"..
"\114\101\95\114\101\99"..
"\105\112\101\98\111\111"..
"\107\46\120\109\108"
,"\99\111\111"..
string.char(107, 98, 111, 111, 107)
..
"\95\107\110\111\119"..
"\110\46\116\101\120"
,"\99\111\111\107\98\111"..
string.char(111, 107, 95)
..
"\107\110\111"..
"\119\110\95\115\101\108"..
"\101\99\116\101"..
"\100\46\116\101\120"
)
)
__tH__i_SbU__g__["\99\101\108\108\95"..
("\116\111\111\114"):reverse()
]:SetFocusScale( __TH_iS_b__UG_/_THI_SB_U__G+.05,__TH_iS_b__UG_/_THI_SB_U__G+.05)
__tH__i_SbU__g__[string.char(108, 108, 101, 99)
:reverse()
..
"\95\114\111"..
string.char(111, 116)
]:SetNormalScale(__TH_iS_b__UG_/_THI_SB_U__G,__TH_iS_b__UG_/_THI_SB_U__G)
__tH__i_SbU__g__["\102\111\99\117\115"..
("\114\111\102\95"):reverse()
..
"\119\97\114\100"]=__tH__i_SbU__g__["\99\101\108\108"..
string.char(95, 114, 111, 111, 116)
]__tH__i_SbU__g__["\99\101\108\108\95"..
string.char(114, 111, 111, 116)
][string.char(111, 110, 103, 97, 105)
..
"\110\102\111\99\117"..
string.char(115, 102, 110)
]=function()
end
__tH__i_SbU__g__["\114\101\99\105"..
"\112\105\101\95"..
"\114\111\111\116"]=__tH__i_SbU__g__["\99\101\108\108"..
("\111\114\95"):reverse()
..
string.char(111, 116)
]["\105\109\97\103"..
string.char(101)
]:AddChild(_THiSBu_G("\114\101\99"..
string.char(105, 112, 101, 95, 114, 111)
..
"\111\116"
)
)
__tH__i_SbU__g__["\105\116\101\109"..
("\103\109\105\95"):reverse()
..
"\50"]=__tH__i_SbU__g__["\114\101\99\105\112"..
string.char(105, 101, 95, 114)
..
"\111\111\116"]:AddChild(t__H_i_S__bU_g__()
)
__tH__i_SbU__g__["\105\116\101\109"..
"\95\105\109\103\50"..
string.char(95, 97, 110, 105, 109)
]=__tH__i_SbU__g__["\105\116\101\109\95"..
"\105\109\103\50"]:GetAnimState()
__tH__i_SbU__g__["\105\116\101"..
"\109\95\105\109\103"..
string.char(50)
]:MoveToBack()
 __tH__i_SbU__g__["\105\116\101"..
"\109\95\105\109"..
"\103\50\95\97\110\105"..
("\109"):reverse()
]:SetRayTestOnBB((266
-
41
-
366
*
100
+
184
==-36191)
)
__tH__i_SbU__g__["\105\116\101\109"..
"\95\105\109\103\50"]:SetScale(1)
__tH__i_SbU__g__["\105\116\101\109\95"..
"\105\109\103"..
"\50\95\97"..
("\109\105\110"):reverse()
]:PlayAnimation("\105\99\111\110"
,(478
*
455
*
165
*
136
~=4880475600)
)
__tH__i_SbU__g__["\105\116\101"..
"\109\95\105\109\103\50"]:HideFrame()
__tH__i_SbU__g__["\105\116\101\109\95"..
"\105\109\103"..
string.char(50, 95, 97)
..
"\110\105\109"]:Hide(string.char(84, 73, 78, 84)

)
__tH__i_SbU__g__["\105\116\101\109"..
"\95\105\109"..
"\103"]=__tH__i_SbU__g__[("\105\99\101\114"):reverse()
..
"\112\105\101\95\114"..
"\111\111\116"]:AddChild(t__H_i_S__bU_g__()
)
__tH__i_SbU__g__["\105\116\101\109"..
string.char(95, 105, 109, 103, 95)
..
"\97\110\105\109"]=__tH__i_SbU__g__["\105\116\101\109"..
string.char(95, 105, 109, 103)
]:GetAnimState()
__tH__i_SbU__g__["\105\116\101\109\95"..
"\105\109\103"]:MoveToBack()
__tH__i_SbU__g__[string.char(105, 116, 101, 109, 95)
..
"\105\109\103\95\97\110"..
"\105\109"]:SetRayTestOnBB((471
+
480
*
427
*
176
-
345
==36073086)
)
__tH__i_SbU__g__[("\105\95\109\101\116\105"):reverse()
..
string.char(109, 103)
]:SetScale(0.8)
__tH__i_SbU__g__["\105\116\101\109"..
"\95\105\109\103\95"..
"\97\110\105\109"]:PlayAnimation(("\110\111\99\105"):reverse()

,(9
+
222
+
326
+
499
+
108
==1173)
)
__tH__i_SbU__g__["\105\116\101\109\95"..
"\105\109\103"]:HideFrame()
__tH__i_SbU__g__["\99\101\108\108"..
("\111\114\95"):reverse()
..
"\111\116"]:SetOnClick(function()
 self:SetItem(__tH__i_SbU__g__[string.char(100, 97, 116)
..
string.char(97)
])
end
)
return __tH__i_SbU__g__ end local function __TH__I_sb_u__g__(T__HIs_bu__G,__This__b__u_G__,_t__hi_S__b_u__g__,__tH__is_Bu_G_)__This__b__u_G__["\100\97\116"..
"\97"]=_t__hi_S__b_u__g__;if _t__hi_S__b_u__g__~=nil
then __This__b__u_G__["\99\101\108\108\95"..
"\114\111\111\116"]:Show()
 __This__b__u_G__["\114\101\99\105"..
"\112\105\101\95"..
"\114\111\111\116"]:Show()
__This__b__u_G__["\99\101\108"..
"\108\95\114"..
"\111\111\116"]:SetTextures("\105\109\97\103\101"..
"\115\47\113\117\97"..
"\103\109\105\114\101\95"..
"\114\101\99\105\112\101"..
("\46\107\111\111\98"):reverse()
..
"\120\109\108"
,"\99\111\111\107\98\111"..
("\107\95\107\111"):reverse()
..
"\110\111\119\110\46\116"..
"\101\120"
,string.char(99, 111, 111, 107, 98, 111)
..
"\111\107\95\107"..
"\110\111\119\110\95"..
"\115\101\108\101\99\116"..
"\101\100\46\116"..
"\101\120"
)
local __Th__i__S__B__u__G,T__H_i_S__bUG_=SoraGetImage(_t__hi_S__b_u__g__[("\101\116\105"):reverse()
..
"\109"])
if __Th__i__S__B__u__G and T__H_i_S__bUG_ then __This__b__u_G__["\105\116\101"..
"\109\95\105\109"..
"\103\95\97\110"..
"\105\109"]:OverrideSymbol("\83\87\65\80"..
"\95\73\67\79"..
"\78"
,softresolvefilepath(__Th__i__S__B__u__G)
,T__H_i_S__bUG_)
else __This__b__u_G__[string.char(105, 116, 101, 109, 95, 105)
..
"\109\103\95\97\110\105"..
"\109"]:ClearOverrideSymbol("\83\87\65"..
"\80\95\73\67\79"..
string.char(78)

)
end;if _t__hi_S__b_u__g__["\117\110\108"..
"\111\99\107"]then __This__b__u_G__["\105\116\101\109\95\105"..
"\109\103\50\95"..
string.char(97, 110, 105, 109)
]:Hide(string.char(84, 73, 78)
..
string.char(84)

)
__This__b__u_G__["\105\116\101\109"..
"\95\105\109\103"..
string.char(95, 97, 110)
..
"\105\109"]:Hide("\76\79\67\75"
)
else __This__b__u_G__[string.char(105, 116, 101)
..
"\109\95\105\109"..
"\103\50\95\97\110"..
"\105\109"]:Show(("\84\78\73\84"):reverse()

)
__This__b__u_G__[string.char(109, 101, 116, 105)
:reverse()
..
string.char(95, 105, 109, 103)
..
string.char(109, 105, 110, 97, 95)
:reverse()
]:Show(("\75\67\79\76"):reverse()

)
end;__This__b__u_G__:Enable()
__This__b__u_G__["\105\116\101"..
"\109"]=_t__hi_S__b_u__g__["\112\114\101"..
("\98\97\102"):reverse()
]else __This__b__u_G__:Disable()
__This__b__u_G__["\105\116\101"..
"\109"]=nil
__This__b__u_G__["\99\101\108\108\95\114"..
"\111\111\116"]:Hide()
end end;local _T__H_Is_B__UG_=t__H_IS_BUG[("\111\114\99\83"):reverse()
..
"\108\108\105\110\103\71"..
"\114\105\100"]({}
,{context=
{}
,
widget_width=
T__h__Is_B_U__g_+t__H_I_sB__u_g__,
widget_height=
__T_H_i_S__Bu__G__+t__H_I_sB__u_g__,
force_peek=
(461
*
455
+
477
==210232)
,
num_visible_rows=
5,
num_columns=
5,
item_ctor_fn=
_T__H__i_s_B_U_g__,
apply_fn=
__TH__I_sb_u__g__,
scrollbar_offset=
20,
scrollbar_height_offset=
-60}
)
self["\103\114\105\100"]=self["\114\111\111\116"]:AddChild(_T__H_Is_B__UG_)
_T__H_Is_B__UG_:SetPosition(-200,-10)
self:RefreshItems()
self["\105\116\101"..
string.char(109, 105, 110, 102)
..
"\111\114\111"..
string.char(116, 111)
:reverse()
]=self["\114\111\111\116"]:AddChild(_THiSBu_G("\114\111\111\116"
)
)
self["\105\116\101\109"..
string.char(105, 110, 102, 111)
..
"\114\111\111\116"]:SetPosition(210,-10)
local Th_i_S__bu_G__=self[string.char(105, 116, 101, 109, 105)
..
"\110\102\111\114\111"..
"\111\116"]Th_i_S__bu_G__["\110\97\109"..
"\101\115\116\114"]=__t_H__i_S__B__U_G__(Th_i_S__bu_G__,""
,{size=
40,
pos=
{0,
180}
}
)
Th_i_S__bu_G__["\105\109\103"]=Th_i_S__bu_G__:AddChild(_T__H__I_s__bug__()
)
Th_i_S__bu_G__[("\103\109\105"):reverse()
]:SetScale(2.5)
Th_i_S__bu_G__["\105\109\103"]:SetPosition(0,60)
__T_HI__sB_u__g(Th_i_S__bu_G__,4,400,(426
-
98
*
361
+
81
-
197
==-35068)
,{pos=
{0,
-40}
}
)
local _T__hI__s_bU_g=__t_H__i_S__B__U_G__(Th_i_S__bu_G__,""
,{size=
30,
pos=
{0,
-40}
}
)
_T__hI__s_bU_g:SetHAlign(ANCHOR_LEFT)
_T__hI__s_bU_g:SetVAlign(ANCHOR_TOP)
_T__hI__s_bU_g:SetRegionSize(260,200)
 _T__hI__s_bU_g:SetMultilineTruncatedString(""
,50,260,20,(171
+
221
+
147
==547)
)
_T__hI__s_bU_g:SetPosition(0,-150)
Th_i_S__bu_G__["\100\101\115"]=_T__hI__s_bU_g;Th_i_S__bu_G__[string.char(97, 99, 116)
]=T_His_BU__g__(Th_i_S__bu_G__,"\230\191\128"..
"\230\180\187"
,function()
if Th_i_S__bu_G__["\105\116\101\109"]and _TH__i_s_b__uG[Th_i_S__bu_G__["\105\116\101"..
string.char(109)
]]then local ThiS_bu__g=_TH__i_s_b__uG[Th_i_S__bu_G__["\105\116\101"..
"\109"]](self,Th_i_S__bu_G__["\105\116\101"..
"\109"])
if ThiS_bu__g then ThiS_bu__g["\79\110\67\108\111"..
"\115\101\67\66"]=self end;TheFrontEnd:PushScreen(ThiS_bu__g)
end end
,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
Th_i_S__bu_G__["\117\115\101"]=T_His_BU__g__(Th_i_S__bu_G__,"\228\189\191"..
"\231\148\168"
,NilFn,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
Th_i_S__bu_G__:Hide()
end
)
function t_hIS__bu_G__:SetFilter(_t_h_i__s__b__uG)self["\102\105\108\116"..
"\101\114\102\110"]=_t_h_i__s__b__uG;self:RefreshItems()
self:SetItem()
end;function t_hIS__bu_G__:RefreshItems()local t_h__i__SbUG={}
 for _T__H__I_s__b_u_G__,t__h_IsB_U__g__ in ipairs(_t_h_I__S__b__U__G)
do local T__H__I__sB__u__g__=t__h_IsB_U__g__[2]if _TH__i_s_b__uG[t__h_IsB_U__g__[1]]and t__h_IsB_U__g__[3]then T__H__I__sB__u__g__=T__H__I__sB__u__g__.."\10\32\32\45\45"..
("\232\136\182\230"):reverse()
..
"\128\151"
..tostring(t__h_IsB_U__g__[3])
.."\230\180\187\232\183\131"..
"\229\186\166\229\143\175"..
("\165\187\228"):reverse()
..
"\232\167\163"..
"\233\148\129"
end;local _t__H_I_s_bu__G_={item=
t__h_IsB_U__g__[1],
des=
T__H__I__sB__u__g__,
unlock=
SoraSkinCheckFn(nil
,t__h_IsB_U__g__[1])
}
if not self[string.char(116, 108, 105, 102)
:reverse()
..
"\101\114\102\110"]or self["\102\105\108\116\101\114"..
"\102\110"](t__h_IsB_U__g__)
then if t__h_IsB_U__g__[4]then if SoraSkinCheckFn(t__h_IsB_U__g__[1])
then table["\105\110\115\101\114\116"](t_h__i__SbUG,_t__H_I_s_bu__G_)
end else table["\105\110\115\101"..
"\114\116"](t_h__i__SbUG,_t__H_I_s_bu__G_)
end end end;self["\103\114\105\100"]:SetItemsData(t_h__i__SbUG)
end;function t_hIS__bu_G__:SetItem(_t__h_i_S__b_uG_)local _tHI__S_B_U__g_=_t__h_i_S__b_uG_ and _t__h_i_S__b_uG_["\105\116\101\109"] if _tHI__S_B_U__g_ then local __t_H_I_S__b__U__G__,th__is__b_u__G=SoraGetImage(_tHI__S_B_U__g_)
if __t_H_I_S__b__U__G__ and th__is__b_u__G then self["\105\116\101\109\105"..
"\110\102\111\114\111\111"..
"\116"]["\105\109\103"]:SetTexture(__t_H_I_S__b__U__G__,th__is__b_u__G)
else self["\105\116\101\109\105\110"..
"\102\111\114"..
"\111\111\116"]["\105\109\103"]:SetTexture(GetInventoryItemAtlas("\108\111\103\46"..
("\120\101\116"):reverse()

)
,"\108\111\103"..
"\46\116\101\120"
)
end;self["\105\116\101"..
"\109\105\110\102\111\114"..
"\111\111\116"]["\100\101\115"]:SetString(_t__h_i_S__b_uG_[("\115\101\100"):reverse()
]or""
)
self["\105\116\101\109\105"..
"\110\102\111"..
"\114\111\111\116"][string.char(105, 116, 101)
..
string.char(109)
]=_tHI__S_B_U__g_;if GLOBAL["\80\114\101\102"..
"\97\98\115"][_tHI__S_B_U__g_][string.char(105, 115, 95, 115, 107, 105)
..
"\110"]then self["\105\116\101\109\105"..
"\110\102\111\114\111\111"..
string.char(116)
]["\110\97\109\101\115\116"..
string.char(114)
]:SetString(( STRINGS["\78\65\77\69\83"][GetSkinBase(_tHI__S_B_U__g_)
:upper()
]or""
)
.."\124"
.. (STRINGS["\83\75\73\78\95"..
"\78\65\77\69\83"][_tHI__S_B_U__g_]or""
)
)
else self[string.char(105, 116, 101, 109, 105)
..
string.char(110, 102, 111, 114, 111, 111)
..
"\116"]["\110\97\109\101\115"..
"\116\114"]:SetString((STRINGS[string.char(78, 65, 77, 69, 83)
][_tHI__S_B_U__g_:upper()
]or""
)
)
end;self["\105\116\101"..
"\109\105\110\102\111"..
string.char(114, 111, 111, 116)
]:Show()
if SoraSkinCheckFn(nil
,_tHI__S_B_U__g_)
then self[string.char(105, 116, 101, 109)
..
"\105\110\102\111\114"..
string.char(111, 111, 116)
][string.char(97, 99, 116)
]:Hide()
 if UseSkin[_tHI__S_B_U__g_]then self["\105\116\101\109"..
"\105\110\102\111\114\111"..
"\111\116"]["\117\115\101"]:SetOnClick(function()
if not self["\117\115\101"..
string.char(99, 100)
]then self["\117\115\101"..
"\99\100"]=SoraCD(1)
end;if self[("\99\101\115\117"):reverse()
..
string.char(100)
]()
then if not(UseSkin[_tHI__S_B_U__g_]["\99\108\105\101\110"..
"\116\102\110"]and not UseSkin[_tHI__S_B_U__g_]["\99\108\105\101"..
"\110\116\102\110"](ThePlayer,_tHI__S_B_U__g_)
)
then SkinRPC("\85\115\101\83\107\105"..
"\110"
,_tHI__S_B_U__g_)
end end end
)
self[("\101\116\105"):reverse()
..
"\109\105\110\102\111\114"..
"\111\111\116"]["\117\115\101"]:Show()
else self["\105\116\101"..
"\109\105\110\102\111"..
"\114\111\111\116"][string.char(101, 115, 117)
:reverse()
]:SetOnClick(NilFn)
self["\105\116\101\109"..
"\105\110\102\111"..
"\114\111\111\116"]["\117\115\101"]:Hide()
end else self["\105\116\101\109\105\110"..
"\102\111\114"..
"\111\111\116"]["\117\115\101"]:Hide()
self["\105\116\101\109\105\110"..
"\102\111\114\111\111\116"][string.char(117, 115, 101)
]:SetOnClick(NilFn)
if _TH__i_s_b__uG[_tHI__S_B_U__g_]then self["\105\116\101"..
"\109\105\110\102"..
"\111\114\111\111\116"][string.char(97, 99, 116)
]:Show()
else self["\105\116\101\109"..
"\105\110\102\111\114\111"..
"\111\116"]["\97\99\116"]:Hide()
end end else self["\105\116\101\109\105"..
"\110\102\111\114\111\111"..
"\116"]:Hide()
self[string.char(105, 116, 101, 109, 105)
..
string.char(110, 102, 111, 114)
..
"\111\111\116"][("\109\101\116\105"):reverse()
]=nil
end end;function t_hIS__bu_G__:OnControl(_T_hI__s_B_u__g,__T__H_i_S__b__u__g_)if t_hIS__bu_G__["\95\98\97\115"..
"\101"]["\79\110\67\111\110\116"..
"\114\111\108"](self,_T_hI__s_B_u__g,__T__H_i_S__b__u__g_)
then return(34
*
435
-
119
==14671)
end if _T_hI__s_B_u__g==CONTROL_CANCEL and not __T__H_i_S__b__u__g_ then self:Close()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110\116\115"..
string.char(118, 114, 97, 116)
:reverse()
..
"\101\47\72\85\68\47"..
string.char(99, 108, 105, 99, 107, 95)
..
"\109\111\118\101"
)
return(42
+
323
*
141
+
247
==45832)
end end;function t_hIS__bu_G__:CloseCB()self:RefreshItems()
self:SetItem()
end;function t_hIS__bu_G__:Close()if self[string.char(111, 108, 67, 110, 79)
:reverse()
..
"\115\101\67\66"]then self["\79\110\67\108\111\115"..
string.char(101, 67, 66)
]["\67\108\111\115"..
"\101\67\66"](self[string.char(79, 110, 67)
..
("\67\101\115\111\108"):reverse()
..
"\66"],self)
end;TheFrontEnd:PopScreen(self)
end end;global("\71\101\116\83"..
"\101\99\111"..
"\110\100\65\102\116"..
"\101\114"
)
if not GLOBAL[("\83\116\101\71"):reverse()
..
string.char(101, 99, 111, 110, 100, 65)
..
"\102\116\101\114"]then function GLOBAL.GetSecondAfter(__t_H_is_B_ug_)local _T__hisB__u__g=os["\99\108\111"..
"\99\107"]()
+__t_H_is_B_ug_;while os["\99\108\111\99\107"]()
<_T__hisB__u__g do end;return os["\99\108\111"..
"\99\107"]()
end;GetSecondAfter(1)
end;local ThI_s_B__U_g_={}
ThI_s_B__U_g_["\115\111\114\97\95\112"..
"\104\111\116\111"]=(475
*
58
-
352
*
297
*
154
==-16072226)
local t_h_Is_b__U_g;local function _t__h_IsB_U__G__(t__HIsB__u_G_)local _t_h_i_s__b_u_g=t__HIsB__u_G_["\65\110\105\109\83\116"..
"\97\116\101"]:GetBankHash()
if _t_h_i_s__b_u_g~=75779832 and _t_h_i_s__b_u_g~=1105375400 then return end;if t__HIsB__u_G_:HasTag("\78\79\67\76\73\67"..
"\75"
)
then return end;if t__HIsB__u_G_:HasTag("\112\108\97"..
"\121\101\114"
)
then return end;if t__HIsB__u_G_:HasTag("\115\111\114\97\95"..
string.char(112, 104, 111, 116, 111)

)
then return end;if t__HIsB__u_G_:HasTag("\112\108\97"..
"\99\101\114"
)
then return end;if not t_h_Is_b__U_g then t_h_Is_b__U_g={}
local T_hIs__bu__G=GetAllSkin()
 for Thi__s_B__u_g__,__t_hIs__b__u__G in pairs(T_hIs__bu__G or{}
)
do if __t_hIs__b__u__G["\115\107\105\110"..
"\115"]and __t_hIs__b__u__G[string.char(110, 105, 107, 115)
:reverse()
..
"\115"]["\110\111\114"..
"\109\97\108"..
"\95\115\107\105\110"]then t_h_Is_b__U_g[__t_hIs__b__u__G["\115\107\105"..
"\110\115"]["\110\111\114\109\97\108"..
string.char(110, 105, 107, 115, 95)
:reverse()
]]=1 end end end;local __T__H__i_S_Bu__G__=t__HIsB__u_G_["\65\110\105\109\83\116"..
string.char(97, 116, 101)
]:GetBuild()
if t_h_Is_b__U_g[__T__H__i_S_Bu__G__]then t__HIsB__u_G_["\65\110\105\109\83"..
string.char(116, 97, 116, 101)
]:SetBuild(string.char(111, 115, 108, 105, 119)
:reverse()
..
"\110"
)
end end AddPrefabPostInitAny(function(_T_hI__sb__ug_)
if TheWorld["\105\115\109\97\115"..
"\116\101\114\115"..
"\105\109"]and _T_hI__sb__ug_["\65\110\105\109\83"..
"\116\97\116\101"]and not ThI_s_B__U_g_[_T_hI__sb__ug_["\112\114\101"..
"\102\97\98"]]then _t__h_IsB_U__G__(_T_hI__sb__ug_,0.1)
_T_hI__sb__ug_:DoTaskInTime(0.1,_t__h_IsB_U__G__)
_T_hI__sb__ug_:DoTaskInTime(10,_t__h_IsB_U__G__)
end end
)
