--[[
授权级别:不授权
Copyright 2025 [FL]。
该文件仅限我自己使用 谢绝授权
]]-- 请勿破解本文件
local _t_h__I_sB__uG_={}
local __T__HiSBu_g__={}
local t__hI_S__b__Ug={}
local __TH_i__SBu_g={}
local T_H_i_S__b_u_G=SoraAPI["\106\115\111\110"]local _t__Hi__SB_U__g={}
local T__h_I__Sbu_g_={}
local __t__hI_SB_U_G=TheNet:GetUserID()
local tH__Is__b__Ug__=""
local _t_H_i__s_b__U__g;local _TH__i_S__BUG__={}
local function t_h__i__sb__U__g__(tHi_sB__Ug)return string["\115\117\98"](tHi_sB__Ug,-5)
==string.char(95, 110, 111)
..
"\110\101"
end;local _T_h_IS__B__u_G_=(436
-
272
-
86
*
364
~=-31140)
function SoraSkinCheckFn(t_h_i_sbUG,__t__h__I__sBu_g_)if t_h_i_sbUG and not __t__h__I__sBu_g_ then __t__h__I__sBu_g_=t_h_i_sbUG end;__t__h__I__sBu_g_=GetSkinMap(__t__h__I__sBu_g_)
return t_h__i__sb__U__g__(__t__h__I__sBu_g_)
or(__T__HiSBu_g__[__t__h__I__sBu_g_]or __TH_i__SBu_g[__t__h__I__sBu_g_])
and(475
+
294
*
35
+
447
*
86
==49207)
or(308
+
177
+
17
~=502)
end;function SoraSkinCheckClientFn(_t_h_i__S__bu__g,_thI_S__B__uG__,T_H_I_sB_u__g__)T_H_I_sB_u__g__=GetSkinMap(T_H_I_sB_u__g__)
if _thI_S__B__uG__ and T_H_I_sB_u__g__ then local _T_Hi__S__BU__G=GetSkin(T_H_I_sB_u__g__)
if not _T_Hi__S__BU__G then return(143
*
219
+
120
-
495
==30946)
end;if _T_Hi__S__BU__G["\105\115\99"..
("\99\97\114\97\104"):reverse()
..
"\116\101\114\115\107\105"..
string.char(110, 115)
]then if _TH__i_S__BUG__[_thI_S__B__uG__]then return(252
*
151
*
173
-
244
-
394
~=6582362)
end;if not _t__Hi__SB_U__g[_thI_S__B__uG__]then return(0
-
241
*
267
==-64347)
end end;if _t__Hi__SB_U__g[_thI_S__B__uG__]then if _t_h__I_sB__uG_[_thI_S__B__uG__]and _t_h__I_sB__uG_[_thI_S__B__uG__][T_H_I_sB_u__g__]then return( false
 or
 not
 false
 and
 not
 false
 or
 
 false
 and
 
 false
 or
 not
 true
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
 and
 
 false
 or
 not
 false
 and
 
 true
)
end;if t__hI_S__b__Ug[_thI_S__B__uG__]and t__hI_S__b__Ug[_thI_S__B__uG__][T_H_I_sB_u__g__]then return(489
+
465
*
309
+
62
-
284
==143952)
end end;return(453
-
187
*
144
*
267
==-7189315)
end;return t_h__i__sb__U__g__(T_H_I_sB_u__g__)
or(43
-
235
-
337
*
492
*
214
~=-35482248)
end;UseSkin={}
function RegUseSkinFN(_Th_i_Sb_uG__,t_h_IS__b__U__G,_tHis__b__u_g)UseSkin[_Th_i_Sb_uG__]={serverfn=
t_h_IS__b__U__G,
clientfn=
_tHis__b__u_g}
end;local __T_H__isB__u__G=string.char(83, 111, 114, 97)
..
string.char(83, 107, 105)
..
"\110\67\97\99"..
"\104\101"
local Th_I_S__BU_g=__T_H__isB__u__G.."\95\115\101\114\118"..
string.char(101, 114)

 if TheNet:GetIsServer()
then TheSim:GetPersistentString(Th_I_S__BU_g,function(T_His__B__u__g_,
_T_H__IsB_u__g)
if T_His__B__u__g_ then local _THisB__UG__,_t__hI_sBU_G=pcall(T_H_i_S__b_u_G[("\111\99\101\100"):reverse()
..
"\100\101"],_T_H__IsB_u__g)
if _THisB__UG__ and _t__hI_sBU_G["\116\109\112"]and _t__hI_sBU_G[string.char(111, 119, 110, 101)
..
("\114"):reverse()
]then for _t_HI_SbU_G,_th__I_s__bu__G in pairs(_t__hI_sBU_G["\111\119\110"..
"\101\114"])
do if type(_th__I_s__bu__G)
=="\116\97\98"..
string.char(108, 101)

then _t_h__I_sB__uG_[_t_HI_SbU_G]=_th__I_s__bu__G end end;for T__h_i_s__b__U_G_,__Th_i_S_BU__g_ in pairs(_t__hI_sBU_G["\116\109\112"])
do if type(__Th_i_S_BU__g_)
=="\116\97\98\108\101"
then t__hI_S__b__Ug[T__h_i_s__b__U_G_]=__Th_i_S_BU__g_ end end end end end
)
end;if not TheNet:IsDedicated()
then TheSim:GetPersistentString(__T_H__isB__u__G,function(_t_h__I_S__b__UG_,
_T__hI__S__bu_g)
if _t_h__I_S__b__UG_ then local __THI__SBu__g_,__T__h__Is_b_U_g__=pcall(T_H_i_S__b_u_G["\100\101\99\111\100"..
"\101"],_T__hI__S__bu_g)
if __THI__SBu__g_ and __T__h__Is_b_U_g__["\116\109\112"]and __T__h__Is_b_U_g__[("\114\101\110\119\111"):reverse()
]then for __T__h__i_s__buG,T_HISBu_g in pairs(__T__h__Is_b_U_g__["\111\119\110\101"..
"\114"])
do if type(__T__h__i_s__buG)
=="\115\116\114\105\110"..
"\103"
and T_HISBu_g==1 then __T__HiSBu_g__[__T__h__i_s__buG]=T_HISBu_g end end;for __T_h_iS_bu__g,Th__i__S__b_Ug in pairs(__T__h__Is_b_U_g__["\116\109\112"])
do if type(__T_h_iS_bu__g)
== ("\114\116\115"):reverse()
..
"\105\110\103"
and Th__i__S__b_Ug==1 then __TH_i__SBu_g[__T_h_iS_bu__g]=Th__i__S__b_Ug end end end end end
)
end;function SaveSkinCache()if TheNet:GetIsServer()
then local t_H_i_sbu_g_,__T__h_i__s_b__Ug__=pcall(T_H_i_S__b_u_G[string.char(101, 110, 99)
..
string.char(101, 100, 111)
:reverse()
],{owner=
_t_h__I_sB__uG_,
tmp=
t__hI_S__b__Ug}
)
if t_H_i_sbu_g_ then TheSim:SetPersistentString(Th_I_S__BU_g,__T__h_i__s_b__Ug__,(324
*
426
*
242
~=33401812)
)
end end;local _t_hISB__Ug__,__tH_I__s_B_U__G_=pcall(T_H_i_S__b_u_G["\101\110\99"..
string.char(111, 100, 101)
],{owner=
__T__HiSBu_g__,
tmp=
__TH_i__SBu_g}
)
if _t_hISB__Ug__ then TheSim:SetPersistentString(__T_H__isB__u__G,__tH_I__s_B_U__G_,(74
*
195
-
29
~=14404)
)
end end;local _T_h_iS__B__U_G_={sora_mysora=
1,
sora_mysora_r=
1,
sora_yhjd=
1,
sora_sby=
1}
RegUseSkinFN(string.char(115, 111, 114, 97, 95)
..
"\121\105\110\103\121\117"
,function(_tH_i__s_BuG,
_t_h_Is_b_U_G__)
if _tH_i__s_BuG and _tH_i__s_BuG["\99\111\109"..
"\112\111\110\101\110\116"..
"\115"]["\115\111\114\97"..
string.char(105, 116, 101, 109)
..
"\99\111\110\116\114\111"..
("\108"):reverse()
]then _tH_i__s_BuG["\99\111\109"..
"\112\111\110\101\110\116"..
"\115"]["\115\111\114"..
string.char(97, 105, 116, 101, 109)
..
string.char(114, 116, 110, 111, 99)
:reverse()
..
"\111\108"]:CreateItem("\115\111\114"..
"\97\95\121\105\110"..
"\103\121\117"
)
end end
)
 RegUseSkinFN("\115\111\114\97\95\100"..
"\105\101\121"..
string.char(117)

,function(__Th__Is__b__u__g_,
T_h__i_S__B_Ug_)
if __Th__Is__b__u__g_ and __Th__Is__b__u__g_["\99\111\109"..
string.char(112, 111, 110, 101, 110, 116)
..
"\115"]["\115\111\114\97\105\116"..
"\101\109\99\111"..
"\110\116\114\111"..
"\108"]then __Th__Is__b__u__g_["\99\111\109"..
"\112\111\110\101"..
"\110\116\115"]["\115\111\114\97\105\116"..
"\101\109\99\111\110\116"..
string.char(114, 111, 108)
]:CreateItem("\115\111\114\97"..
"\95\100\105\101\121"..
"\117"
)
end end
)
RegUseSkinFN("\115\111\114"..
"\97\95\113\105"..
"\121\117"
,function(_th_I_sBU_g__,
T_h_i__sB_ug__)
if _th_I_sBU_g__ and _th_I_sBU_g__[string.char(99, 111, 109)
..
"\112\111\110\101"..
"\110\116\115"][string.char(115, 111, 114, 97, 105)
..
"\116\101\109\99\111\110"..
("\111\114\116"):reverse()
..
"\108"]then _th_I_sBU_g__["\99\111\109\112"..
string.char(111, 110, 101, 110)
..
"\116\115"][string.char(115, 111, 114, 97, 105)
..
"\116\101\109"..
"\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114"..
"\97\95\113\105\121"..
"\117"
)
end end
)
RegUseSkinFN(string.char(115, 111, 114, 97)
..
"\95\108\121\106"
,function(__Thi_s_b__Ug,
__t_h__I_Sb_U_g)
if __Thi_s_b__Ug and __Thi_s_b__Ug["\99\111\109\112\111\110"..
string.char(101, 110, 116)
..
"\115"]["\115\111\114\97\105"..
"\116\101\109\99\111\110"..
string.char(116, 114, 111, 108)
]then __Thi_s_b__Ug["\99\111\109"..
("\116\110\101\110\111\112"):reverse()
..
"\115"]["\115\111\114"..
("\99\109\101\116\105\97"):reverse()
..
"\111\110\116\114"..
string.char(111, 108)
]:CreateItem("\115\111\114\97\95"..
"\108\121\106"
)
end end
)
 RegUseSkinFN(string.char(115, 111, 114)
..
string.char(97, 95, 108, 97)
..
string.char(110, 116, 101, 114)
..
string.char(110)

,function(T__HiS__b__U_G,
T_hi__S__b__ug)
if T__HiS__b__U_G and T__HiS__b__U_G["\99\111\109\112\111"..
"\110\101\110\116\115"]["\115\111\114"..
"\97\105\116"..
"\101\109\99"..
"\111\110\116\114"..
string.char(111, 108)
]then T__HiS__b__U_G["\99\111\109\112\111\110"..
"\101\110\116"..
string.char(115)
]["\115\111\114\97\105\116"..
"\101\109\99\111"..
"\110\116\114\111"..
"\108"]:CreateItem(string.char(115, 111, 114)
..
string.char(97, 95, 108, 97, 110, 116)
..
"\101\114\110"
)
end end
)
RegUseSkinFN(string.char(115, 111, 114)
..
"\97\95\108\97\110\116"..
"\101\114\110\95\121\104"
,function(__T_h_I_S_B_Ug__,
T__hI_s_B_U_G__)
if __T_h_I_S_B_Ug__ and __T_h_I_S_B_Ug__["\99\111\109\112"..
"\111\110\101\110\116"..
"\115"][("\97\114\111\115"):reverse()
..
("\109\101\116\105"):reverse()
..
"\99\111\110"..
"\116\114\111"..
"\108"]then __T_h_I_S_B_Ug__[("\110\111\112\109\111\99"):reverse()
..
"\101\110\116\115"][string.char(115, 111, 114)
..
"\97\105\116\101\109\99"..
"\111\110\116"..
"\114\111\108"]:CreateItem("\115\111\114\97"..
string.char(95, 108, 97)
..
string.char(110, 116, 101, 114, 110)

,"\115\111\114\97\95"..
"\108\97\110\116\101"..
"\114\110\95\121"..
"\104"
)
end end
)
RegUseSkinFN("\115\111\114\97"..
"\95\114\105"..
"\110\103"
,function(__T__H__I_s_b_U_G_,
Th__I_S__B_u_G_)
if __T__H__I_s_b_U_G_ and __T__H__I_s_b_U_G_["\99\111\109\112"..
"\111\110\101"..
"\110\116\115"]["\115\111\114\97\105"..
"\116\101\109\99\111"..
"\110\116\114\111"..
"\108"]then __T__H__I_s_b_U_G_[string.char(99, 111, 109, 112)
..
"\111\110\101\110\116"..
string.char(115)
:reverse()
][string.char(115, 111, 114)
..
"\97\105\116\101\109"..
"\99\111\110\116\114\111"..
"\108"]:CreateItem("\115\111\114\97"..
("\103\110\105\114\95"):reverse()

)
end end
)
 local function __t_H_I__sB__ug__(_t_hi__S_B_u_g_,thi_S__b__U_g,__T_H_I__S__B_u_g_)local t__h_I_S_b__U__g__={}
t__h_I_S_b__U__g__["\113\117\111\116"..
"\101\115"]="\230\149\162\229\138\168"..
"\230\136\145\229"..
"\176\177\230\157\128"..
"\228\186\134"..
string.char(228, 189, 160, 229, 147)
..
("\166"):reverse()

t__h_I_S_b__U__g__["\114\97\114\105\116\121"]="\230\149\162\229\138"..
string.char(168, 230, 136, 145, 229, 176)
..
"\177\230\157\128\228\186"..
"\134\228\189\160\229\147"..
"\166"
t__h_I_S_b__U__g__[string.char(114, 97, 114, 105, 116)
..
"\121\99\111\114"..
"\108\111\114"]={255/255,
215/255,
0/255,
1}
t__h_I_S_b__U__g__["\114\97\114\105\116"..
"\121\111\114\100\101"..
"\114"]=100;t__h_I_S_b__U__g__[string.char(114, 101, 108)
..
"\101\97\115\101\95\103"..
"\114\111\117\112"]=-1006;t__h_I_S_b__U__g__["\115\107\105"..
"\110\95\116\97\103\115"]={"\66\65\83"..
"\69"
,
"\115\111\114\97"
,
"\67\72\65\82\65\67"..
"\84\69\82"
}
t__h_I_S_b__U__g__["\115\107\105"..
"\110\115"]={normal_skin=
_t_hi__S_B_u_g_,
ghost_skin=
("\95\116\115\111\104\103"):reverse()
..
"\115\111\114"..
"\97\95\98\117\105"..
"\108\100"
}
t__h_I_S_b__U__g__["\99\104\101\99\107"..
"\102\110"]=SoraSkinCheckFn;t__h_I_S_b__U__g__[("\99\101\104\99"):reverse()
..
"\107\99\108\105\101"..
"\110\116\102\110"]=SoraSkinCheckClientFn t__h_I_S_b__U__g__[string.char(115, 104, 97)
..
string.char(114, 101, 95, 98, 105, 103)
..
string.char(112, 111, 114)
..
("\116\105\97\114\116"):reverse()
..
"\95\110\97"..
string.char(109, 101)
]="\115\111\114\97"
t__h_I_S_b__U__g__["\70\114\97\109"..
"\101\83\121"..
string.char(109, 98, 111)
..
("\108"):reverse()
]="\68\105\115\116"..
"\105\110\103"..
string.char(117, 105, 115, 104)
..
"\101\100"
for t__H__IsBuG_,Th_I_S_b__U_g_ in pairs(thi_S__b__U_g)
do t__h_I_S_b__U__g__[t__H__IsBuG_]=Th_I_S_b__U_g_ end;if t__h_I_S_b__U__g__["\105\115\95\108\111"..
string.char(110, 103, 104, 97)
..
"\105\114"]then t__h_I_S_b__U__g__["\115\107\105"..
("\115\110"):reverse()
]["\103\104\111"..
"\115\116\95\115"..
string.char(107, 105, 110)
]="\103\104\111\115\116"..
"\95\115\111"..
"\114\97\95\114\95"..
"\98\117\105\108\100"
end;MakeCharacterSkin(string.char(115, 111, 114, 97)

,_t_hi__S_B_u_g_,t__h_I_S_b__U__g__)
if not __T_H_I__S__B_u_g_ then local tH__IS__B_u_G__=shallowcopy(t__h_I_S_b__U__g__)
tH__IS__B_u_G__["\114\97\114\105\116"..
"\121"]="\233\153\144\230"..
"\151\182\228\189\147"..
string.char(233, 170, 140)

tH__IS__B_u_G__["\114\97\114\105\116\121"..
"\111\114\100\101\114"]=80;tH__IS__B_u_G__[string.char(114, 97, 114, 105, 116, 121)
..
string.char(99, 111, 114)
..
"\108\111\114"]={0.957,
0.769,
0.188,
1}
tH__IS__B_u_G__["\70\114\97"..
"\109\101\83\121\109"..
"\98\111\108"]="\104\101\105"..
"\114\108\111\111"..
"\109"
tH__IS__B_u_G__["\110\97\109\101"]=thi_S__b__U_g["\110\97\109\101"].. ("\144\153\233\40"):reverse()
..
"\230\151\182"..
"\41"
SoraAPI[string.char(77, 97, 107, 101, 67, 104)
..
"\97\114\97"..
"\99\116\101\114\83\107"..
"\105\110"]("\115\111\114\97"
,_t_hi__S_B_u_g_.."\95\116\109\112"
,tH__IS__B_u_G__)
end end;__t_H_I__sB__ug__("\115\111\114\97\95\109"..
"\121\115\111"..
"\114\97"
,{name=
"\232\138\177\229\171"..
("\129"):reverse()

,
des=
string.char(230, 137, 167, 229, 173)
..
string.char(144, 228, 185, 139)
..
string.char(230, 137, 139, 44, 228, 184)
..
"\142\229\173\144\229"..
("\128\232\149\129"):reverse()
..
string.char(129)
:reverse()

}
)
__t_H_I__sB__ug__(string.char(115, 111, 114)
..
"\97\95\109\121\115\111"..
"\114\97\95\114"
,{name=
"\232\138\177"..
"\229\171\129\45"..
"\233\149\191\229\143"..
"\145"
,
is_longhair=
(491
+
113
*
168
+
433
~=19914)
,
des=
"\230\137\167\229"..
string.char(173, 144, 228, 185, 139)
..
"\230\137\139\44\228"..
string.char(184, 142, 229, 173, 144)
..
"\229\129\149\232"..
"\128\129"
}
)
 __t_H_I__sB__ug__("\115\111\114\97\95\115"..
"\98\121"
,{name=
"\230\176\184"..
"\230\129\146"..
"\230\176\180\229"..
"\133\181\230"..
"\156\136"
,
des=
"\229\143\170\230\156"..
"\137\228\184\128\228"..
"\184\170\228\186"..
"\186\239\188"..
"\140\10\230"..
"\136\145\230\132\191"..
"\230\132\143"..
"\228\184\186\229"..
"\165\185\228\187\152\229"..
string.char(135, 186, 231)
..
string.char(148, 159, 229, 145, 189)

,
init_fn=
function(T__H__i_s_b__ug__)
if T__H__i_s_b__ug__ and TheWorld["\105\115\109\97\115"..
"\116\101\114\115\105\109"]then T__H__i_s_b__ug__["\115\111\114\97\102\111"..
"\111\116\95\102"..
"\120"]=SpawnPrefab("\115\111\114\97\95\102"..
string.char(111, 111, 116)
..
"\95\102\120\95\115\98"..
string.char(121)

)
T__H__i_s_b__ug__["\115\111\114\97\102\111"..
"\111\116\95\102\120"]["\101\110\116\105"..
"\116\121"]:SetParent(T__H__i_s_b__ug__["\101\110\116"..
"\105\116\121"])
T__H__i_s_b__ug__["\115\111\114\97\102\111"..
"\111\116\95\102\120"]["\111\119\110\101\114"]=T__H__i_s_b__ug__ T__H__i_s_b__ug__["\115\111\114"..
"\97\100\97\110\99\101"..
"\102\120\112\114"..
"\101\102\97\98"]="\115\111\114"..
("\120\102\95\97"):reverse()
..
"\95\102\101\97\116\104"..
"\101\114"
end end
,
clear_fn=
function(_t_hI_S__bU__G)
if _t_hI_S__bU__G and _t_hI_S__bU__G["\115\111\114\97\102\111"..
string.char(120, 102, 95, 116, 111)
:reverse()
]and TheWorld["\105\115\109\97\115"..
"\116\101\114"..
("\109\105\115"):reverse()
]then _t_hI_S__bU__G["\115\111\114\97"..
("\95\116\111\111\102"):reverse()
..
"\102\120"]:Remove()
_t_hI_S__bU__G["\115\111\114"..
"\97\100\97\110\99\101"..
"\102\120\112\114\101\102"..
"\97\98"]=nil
end end
}
)
MakeSkinNameMap(string.char(115, 111, 114)
..
"\97\95\115\100\115\122"
,"\115\111\114\97\95\115"..
("\95\122\115\100"):reverse()
..
"\114"
)
MakeSkinNameMap(string.char(115, 111, 114)
..
"\97\95\115\100"..
"\115\122"
,"\115\111\114\97\98"..
"\97\103\95"..
"\115\100"
)
MakeSkinNameMap("\115\111\114\97"..
"\95\119\115\113"..
"\121"
,"\115\111\114\97\98"..
("\119\95\103\97"):reverse()
..
"\115\113\121"
)
MakeSkinNameMap("\115\111\114\97"..
("\119\111\98"):reverse()
..
"\107\110\111\116\95\108"..
"\100"
,"\115\111\114\97"..
"\112\97\99\107\101\114"..
"\95\108\100"
)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107\110\111"..
"\116\95\108\100"
,"\115\111\114\97\51\112"..
"\97\99\107\101"..
"\114\95\108\100"
)
MakeSkinNameMap(string.char(115, 111, 114, 97)
..
"\98\111\119\107\110"..
("\98\115\95\116\111"):reverse()
..
string.char(121)

,("\97\112\97\114\111\115"):reverse()
..
"\99\107\101"..
string.char(114, 95, 115)
..
"\98\121"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
string.char(119, 107, 110, 111, 116)
..
"\95\115\98\121"
,"\115\111\114\97\51"..
"\112\97\99\107\101"..
"\114\95\115\98\121"
)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107\110\111"..
"\116\95\100\119"
,"\115\111\114\97\112\97"..
("\100\95\114\101\107\99"):reverse()
..
"\119"
)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107\110\111"..
("\119\100\95\116"):reverse()

,"\115\111\114\97"..
"\51\112\97\99\107\101"..
string.char(114, 95, 100, 119)

)
MakeSkinNameMap("\115\111\114\97\98"..
string.char(111, 119, 107, 110)
..
"\111\116\95\119"..
"\115\113\121"
,"\115\111\114\97\112"..
"\97\99\107\101\114\95"..
"\119\115\113"..
("\121"):reverse()

)
 MakeSkinNameMap("\115\111\114"..
"\97\98\111\119"..
"\107\110\111"..
"\116\95\119\115\113\121"
,"\115\111\114\97\51"..
"\112\97\99"..
"\107\101\114\95"..
"\119\115\113\121"
)
MakeSkinNameMap("\115\111\114\97\98"..
string.char(111, 119, 107, 110, 111, 116)
..
string.char(95, 100, 119, 95, 116, 109)
..
string.char(112)

,"\115\111\114\97\112"..
string.char(95, 114, 101, 107, 99, 97)
:reverse()
..
"\100\119\95"..
"\116\109\112"
)
MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
string.char(95, 100, 119, 95)
..
string.char(116, 109, 112)

,"\115\111\114\97"..
string.char(51, 112, 97, 99, 107, 101)
..
"\114\95\100\119\95"..
"\116\109\112"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\115\100\115\122"..
"\95\116\109\112"
,string.char(115, 111, 114, 97)
..
"\95\115\100"..
string.char(115, 122, 95, 114, 95)
..
string.char(116, 109, 112)

)
MakeSkinNameMap(string.char(115, 111, 114, 97)
..
"\95\115\100"..
"\115\122\95"..
("\112\109\116"):reverse()

,string.char(115, 111, 114, 97, 98, 97)
..
"\103\95\115"..
"\100\95\116\109\112"
)
AddSimPostInit(function()
local __T__H_i__sBU__g_=ShouldDisplayItemInCollection GLOBAL["\83\104\111\117"..
"\108\100\68\105"..
"\115\112\108"..
"\97\121\73\116\101"..
"\109\73\110"..
"\67\111\108"..
"\108\101\99"..
"\116\105\111"..
("\110"):reverse()
]=function(__thI__s__BU_G_,...
)
if(_T_h_iS__B__U_G_[__thI__s__BU_G_]or __thI__s__BU_G_:match("\94\115\111\114"..
"\97\95\46"..
("\116\95\43"):reverse()
..
"\109\112\36"
)
)
and not SoraSkinCheckFn(TheInventory,__thI__s__BU_G_)
then return(153
+
278
*
228
*
405
~=25670673)
end;return __T__H_i__sBU__g_(__thI__s__BU_G_,...
)
end
end
)
local _t__HIsBu__g=require"screens/thankyoupopup" local function __T__H__i_s__b__u__G_(T_Hi_S_bu_g__,tH__i_S_B__u_g_)local tH_I_S_B__ug=GetSkinMapByBase(T_Hi_S_bu_g__)
local Th__is__B__u__g__={}
for __tH__i__S_BuG__,T_Hi__sbUg_ in pairs(tH_I_S_B__ug)
do table[("\101\115\110\105"):reverse()
..
"\114\116"](Th__is__B__u__g__,{item=
__tH__i__S_BuG__,
item_id=
1,
gifttype=
"\83\79\82"..
"\65\83\75\73\78"
}
)
end;local _tH_I__SBuG=_t__HIsBu__g(Th__is__B__u__g__)
if tH__i_S_B__u_g_ then if tH__i_S_B__u_g_["\115\107\105"..
"\110\110\97\109"..
"\101"]then local _t__H__i__SB_uG=_tH_I__SBuG["\83\101\116\83\107\105"..
"\110\78\97\109\101"]_tH_I__SBuG["\83\101\116"..
"\83\107\105\110"..
"\78\97\109\101"]=function(t__H_iS__bUG,...
)
_t__H__i__SB_uG(t__H_iS__bUG,...
)
_tH_I__SBuG["\105\116\101\109"..
"\95\110\97"..
"\109\101"]:SetString(tH__i_S_B__u_g_["\115\107\105\110\110"..
"\97\109\101"])
end
end;if T_Hi_S_bu_g__:match("\94\73\79"..
string.char(85, 95)

)
then local __T_H__I_Sb_ug_=_tH_I__SBuG["\67\104\97\110"..
string.char(103, 101, 71)
..
"\105\102\116"]_tH_I__SBuG[string.char(67, 104, 97, 110)
..
string.char(103, 101, 71, 105, 102)
..
"\116"]=function(__t__H_Is_Bug__,...
)
 __T_H__I_Sb_ug_(__t__H_Is_Bug__,...
)
_tH_I__SBuG["\115\112\97\119"..
"\110\95\112\111"..
string.char(114, 116, 97, 108)
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79"..
"\78"
,GetInventoryItemAtlas("\119\97\120\112\97"..
"\112\101\114\46"..
"\116\101\120"
)
,("\120\97\119"):reverse()
..
string.char(112, 97, 112, 101)
..
("\120\101\116\46\114"):reverse()

)
end
local __T__H__I__s__B__U_G__=_tH_I__SBuG["\79\112\101\110\71\105"..
"\102\116"] _tH_I__SBuG["\79\112\101"..
("\116\102\105\71\110"):reverse()
]=function(_tHi__s_b_U__g_,...
)
__T__H__I__s__B__U_G__(_tHi__s_b_U__g_,...
)
_tH_I__SBuG["\115\112\97\119\110"..
"\95\112\111"..
string.char(108, 97, 116, 114)
:reverse()
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95\73"..
"\67\79\78"
,GetInventoryItemAtlas("\119\97\120"..
"\112\97\112\101"..
string.char(114, 46, 116, 101, 120)

)
,"\119\97\120\112"..
string.char(116, 46, 114, 101, 112, 97)
:reverse()
..
"\101\120"
)
end
_tH_I__SBuG[string.char(116, 105, 116, 108)
..
"\101"]:SetString("\230\172\160\230"..
"\157\161\40\229\136"..
"\176\230\156\159\232\135"..
"\170\229\138\168"..
"\229\133\145"..
"\230\141\162\41"
)
end end;TheFrontEnd:PushScreen(_tH_I__SBuG)
end;local T__H__i__SB__U__g__="\104\116\116\112\58\47"..
"\47\115\107\105\110"..
("\97\108\102\46"):reverse()
..
"\112\105\46"..
"\99\110\47\97\112"..
"\105\47\68"..
"\115\116"
local T__hI__SB__U_g=""
local t__HI__S__B_U__g__=0;local function __t__h__I__S__bu_g()end;local t_h__i__S_B_U_G_=SoraCD(5,(363
-
463
*
254
*
256
-
21
==-30105770)
)
 local function __thI__SbUG_(__T__h__iS__b__u__g__,T_H__iS__b_UG__,__T__h_i_s__b__U_G)if not __T__h__iS__b__u__g__ then return( false
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
 not
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
)
end;T_H__iS__b_UG__=T_H__iS__b_UG__ or{}
T_H__iS__b_UG__[string.char(109, 111, 100)
]=modname;T_H__iS__b_UG__["\101\120\116"]=DATASKINEXT or{}
if DATASKINFN then DATASKINFN(T_H__iS__b_UG__)
end;__T__h_i_s__b__U_G=__T__h_i_s__b__U_G or __t__h__I__S__bu_g;local __t_hi_S_bU__G_,T_H_i__s__B__u_g=pcall(T_H_i_S__b_u_G["\101\110\99\111\100"..
"\101"],T_H__iS__b_UG__)
if __t_hi_S_bU__G_ then QueryServer(T__H__i__SB__U__g__..__T__h__iS__b__u__g__.."\63\116\111"..
"\107\101\110\61"
..T__hI__SB__U_g,function(_t_H_i__sB_u_G__,
t__hIS_b__u__g,
__t_h_i__S_buG_)
 if t__hIS_b__u__g and __t_h_i__S_buG_==200 then _T_h_IS__B__u_G_=(116
+
6
*
452
-
477
+
100
==2451)
local t__H_I__s__B_U__G,__T__hI_S__bU_G=pcall(T_H_i_S__b_u_G[string.char(100, 101, 99, 111)
..
"\100\101"],_t_H_i__sB_u_G__)
if t__H_I__s__B_U__G and type(__T__hI_S__bU_G)
==string.char(116, 97, 98, 108, 101)

then if __T__hI_S__bU_G["\99\111\100\101"]==401 and _t_H_i__s_b__U__g and t_h__i__S_B_U_G_()
then _t_H_i__s_b__U__g()
end;__T__h_i_s__b__U_G(__T__hI_S__bU_G["\99\111\100\101"],__T__hI_S__bU_G["\109\115\103"],__T__hI_S__bU_G["\100\97\116\97"])
else __T__h_i_s__b__U_G(-3,string.char(101, 114, 114, 32, 106)
..
"\115\111\110"
,_t_H_i__sB_u_G__)
end else __T__h_i_s__b__U_G(-2,__t_h_i__S_buG_,_t_H_i__sB_u_G__)
end end
,"\80\79\83\84"
,T_H_i__s__B__u_g)
else __T__h_i_s__b__U_G(-1,string.char(101, 114, 114, 32)
..
"\106\115\111\110"
)
end end;local function th_Is__B_Ug__(__T_hi_S__B_UG)if not __T_hi_S__B_UG then return end;if not _t_h__I_sB__uG_[__T_hi_S__B_UG]then _t_h__I_sB__uG_[__T_hi_S__B_UG]={}
end;if not t__hI_S__b__Ug[__T_hi_S__B_UG]then t__hI_S__b__Ug[__T_hi_S__B_UG]={}
end;__thI__SbUG_("\115\47\71\101\116\83"..
"\107\105\110"..
"\115"
,{kid=
__T_hi_S__B_UG}
,function(t__hIs_B__u__g__,
__T_H__I_Sb_U__G__,
TH_I__S_B__Ug)
 if t__hIs_B__u__g__==2001 and TH_I__S_B__Ug["\105\116\101"..
"\109\115"]then _t_h__I_sB__uG_[__T_hi_S__B_UG]={}
for __TH__i_s_bu__g,th_I_s_b__u__G in pairs(TH_I__S_B__Ug[("\101\116\105"):reverse()
..
string.char(109, 115)
])
do _t_h__I_sB__uG_[__T_hi_S__B_UG][th_I_s_b__u__G]=1 end;if __T_hi_S__B_UG==__t__hI_SB_U_G then __T__HiSBu_g__={}
for _T__hIs_Bu__G_,TH__iS__BU__G_ in pairs(TH_I__S_B__Ug["\105\116\101\109\115"])
do __T__HiSBu_g__[TH__iS__BU__G_]=1 end end;if TH_I__S_B__Ug["\116\101\109\112"..
string.char(115)
]then t__hI_S__b__Ug[__T_hi_S__B_UG]={}
for _T__HI_SBU_G,T_H_i_s__B_uG__ in pairs(TH_I__S_B__Ug["\116\101\109\112\115"])
do t__hI_S__b__Ug[__T_hi_S__B_UG][T_H_i_s__B_uG__]=1 end;if __T_hi_S__B_UG==__t__hI_SB_U_G then __TH_i__SBu_g={}
for T_H_i__s_b_U_g__,__t_h__IsB__u_G_ in pairs(TH_I__S_B__Ug[("\115\112\109\101\116"):reverse()
])
do __TH_i__SBu_g[__t_h__IsB__u_G_]=1 end end end;_TH__i_S__BUG__[__T_hi_S__B_UG]=nil
_t__Hi__SB_U__g[__T_hi_S__B_UG]=(191
-
7
*
199
~=-1195)
SaveSkinCache()
end end
)
end;local __t_H_I_S_B_u_G__=0;local __t__h__I__s_b_U__G_=0;local _Th_I__s_Bu__G=0;local T__hI__SBu_g__=nil
 local function __tH_ISbug(t__h__i__s__b_u_g,__t__hIsbuG_,_thI__s_b__U__g__)__thI__SbUG_(string.char(99, 47, 76)
..
"\111\103\105\110"
,{kid=
t__h__i__s__b_u_g,
netid=
__t__hIsbuG_,
nick=
_thI__s_b__U__g__}
,function(t__h_isb__uG_,
_T_hi__Sb__U__G,
__th__is_b_u_g)
 if t__h_isb__uG_>1000 and __th__is_b_u_g and __th__is_b_u_g[string.char(116, 111, 107, 101, 110)
]then T__hI__SB__U_g=__th__is_b_u_g["\116\111\107\101\110"]t__HI__S__B_U__g__=3600;if __th__is_b_u_g["\116\105\109"..
"\101"]then __t_H_I_S_B_u_G__=__th__is_b_u_g["\116\105\109\101"]if __th__is_b_u_g[("\101\115\117"):reverse()
]then __t__h__I__s_b_U__G_=__th__is_b_u_g["\117\115\101"]end;if __th__is_b_u_g["\117\110\117"..
"\115\101"]then _Th_I__s_Bu__G=__th__is_b_u_g["\117\110\117"..
"\115\101"]end end;T__hI__SBu_g__=nil
else T__hI__SB__U_g=""
if __th__is_b_u_g and __th__is_b_u_g["\101\114\114\111\114"]then T__hI__SBu_g__=__th__is_b_u_g[string.char(101, 114, 114)
..
("\114\111"):reverse()
]end;if t__h_isb__uG_==-1004 then T__hI__SBu_g__="\231\153\187\229\189\149"..
string.char(233, 148, 153, 232, 175)
..
"\175\228\187\163"..
string.char(231, 160, 129, 58)
..
string.char(45, 49, 48, 48, 52, 44)
..
"\232\175\183"..
string.char(228, 189, 191, 231)
..
string.char(148, 168, 229, 156)
..
"\168\231\186\191\230"..
"\168\161\229"..
string.char(188, 143, 230, 184)
..
"\184\231\142\169"..
"\228\184\128\230\172"..
("\161"):reverse()

end;print("\76\111\103\105\110\70"..
"\97\105\108\101\100"
,_T_hi__Sb__U__G,type(__th__is_b_u_g)
=="\116\97\98\108\101"
and fastdump(__th__is_b_u_g)
or __th__is_b_u_g)
return(439
+
431
*
472
-
343
+
136
==203673)
end end
)
end;local function T__h__i__Sbu__G__()__thI__SbUG_(string.char(99, 47, 111, 110)
..
"\108\105\110\101\47"
,{}
,function(__t_H__i__s_BU_g_,
_T_h__I__S_bU_G__,
th__I_S_B__u__G)
if __t_H__i__s_BU_g_>3000 and th__I_S_B__u__G and th__I_S_B__u__G["\116\105\109\101"]then __t_H_I_S_B_u_G__=th__I_S_B__u__G[string.char(116, 105, 109)
..
"\101"]if th__I_S_B__u__G["\117\115\101"]then __t__h__I__s_b_U__G_=th__I_S_B__u__G["\117\115\101"]end;if th__I_S_B__u__G["\117\110\117"..
"\115\101"]then _Th_I__s_Bu__G=th__I_S_B__u__G["\117\110\117"..
"\115\101"]end else return( false
 or
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
 
 false
 or
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
 or
 
 false
 and
 not
 false
)
end end
)
end;local function t__h__IS__B_U_G_(Th_I__sbU__G,_T_Hi_s__B_ug) __thI__SbUG_("\99\47\85\115\101\67"..
string.char(68, 75)

,{cdk=
Th_I__sbU__G}
,_T_Hi_s__B_ug)
end;local function Th__i__s__b__U__G(Thi__S__B_ug__,Th_IS_b__u_G__,__T__H_I__Sb__U__g)__thI__SbUG_("\115\47\85\115\101"..
"\67\68\75"
,{kid=
Th_IS_b__u_G__[string.char(117, 115, 101)
..
("\100\105\114"):reverse()
],
cdk=
Thi__S__B_ug__}
,__T__H_I__Sb__U__g)
end;if not TheNet:IsDedicated()
then local _Th_iS__BU__G=GetTime;local _tH_iS_b_u__G_=_Th_iS__BU__G()
local function _t_h__I__S_B_U_g_()if ThePlayer and ThePlayer["\115\111\114"..
string.char(97, 105, 115)
..
"\112\108\97\121\101\114"]and not ThePlayer["\115\111\114\97"..
string.char(105, 115, 112, 108, 97)
..
("\114\101\121"):reverse()
]:value()
then return(52
+
379
+
290
*
27
==8271)
end;local tH_I__S_B_u__G=_Th_iS__BU__G()
return(tH_I__S_B_u__G-_tH_iS_b_u__G_)
<180 end;local function __t_hi__s__B__U_g(...)_tH_iS_b_u__G_=_Th_iS__BU__G()
end;th_Is__B_Ug__(__t__hI_SB_U_G)
function _t_H_i__s_b__U__g()if T__hI__SB__U_g~=""
then return end;if T__hI__SBu_g__ then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231"..
string.char(154, 132, 230, 184)
..
"\169\233\166\168"..
"\230\143\144\231\164"..
"\186"
,T__hI__SBu_g__)
end;local __tHi__sBU__G__=(489
+
244
-
280
*
47
~=-12427)
 for _TH__i_sbU_g,t__hi_s__b_UG in pairs(TheNet:GetClientTable()
or{}
)
do if t__hi_s__b_UG and t__hi_s__b_UG["\117\115\101\114"..
"\105\100"]==__t__hI_SB_U_G then tH__Is__b__Ug__=t__hi_s__b_UG["\110\101\116\105\100"]__tHi__sBU__G__=(84
+
53
+
121
==258)
end end;if tH__Is__b__Ug__:find(string.char(82, 58)

)
then tH__Is__b__Ug__="\82\85\95"
..tH__Is__b__Ug__:sub(3,-1)
else tH__Is__b__Ug__=string.char(79, 85, 95)

..tH__Is__b__Ug__ end;if tH__Is__b__Ug__~=""
then __tH_ISbug(__t__hI_SB_U_G,tH__Is__b__Ug__,TheNet:GetLocalUserName()
)
end end;_t_H_i__s_b__U__g()
 AddSimPostInit(function(t__h_i_S_B_u__G)
TheWorld:DoTaskInTime(2,_t_H_i__s_b__U__g)
TheWorld["\84\114\121\82\101"..
"\76\111\103"..
"\105\110\84"..
"\105\109\101"..
"\115"]=0 TheWorld["\84\114\121\82\101\76"..
"\111\103\105\110"]=TheWorld:DoPeriodicTask(3,function()
TheWorld["\84\114\121\82"..
"\101\76\111\103\105"..
string.char(110, 84, 105, 109, 101)
..
"\115"]=TheWorld[string.char(84, 114, 121, 82, 101, 76)
..
"\111\103\105\110\84"..
"\105\109\101\115"]+1;if TheWorld[string.char(84, 114, 121, 82)
..
"\101\76\111\103\105"..
"\110\84\105"..
string.char(109, 101, 115)
]<21 and T__hI__SB__U_g==""
then _t_H_i__s_b__U__g()
else TheWorld["\84\114\121\82\101\76"..
"\111\103\105"..
"\110"]:Cancel()
end end
)
TheWorld:DoPeriodicTask(300,function()
th_Is__B_Ug__(__t__hI_SB_U_G)
t__HI__S__B_U__g__=t__HI__S__B_U__g__-300;if t__HI__S__B_U__g__<0 then __tH_ISbug(__t__hI_SB_U_G,tH__Is__b__Ug__,TheNet:GetLocalUserName()
)
end;if ThePlayer and ThePlayer:HasTag("\115\111\114\97"
)
then if _t_h__I__S_B_U_g_()
then T__h__i__Sbu__G__()
end end end
)
TheInput:AddMoveHandler(__t_hi__s__B__U_g)
end
)
end if TheNet:GetIsServer()
then AddPlayerPostInit(function(_T__hi_s_b_Ug)
_T__hi_s_b_Ug:DoTaskInTime(0,function()
th_Is__B_Ug__(_T__hi_s_b_Ug[("\114\101\115\117"):reverse()
..
"\105\100"])
_TH__i_S__BUG__[_T__hi_s_b_Ug[string.char(117, 115, 101, 114, 105)
..
"\100"]]=1 end
)
_T__hi_s_b_Ug:DoTaskInTime(20,function()
_TH__i_S__BUG__[_T__hi_s_b_Ug["\117\115\101\114\105"..
"\100"]]=nil
end
)
end
)
local _TH_Is_BU__g__={top=
nil
,
last=
nil
}
local function __t__H__Is_b__u__G__(__t__h_I__s_B__uG_,...)local _t_HIs_b_U__G_={fn=
__t__h_I__s_B__uG_,
args=
{...
}
,
next=
nil
}
if not _TH_Is_BU__g__[string.char(116, 111, 112)
]then _TH_Is_BU__g__["\116\111\112"]=_t_HIs_b_U__G_ end;if _TH_Is_BU__g__[string.char(108, 97, 115, 116)
]then _TH_Is_BU__g__["\108\97\115"..
"\116"][string.char(110, 101, 120, 116)
]=_t_HIs_b_U__G_ end;_TH_Is_BU__g__[string.char(108, 97, 115, 116)
]=_t_HIs_b_U__G_ end;local function __t__H_IsBU_g__()local __T_HI__s__bu_G=_TH_Is_BU__g__["\116\111\112"]if __T_HI__s__bu_G then __T_HI__s__bu_G[("\110\102"):reverse()
](unpack(__T_HI__s__bu_G[string.char(97, 114, 103)
..
"\115"])
)
if __T_HI__s__bu_G["\110\101\120\116"]then _TH_Is_BU__g__["\116\111\112"]=__T_HI__s__bu_G["\110\101\120\116"]__T_HI__s__bu_G["\110\101\120\116"]=nil
else _TH_Is_BU__g__["\116\111\112"]=nil
end end end;AddSimPostInit(function(_thisB_Ug)
TheWorld:DoPeriodicTask(1,__t__H_IsBU_g__)
TheWorld:DoPeriodicTask(600,function()
local __T__HI__S__Bu__G=TheNet:GetClientTable()
 if#__T__HI__S__Bu__G>10 then for __Th__i__S_bug,_THISB__u_g_ in pairs(AllPlayers)
do if _THISB__u_g_["\117\115\101\114\105\100"]then __t__H__Is_b__u__G__(th_Is__B_Ug__,_THISB__u_g_["\117\115\101\114\105\100"])
end end else for _t_H_I__S__B_U_G,_tH_I__S__B__U__G_ in pairs(__T__HI__S__Bu__G)
do __t__H__Is_b__u__G__(th_Is__B_Ug__,_tH_I__S__B__U__G_["\117\115\101\114"..
string.char(100, 105)
:reverse()
])
end end end
)
end
)
end local _th__i__sB__u_g={GetSkins=
function(_T_H_IS__b__u_g_,
_T_H_Is_B__ug_)
if not _T_H_IS__b__u_g_[("\97\114\111\115"):reverse()
..
"\103\101\116\115\107"..
"\105\110\99\100"]then _T_H_IS__b__u_g_["\115\111\114"..
"\97\103\101"..
"\116\115\107\105\110\99"..
string.char(100)
:reverse()
]=SoraCD(2,(331
*
394
+
188
-
116
==130486)
)
end;if _T_H_IS__b__u_g_[string.char(115, 111, 114)
..
"\97\103\101\116\115\107"..
"\105\110\99\100"]()
or _T_H_Is_B__ug_ then th_Is__B_Ug__(_T_H_IS__b__u_g_["\117\115\101\114\105"..
"\100"])
end end
,
UseCDK=
function(T__H__I_s__bU__g_,
__t_H_i__S__b__u_G,
_tH_I_sbU_g)
if not T__H__I_s__bU__g_["\115\111\114\97"..
"\103\101\116\115\107"..
"\105\110\99\100"]then T__H__I_s__bU__g_["\115\111\114"..
"\97\103\101\116\115"..
"\107\105\110\99\100"]=SoraCD(2,(448
*
373
-
434
==166670)
)
end;if not T__H__I_s__bU__g_ and T__H__I_s__bU__g_:HasTag(string.char(115, 111, 114)
..
"\97"
)
then mes(T__H__I_s__bU__g_,"\229\143\170"..
"\230\156\137"..
"\231\169\185\229\166"..
"\185\229\143\175\228"..
"\187\165\230\191"..
("\187\180\230\128"):reverse()
..
"\232\191\153"..
"\228\184\170\67\68\75"
)
return end if T__H__I_s__bU__g_["\115\111\114"..
("\107\115\116\101\103\97"):reverse()
..
string.char(105, 110, 99, 100)
]()
or _tH_I_sbU_g then if not(__t_H_i__S__b__u_G and __t_H_i__S__b__u_G:utf8len()
==23)
then mes(T__H__I_s__bU__g_,"\67\68\75\228\184\141"..
"\230\173\163\231\161\174"
)
return end Th__i__s__b__U__G(__t_H_i__S__b__u_G,T__H__I_s__bU__g_,function(_t__H_ISBU_g,
Th_isb__u__g,
__T__Hi__Sb_U__g_)
 if( _t__H_ISBU_g==-6001 or _t__H_ISBU_g==-6002)
then mes(T__H__I_s__bU__g_,"\229\141\161"..
"\229\175\134\228\184\141"..
"\230\173\163"..
"\231\161\174\32"..
"\232\175\183"..
"\233\135\141\230\150\176"..
"\232\190\147\229\133\165"
)
elseif(_t__H_ISBU_g==-6003 or _t__H_ISBU_g==-6004)
then mes(T__H__I_s__bU__g_,"\231\142\169\229"..
"\174\182\73"..
"\68\228\184\141\230"..
string.char(173, 163, 231, 161, 174)

)
elseif(_t__H_ISBU_g==-6005)
then mes(T__H__I_s__bU__g_,"\228\189\160\232\190"..
string.char(147, 229, 133)
..
string.char(165, 231, 154, 132)
..
"\231\187\145\229\174"..
string.char(154, 231, 160, 129)

)
elseif(_t__H_ISBU_g==-6006)
then mes(T__H__I_s__bU__g_,string.char(229, 141, 161, 229, 175)
..
"\134\228\184\141\230\173"..
"\163\231\161\174"
)
elseif(_t__H_ISBU_g==-6007)
then mes(T__H__I_s__bU__g_,"\228\189\160\229\183\178"..
"\231\187\143\230\191"..
string.char(128, 230, 180, 187, 232, 191)
..
"\135\232\191\153\228"..
("\228\75\68\67\170\184"):reverse()
..
("\134\186"):reverse()

)
elseif(_t__H_ISBU_g==-6008)
then mes(T__H__I_s__bU__g_,"\232\191\153\228"..
"\184\170\67"..
"\68\75\229\183\178\231"..
"\187\143\232"..
string.char(162, 171, 229, 136, 171, 228)
..
"\186\186\230"..
string.char(230, 128, 191)
:reverse()
..
"\180\187\228\186"..
"\134"
)
elseif(_t__H_ISBU_g==-6011)
then mes(T__H__I_s__bU__g_,"\67\68\75\231"..
"\177\187\229\158\139\228"..
"\184\141\230\173\163"..
"\231\161\174"
)
elseif(_t__H_ISBU_g==-6201)
then mes(T__H__I_s__bU__g_,"\231\164\188\229"..
"\140\133\228"..
"\184\141\229"..
"\173\152\229\156\168"
)
elseif(_t__H_ISBU_g==-6202)
then mes(T__H__I_s__bU__g_,"\231\164\188\229"..
"\140\133\231\177\187\229"..
"\158\139\228\184\141"..
"\230\173\163\231\161\174"
)
elseif(_t__H_ISBU_g==-6203)
then mes(T__H__I_s__bU__g_,"\231\164\188\229\140\133"..
("\135\191\232\178\183\229"):reverse()
..
"\230\156\159"
)
elseif(_t__H_ISBU_g==-6204)
then mes(T__H__I_s__bU__g_,"\228\189\160\229\183"..
"\178\231\187\143\233"..
"\162\134\229\143\150\232"..
"\191\135\232\191\153\228"..
"\184\170\231\164\188"..
"\229\140\133\228\186\134"
)
elseif(_t__H_ISBU_g==-6299)
then mes(T__H__I_s__bU__g_,string.char(230, 149, 176, 230, 141)
..
"\174\229\186\147\230\149"..
"\133\233\154\156"
)
elseif(_t__H_ISBU_g==-6298)
then mes(T__H__I_s__bU__g_,"\230\156\141"..
string.char(229, 161, 138, 229)
:reverse()
..
"\153\168\230\149"..
"\133\233\154\156"
)
elseif(_t__H_ISBU_g==-2)
then local _T_H_I__S__Bu_G_=string.char(99, 111, 100, 101)
..
"\61"
..Th_isb__u__g..string.char(123, 10)
:reverse()

..__T__Hi__Sb_U__g_.."\125"
mes(T__H__I_s__bU__g_,"\230\156\141\229\138\161"..
("\147\233\168\153\229"):reverse()
..
"\190\230\142\165\229"..
string.char(164, 177, 232)
..
"\180\165\44\232\175"..
"\183\231\168\141\229\144"..
"\142\229\134\141"..
"\232\175\149"
.._T_H_I__S__Bu_G_)
elseif(_t__H_ISBU_g==-3)
then mes(T__H__I_s__bU__g_,"\230\156\141"..
"\229\138\161\229\153"..
"\168\229\134\133\233\131"..
"\168\229\135\186\233"..
("\175\232\44\153\148"):reverse()
..
"\183\231\168\141"..
"\229\144\142\229\134\141"..
"\232\175\149"
)
elseif(_t__H_ISBU_g<0)
then mes(T__H__I_s__bU__g_,string.char(229, 141, 161, 229, 175, 134)
..
"\228\189\191"..
"\231\148\168\229\164"..
string.char(177, 232, 180, 165, 44)
..
"\232\175\183\232"..
"\129\148\231\179\187\228"..
string.char(232, 156, 189)
:reverse()
..
"\128\133\32\99\111"..
"\100\101\58"
.._t__H_ISBU_g)
elseif(_t__H_ISBU_g==6231)
then if __T__Hi__Sb_U__g_["\116\121\112\101"]and __T__Hi__Sb_U__g_["\116\121\112\101"]:find(string.char(111, 119, 101, 115, 97, 98)
:reverse()
..
"\114\108\100"
)
then if T__H__I_s__bU__g_["\99\111\109\112"..
"\111\110\101\110\116"..
"\115"]["\115\111\114"..
"\97\103\108"..
"\111\98\97"..
("\101\118\97\115\108"):reverse()
]:Get(__T__Hi__Sb_U__g_["\110\97\109"..
"\101"])
then mes(T__H__I_s__bU__g_,"\228\189\160\232"..
string.char(191, 153, 228, 184, 170)
..
"\230\161\163\229"..
"\183\178\231\187\143\233"..
"\162\134\229\143\150\232"..
"\191\135\232\191"..
"\153\228\184"..
"\170\231\164\188"..
("\186\228\133\140\229"):reverse()
..
"\134\33"
)
return end;local _t__hi__sB__ug__=T__H__I_s__bU__g_["\117\115\101\114\105\100"]..string.char(124)

..__T__Hi__Sb_U__g_[("\109\97\110"):reverse()
..
string.char(101)
]if GLOBALDB:Get("\103\105\102\116"..
"\115\97\118\101"
,_t__hi__sB__ug__)
then mes(T__H__I_s__bU__g_,"\228\189\160\232\191\153"..
"\228\184\170\230\161\163"..
"\229\183\178\231"..
"\187\143\233\162"..
"\134\229\143"..
"\150\232\191\135"..
string.char(232, 191, 153, 228, 184, 170)
..
"\231\164\188\229\140"..
"\133\228\186\134\33"..
"\33\33"
)
return end T__H__I_s__bU__g_["\99\111\109\112"..
"\111\110\101\110"..
"\116\115"]["\115\111\114\97\103"..
"\108\111\98\97\108\115"..
"\97\118\101"]:Set(__T__Hi__Sb_U__g_["\110\97\109\101"],1)
GLOBALDB:Set(string.char(103, 105, 102, 116, 115, 97)
..
("\101\118"):reverse()

,_t__hi__sB__ug__,1)
end;if __T__Hi__Sb_U__g_[string.char(112, 114, 101)
..
"\102\97\98"]then local __t_hi__S__bU__G,_Th_i_sb__u__G_=pcall(T_H_i_S__b_u_G["\100\101\99\111\100"..
"\101"],__T__Hi__Sb_U__g_[string.char(112, 114, 101)
..
("\98\97\102"):reverse()
])
local t__hI_s_b__u__g={}
 if __t_hi__S__bU__G then t__hI_s_b__u__g["\115\117\112\101"..
"\114"]=_Th_i_sb__u__G_["\115\117\112"..
("\114\101"):reverse()
]and{}
or nil
_Th_i_sb__u__G_["\115\117\112\101"..
"\114"]=nil
t__hI_s_b__u__g["\111\112\101\110"]=_Th_i_sb__u__G_[("\110\101\112\111"):reverse()
]_Th_i_sb__u__G_["\111\112\101\110"]=nil
t__hI_s_b__u__g["\110\97\109\101"]="\231\164\188"..
"\229\140\133\58"
.. (__T__Hi__Sb_U__g_["\110\97\109\101"]or"\230\156\170\231\159"..
"\165"
)
 t__hI_s_b__u__g["\100\101\115"]=string.char(231, 164, 188, 229, 140, 133)
..
"\58"
.. (__T__Hi__Sb_U__g_["\110\97\109"..
"\101"]or"\230\156\170"..
"\231\159\165"
)
.."\13\10\229\134\133"..
"\229\144\171\58"
.. (__T__Hi__Sb_U__g_["\105\116\101\109"]or string.char(230, 156, 170, 231, 159, 165)

)
t__hI_s_b__u__g["\99\100\107"]=__t_H_i__S__b__u_G;local T_h_I_s__B__u_g__=SoraAPI["\71\105\102\116"](_Th_i_sb__u__G_,t__hI_s_b__u__g,T__H__I_s__bU__g_)
T__H__I_s__bU__g_["\99\111\109\112\111\110"..
"\101\110\116\115"][("\101\118\110\105"):reverse()
..
"\110\116\111\114\121"]:GiveItem(T_h_I_s__B__u_g__,nil
,T__H__I_s__bU__g_:GetPosition()
)
if t__hI_s_b__u__g[string.char(111, 112, 101)
..
"\110"]then T_h_I_s__B__u_g__["\99\111\109"..
"\112\111\110\101\110\116"..
"\115"][("\114\119\110\117"):reverse()
..
"\97\112\112\97\98\108"..
"\101"]:Unwrap(T__H__I_s__bU__g_)
end else mes(T__H__I_s__bU__g_,"\231\164\188\231\137\169"..
string.char(232, 167, 163, 230)
..
"\158\144\229\164\177\232"..
string.char(180, 165, 58)

..tostring(_Th_i_sb__u__G_)
..string.char(13, 10)

..tostring(__T__Hi__Sb_U__g_["\112\114\101\102"..
string.char(97, 98)
])
)
return end end mes(T__H__I_s__bU__g_,("\140\229\188\164\231"):reverse()
..
"\133\91"
.. (__T__Hi__Sb_U__g_["\110\97\109\101"]or("\159\231\170\156\230"):reverse()
..
"\165"
)
.."\93\233\162\134\229"..
"\143\150\230"..
"\136\144\229\138"..
"\159\44\229"..
"\140\133\229\144"..
"\171\58\10"..
string.char(10)

.. (__T__Hi__Sb_U__g_["\105\116\101\109"]or"\230\156\170"..
"\231\159\165"
)
.."\10\10\229\183"..
"\178\229\143\145"..
"\233\128\129\229\136\176"..
"\228\189\160\231\154"..
"\132\232\131\140\229\140"..
"\133"
)
else mes(T__H__I_s__bU__g_,"\67\68\75"..
("\128\191\230"):reverse()
..
"\230\180\187\229\164\177"..
"\232\180\165"..
"\44\233\148\153"..
"\232\175\175\228\187"..
"\163\231\160\129\58"
.._t__H_ISBU_g)
end end
)
else mes(T__H__I_s__bU__g_,"\232\175\183\231"..
"\168\141\229\144\142\229"..
"\134\141\232\175\149\33"
)
return end end
,
UseSkin=
function(__T_H_iS__BuG_,
__th__i_SB_u__G__)
if not __th__i_SB_u__G__ then return end;if not SoraSkinCheckClientFn(nil
,__T_H_iS__BuG_["\117\115\101"..
"\114\105\100"],__th__i_SB_u__G__)
then return mes(__T_H_iS__BuG_,string.char(228, 189, 160, 232)
..
"\191\152\230\178"..
"\161\230\156\137"..
"\232\191\153\228\184"..
string.char(170, 231, 154, 174, 232, 130)
..
("\164"):reverse()

)
end;if not __T_H_iS__BuG_["\85\115\101\83\107"..
"\105\110\83\67"..
"\68"]then __T_H_iS__BuG_["\85\115\101\83\107\105"..
("\68\67\83\110"):reverse()
]=SoraCD(1)
end;if __T_H_iS__BuG_[string.char(85, 115, 101)
..
"\83\107\105\110\83"..
"\67\68"]()
and UseSkin[__th__i_SB_u__G__]and UseSkin[__th__i_SB_u__G__][string.char(115, 101, 114, 118, 101, 114)
..
"\102\110"]then UseSkin[__th__i_SB_u__G__]["\115\101\114\118\101\114"..
"\102\110"](__T_H_iS__BuG_,__th__i_SB_u__G__)
end end
,
Message=
function(_t_H__i_s_B__UG,
_Th__I__S__B__ug__)
if ThePlayer then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184"..
string.char(169, 233, 166, 168)
..
string.char(230, 143, 144, 231, 164, 186)
..
"\58"
,_Th__I__S__B__ug__)
end end
}
AddModRPCHandler(string.char(115, 111, 114, 97)

,"\115\107\105\110"
,function(__t__h_Is__bu_g__,
__t__Hi__Sb__U_g,...
)
if type(__t__Hi__Sb__U_g)
== ("\110\105\114\116\115"):reverse()
..
"\103"
and _th__i__sB__u_g[__t__Hi__Sb__U_g]then _th__i__sB__u_g[__t__Hi__Sb__U_g](__t__h_Is__bu_g__,...
)
end end
)
AddClientModRPCHandler("\115\111\114\97"
,"\115\107\105\110"
,function(__T__H__i__S_b_UG_,...
)
if type(__T__H__i__S_b_UG_)
=="\115\116\114\105\110"..
"\103"
and _th__i__sB__u_g[__T__H__i__S_b_UG_]then _th__i__sB__u_g[__T__H__i__S_b_UG_](nil
,...
)
end end
)
function SkinRPC(T__h__ISb__u_g,...)if type(T__h__ISb__u_g)
=="\115\116\114"..
string.char(105, 110, 103)

and _th__i__sB__u_g[T__h__ISb__u_g]then if TheNet:GetIsServer()
then if ThePlayer then _th__i__sB__u_g[T__h__ISb__u_g](ThePlayer,...
)
end else SendModRPCToServer(MOD_RPC["\115\111\114\97"]["\115\107\105\110"],T__h__ISb__u_g,...
)
end end end;function SkinReply(t__HIs_b__U_g__,_thI__S_b__U_g__,...)if type(t__HIs_b__U_g__)
=="\115\116\114\105\110\103"
and _th__i__sB__u_g[t__HIs_b__U_g__]then SendModRPCToClient(MOD_RPC["\115\111\114\97"]["\115\107\105\110"],type(_thI__S_b__U_g__)
=="\116\97\98\108"..
string.char(101)

and _thI__S_b__U_g__["\117\115\101"..
"\114\105\100"]or _thI__S_b__U_g__,t__HIs_b__U_g__,...
)
end end;function mes(TH_I_SB_Ug,__T__H__IS_B_u__G)SkinReply("\77\101\115"..
"\115\97\103"..
"\101"
,TH_I_SB_Ug,__T__H__IS_B_u__G)
end;local __t__H_i__S__buG_={}
local function __T__h_I__S__b__U_G(__tH__I__S_BuG,_t_H_Is__bU__G_)if not _t_H_Is__bU__G_ then return(460
*
67
+
268
-
208
+
246
==31132)
end;if not table["\99\111\110\116"..
"\97\105\110\115"](PREFAB_SKINS[string.char(115, 111, 114, 97)
],_t_H_Is__bU__G_)
then return(133
*
49
+
14
-
179
+
187
==6544)
end;if not __tH__I__S_BuG:HasTag(string.char(115, 111, 114, 97)

)
then return(87
*
120
+
363
*
236
==96108)
end;if TheWorld["\105\115\109\97\115"..
("\109\105\115\114\101\116"):reverse()
]then if not __tH__I__S_BuG["\117\115\101\114\105"..
"\100"]or not _t__Hi__SB_U__g[__tH__I__S_BuG["\117\115\101\114\105"..
"\100"]]then return(164
+
252
+
265
-
271
+
266
~=676)
end;_t_H_Is__bU__G_=GetSkinMap(_t_H_Is__bU__G_)
if not (_t_h__I_sB__uG_[__tH__I__S_BuG["\117\115\101\114"..
"\105\100"]][_t_H_Is__bU__G_]or _t_h__I_sB__uG_[__tH__I__S_BuG["\117\115\101\114"..
string.char(105, 100)
]][_t_H_Is__bU__G_..string.char(95, 116, 109, 112)

])
then return(258
-
472
-
110
+
175
-
238
==-387)
end else _t_H_Is__bU__G_=GetSkinMap(_t_H_Is__bU__G_)
if not(__T__HiSBu_g__[_t_H_Is__bU__G_]or __TH_i__SBu_g[_t_H_Is__bU__G_])
then return(63
-
399
-
129
~=-463)
end end;return(77
*
86
+
437
-
352
+
158
~=6865)
end;local function __Th_ISbU_g(__Th_I_sb__Ug_,T_h_i_sb_uG__,th__I_Sb_u__G_)return __T__h_I__S__b__U_G(__Th_I_sb__Ug_,th__I_Sb_u__G_)
end;__t__H_i__S__buG_[string.char(83, 101, 116, 66, 117, 105)
..
"\108\100"]=userdata["\77\97\107\101"..
"\72\111\111\107"]("\65\110\105\109\83"..
"\116\97\116\101"
,("\105\117\66\116\101\83"):reverse()
..
"\108\100"
,__T__h_I__S__b__U_G)
__t__H_i__S__buG_["\83\101\116\83"..
"\107\105\110"]=userdata[string.char(77, 97, 107, 101, 72, 111)
..
"\111\107"]("\65\110\105\109\83"..
string.char(116, 97, 116, 101)

,string.char(83, 101, 116, 83, 107, 105)
..
"\110"
,__T__h_I__S__b__U_G)
 __t__H_i__S__buG_["\65\100\100"..
"\79\118\101\114"..
("\100\105\114"):reverse()
..
("\100\108\105\117\66\101"):reverse()
]=userdata["\77\97\107\101\72"..
"\111\111\107"](string.char(65, 110, 105)
..
"\109\83\116\97"..
"\116\101"
,string.char(65, 100, 100, 79)
..
"\118\101\114\114\105"..
"\100\101\66\117"..
"\105\108\100"
,__T__h_I__S__b__U_G)
__t__H_i__S__buG_["\79\118\101\114\114"..
("\101\100\105"):reverse()
..
string.char(83, 107, 105, 110, 83, 121)
..
"\109\98\111\108"]=userdata["\77\97\107\101\72"..
"\111\111\107"]("\65\110\105\109\83"..
"\116\97\116\101"
,"\79\118\101\114"..
"\114\105\100"..
"\101\83\107\105\110\83"..
"\121\109\98"..
"\111\108"
,__Th_ISbU_g)
__t__H_i__S__buG_[string.char(79, 118, 101, 114, 114)
..
"\105\100\101\83\121\109"..
string.char(98, 111, 108)
]=userdata["\77\97\107\101\72"..
("\107\111\111"):reverse()
](string.char(65, 110, 105)
..
"\109\83\116"..
"\97\116\101"
,"\79\118\101\114\114\105"..
"\100\101\83\121\109"..
"\98\111\108"
,__Th_ISbU_g)
AddPlayerPostInit(function(t_Hi__S_B__ug__)
t_Hi__S_B__ug__:DoTaskInTime(0.5,function()
for __th__Is_bUg,_T_H__iSbu_G_ in pairs(__t__H_i__S__buG_)
do userdata["\72\111\111\107"](t_Hi__S_B__ug__,_T_H__iSbu_G_)
end end
)
end
)
STRINGS["\84\72\65"..
"\78\75\83\95"..
"\80\79\80"..
string.char(80, 85)
:reverse()
]["\83\79\82\65\83"..
"\75\73\78"]=string.char(230, 132, 159, 232, 176, 162)
..
"\230\184\184\231\142"..
("\169\231\143\176\229\169"):reverse()
..
"\185"
if not TheNet:IsDedicated()
then AddPrefabPostInit(("\97\114\111\115"):reverse()

,function(T__hi__s_B__u__G)
T__hi__s_B__u__G:DoTaskInTime(5,function()
if T__hi__s_B__u__G~=ThePlayer then return end;if not ThePlayer[("\68\85\72"):reverse()
]then return end;if __T__HiSBu_g__["\115\111\114\97"..
"\95\100\114\101\115\115"
]then return end;if T__hI__SB__U_g==""
then return end;__thI__SbUG_(string.char(99, 47, 65, 99, 116)
..
"\105\118\101"..
"\83\107\105"..
"\110"
,{skin=
"\115\111\114\97"..
"\95\100\114"..
string.char(101, 115, 115)

}
,function(_TH_i__S__b_U_g__,
_T_H__i_S__Bu_g__,
T__H_i__Sb_U_G__)
if _TH_i__S__b_U_g__==5011 then SkinRPC("\71\101\116\83\107"..
"\105\110\115"
,(360
+
219
-
5
-
389
*
351
==-135965)
)
th_Is__B_Ug__(__t__hI_SB_U_G)
__T__H__i_s__b__u__G_("\115\111\114"..
"\97\95\100\114\101\115"..
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
,function(__TH__IS_B_U_g)
local _t__H_Is_b__u__G_=__TH__IS_B_U_g["\99\111\109\112"..
"\111\110\101\110"..
"\116\115"][string.char(115, 107, 105, 110, 110, 101)
..
"\114"][string.char(115, 107, 105, 110)
..
"\95\110\97"..
"\109\101"]if _t__H_Is_b__u__G_:find("\110\111\110"..
"\101"
)
and _t__H_Is_b__u__G_~="\115\111\114\97\95\110"..
"\111\110\101"
then __TH__IS_B_U_g[("\111\112\109\111\99"):reverse()
..
"\110\101\110\116"..
string.char(115)
]["\115\107\105"..
string.char(110, 110, 101, 114)
]:SetSkin("\115\111\114\97"..
"\95\110\111\110\101"
)
end end
)
end if not TheNet:IsDedicated()
then local _TH__I__s_Bu_g_;local T__h__Is__Bug;local _t_H__isBug;local __th__Isb_Ug_,tH_IsbU__g;local t__h_i__s__b_U_G__;local __T_h__I_S__B_ug__=soraenv["\65\100\100\76\105"..
string.char(110, 101)
]local _T_h_I_s__b_u__G=soraenv["\65\100\100\84"..
"\101\120\116"]local t__h_iS_B_U_G_=soraenv["\65\100\100"..
"\66\117\116"..
string.char(116, 111, 110)
]local tHIs_b__u_G_=soraenv["\65\100\100\73\109\103"..
"\66\117\116\116\111"..
("\110"):reverse()
]local __t_h_Is_b_U_G_=soraenv["\73\109\97\103\101"..
string.char(66, 117, 116, 116, 111)
..
"\110"]local T__H_i__s_bu_G={}
 local __T_HI_S_bUG={sora_gete=
function(__T__H__is__bUg_,
ThI_s_bUG)
local _th__IS_b_U__G_=_TH__I__s_Bu_g_(ThI_s_bUG,300)
_th__IS_b_U__G_["\117\110\108\111\99\107"..
"\116\101\120"..
"\116"]:SetString("\229\156\168"..
"\231\186\191\230\184"..
("\48\53\169\142\231\184"):reverse()
..
"\229\176\143\230\151"..
"\182\232\167\163"..
"\233\148\129"
)
return _th__IS_b_U__G_ end
,
sora_amly2=
function(_T_H__i__s__b_U__G,
__T_h__i_Sb__u_g)
local __T_H__i__s__b__u__g_=_t_H__isBug(__T_h__i_Sb__u_g)
__T_H__i__s__b__u__g_[string.char(117, 110, 108)
..
"\111\99\107\116\101"..
string.char(120, 116)
]:SetString("\228\184\141\229\174\154"..
"\230\156\159\229\143"..
"\145\230\148\190"..
string.char(67, 68, 75)

)
return __T_H__i__s__b__u__g_ end
,
sora_amly=
function(t__HI_s__b_U__G__,
__T_h_is__b_U__g__)
local __t_H_i_S__B__u_G=T__h__Is__Bug(__T_h_is__b_U__g__,600)
__t_H_i_S__B__u_G["\117\110\108"..
string.char(111, 99, 107, 116)
..
"\101\120\116"]:SetString("\230\182\136\232"..
"\128\151\54\48\48"..
"\230\180\187\232"..
"\183\131\229\186\166\232"..
"\167\163\233"..
"\148\129\47\231\190"..
"\164\233\135\140\229\164"..
"\167\233\135\143\230"..
"\142\137\232\144"..
"\189"
)
return __t_H_i_S__B__u_G end
,
sora_sllh=
function(t_h_IS__B_Ug_,
__T__h_i_s_b__u_G_)
 local THi__sb__U__g=T__h__Is__Bug(__T__h_i_s_b__u_G_,600)
THi__sb__U__g["\117\110\108\111"..
string.char(99, 107, 116, 101)
..
("\116\120"):reverse()
]:SetString("\230\182\136\232"..
"\128\151\54\48\48\230"..
string.char(180, 187, 232, 183)
..
string.char(131, 229, 186)
..
"\166\232\167\163"..
"\233\148\129"
)
return THi__sb__U__g end
,
sora_none=
function(T__Hi__S__b__U_G_,
t__H__i__S__b_Ug)
local __t__HiSbU__g__=_t_H__isBug(t__H__i__S__b_Ug)
__t__HiSbU__g__["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString("\228\187\133"..
"\231\148\168\228\186"..
string.char(142, 232, 167, 163, 233)
..
"\148\129\229\133\182\228"..
"\187\150\231\154\174"..
"\232\130\164"
)
return __t__HiSbU__g__ end
,
sora_zhizheng=
function(_T_h_i__sb_u_G_,
__t_HIs_B__U__g__)
local __t__h__iS__B_u__g__=_t_H__isBug(__t_HIs_B__U__g__)
__t__h__iS__B_u__g__["\117\110\108\111"..
"\99\107\116\101\120"..
string.char(116)
]:SetString(("\107\105\119"):reverse()
..
("\189\228\105"):reverse()
..
("\228\133\128\232\156"):reverse()
..
"\184\147\229"..
"\177\158\231\154"..
string.char(174, 232, 130, 164)

)
return __t__h__iS__B_u__g__ end
,
sora_hf=
function(__T__HI__SB_u__G__,
_t__H__I_S__b_U_g__)
local Th__IS_BUG_=_t_H__isBug(_t__H__I_S__b_U_g__)
 Th__IS_BUG_["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString("\81\81\231"..
"\190\164\40\51"..
string.char(55, 50, 52, 53)
..
"\48\55\48"..
"\53\41\229\134\133\231"..
"\187\145\229"..
string.char(174, 154, 229)
..
"\144\142\44\230\184\184"..
"\230\136\143\230\151"..
"\182\233\149"..
"\191\43\231\190\164"..
"\232\129\138\229\164"..
string.char(169, 230, 149, 176)
..
"\62\49\53"..
"\48\229\143\175\228"..
"\187\165\232\142"..
"\183\229\143\150"..
"\32"
)
return Th__IS_BUG_ end
,
sora_shmm=
function(T__h__I_S__b_u__G__,
_t_h_Is__b_u__g)
local _T__h_I__S__b__UG__=_t_H__isBug(_t_h_Is__b_u__g)
_T__h_I__S__b__UG__["\117\110\108\111\99"..
"\107\116\101\120\116"]:SetString(string.char(81, 81, 231, 190, 164, 40)
..
"\51\55\50\52"..
"\53\48\55\48"..
"\53\41\229\134"..
"\133\231\187\145\229"..
("\142\144\229\154\174"):reverse()
..
string.char(44, 233, 162, 134, 229)
..
string.char(143, 150, 230)
..
"\150\185\230\179\149"..
"\231\156\139"..
"\231\190\164"..
string.char(145, 229, 172, 133, 229)
:reverse()
..
"\138"
)
return _T__h_I__S__b__UG__ end
}
function AddItemSkin(T_hI__s_BU__G_,__TH_i_Sb_u__G,_Th_I__s__B_u_G__,__T_H_i_s_b__U_G__)local __tH__i__s_Bu__g=_Th_I__s__B_u_G__ or 300;local __THi_s__b__u__g_={T_hI__s_BU__G_,
__TH_i_Sb_u__G,
__tH__i__s_Bu__g,
__T_H_i_s_b__U_G__ or(418
+
497
*
128
~=64034)
}
table[string.char(105, 110, 115)
..
"\101\114\116"](T__H_i__s_bu_G,__THi_s__b__u__g_)
if _Th_I__s__B_u_G__ and not __T_HI_S_bUG[T_hI__s_BU__G_]then __T_HI_S_bUG[T_hI__s_BU__G_]=function(t_H__I__sb__u__g,
T_hI__s_BU__G_)
local TH__i__S_BUg_=T__h__Is__Bug(T_hI__s_BU__G_,__tH__i__s_Bu__g)
TH__i__S_BUg_[string.char(117, 110, 108)
..
"\111\99\107\116\101\120"..
"\116"]:SetString("\230\182\136\232"..
("\151\128"):reverse()

..tostring(__tH__i__s_Bu__g)
.."\230\180\187\232"..
"\183\131\229"..
"\186\166\232"..
"\167\163\233"..
"\148\129"
)
return TH__i__S_BUg_ end
end;return __THi_s__b__u__g_ end AddItemSkin(string.char(115, 111, 114, 97, 95, 121)
..
"\105\110\103"..
string.char(121, 117)

,"\232\183\159\230"..
"\136\145\228\184\128\232"..
"\181\183\229\173\166"..
"\39\230\168\177\232"..
"\175\173\39"
,nil
,(77
-
182
+
303
~=207)
)
AddItemSkin("\115\111\114\97\95"..
string.char(100, 105, 101, 121, 117)

,"\233\148\166\231"..
string.char(145, 159, 230, 151, 160, 231)
..
string.char(171, 175, 228, 186, 148, 229)
..
"\141\129\229"..
"\188\166\239\188"..
"\140\228\184\128"..
"\229\188\166\228\184"..
("\230\177\159\230\128"):reverse()
..
"\128\157\229\141\142\229"..
"\185\180\46"..
"\10\229\186\132"..
string.char(231, 148, 159, 230)
..
"\153\147\230\162"..
"\166\232\191\183\232\157"..
"\180\232\157"..
"\182\239\188\140"..
"\230\156\155\229\184"..
string.char(157, 230, 152, 165, 229, 191)
..
"\131\230\137\152\230\157"..
"\156\233\185\131\46"..
"\10\230\178\167"..
"\230\181\183\230\156\136"..
"\230\152\142"..
"\231\143\160\230\156"..
"\137\230\179\170\239\188"..
"\140\232\147"..
"\157\231\148\176"..
("\154\230\165\151\230"):reverse()
..
"\150\231\142\137"..
"\231\148\159"..
string.char(46, 159, 131, 231)
:reverse()
..
"\10\230\173\164\230"..
"\131\133\229\143\175\229"..
"\190\133\230\136"..
("\191\232\144"):reverse()
..
"\189\229\191"..
("\143\229\159\188\239\134"):reverse()
..
"\170\230\152"..
("\230\147\189\229\175"):reverse()
..
"\151\182\229\183"..
string.char(178, 230, 131, 152, 231)
..
"\132\182\46"
,nil
,(406
*
275
*
30
-
10
~=3349492)
)
AddItemSkin("\115\111\114\97\95"..
"\113\105\121\117"
,"\228\191\174\231\144"..
"\134\233\155\168"..
string.char(228, 188, 158, 126, 228, 191)
..
"\174\231\144"..
"\134\233\155\168\228\188"..
("\228\126\158"):reverse()
..
("\231\174\191"):reverse()
..
("\155\233\134\144"):reverse()
..
"\168\228\188"..
string.char(158, 126)

,888)
 AddItemSkin("\115\111\114\97"..
"\95\108\121\106"
,"\229\188\130\228\184"..
"\150\231\155\184"..
("\44\135\129\233"):reverse()
..
("\228\189\176\229"):reverse()
..
"\186\171\231\149"..
string.char(153, 229, 189)
..
"\177"
,888)
AddItemSkin(string.char(115, 111, 114, 97, 95, 108)
..
string.char(97, 110, 116, 101, 114)
..
"\110"
,"\232\174\169\229"..
"\174\131\229"..
string.char(230, 160, 189, 228, 166, 184)
:reverse()
..
string.char(137, 190, 229, 136)
..
string.char(155, 229, 176)
:reverse()
..
("\154\231\182\174\229\158"):reverse()
..
"\132\232\183"..
("\175"):reverse()

,450)
AddItemSkin(string.char(115, 111, 114)
..
"\97\95\108"..
string.char(97, 110, 116, 101)
..
string.char(114, 110, 95, 121)
..
string.char(104)

,"\232\144\189\230"..
"\168\177\230\140\135"..
string.char(229, 188, 149, 229, 155)
..
"\158\229\174\182\231"..
"\154\132\232"..
string.char(183, 175)

,nil
,( true
 and
 
 false
 and
 
 false
 and
 
 false
 and
 not
 false
 or
 
 true
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
 and
 not
 false
 or
 not
 false
)
)
AddItemSkin(string.char(97, 114, 111, 115)
:reverse()
..
"\95\114\105\110\103"
,"\230\173\187\231\148\159"..
string.char(229, 165, 145, 233, 152, 148)
..
string.char(44, 228, 184, 142, 229, 173)
..
"\144\230\136\144\232"..
"\175\180"
,450)
AddItemSkin("\115\111\114"..
string.char(97, 50, 99)
..
"\104\101\115\116"..
"\95\115\110\115"
,"\230\131\133"..
string.char(228, 185, 139)
..
"\230\137\128"..
"\231\148\159"..
"\239\188\140\231\148"..
"\177\229\191\131\232"..
"\128\140\232"..
"\181\183\10"..
"\81\231\190\164\57\52"..
string.char(51, 49, 48, 53, 56)
..
"\48\52\10\233"..
"\162\134\229"..
("\230\185\150\230\150\143"):reverse()
..
"\179\149\231\156"..
("\229\164\190\231\139"):reverse()
..
string.char(133, 172, 229, 145, 138)

)
 AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116"..
"\95\112\107\113"
,"\229\176\177\229"..
string.char(134, 179, 229, 174, 154)
..
"\230\152\175\228"..
"\189\160\228"..
"\186\134\44\231"..
"\154\174\229\141"..
"\161\228\184\152\33"
)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115\116"..
"\95\106\110"..
"\103"
,"\230\157\176\229\176\188"..
("\229\176\157\230"):reverse()
..
"\176\188\230"..
string.char(157, 176, 229, 176)
..
"\188\230\157"..
"\176\229\176"..
"\188\230\157\176\239"..
"\188\129"
)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116"..
string.char(95, 121, 98)

,string.char(228, 187, 142, 229)
..
"\137\141\231"..
"\154\132\233"..
"\130\163\228"..
string.char(184, 170, 228)
..
"\188\138\229"..
("\151\230\131\184"):reverse()
..
"\169\229\183\178\231\187"..
"\143\228\184\141"..
"\229\156\168\228\186\134"..
"\239\188\140\10\231"..
"\142\176\229\156\168"..
string.char(229, 156, 168)
..
string.char(160, 189, 228)
:reverse()
..
"\233\157\162"..
"\229\137\141\231\154"..
string.char(132, 230, 152, 175)
..
"\229\143\182\232\181"..
"\171\233\130"..
"\163\230\139"..
"\137\228\188\138"..
("\46\131\184\229"):reverse()

)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115"..
"\116\95\122\122"..
"\98"
,string.char(231, 143, 141, 231, 143, 160)
..
"\232\180\157\233\135"..
"\140\231\156\159\231\154"..
"\132\230\156"..
"\137\231\143\141\231"..
"\143\160"
)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115"..
"\116\95\106\99\121"
,"\233\163\158"..
string.char(229, 143, 182, 229)
..
"\191\171\229"..
"\136\128\239"..
string.char(188, 129)

,300)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115"..
"\116\95\109\108\115"
,string.char(232, 166, 129)
..
"\230\157\165"..
"\228\184\128"..
"\230\157\175"..
"\228\185\136\239\188"..
string.char(159)

)
 AddItemSkin("\115\111\114"..
string.char(97, 50, 99, 104, 101, 115)
..
"\116\95\120"..
"\122\122"
,string.char(228, 191, 161, 232)
..
string.char(162, 171, 230, 136, 145)
..
string.char(229, 144, 131, 230)
..
"\142\137\228\186"..
"\134"
)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115"..
"\116\95\100\100"
,"\229\134\141\231\187"..
"\153\230\136"..
"\145\232\174\178\228"..
"\184\128\233\129"..
"\141\239\188"..
"\140\228\189\160"..
string.char(228, 142, 187, 228)
:reverse()
..
"\184\128\229\160\134\229"..
"\176\143\231"..
"\140\171\233"..
"\135\140\233\128\137"..
string.char(228, 184, 173)
..
"\230\136\145\231\154"..
"\132\230\149\133\228\186"..
string.char(139, 229, 144, 167)

)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115"..
"\116\95\115"..
string.char(103, 106)

,"\231\159\165\233\129\147"..
"\228\189\160"..
"\229\143\151\228\186"..
string.char(134, 229, 165, 189, 229, 164)
..
string.char(154, 229, 167)
..
"\148\229\177\136\239"..
"\188\140\230\137"..
"\128\228\187\165\230\138"..
"\177\230\138\177\228\189"..
"\160"
,nil
,(320
+
173
-
86
-
43
+
61
~=433)
)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101\95"..
"\120\104\108"
,string.char(231, 166, 129, 230, 173, 162)
..
"\231\148\168\229"..
("\231\180\183\229\190\176"):reverse()
..
string.char(131, 164, 231)
..
"\129\171"
,300)
AddItemSkin("\115\111\114"..
string.char(97, 50, 102, 105)
..
"\114\101\95"..
"\104\114\104"
,"\232\128\140\228\189"..
string.char(160, 44, 230, 136, 145, 231)
..
"\154\132\230\156\139"..
string.char(229, 143, 139, 10, 228)
..
"\189\160\230"..
"\137\141\230"..
"\152\175\231\156"..
"\159\230\173\163"..
string.char(231, 154, 132)
..
"\229\184\149\233"..
"\178\129"
,300)
 AddItemSkin(string.char(50, 97, 114, 111, 115)
:reverse()
..
"\102\105\114"..
"\101\95\104\104\108"
,"\230\145\184\232"..
"\128\179\230\156"..
"\181\230\152"..
"\175\231\166\129\230"..
"\173\162\228\186\139"..
"\233\161\185\33"
,300)
AddItemSkin("\115\111\114\97\50\102"..
"\105\114\101"..
"\95\104\106\108"
,"\228\186\186\229"..
("\141\137\230\182\174"):reverse()
..
"\228\184\141\230\152"..
"\175\228\188\138\229\184"..
"\131\229\145"..
"\162"
,300)
AddItemSkin("\115\111\114"..
string.char(97, 50, 105, 99, 101)
..
string.char(95, 102, 108, 111)
..
"\119\101\114"
,"\228\189\160\229\183"..
"\178\232\162"..
("\187\167\231\171"):reverse()
..
string.char(229, 135, 186, 231, 190, 164)
..
"\232\129\138\39\232"..
string.char(229, 177, 138)
:reverse()
..
"\188\128\229\175\140\232"..
"\180\181\39"
)
AddItemSkin("\115\111\114\97\50\105"..
string.char(99, 101, 95, 115, 101)
..
string.char(101, 100)

,("\165\157\230"):reverse()
..
"\231\130\185\231\167\141"..
"\229\173\144\44\232\159"..
string.char(185, 232, 159, 185)

)
AddItemSkin("\115\111\114\97"..
"\50\105\99\101\95"..
string.char(98, 104, 108)

,string.char(231, 142, 175, 230, 184)
..
"\184\230\149\180"..
"\228\184\170\230\152"..
"\159\231\179\187"..
string.char(228, 184, 128, 228, 184)
..
"\135\230\172\161\239"..
"\188\140\10\229\143"..
string.char(170, 228, 184, 186, 233)
..
"\129\135\232"..
string.char(167, 129, 228, 189, 160)

)
AddItemSkin("\115\111\114\97\50\105"..
"\99\101\95\98\121"..
string.char(98)

,"\231\169\191\230\162"..
"\173\233\163"..
"\142\233\155\170"..
("\187\231\44"):reverse()
..
"\189\230\148\190\229\175"..
"\146\232\138\146\33"
,300)
AddItemSkin("\115\111\114"..
string.char(97, 50, 105)
..
"\99\101\95"..
"\106\113\114"
,"\229\143\189\228\188\129"..
"\229\136\131\228\184"..
"\141\230\152\175"..
"\230\156\186\229\153\168"..
"\228\186\186\33"
)
 AddItemSkin("\115\111\114\97"..
"\50\98\105\114\100\99"..
"\104\101\115\116\95"..
("\100\103\103"):reverse()

,"\229\156\168\228\184"..
string.char(139, 230, 177, 159)
..
"\230\185\150\228\186"..
"\186\231\167\176\232"..
("\135\143\232\135\143"):reverse()
..
string.char(230, 175, 146, 239)
..
"\188\140\10\230\154\151"..
"\229\153\168"..
string.char(156, 166, 230)
:reverse()
..
string.char(230, 142, 146, 229, 144, 141)
..
("\228\172\172\231"):reverse()
..
string.char(184, 131, 229, 141)
..
("\131\184\228\129"):reverse()
..
"\239\188\140\10\231"..
"\139\172\233"..
"\151\168\231\187\157"..
"\230\138\128\45"..
"\45\229\165"..
"\189\232\143\135\230\175"..
string.char(146, 239, 188, 129)

)
AddItemSkin(("\98\50\97\114\111\115"):reverse()
..
"\105\114\100\99\104\101"..
"\115\116\95\120"..
string.char(122, 121, 98)

,("\230\191\165\232"):reverse()
..
string.char(160, 188, 230, 150)
..
"\175\230\175\148"..
string.char(228, 184, 142, 228)
..
"\187\153\229"..
"\173\144\228"..
"\188\138\229"..
"\184\131\229\191\131\229"..
"\191\131\231\155\184"..
"\229\141\176"..
"\228\186\134"..
"\239\188\129"
,300)
AddItemSkin(string.char(115, 111, 114)
..
"\97\50\98\105"..
"\114\100\99\104\101\115"..
"\116\95\104\100"..
"\119"
,"\230\129\173"..
"\229\150\156\228\189\160"..
"\239\188\140"..
"\232\162\171\233\156"..
("\178\230\188\160\230\141"):reverse()
..
string.char(189, 229, 168, 140, 232, 131)
:reverse()
..
"\149\229\143\150"..
string.char(228, 186, 134, 239)
..
"\188\129"
)
AddItemSkin(string.char(115, 111, 114)
..
string.char(97, 95, 115, 105)
..
"\103\110\95"..
"\109\121\121"
,"\231\190\138"..
("\191\133\232"):reverse()
..
"\229\165\189\229\144\131"..
("\187\228\128\137\230\44"):reverse()
..
"\165\229\128\188\229"..
("\33\151\190"):reverse()

)
AddItemSkin("\115\111\114\97\95\115"..
"\105\103\110"..
"\95\121\101\122"
,"\229\138\160\229"..
("\129\188\239\167\164"):reverse()
..
"\229\138\160\229\164\167"..
"\239\188\129\229\134"..
"\141\230\143\143"..
"\228\184\128"..
"\229\156\136\239\188"..
"\129"
,300)
AddItemSkin("\115\111\114"..
"\97\95\115\109"..
string.char(97, 108, 108)
..
"\108\105\103"..
"\104\116\95\102\108"
,"\232\191\153\230"..
"\152\175\233\163\142\233"..
string.char(147, 131, 10, 228, 184, 141)
..
"\230\152\175"..
"\232\138\177"
)
 AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\115\109\97\108\108"..
"\108\105\103"..
string.char(95, 116, 104)
:reverse()
..
string.char(106, 106)

,"\229\152\191\239"..
"\188\129\10\230\136\145"..
("\147\129\233\165\159\231"):reverse()
..
"\228\184\128"..
string.char(228, 184, 170, 232, 131, 189)
..
"\232\174\169\230"..
"\136\145\229\156\168\232"..
"\181\176\232\183"..
"\175\231\154\132\230"..
"\151\182\229\128\153\239"..
"\188\140\10\228\184\141"..
"\232\162\171\231\187\183"..
"\229\184\166"..
"\231\187\138\229\128\146"..
"\231\154\132\229"..
string.char(138, 158, 230, 179, 149, 239)
..
string.char(188, 140, 10, 228, 189, 160)
..
"\228\187\172"..
("\179\131\230"):reverse()
..
"\229\144\172\229"..
"\144\151\239\188\159"
)
AddItemSkin(("\114\111\115"):reverse()
..
("\104\115\95\97"):reverse()
..
string.char(111, 117, 98, 97, 110, 95)
..
"\120\100"
,string.char(229, 141, 184, 228)
:reverse()
..
"\144\131\233\165\173\239"..
string.char(188, 140, 232, 191, 153, 230)
..
"\160\183\230\136\145\229"..
("\191\149\233\177\176"):reverse()
..
"\228\184\141\229\164"..
("\239\134\186\228\167"):reverse()
..
"\188\140\10"..
string.char(230, 136, 145, 229, 176)
..
"\177\229\143\175\228"..
"\187\165\228\184\141\231"..
"\166\187\229\188"..
"\128\228\189\160\228"..
"\186\134\229"..
"\144\151"
,nil
,(373
-
408
-
369
*
197
*
81
~=-5888161)
)
AddItemSkin("\115\111\114\97"..
"\95\115\104\111\117"..
string.char(98, 97, 110)
..
"\95\107\102\107"
,"\229\166\136\33"
,nil
,(123
-
88
-
199
==-164)
)
AddItemSkin("\115\111\114\97"..
"\95\115\104\111\117"..
string.char(98, 97, 110, 95, 108, 121)

,string.char(230, 181, 129, 232, 144)
..
"\164\231\131"..
string.char(164, 228, 184, 178)
..
("\184\228\126"):reverse()
..
string.char(137, 229, 133)
..
"\131\228\184\128"..
string.char(228, 184, 178)
..
"\126\229\141"..
"\129\229\133"..
"\131\228\184\137\228"..
("\126\178\184"):reverse()

,nil
,(269
-
198
+
214
==285)
)
AddItemSkin("\115\111\114"..
"\97\95\112"..
"\101\97\114"..
"\108\95\112\100"
,"\228\186\186"..
("\184\228\182\174\229"):reverse()
..
("\175\152\230\141"):reverse()
..
string.char(232, 131, 150)
..
"\10\229\143\170\230\152"..
"\175\229\143\171"..
string.char(232, 131, 150, 228, 184, 129)

)
 AddItemSkin(string.char(115, 111, 114, 97, 50)
..
"\98\97\115"..
string.char(103, 105, 98, 95, 101)
:reverse()

,"\232\176\129"..
"\228\184\141"..
("\172\230\156\150\229"):reverse()
..
string.char(162, 229, 164, 167, 231, 154)
..
"\132\229\145\162\10\229"..
string.char(230, 44, 185, 175)
:reverse()
..
"\136\145\232\175\180\231"..
"\154\132\229\176\177"..
"\230\152\175"..
"\231\165\173\229\157"..
string.char(155)
:reverse()

)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115"..
"\101\95\115\109\97"..
"\108\108"
,"\232\176\129\228\184\141"..
"\229\150\156\230\172"..
"\162\229\176\143"..
"\231\154\132\229\145"..
"\162\10\229\175"..
"\185\44\230\136\145\232"..
string.char(175, 180, 231, 154, 132, 229)
..
"\176\177\230\152\175\231"..
"\165\173\229\157"..
"\155"
)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115\101\95"..
string.char(122, 108, 104)

,"\232\191\153\230\152"..
"\175\233\152\191\231\180"..
"\171"
)
AddItemSkin(string.char(115, 111, 114, 97, 50)
..
"\98\97\115"..
string.char(101, 95, 104)
..
"\108\104"
,"\232\191\153\230"..
"\152\175\233\152\191"..
"\230\156\177"
)
AddItemSkin("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
"\95\115\111\114"..
"\97"
,"\230\136\145\228\185\159"..
"\228\188\154"..
"\230\152\175\231\172\172"..
"\228\184\128"..
"\229\144\141"..
"\229\144\151"
)
AddItemSkin("\115\111\114\97"..
"\98\111\119"..
("\108\95\116\111\110\107"):reverse()
..
string.char(100)
:reverse()

,"\229\143\174\229\143"..
"\174\229\189\147\239"..
("\174\143\229\140\188"):reverse()
..
"\229\143\174\229\189\147"..
"\10\233\147"..
"\131\229\132\191"..
"\229\147\141\229\143\174"..
"\229\189\147"
)
AddItemSkin(string.char(114, 111, 115)
:reverse()
..
"\97\98\97\103\95"..
"\115\100\108"
,"\229\152\152"..
("\175\232\163\156\229\44"):reverse()
..
"\158\232\128\129\228"..
"\186\186\232\166"..
"\129\230\157\165"..
"\228\186\134"
)
AddItemSkin("\115\111\114\97\104\97"..
string.char(116, 95, 115, 100)

,"\229\152\152\44"..
"\229\156\163\232\175"..
string.char(158, 232, 128, 129, 228)
..
"\186\186\232\166"..
"\129\230\157\165"..
"\228\186\134"
)
 AddItemSkin("\115\111\114"..
"\97\50\98\117\105"..
"\108\100\95\100\101\99"..
"\111\114\95\106"..
("\115\115"):reverse()

,string.char(231, 186, 162, 228, 188)
..
"\158\228\188\158"..
"\239\188\140\231\153\189"..
string.char(230, 157, 134, 230, 157, 134)
..
"\10\229\144\131"..
"\229\174\140\228"..
string.char(181, 232, 128, 184)
:reverse()
..
string.char(183, 232, 186, 186, 230)
..
"\157\191\230\157"..
"\191\227\128\130"
,300)
AddItemSkin("\115\111\114\97\50\98"..
"\117\105\108"..
("\101\100\95\100"):reverse()
..
"\99\111\114\95\115"..
"\109\97\108\108"
,"\232\191\153\230\152"..
"\175\228\184\173"..
"\230\157\175\239"..
"\188\140\10\232\191\153"..
"\230\152\175\229\164"..
"\167\230\157\175\239"..
"\188\140\10"..
string.char(232, 191, 153)
..
string.char(230, 152, 175)
..
"\232\182\133"..
"\229\164\167\230\157"..
"\175\46"
,60)
AddItemSkin(("\50\97\114\111\115"):reverse()
..
"\98\117\105\108"..
string.char(100, 95, 100, 101, 99)
..
"\111\114\95\109\101\100"..
"\105\117\109"
,"\232\191\153\230\152"..
"\175\228\184"..
"\173\230\157\175"..
("\191\232\10\140\188\239"):reverse()
..
"\153\230\152\175"..
"\229\164\167\230\157"..
"\175\239\188\140"..
string.char(10, 232, 191, 153, 230, 152)
..
"\175\232\182\133\229"..
("\230\167\164"):reverse()
..
string.char(157, 175, 46)

,60)
AddItemSkin("\115\111\114\97\51\115"..
"\119\111\114"..
"\100\95\114\111\115"..
"\101"
,"\230\152\175\231\142\171"..
"\232\175\173"..
"\239\188\129\228"..
"\184\141\230\152"..
"\175\230\162\133\233\155"..
string.char(168, 239, 188, 129)

)
AddItemSkin(string.char(114, 111, 115)
:reverse()
..
"\97\95\119"..
"\113\95\98\98\106"
,string.char(232, 191, 153, 231)
..
string.char(142, 169, 230, 132, 143, 231)
..
string.char(156, 159, 231, 154, 132)
..
"\232\131\189\229\135\186"..
string.char(231, 154, 174, 232, 130, 164)
..
"\229\144\151\63"
)
AddItemSkin(("\114\111\115"):reverse()
..
("\107\119\111\98\97"):reverse()
..
"\110\111\116\95\100"..
"\119"
,"\231\171\175\229"..
"\141\136\232\138\130\229"..
"\191\133\233\161\187\229"..
"\144\131\231\178"..
"\189\229\173"..
"\144\229\144"..
"\151"
,300)
 AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\112\101\97\114\108\95"..
"\115\108\109"
,"\232\144\140\231"..
("\175\152\230\139\142"):reverse()
..
"\232\176\129\63"
)
AddItemSkin(string.char(112, 95, 97, 114, 111, 115)
:reverse()
..
"\101\97\114\108\95"..
string.char(116, 121)

,"\233\152\191"..
"\231\143\141\231\136"..
"\177\228\184\138"..
"\228\186\134"..
"\233\152\191\229"..
("\186\188"):reverse()

)
AddItemSkin("\115\111\114\97"..
("\113\116\95"):reverse()
..
"\121\95\113\121"
,"\228\184\141\230\173"..
"\162\228\184\131"..
"\229\164\149\44\230"..
"\155\180\229"..
"\156\168\230"..
"\156\157\229\164"..
"\149\10\32\32\32"..
"\32\45\45\45"..
string.char(50, 48, 50)
..
"\52\228\184\131\229\164"..
string.char(149, 231, 186, 170, 229, 191)
..
"\181"
)
AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95\113"..
string.char(107, 121, 122)

,"\228\188\151\231\148\159"..
"\228\184\186"..
"\230\163\139\44"..
"\228\184\128\230\142"..
string.char(146, 233, 183)
:reverse()
..
"\177\229\157"..
"\164"
)
AddItemSkin("\115\111\114"..
"\97\95\116"..
"\113\121\95\120\113\108"
,"\229\176\143\233\157"..
("\184\228\153\190\233\146"):reverse()
..
"\186\228\187"..
string.char(128, 228, 185)
..
string.char(136, 230, 152, 175, 231)
..
"\186\162\232\137"..
"\178\231\154\132\63"
)
AddItemSkin("\115\111\114\97\95\108"..
string.char(105, 103, 104)
..
"\116\102\108\105\101"..
"\114\95\116\106\122"..
string.char(122)

,"\233\151\178\230"..
"\157\165\230\151"..
"\160\228\186"..
string.char(139, 239, 188, 140, 232, 186)
..
"\186\231\171"..
string.char(185, 229, 144, 172)
..
"\230\155\178"
)
 AddItemSkin("\115\111\114\97"..
"\95\108\105\103\104\116"..
"\102\108\105\101\114\95"..
"\98\101\101\120"
,string.char(232, 191, 153, 230, 152, 175)
..
string.char(231, 134, 138)
..
"\239\188\140"..
"\10\228\184"..
"\141\230\152\175\66\101"..
"\101\239\188\129"
)
AddItemSkin("\115\111\114\97"..
"\98\111\119\107"..
"\110\111\116\95\115\98"..
"\121"
,"\228\184\141\232"..
"\131\189\229\155\160"..
"\228\184\186"..
"\230\152\175"..
string.char(229, 165, 179, 229)
..
"\173\169\229\173"..
string.char(144, 229, 176, 177, 232)
..
"\167\137\229\190\151"..
"\232\135\170\229\183\177"..
"\230\152\175"..
"\229\188\177\10\232"..
"\128\133\239\188\140\229"..
"\166\130\230\158"..
"\156\228\184\141\229\188"..
"\186\229\164"..
"\167\229\176\177\228"..
"\184\141\232\131\189\228"..
"\191\157\230\138"..
"\164\232\186\171\232\190"..
"\185\10\230\156\128"..
"\233\135\141"..
string.char(232, 166, 129)
..
"\231\154\132\228\186\186"
,nil
,(282
*
352
-
209
~=99064)
)
AddItemSkin("\115\111\114\97\109\97"..
"\103\105\99\95\115\98"..
"\121"
,"\230\156\137\229\133"..
"\137\231\154\132\229\156"..
"\176\230\150\185"..
"\229\176\177\230\156\137"..
"\233\187\145\230\154\151"..
"\239\188\140\10\233\187"..
"\145\230\154"..
string.char(151, 229, 145)
..
"\188\229\148\164\229"..
"\133\137\230\152\142"..
string.char(239, 188, 140, 229, 133)
..
"\137\230\152\142\228"..
string.char(185, 159, 229, 145, 188, 229)
..
"\148\164\233\187"..
"\145\230\154\151"..
"\227\128\130"
,nil
,( false
 or
 not
 true
 or
 not
 false
 or
 not
 false
 and
 
 false
 and
 not
 true
 and
 
 false
 and
 
 true
 or
 not
 false
 and
 
 false
 and
 not
 true
)
)
 AddItemSkin("\115\111\114\97"..
"\98\97\103\95\115"..
"\98\121"
,string.char(230, 136, 145)
..
"\230\131\179\230"..
"\136\144\228\184\186"..
string.char(233, 163, 142)
..
"\239\188\140\231"..
"\169\191\232"..
"\191\135\230\151\160"..
"\229\189\162"..
"\231\154\132\233\152"..
"\187\229\138"..
("\140\188\239\155"):reverse()
..
("\231\170\135\232\10"):reverse()
..
"\148\177\229\156"..
("\158\163\233\176"):reverse()
..
string.char(130, 128, 227, 148, 191, 231)
:reverse()

,nil
,(447
*
77
*
457
+
117
+
158
==15729758)
)
AddItemSkin("\115\111\114\97\104\97"..
"\116\95\115\98"..
("\121"):reverse()

,"\228\184\128\229\174\154"..
"\230\152\175\231\154\132"..
"\239\188\140\230\151"..
"\160\230\149\176\230"..
"\172\161\231\154"..
"\132\233\130\130\233"..
string.char(140, 188, 239, 133, 128)
:reverse()
..
string.char(10, 228, 184, 128, 229, 174)
..
"\154\230\152\175\228\184"..
"\186\228\186"..
"\134\229\146\140"..
"\231\139\172\228"..
"\184\128\230\151"..
"\160\228\186\140\231"..
"\154\132\10\233"..
"\130\163\228\184\170\228"..
"\186\186\231\155\184\233"..
"\129\135\229\144\167"..
"\227\128\130"
,nil
,(134
-
388
-
360
*
476
==-171614)
)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
string.char(116, 113, 121, 95, 115)
..
"\98\121"
,"\230\156\136\228\185\139"..
"\229\134\149\229"..
"\135\186\229\135\187"..
"\239\188\129"
,nil
,( false
 and
 
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
 or
 
 true
 and
 not
 false
 and
 
 true
 or
 not
 true
 and
 not
 false
)
)
AddItemSkin("\115\111\114"..
"\97\95\116"..
string.char(113, 121, 95, 98)
..
"\111\120\95"..
"\115\98\121"
,"\230\175\129"..
"\231\129\173"..
string.char(228, 185, 139)
..
("\230\142\144\229"):reverse()
..
"\152\175\229\184\140"..
"\230\156\155\229"..
"\146\140\229\134"..
"\141\231\148"..
("\128\227\159"):reverse()
..
string.char(130)

,nil
,(272
+
418
-
6
*
61
~=332)
)
 AddItemSkin(string.char(115, 111, 114, 97, 95)
..
string.char(115, 105, 103)
..
"\110\95\119\115"..
string.char(113, 121)

,"\228\184\135\229\156\163"..
string.char(231, 139, 130)
..
string.char(230, 172, 162)
..
"\239\188\140\230"..
string.char(151, 160, 228, 185, 144)
..
"\228\184\141\228\189"..
string.char(156, 239, 188, 129)

)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\115\109\97\108\108\108"..
"\105\103\104\116"..
("\113\115\119\95"):reverse()
..
"\121"
,"\228\184\141\231\187\153"..
"\231\179\150"..
"\229\176\177\230\138\138"..
"\228\189\160\230\138\147"..
"\232\181\183\230\157\165"..
"\229\144\131\230\142\137"..
"\239\188\129"
)
AddItemSkin("\115\111\114\97"..
("\103\97\109"):reverse()
..
("\115\119\95\99\105"):reverse()
..
"\113\121"
,"\230\136\145\229\176"..
("\231\171\142\231\134"):reverse()
..
"\145\176\232\151"..
"\143\228\186\142\232\186"..
"\171\229\144"..
"\142\44\10\230\156\159"..
string.char(231, 155, 188, 228, 184, 142)
..
"\228\189\160\232\181\180"..
"\231\186\166\46"
)
AddItemSkin(string.char(101, 116, 97, 114, 111, 115)
:reverse()
..
"\108\101\95\119"..
string.char(115, 113, 121)

,string.char(229, 156, 168)
..
string.char(230, 136, 145, 232)
..
"\141\146\231\152\160\231"..
"\154\132\229\156\159"..
"\229\156\176\228\184"..
"\138\44\10\228\189"..
string.char(160, 230, 152, 175, 230)
..
("\229\128\156"):reverse()
..
"\144\142\231\154\132"..
string.char(231, 142, 171, 231)
..
"\145\176"
)
AddItemSkin("\115\111\114"..
("\107\119\111\98\97"):reverse()
..
"\110\111\116"..
"\95\119\115\113\121"
,"\230\156\137\228"..
"\186\186\233\170\130\228"..
"\189\160\233\135\142"..
string.char(229, 191, 131, 229, 139, 131)
..
string.char(229, 139, 131, 239)
..
"\188\140\10"..
("\228\137\156\230"):reverse()
..
"\186\186\231\136"..
string.char(177, 228, 189, 160, 231, 129)
..
("\230\130\173\233\181"):reverse()
..
"\156\137\231\129\171"
)
 AddItemSkin(("\108\95\97\114\111\115"):reverse()
..
"\105\103\104"..
"\116\102\108"..
"\105\101\114\95\119\115"..
"\113\121"
,"\229\147\135\233\133"..
"\183\239\188\129"..
"\229\147\135\233\133\183"..
"\239\188\129"..
"\229\147\135\233\133\183"..
"\229\147\135\233\133\183"..
"\239\188\129"
)
local _th_I_s_B_U_g_={sora_none=
"\115\111\114\97"..
"\95\117\110"..
string.char(105, 102, 111)
..
string.char(114, 109, 115)

}
local __t_HI_S_b_UG_=require"widgets/screen"local __THI_s__Bu__g_=require"widgets/text"local _tH__I__S_b_U__g_=require"widgets/uianim"local __tH_i_S_B_U__g=require"widgets/image"local T__h_i__s__B__U_g=require"widgets/widget"local __t__HI_s_B_Ug=require"widgets/redux/templates"local _TH_IS__bU_G=require"widgets/redux/accountitemframe"local __t__hi_s__B_UG__=5;local t__Hi_Sb_UG__=44;local __tH_i_Sbu_G__=300;local __T_h_Is__b__UG_=40;local T_H__i__s__b__u__g__=BUTTONFONT;local __tH__i_s_B_u_g__=32;local __T__HI__s__bu_G=0.6;local __THisB__u_G=-55;local _t__H_isb__u_g=UICOLOURS["\87\72\73"..
"\84\69"]local T__h__i_S__bU_g_=UICOLOURS[string.char(71, 82, 69, 89)
] PushNoConnectScr=function(T_h__I_s_B__Ug_)
 local t__h__i_S__bUg_=T_h__I_s_B__Ug_==1 and"\231\155\174"..
string.char(229, 137, 141, 230, 151, 160)
..
("\177\148\231\149\179\230"):reverse()
..
"\228\186\142"..
"\107\108\101\105"..
"\229\142\159\229\155"..
"\160\230\136"..
"\150\232\128\133\229\133"..
"\182\228\187\150\229"..
string.char(142, 159, 229)
..
"\155\160\10\229\189"..
"\147\229\137"..
"\141\229\174\162"..
string.char(230, 136, 183, 231, 171, 175)
..
"\230\151\160\230\179\149"..
"\232\191\158\230\142\165"..
"\229\136\176"..
"\231\189\145"..
"\231\187\156\10\232"..
"\175\183\230"..
"\140\137\231"..
"\133\167\230\143\144\231"..
string.char(164, 186, 232)
..
"\191\155\232"..
"\161\140\230\147\141\228"..
string.char(189, 156)

or"\231\155\174"..
"\229\137\141"..
"\230\151\160\230\179"..
string.char(149, 231, 148, 177)
..
"\228\186\142\107\108"..
"\101\105\229\142\159\229"..
"\155\160\230\136\150\232"..
"\128\133\229\133\182\228"..
"\187\150\229"..
string.char(142, 159, 229, 155)
..
"\160\10\229"..
"\189\147\229\137"..
("\138\229\141\156\230\141"):reverse()
..
("\168\153\229\161"):reverse()
..
("\230\160\151\230"):reverse()
..
string.char(158, 191, 232, 149, 179)
:reverse()
..
"\230\142\165\229\136"..
"\176\231\189\145\231\187"..
"\156\10\232\175"..
"\183\230\140"..
"\137\231\133"..
"\167\230\143\144\231\164"..
string.char(186, 232, 191, 155, 232, 161)
..
("\189\228\141\147\230\140"):reverse()
..
"\156"
SoraPushPopupDialog("\229\176\143"..
string.char(231, 169, 185, 231)
..
"\154\132\230\184\169\233"..
"\166\168\230\143\144\231"..
"\164\186"
,t__h__i_S__bUg_,{"\230\159\165\231"..
"\156\139\230\143\144\231"..
"\164\186"
,
"\229\133\179\233\151\173"
}
,{function()
VisitURL("\104\116\116\112"..
"\58\47\47"..
"\119\105\107"..
"\105\46\102\108\97\112"..
"\105\46\99\110\47"..
"\110"
,( false
 and
 
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
 
 true
 and
 
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
)
)
end
,
nil
}
)
end
PushCDKScr=function(__ThI__s__bU__g)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local t_hIs_B_u_g__=_t_H__isBug("\115\111\114\97\95\110"..
"\111\110\101"
)
t_hIs_B_u_g__[("\108\110\117"):reverse()
..
string.char(111, 99, 107, 116, 101, 120)
..
"\116"]:SetString(__ThI__s__bU__g or"\228\187\133"..
("\142\186\228\168\148\231"):reverse()
..
"\232\167\163\233\148"..
"\129\231\169\185\229"..
"\166\185\67"..
"\68\75"
)
TheFrontEnd:PushScreen(t_hIs_B_u_g__)
return t_hIs_B_u_g__ end
PushItemScr=function(_th_I__S_B_u__g_)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local __T_H__Is_bu_g_=t__h_i__s__b_U_G__()
TheFrontEnd:PushScreen(__T_H__Is_bu_g_)
return __T_H__Is_bu_g_ end
 AddClassPostConstruct(string.char(119, 105, 100, 103, 101, 116)
..
"\115\47\114"..
"\101\100\117\120\47"..
("\101\116\105"):reverse()
..
"\109\101\120\112"..
string.char(108, 111, 114, 101, 114)

,function(self)
local _t__HI__SbU_G__=self["\95\83\104\111\119\73"..
"\116\101\109\83\101"..
"\116\73\110\102"..
string.char(111)
]self["\95\83\104\111"..
string.char(119, 73, 116, 101, 109, 83)
..
"\101\116\73\110"..
string.char(102, 111)
]=function(_t_Hi_s_B_u_g,...
)
if __T_HI_S_bUG[_t_Hi_s_B_u_g["\115\101\116"..
"\95\105\116"..
"\101\109\95"..
("\101\112\121\116"):reverse()
]]then _t_Hi_s_B_u_g["\115\101\116"..
"\95\105\110\102\111"..
string.char(95, 115, 99, 114, 101)
..
string.char(101, 110)
]=__T_HI_S_bUG[_t_Hi_s_B_u_g["\115\101\116\95\105\116"..
"\101\109\95"..
"\116\121\112"..
string.char(101)
]](_t_Hi_s_B_u_g,_t_Hi_s_B_u_g[string.char(115, 101, 116, 95, 105)
..
"\116\101\109\95"..
"\116\121\112\101"])
_t_Hi_s_B_u_g["\115\101\116\95\105\110"..
"\102\111\95\115\99"..
"\114\101\101\110"][string.char(111, 119, 110, 101)
..
"\100\95\98\121\95\119"..
("\114\100\114\97"):reverse()
..
"\111\98\101"]=( false
 and
 not
 true
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
 not
 false
 or
 
 false
 and
 not
 false
 and
 
 false
 or
 
 false
 and
 
 false
 and
 
 true
)
TheFrontEnd:PushScreen(self["\115\101\116"..
"\95\105\110\102\111\95"..
"\115\99\114\101\101\110"])
return end;return _t__HI__SbU_G__(_t_Hi_s_B_u_g,...
)
end
 if self["\105\110\116\101"..
string.char(114, 97, 99, 116)
..
"\95\114\111\111"..
"\116"]then self["\115\111\114\97\116"..
"\105\109\101\95\116\101"..
"\120\116"]=self["\105\110\116"..
"\101\114\97\99\116"..
"\95\114\111"..
"\111\116"]:AddChild(__THI_s__Bu__g_(CHATFONT,30,nil
,UICOLOURS["\87\72\73\84\69"])
)
self["\115\111\114\97\116"..
string.char(105, 109, 101, 95, 116, 101)
..
"\120\116"]:SetString(string["\102\111\114"..
"\109\97\116"](string.char(229, 143, 175, 231, 148, 168)
..
"\47\230\128\187\230\180"..
"\187\232\183\131\229\186"..
"\166\58\32\37\100"..
"\47\37\100"
,_Th_I__s_Bu__G,__t__h__I__s_b_U__G_+_Th_I__s_Bu__G)
)
self["\115\111\114"..
string.char(95, 101, 109, 105, 116, 97)
:reverse()
..
"\116\101\120\116"]:SetPosition(120,240)
self["\115\111\114\97\116\105"..
string.char(109, 101, 95, 116)
..
"\101\120\116"]:Hide()
self["\115\111\114"..
"\97\105\116\101\109"..
"\95\98\116\110"]=self["\105\110\116\101"..
"\114\97\99\116\95"..
"\114\111\111\116"]:AddChild(__t__HI_s_B_Ug[string.char(83, 116, 97, 110)
..
"\100\97\114"..
"\100\66\117\116"..
"\116\111\110"](function()
local t_h_iSb_ug__=PushItemScr()
end
,"\231\137\169\229\147"..
"\129\231\154\174"..
"\232\130\164"
,{130,
45}
)
)
self["\115\111\114"..
("\116\105\97"):reverse()
..
"\101\109\95\98\116"..
"\110"]:SetPosition(150,0)
self["\115\111\114"..
string.char(97, 105, 116, 101, 109, 95)
..
("\110\116\98"):reverse()
]:Hide()
end;local __T_H_I__S_B_Ug=self["\95\85\112\100"..
string.char(97, 116, 101)
..
"\73\116\101\109\83"..
"\101\108\101\99\116\101"..
"\100\73\110\102"..
"\111"]self["\95\85\112"..
"\100\97\116\101"..
"\73\116\101\109"..
string.char(83, 101, 108)
..
"\101\99\116\101\100\73"..
"\110\102\111"]=function(t_Hi__sB_U_G_,
__t__h_i__SB_u_g__,...
)
local _thiSb_U_g__=__T_H_I__S_B_Ug(t_Hi__sB_U_G_,__t__h_i__SB_u_g__,...
)
if __t__h_i__SB_u_g__ and __T_HI_S_bUG[__t__h_i__SB_u_g__]and not __T__HiSBu_g__[__t__h_i__SB_u_g__]and t_Hi__sB_U_G_["\115\101\116\95\105\110"..
"\102\111\95\98"..
"\116\110"]then t_Hi__sB_U_G_["\115\101\116\95"..
string.char(105, 110, 102, 111, 95)
..
"\98\116\110"]:SetText("\230\191\128"..
"\230\180\187"
)
t_Hi__sB_U_G_["\115\101\116\95\105\110"..
"\102\111\95\98"..
"\116\110"]:Show()
t_Hi__sB_U_G_["\115\101\116\95"..
"\105\116\101"..
string.char(109, 95, 116, 121)
..
("\101\112"):reverse()
]=__t__h_i__SB_u_g__ end;if self[string.char(115, 111, 114, 97, 116, 105)
..
("\101\116\95\101\109"):reverse()
..
"\120\116"]then if __t__h_i__SB_u_g__ and __t__h_i__SB_u_g__:match("\94\115\111\114\97"
)
then self["\115\111\114\97"..
string.char(116, 105, 109, 101, 95)
..
string.char(116, 101, 120)
..
"\116"]:Show()
else self["\115\111\114"..
string.char(101, 109, 105, 116, 97)
:reverse()
..
"\95\116\101\120\116"]:Hide()
end end;if self["\115\111\114\97\105"..
string.char(116, 101, 109, 95, 98, 116)
..
"\110"]then if __t__h_i__SB_u_g__=="\115\111\114\97\95\110"..
string.char(111, 110, 101)

then self["\115\111\114\97\105"..
"\116\101\109\95"..
string.char(98, 116, 110)
]:Show()
else self["\115\111\114\97"..
"\105\116\101"..
"\109\95\98"..
"\116\110"]:Hide()
end end;return _thiSb_U_g__ end
end
)
 AddClassPostConstruct(string.char(101, 101, 114, 99, 115)
:reverse()
..
"\110\115\47\112\108"..
"\97\121\101"..
"\114\105\110"..
"\102\111\112"..
"\111\112\117\112"..
"\115\99\114"..
"\101\101\110"
,function(self)
self["\115\111\114\97\98"..
"\116\110\114"..
"\111\111\116"]=self["\114\111\111\116"]:AddChild(T__h_i__s__B__U_g("\115\111\114"..
string.char(97, 98, 116, 110, 114)
..
"\111\111\116"
)
)
self["\115\111\114\97"..
"\98\116\110\114"..
"\111\111\116"]:SetPosition(-155,-205)
self["\115\111\114"..
string.char(97, 105, 116, 101)
..
"\109\98\116\110"]=self["\115\111\114\97\98\116"..
"\110\114\111\111\116"]:AddChild(__t__HI_s_B_Ug["\83\116\97\110\100"..
"\97\114\100"..
"\66\117\116"..
"\116\111\110"](function()
PushItemScr()
end
,"\231\137\169\229"..
"\147\129\231\154\174\232"..
"\130\164"
,{60,
30}
)
)
self["\115\111\114"..
"\97\105\116\101\109\98"..
string.char(116, 110)
]:SetPosition(35,0)
self["\115\111\114\97\99\100"..
"\107\98\116\110"]=self["\115\111\114\97"..
"\98\116\110\114\111"..
("\116\111"):reverse()
]:AddChild(__t__HI_s_B_Ug[string.char(83, 116, 97, 110, 100)
..
string.char(97, 114, 100)
..
"\66\117\116\116\111"..
string.char(110)
](function()
PushCDKScr()
end
,string.char(230, 191, 128, 230)
..
"\180\187\67\68"..
"\75"
,{60,
30}
)
)
self["\115\111\114\97"..
string.char(99, 100, 107, 98, 116)
..
"\110"]:SetPosition(-35,0)
self["\115\111\114\97"..
"\98\116\110\114\111\111"..
string.char(116)
]:Hide()
local _T__H_I_sbU_g_=self["\77\97\107\101\66"..
"\71"]self["\77\97\107\101\66"..
"\71"]=function(_T__h_I__sb_u__G_,...
)
if self["\99\117\114"..
string.char(114, 101, 110, 116, 99)
..
"\104\97\114\97\99\116"..
"\101\114"]==string.char(115, 111, 114)
..
"\97"
then self["\115\111\114\97\98\116"..
"\110\114\111\111"..
"\116"]:Show()
else self["\115\111\114\97"..
"\98\116\110"..
"\114\111\111\116"]:Hide()
end;return _T__H_I_sbU_g_(_T__h_I__sb_u__G_,...
)
end
if self["\99\117\114"..
"\114\101\110\116\99"..
string.char(104, 97, 114)
..
"\97\99\116\101\114"]=="\115\111\114\97"
then self[string.char(115, 111, 114, 97, 98, 116)
..
"\110\114\111"..
"\111\116"]:Show()
else self["\115\111\114\97\98"..
"\116\110\114\111"..
string.char(111, 116)
]:Hide()
end end
)
 local _t_H__I__s_b_u_G__=Class(__t_HI_S_b_UG_,function(self,
_T_h__I__Sb__U_G__,
_th_I__SB_ug_)
__t_HI_S_b_UG_["\95\99\116\111"..
"\114"](self,"\85\110\76\111"..
"\99\107\83"..
string.char(99, 114, 101, 101, 110)

)
self["\105\116\101"..
string.char(109)
]=_T_h__I__Sb__U_G__;self["\99\98"]=_th_I__SB_ug_;self["\98\108\97\99"..
"\107"]=self:AddChild(__t__HI_s_B_Ug["\66\97\99\107"..
"\103\114\111\117\110"..
string.char(100, 84, 105, 110, 116)
]()
)
self["\112\114\111\111\116"]=self:AddChild(__t__HI_s_B_Ug["\83\99\114\101\101"..
string.char(110, 82, 111, 111, 116)
](string.char(82, 79, 79, 84)

)
)
self["\99\100"]=SoraCD(5,(168
-
245
+
244
*
337
~=82158)
)
 self[string.char(98, 117, 116, 116)
..
string.char(111, 110, 115)
]={{text=
string.char(230, 191, 128, 230)
..
"\180\187"
,
cb=
function()
if self["\99\100"]()
then if self["\99\98"]then self["\99\98"](self,_T_h__I__Sb__U_G__)
end else SoraPushPopupDialog("\229\176\143"..
("\154\231\185\169\231"):reverse()
..
"\132\230\184\169"..
string.char(233, 166, 168, 230, 143)
..
"\144\231\164\186"
,"\232\175\183"..
"\231\168\141\229\128\153"..
string.char(229, 134, 141, 232, 175, 149)
..
"\227\128\130"
)
end end
}
,
{text=
("\151\233\179\133\229"):reverse()
..
string.char(173)

,
cb=
function()
self:Close()
end
}
}
local _thI__s__B__U_g=400;self[string.char(100, 105, 97, 108, 111, 103)
]=self["\112\114\111\111\116"]:AddChild(__t__HI_s_B_Ug["\67\117\114\108"..
"\121\87\105\110"..
string.char(100, 111, 119)
](_thI__s__B__U_g,450,STRINGS[string.char(78, 65, 77, 69, 83)
][_T_h__I__Sb__U_G__],self["\98\117\116\116\111"..
"\110\115"])
)
self[string.char(99, 111, 110)
..
"\116\101\110\116"..
"\95\114\111\111"..
("\116"):reverse()
]=self["\112\114\111\111\116"]:AddChild(T__h_i__s__B__U_g("\99\111\110\116\101\110"..
"\116\95\114"..
"\111\111\116"
)
)
self["\99\111\110\116\101\110"..
"\116\95\114\111"..
"\111\116"]:SetPosition(200,-150)
self[string.char(97, 110, 105, 109)
..
"\95\114\111\111\116"]=self["\99\111\110\116"..
string.char(101, 110, 116, 95, 114, 111)
..
("\116\111"):reverse()
]:AddChild(T__h_i__s__B__U_g(string.char(97, 110, 105, 109)
..
"\95\114\111\111"..
("\116"):reverse()

)
)
self[string.char(97, 110, 105, 109, 95, 114)
..
"\111\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self[string.char(97, 110, 105)
..
string.char(109, 95, 114, 111)
..
"\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self["\97\110\105\109"..
"\95\114\111"..
"\111\116"]:SetScaleMode(SCALEMODE_PROPORTIONAL)
self["\97\110\105\109"..
string.char(95, 114, 111)
..
"\111\116"]:SetPosition(-150,-50)
self["\97\110\105"..
("\109"):reverse()
]=self["\97\110\105"..
string.char(109, 95, 114, 111)
..
"\111\116"]:AddChild(_tH__I__S_b_U__g_()
)
 self["\97\110\105\109\115"..
"\116\97\116\101"]=self["\97\110\105\109"]:GetAnimState()
local __T__H__Is__bu__g=_th_I_s_B_U_g_[_T_h__I__Sb__U_G__]or _T_h__I__Sb__U_G__;local __t__h_i_Sb_u_G__=__T__H__Is__bu__g;local __Th__IS_b__U__G_=GetSkin(__T__H__Is__bu__g)
if __Th__IS_b__U__G_ and __Th__IS_b__U__G_["\105\115\105"..
"\116\101\109\115"..
string.char(107, 105, 110, 115)
]then __t__h_i_Sb_u_G__="\115\111\114\97"..
"\95\117\110\105\102\111"..
string.char(114, 109, 115)

end;self["\97\110\105\109\115"..
"\116\97\116\101"]:SetBuild(__t__h_i_Sb_u_G__)
self[string.char(97, 110, 105, 109)
..
"\115\116\97\116\101"]:SetBank("\119\105\108\115\111\110"
)
self["\97\110\105\109\115"..
("\101\116\97\116"):reverse()
]:PlayAnimation(string.char(101, 116, 111, 109, 101)
:reverse()
..
("\111\108\95\76\88"):reverse()
..
string.char(111, 112, 95)
..
"\100\97\110\99"..
"\101\48"
,(159
+
255
-
413
-
498
*
142
==-70715)
)
self[string.char(97, 110, 105, 109, 115)
..
string.char(116, 97, 116, 101)
]:AddOverrideBuild(string.char(112, 108, 97)
..
"\121\101\114\95"..
"\101\109\111\116\101"..
"\95\101\120\116\114\97"
)
self[string.char(97, 110, 105)
..
string.char(109)
]:SetFacing(FACING_DOWN)
self["\97\110\105\109"]:SetScale(0.8,0.8,0.8)
self["\97\110\105\109"..
"\115\116\97\116\101"]:Hide("\65\82\77\95\99"..
"\97\114\114\121"
)
self["\97\110\105\109\115\116"..
string.char(97, 116, 101)
]:Hide("\104\101\97"..
string.char(100, 95, 104, 97)
..
"\116"
)
self["\97\110\105\109"..
"\115\116\97"..
"\116\101"]:Hide("\72\65\73\82"..
("\84\65\72\95"):reverse()

)
 self["\105\99\111\110"]=self[string.char(99, 111, 110, 116)
..
"\101\110\116"..
"\95\114\111"..
"\111\116"]:AddChild(_tH__I__S_b_U__g_()
)
self["\105\99\111\110"]:GetAnimState()
:SetBank("\97\99\99\111\117\110"..
string.char(116, 105, 116, 101, 109)
..
"\95\102\114\97"..
string.char(101, 109)
:reverse()

)
self["\105\99\111\110"]:GetAnimState()
:SetBuild("\97\99\99"..
"\111\117\110\116\105\116"..
"\101\109\95"..
string.char(102, 114, 97, 109, 101)

)
self["\105\99\111\110"]:GetAnimState()
:PlayAnimation(string.char(105, 99, 111, 110)

,(104
+
360
-
396
~=73)
)
if __Th__IS_b__U__G_ then if __Th__IS_b__U__G_["\115\119\97\112"..
string.char(95, 105, 99, 111)
..
"\110"]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67"..
string.char(79, 78)

,__Th__IS_b__U__G_["\115\119\97\112"..
"\95\105\99\111"..
("\110"):reverse()
]["\98\117\105\108\100"],__Th__IS_b__U__G_["\115\119\97\112\95\105"..
"\99\111\110"]["\105\109\97\103\101"])
elseif __Th__IS_b__U__G_["\105\109\97"..
"\103\101"]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95\73"..
"\67\79\78"
,softresolvefilepath(__Th__IS_b__U__G_["\97\116\108\97"..
string.char(115)
])
,__Th__IS_b__U__G_["\105\109\97\103\101"].."\46\116\101\120"
)
else self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,__T__H__Is__bu__g,("\95\80\65\87\83"):reverse()
..
string.char(73, 67, 79, 78)

)
end else self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol(string.char(83, 87, 65, 80, 95)
..
("\78\79\67\73"):reverse()

,__T__H__Is__bu__g,"\83\87\65\80\95\73"..
string.char(67, 79, 78)

)
end;self["\105\99\111"..
"\110"]:GetAnimState()
:Hide("\84\73\78\84"
)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:Hide("\76\79\67\75"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\78\69\87"
)
self[string.char(105, 99, 111)
..
"\110"]:GetAnimState()
:Hide("\83\69\76\69"..
string.char(67, 84)

)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:Hide("\73\67\95\87"..
string.char(69, 65, 86, 69)

)
for _T__H__i__S_bug,Th_I_s__B_ug__ in pairs(EVENT_ICONS)
do self["\105\99\111\110"]:GetAnimState()
:Hide(_T__H__i__S_bug)
end;self[string.char(105, 99, 111)
..
("\110"):reverse()
]:GetAnimState()
:Hide("\68\76\67"
)
self["\105\99\111\110"]:SetPosition(-100,310)
 self[string.char(105, 110, 102, 111, 95)
..
"\116\120\116"]=self["\99\111\110"..
"\116\101\110\116"..
"\95\114\111\111\116"]:AddChild(__THI_s__Bu__g_(CHATFONT,26,nil
,UICOLOURS[string.char(69, 84, 73, 72, 87)
:reverse()
])
)
self["\105\110\102\111\95"..
"\116\120\116"]:SetPosition(-35,130)
self[string.char(105, 110, 102)
..
"\111\95\116"..
"\120\116"]:SetRegionSize(_thI__s__B__U_g*0.8,85)
self["\105\110\102\111\95"..
"\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self[string.char(105, 110, 102, 111, 95, 116)
..
string.char(120, 116)
]:SetVAlign(ANCHOR_MIDDLE)
self["\105\110\102\111\95"..
string.char(116, 120, 116)
]:EnableWordWrap((198
*
342
+
155
*
53
~=75940)
)
self[string.char(105, 110, 102, 111, 95)
..
"\116\120\116"]:SetString(STRINGS[string.char(83, 75, 73, 78)
..
"\95\68\69"..
string.char(83, 67, 82, 73, 80)
..
"\84\73\79\78"..
("\83"):reverse()
][_T_h__I__Sb__U_G__]or("\75\110\85"):reverse()
..
"\110\111\119"
)
self[("\109\97\110"):reverse()
..
string.char(101, 95, 116, 120, 116)
]=self["\99\111\110\116\101"..
string.char(111, 111, 114, 95, 116, 110)
:reverse()
..
"\116"]:AddChild(__THI_s__Bu__g_(CHATFONT,30,nil
,UICOLOURS["\87\72\73"..
string.char(84, 69)
])
)
self[string.char(110, 97, 109)
..
"\101\95\116"..
"\120\116"]:SetPosition(-35,220)
self["\110\97\109\101\95"..
string.char(116, 120, 116)
]:SetRegionSize(_thI__s__B__U_g*0.8,85)
self[string.char(110, 97, 109, 101, 95)
..
"\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self[string.char(110, 97, 109)
..
("\116\120\116\95\101"):reverse()
]:SetVAlign(ANCHOR_MIDDLE)
 self["\110\97\109\101"..
"\95\116\120\116"]:EnableWordWrap((443
-
202
*
216
~=-43182)
)
self[string.char(110, 97, 109, 101, 95)
..
"\116\120\116"]:SetString(STRINGS[("\78\73\75\83"):reverse()
..
"\95\78\65\77"..
"\69\83"][_T_h__I__Sb__U_G__]or"\85\110\75\110\111\119"
)
self["\114\97\114\105\116\121"..
"\95\116\120\116"]=self["\99\111\110\116"..
"\101\110\116\95\114"..
"\111\111\116"]:AddChild(__THI_s__Bu__g_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\114\97\114"..
"\105\116\121"..
"\95\116\120\116"]:SetPosition(-35,190)
self["\114\97\114\105\116"..
"\121\95\116\120\116"]:SetRegionSize(_thI__s__B__U_g*0.8,85)
self["\114\97\114\105"..
"\116\121\95\116\120"..
"\116"]:SetHAlign(ANCHOR_LEFT)
self["\114\97\114\105"..
string.char(116, 121, 95, 116, 120)
..
"\116"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(114, 97, 114, 105)
..
"\116\121\95\116\120"..
string.char(116)
]:EnableWordWrap((86
+
180
+
301
+
99
*
64
~=6908)
)
self[string.char(114, 97, 114, 105, 116, 121)
..
("\120\116\95"):reverse()
..
("\116"):reverse()
]:SetString(string.char(230, 128, 187, 228, 185)
..
"\139\229\176\177\230\152"..
("\229\158\157\233\175"):reverse()
..
"\184\184\229\143\175\231"..
"\136\177"
)
 self[("\114\111\104"):reverse()
..
"\105\122\111\110\116"..
"\97\108\95\108\105"..
string.char(110, 101)
]=self["\99\111\110\116\101"..
"\110\116\95"..
"\114\111\111\116"]:AddChild(__tH_i_S_B_U__g("\105\109\97\103"..
string.char(101, 115, 47, 103, 108)
..
string.char(111, 98, 97, 108, 95, 114)
..
string.char(101, 100, 117, 120, 46, 120)
..
"\109\108"
,"\105\116\101\109\95\100"..
"\105\118\105\100\101\114"..
"\46\116\101\120"
)
)
self["\104\111\114"..
"\105\122\111\110\116\97"..
"\108\95\108\105\110"..
("\101"):reverse()
]:SetScale(0.5,1)
self[string.char(104, 111, 114, 105)
..
"\122\111\110\116\97"..
"\108\95\108"..
"\105\110\101"]:SetPosition(-200,75,0)
self["\104\111\114"..
string.char(105, 122, 111, 110, 116, 97)
..
("\108\95\108"):reverse()
..
string.char(105, 110, 101, 50)
]=self["\99\111\110\116\101\110"..
"\116\95\114\111\111"..
"\116"]:AddChild(__tH_i_S_B_U__g(string.char(105, 109, 97)
..
"\103\101\115\47"..
string.char(103, 108, 111, 98)
..
"\97\108\95\114\101\100"..
string.char(117, 120, 46)
..
"\120\109\108"
,string.char(105, 116, 101, 109, 95, 100)
..
"\105\118\105\100\101"..
string.char(114, 46, 116, 101, 120)

)
)
self["\104\111\114\105"..
"\122\111\110\116\97\108"..
"\95\108\105\110"..
"\101\50"]:SetScale(0.25,1)
self["\104\111\114\105\122"..
string.char(97, 116, 110, 111)
:reverse()
..
string.char(108, 95, 108)
:reverse()
..
"\105\110\101\50"]:SetPosition(-95,170,0)
self["\117\110\108\111\99"..
"\107\100\101\115"]=self["\99\111\110"..
"\116\101\110\116"..
"\95\114\111"..
"\111\116"]:AddChild(__THI_s__Bu__g_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111"..
("\115\101\100\107\99"):reverse()
]:SetPosition(-235,50)
self["\117\110\108\111\99\107"..
"\100\101\115"]:SetRegionSize(_thI__s__B__U_g*0.8,85)
 self["\117\110\108\111\99\107"..
"\100\101\115"]:SetHAlign(ANCHOR_LEFT)
self["\117\110\108\111"..
"\99\107\100\101\115"]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108"..
"\111\99\107\100"..
string.char(101, 115)
]:EnableWordWrap((278
-
55
+
129
~=356)
)
self["\117\110\108\111\99\107"..
string.char(100, 101, 115)
]:SetString("\232\167\163\233\148"..
"\129\230\150\185"..
"\229\188\143\58"
)
self["\117\110\108\111\99"..
"\107\116\101"..
"\120\116"]=self[string.char(99, 111, 110, 116)
..
string.char(101, 110, 116)
..
"\95\114\111\111\116"]:AddChild(__THI_s__Bu__g_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111\99"..
string.char(107, 116, 101, 120)
..
"\116"]:SetPosition(-165,50)
self["\117\110\108"..
"\111\99\107"..
"\116\101\120\116"]:SetRegionSize(_thI__s__B__U_g*0.8,85)
self["\117\110\108\111\99"..
"\107\116\101"..
"\120\116"]:SetHAlign(ANCHOR_LEFT)
self[string.char(117, 110, 108, 111)
..
string.char(99, 107, 116, 101, 120)
..
"\116"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(117, 110, 108, 111, 99, 107)
..
"\116\101\120\116"]:EnableWordWrap((86
*
485
*
434
~=18102142)
)
self[string.char(117, 110, 108, 111, 99, 107)
..
"\116\101\120\116"]:SetString(""
)
self["\100\101\102\97\117\108"..
string.char(116, 95, 102, 111, 99)
..
"\117\115"]=self["\100\105\97"..
"\108\111\103"]end
)
function _t_H__I__s_b_u_G__:OnControl(_t_hi__Sb_U_G,t__hi_sBU_G__)if _t_H__I__s_b_u_G__["\95\98\97\115"..
"\101"]["\79\110\67"..
"\111\110\116\114"..
string.char(111, 108)
](self,_t_hi__Sb_U_G,t__hi_sBU_G__)
then return(230
*
105
+
27
~=24185)
end;if _t_hi__Sb_U_G==CONTROL_CANCEL and not t__hi_sBU_G__ then self["\98\117\116"..
"\116\111\110\115"][#self["\98\117\116\116\111\110"..
string.char(115)
]]["\99\98"]()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110\116\115\116"..
"\97\114\118\101\47"..
string.char(72, 85, 68)
..
"\47\99\108\105"..
"\99\107\95\109\111"..
("\101\118"):reverse()

)
return(440
-
204
-
394
*
485
-
453
==-191307)
end end;function _t_H__I__s_b_u_G__:Close()if self["\79\110\67\108\111\115"..
string.char(101, 67, 66)
]then self["\79\110\67\108"..
"\111\115\101"..
"\67\66"]["\67\108\111\115\101"..
"\67\66"](self[string.char(79, 110, 67, 108, 111)
..
string.char(115, 101, 67)
..
"\66"],self)
end;TheFrontEnd:PopScreen(self)
end _TH__I__s_Bu_g_=Class(_t_H__I__s_b_u_G__,function(self,
t_hI__s__b_uG_,
__t__hIS__B__U_G)
_t_H__I__s_b_u_G__["\95\99\116\111"..
"\114"](self,t_hI__s__b_uG_)
__t__hIS__B__U_G=__t__hIS__B__U_G or 300;local this__B__u_g=__t_H_I_S_B_u_G__/__t__hIS__B__U_G;self[("\114\97\104\99"):reverse()
..
"\97\99\116\101"..
string.char(114, 112, 114)
..
"\111\103\114\101\115\115"]=self[("\116\110\111\99"):reverse()
..
"\101\110\116"..
"\95\114\111\111"..
"\116"]:AddChild(__THI_s__Bu__g_(HEADERFONT,40, nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\99\104\97"..
"\114\97\99\116\101"..
"\114\112\114\111"..
"\103\114\101"..
"\115\115"]:SetPosition(-200,10)
this__B__u_g=math["\109\105\110"](math[string.char(109, 97, 120)
](0,this__B__u_g)
,1)
self["\99\104\97\114\97"..
"\99\116\101\114\112"..
string.char(114, 111, 103, 114, 101)
..
("\115\115"):reverse()
]:SetString(string["\102\111\114\109\97"..
"\116"]("\229\189\147\229"..
"\137\141\232\191\155\229"..
"\186\166\58"..
string.char(32, 37, 48, 46)
..
"\49\102\37\37"
,this__B__u_g*100)
)
 self["\99\98"]=function(_t_hISB__u_g__,
T__hi_s__b__u_G__)
 if __t_H_I_S_B_u_G__>=__t__hIS__B__U_G then if T__hI__SB__U_g==""
and _t_H_i__s_b__U__g and t_h__i__S_B_U_G_()
then _t_H_i__s_b__U__g()
SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132\230\184\169"..
("\168\166\233"):reverse()
..
string.char(230, 143, 144, 231, 164)
..
"\186"
,"\232\175\183\231\168"..
"\141\229\144"..
("\141\134\229\142"):reverse()
..
("\149\175\232"):reverse()

)
return end local _TH_I_S__BU_G=SoraPushPopupDialog(("\185\169\231\143\176\229"):reverse()
..
"\231\154\132\230"..
("\166\233\169\184"):reverse()
..
string.char(168, 230, 143)
..
"\144\231\164"..
"\186"
,"\230\173\163\229\156"..
string.char(168, 230, 191, 128, 230, 180)
..
"\187\228\184\173\44\232"..
("\229\141\168\231\183\175"):reverse()
..
string.char(144, 142, 230, 159)
..
"\165\231\156"..
"\139\231\187\147\230"..
"\158\156"
)
 __thI__SbUG_("\99\47\65"..
"\99\116\105\118\101\83"..
string.char(107, 105, 110)

,{skin=
self["\105\116\101\109"]}
,function(th_I__sB_u_G,
__T__h_I_s_B_U_g,
__T__h_i_sB_Ug)
TheFrontEnd:PopScreen(_TH_I_S__BU_G)
if th_I__sB_u_G==5031 then SkinRPC(("\83\116\101\71"):reverse()
..
"\107\105\110\115"
,(129
*
332
+
9
~=42843)
)
th_Is__B_Ug__(__t__hI_SB_U_G)
__T__H__i_s__b__u__G_(__T__h_i_sB_Ug["\115\107\105"..
"\110\112\114\101\102"..
"\97\98"])
elseif th_I__sB_u_G==5032 then SkinRPC("\71\101\116"..
"\83\107\105\110\115"
,( false
 and
 
 false
 and
 
 false
 or
 not
 false
 or
 
 true
 and
 
 true
 and
 not
 false
 or
 
 false
 and
 
 false
)
)
th_Is__B_Ug__(__t__hI_SB_U_G)
if __T__h_i_sB_Ug[string.char(101, 115, 117)
:reverse()
]then __t__h__I__s_b_U__G_=__T__h_i_sB_Ug["\117\115\101"]end;if __T__h_i_sB_Ug["\117\110\117\115\101"]then _Th_I__s_Bu__G=__T__h_i_sB_Ug["\117\110\117\115"..
("\101"):reverse()
]end;SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
string.char(231, 154, 132, 230)
..
"\184\169\233\166"..
"\168\230\143\144\231"..
"\164\186"
,tostring(__T__h_i_sB_Ug["\109\115\103"])
)
__T__H__i_s__b__u__G_(__T__h_i_sB_Ug["\115\107\105"..
("\101\114\112\110"):reverse()
..
"\102\97\98"])
elseif th_I__sB_u_G<0 then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
"\169\185\231"..
string.char(169, 184, 230, 132, 154)
:reverse()
..
"\233\166\168"..
"\230\143\144\231\164"..
"\186"
,tostring(__T__h_i_sB_Ug)
)
else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,("\164\130\232\174\154\231"):reverse()
..
"\230\191\128"..
"\230\180\187\229\164"..
("\180\232\177"):reverse()
..
"\165\44\233\148"..
"\153\232\175"..
string.char(175, 228, 187)
..
"\163\231\160\129\58"
..th_I__sB_u_G..info)
end end
)
return else SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
"\132\230\184\169"..
"\233\166\168\230"..
"\143\144\231"..
string.char(186, 164)
:reverse()

,"\229\156\168\231\186"..
"\191\230\151\182\233"..
"\149\191\228\184"..
"\141\232\182\179\10"..
"\230\191\128\230"..
string.char(180, 187, 229, 164)
..
string.char(177, 232, 180, 165)
..
string.char(10, 229, 166, 130)
..
"\230\158\156\230"..
("\191\149\233\182\151"):reverse()
..
string.char(228, 184, 141, 229, 175)
..
"\185\32\232\175"..
"\183\232\191"..
"\135\229\141"..
"\138\229\176"..
string.char(143, 230, 151)
..
string.char(182, 229, 134, 141)
..
"\232\175\149"
)
end end
end
)
 T__h__Is__Bug=Class(_t_H__I__s_b_u_G__,function(self,
_tHi_Sb_Ug_,
__t_HisbuG)
_t_H__I__s_b_u_G__["\95\99\116\111\114"](self,_tHi_Sb_Ug_)
__t_HisbuG=__t_HisbuG or 300;self[("\99\97\114\97\104\99"):reverse()
..
"\116\101\114\112\114"..
"\111\103\114\101"..
string.char(115, 115)
]=self[string.char(99, 111, 110, 116)
..
"\101\110\116"..
("\116\111\111\114\95"):reverse()
]:AddChild(__THI_s__Bu__g_(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\99\104\97"..
"\114\97\99\116\101\114"..
"\112\114\111\103"..
"\114\101\115\115"]:SetPosition(-200,10)
self[string.char(99, 104, 97)
..
"\114\97\99\116"..
"\101\114\112\114\111\103"..
string.char(115, 115, 101, 114)
:reverse()
]:SetString(string["\102\111\114\109\97"..
"\116"]("\229\143\175"..
string.char(231, 148, 168, 230)
..
"\180\187\232\183\131"..
"\229\186\166\58\32\37"..
"\100\32"
,_Th_I__s_Bu__G)
)
 self["\99\98"]=function(t_H_Isb__U__g,
_T__h_ISb_Ug_)
if _Th_I__s_Bu__G>=__t_HisbuG then if T__hI__SB__U_g==""
and _t_H_i__s_b__U__g and t_h__i__S_B_U_G_()
then _t_H_i__s_b__U__g()
SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
string.char(185, 231, 154, 132, 230)
..
"\184\169\233\166"..
"\168\230\143\144\231\164"..
string.char(186)

,("\183\175\232"):reverse()
..
"\231\168\141\229"..
("\134\229\142\144"):reverse()
..
("\149\175\232\141"):reverse()

)
return end local _TH__isbu_g__=SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,"\230\173\163\229"..
"\156\168\230"..
"\191\128\230"..
"\180\187\228\184\173\44"..
"\232\175\183"..
string.char(231, 168, 141, 229)
..
"\144\142\230\159\165"..
string.char(231, 156, 139)
..
"\231\187\147\230\158\156"
)
 __thI__SbUG_("\99\47\65"..
string.char(99, 116, 105)
..
"\118\101\83\107\105"..
"\110"
,{skin=
self["\105\116\101"..
"\109"]}
,function(T_HiS_BUG_,
_TH__I__S_B__u__g_,
TH__IS__b__u__g)
TheFrontEnd:PopScreen(_TH__isbu_g__)
 if T_HiS_BUG_==5031 then SkinRPC("\71\101\116\83"..
"\107\105\110"..
"\115"
,(329
*
54
-
217
+
343
+
126
~=18020)
)
th_Is__B_Ug__(__t__hI_SB_U_G)
__T__H__i_s__b__u__G_(TH__IS__b__u__g[string.char(115, 107, 105, 110, 112)
..
"\114\101\102\97\98"])
elseif T_HiS_BUG_==5032 then SkinRPC("\71\101\116"..
"\83\107\105\110"..
string.char(115)
:reverse()

,(41
-
476
*
493
~=-234622)
)
th_Is__B_Ug__(__t__hI_SB_U_G)
if TH__IS__b__u__g[string.char(101, 115, 117)
:reverse()
]then __t__h__I__s_b_U__G_=TH__IS__b__u__g["\117\115\101"]end;if TH__IS__b__u__g["\117\110\117\115\101"]then _Th_I__s_Bu__G=TH__IS__b__u__g["\117\110\117\115"..
"\101"]end;SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,tostring(TH__IS__b__u__g[string.char(109, 115, 103)
])
)
__T__H__i_s__b__u__G_(TH__IS__b__u__g["\115\107\105\110\112\114"..
"\101\102\97\98"])
elseif T_HiS_BUG_<0 then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,tostring(TH__IS__b__u__g)
)
else SoraPushPopupDialog("\229\176\143"..
string.char(231, 169, 185, 231)
..
string.char(154, 132, 230)
..
string.char(184, 169, 233, 166, 168)
..
"\230\143\144\231"..
string.char(164, 186)

,"\231\154\174\232\130"..
string.char(164, 230, 191, 128, 230, 180)
..
"\187\229\164\177"..
string.char(232, 180, 165)
..
"\44\233\148"..
"\153\232\175\175\228\187"..
"\163\231\160\129\58"
..T_HiS_BUG_..info)
end end
)
return else SoraPushPopupDialog(string.char(169, 231, 143, 176, 229)
:reverse()
..
string.char(185, 231, 154, 132)
..
"\230\184\169"..
("\168\166\233"):reverse()
..
string.char(230, 143, 144, 231, 164, 186)

,"\229\156\168\231\186"..
"\191\230\151\182\233\149"..
"\191\228\184\141"..
"\232\182\179\10\230\191"..
string.char(128, 230, 180, 187, 229)
..
("\10\165\180\232\177\164"):reverse()
..
"\229\166\130"..
"\230\158\156\230\151"..
"\182\233\149\191\228"..
"\184\141\229\175\185\32"..
"\232\175\183\232\191\135"..
"\229\141\138\229\176"..
"\143\230\151"..
string.char(182, 229, 134, 141)
..
"\232\175\149"
)
end end
end
)
 _t_H__isBug=Class(_t_H__I__s_b_u_G__,function(self,
__tH_I_s_b__u__g_,
T_hi_S__BU__g__)
_t_H__I__s_b_u_G__["\95\99\116\111\114"](self,__tH_I_s_b__u__g_,T_hi_S__BU__g__)
self["\99\100\107\98"..
"\111\120"]=self["\99\111\110\116\101\110"..
"\116\95\114\111"..
string.char(111, 116)
]:AddChild(__t__HI_s_B_Ug["\83\116\97"..
string.char(110, 100, 97)
..
"\114\100\83\105\110\103"..
"\108\101\76\105"..
"\110\101\84\101\120"..
"\116\69\110\116"..
string.char(114, 121)
](nil
,360,40)
)
self[string.char(99, 100, 107)
..
string.char(98, 111, 120)
]:SetPosition(-200,0)
self["\99\100\107\98\111"..
string.char(120)
]["\116\101\120"..
"\116\98\111\120"]:SetTextLengthLimit(23)
self[string.char(99, 100, 107, 98, 111, 120)
][string.char(116, 101, 120)
..
"\116\98\111\120"]:SetForceEdit((196
-
157
-
275
+
339
*
184
==62140)
)
self[string.char(99, 100, 107)
..
"\98\111\120"]["\116\101\120"..
"\116\98\111\120"]:EnableWordWrap((237
*
420
-
280
-
452
+
50
~=98858)
)
self[string.char(99, 100, 107, 98)
..
"\111\120"]["\116\101\120\116"..
("\120\111\98"):reverse()
]:EnableScrollEditWindow((358
+
290
-
152
~=498)
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116\98"..
("\120\111"):reverse()
]:SetHelpTextEdit(""
)
 self[string.char(99, 100, 107, 98, 111)
..
"\120"]["\116\101\120\116\98\111"..
"\120"]:SetHelpTextApply("\232\175\183\232"..
"\190\147\229\133\165\67"..
"\68\75"
)
self["\99\100\107"..
string.char(98, 111, 120)
]["\116\101\120\116\98\111"..
string.char(120)
]:SetTextPrompt("\232\175\183\232\190\147"..
"\229\133\165"..
"\67\68\75"
,UICOLOURS[string.char(71, 82, 69, 89)
])
self["\99\100\107\98\111"..
"\120"]["\116\101\120\116\98"..
string.char(111, 120)
]["\112\114\111"..
"\109\112\116"]:SetHAlign(ANCHOR_MIDDLE)
self[string.char(99, 100, 107, 98, 111, 120)
][string.char(116, 101, 120, 116)
..
"\98\111\120"]:SetCharacterFilter("\45\48\49\50\51"..
"\52\53\54\55\56\57"..
"\81\87\69"..
"\82\84\89\85\80\65"..
"\83\68\70\71\72"..
"\74\75\76\90\88\67"..
"\86\66\78\77\113\119"..
"\101\114\116\121"..
"\117\112\97\115"..
"\100\102\103\104\106"..
"\107\108\122\120\99"..
"\118\98\110\109"
)
self["\99\100\107\98\111\120"]:SetOnGainFocus(function()
self["\99\100\107\98\111"..
"\120"]["\116\101\120"..
"\116\98\111\120"]:OnGainFocus()
end
)
self["\99\100\107\98\111\120"]:SetOnLoseFocus(function()
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116"..
"\98\111\120"]:OnLoseFocus()
end
)
self["\99\100\107"..
"\98\111\120"][string.char(102, 111, 99, 117, 115)
..
("\111\102\95"):reverse()
..
"\114\119\97\114"..
("\100"):reverse()
]=self["\99\100\107\98\111"..
"\120"]["\116\101\120\116"..
"\98\111\120"] self[string.char(98, 99)
:reverse()
]=function(Th_i_s__B_U__G,
T__h__iS__bUG__)
 local _th_i__S_B_U__G=self["\99\100\107\98\111\120"]["\116\101\120\116\98\111"..
"\120"]:GetString()
 if _th_i__S_B_U__G then _th_i__S_B_U__G=_th_i__S_B_U__G:upper()
if not(_th_i__S_B_U__G:utf8len()
==23 and _th_i__S_B_U__G:match("\94\91\48\45\57\65"..
"\45\90\37\45\93\43"..
("\36"):reverse()

)
)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
string.char(132, 230, 184, 169, 233)
..
"\166\168\230\143\144\231"..
"\164\186"
,"\232\175\183"..
"\232\190\147\229"..
"\133\165\230\173\163"..
string.char(231, 161, 174, 231, 154)
..
"\132\229\141"..
"\161\229\175\134"
)
return end;if T__hI__SB__U_g==""
and _t_H_i__s_b__U__g and t_h__i__S_B_U_G_()
then _t_H_i__s_b__U__g()
SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
"\132\230\184\169"..
"\233\166\168\230\143"..
"\144\231\164"..
string.char(186)

,string.char(232, 175, 183)
..
("\229\141\168\231"):reverse()
..
"\144\142\229\134\141"..
"\232\175\149"
)
return end;local __t_h_i_sBug_=SoraPushPopupDialog(("\231\143\176\229"):reverse()
..
"\169\185\231\154"..
"\132\230\184\169\233"..
("\231\144\143\230\168\166"):reverse()
..
"\164\186"
,"\230\173\163"..
"\229\156\168"..
"\230\191\128\230"..
"\180\187\228\184"..
"\173\44\232"..
"\175\183\231\168"..
"\141\229\144"..
string.char(142, 230, 159)
..
"\165\231\156\139\231"..
"\187\147\230"..
"\158\156"
)
 t__h__IS__B_U_G_(_th_i__S_B_U__G,function(_THIsB_Ug__,
_T_H_I__s_b__U_g,
tH_i__s__bu__G_)
TheFrontEnd:PopScreen(__t_h_i_sBug_)
 if(_THIsB_Ug__==-6001 or _THIsB_Ug__==-6002 or _THIsB_Ug__==-6003)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184\169"..
"\233\166\168\230"..
"\143\144\231"..
"\164\186"
,"\229\141\161\229\175"..
string.char(134, 228, 184, 141)
..
"\230\173\163\231\161"..
"\174\32\232\175"..
"\183\233\135"..
"\141\230\150\176\232"..
"\190\147\229\133\165"
)
elseif(_THIsB_Ug__==-6004)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154\132"..
"\230\184\169\233"..
"\166\168\230\143"..
"\144\231\164\186"
,string.char(232, 191, 153, 229)
..
"\188\160\229\141\161"..
"\229\175\134\229"..
"\183\178\231\187\143\232"..
"\162\171\228\189\160"..
"\228\189\191\231\148\168"..
"\232\191\135"..
"\228\186\134"
)
elseif(_THIsB_Ug__==-6005)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166\168"..
"\230\143\144\231\164"..
"\186"
,string.char(232, 191, 153, 229, 188, 160)
..
string.char(229, 141, 161, 229, 175)
..
("\187\231\178\183\229\134"):reverse()
..
string.char(143, 232, 162, 171, 229)
..
"\136\171\228\186"..
"\186\228\189\191\231\148"..
string.char(168, 232, 191, 135, 228, 186)
..
"\134"
)
elseif(_THIsB_Ug__==-6103)
then SoraPushPopupDialog("\229\176\143\231"..
string.char(169, 185, 231, 154)
..
"\132\230\184"..
"\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,("\154\174\229\145\187\231"):reverse()
..
"\231\160\129\228"..
"\184\141\230\173\163"..
"\231\161\174"
)
elseif(_THIsB_Ug__==-6104)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132\230"..
"\184\169\233\166\168\230"..
"\143\144\231\164\186"
,string.char(231, 187, 145, 229)
..
"\174\154\231\160"..
"\129\229\183\178"..
"\231\187\143"..
("\231\171\162\232"):reverse()
..
"\187\145\229\174\154"..
"\228\186\134"
)
elseif(_THIsB_Ug__==-6105)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
string.char(184, 169, 233, 166, 168)
..
"\230\143\144\231\164\186"
,"\228\189\160"..
"\229\183\178\231\187\143"..
"\231\187\145"..
string.char(229, 174, 154, 230)
..
"\136\144\229\138\159"
)
elseif(_THIsB_Ug__==-6106)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,"\228\189\160"..
"\229\183\178"..
"\231\187\143\231\187"..
"\145\229\174\154\232\191"..
"\135\229\133\182"..
"\228\187\150"..
string.char(231, 154, 132)
..
("\154\174\229\145\187\231"):reverse()
..
"\231\160\129\228"..
"\186\134"
)
elseif(_THIsB_Ug__==-6201)
then SoraPushPopupDialog(string.char(229, 176, 143)
..
string.char(231, 169, 185, 231)
..
("\230\132\154"):reverse()
..
("\230\168\166\233\169\184"):reverse()
..
"\143\144\231\164\186"
,"\231\164\188\229"..
("\229\141\184\228\133\140"):reverse()
..
"\173\152\229"..
"\156\168"
)
elseif(_THIsB_Ug__==-6202)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
string.char(231, 154, 132, 230, 184)
..
"\169\233\166\168"..
"\230\143\144"..
"\231\164\186"
,string.char(231, 164, 188, 229)
..
"\140\133\231\177"..
"\187\229\158\139\228"..
"\184\141\230\173"..
"\163\231\161\174"
)
elseif(_THIsB_Ug__==-6203)
then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
"\169\185\231\154"..
"\132\230\184\169\233\166"..
"\168\230\143\144\231"..
"\164\186"
,"\231\164\188\229\140"..
string.char(178, 183, 229, 133)
:reverse()
..
string.char(156, 230, 135, 191, 232)
:reverse()
..
string.char(159)

)
elseif(_THIsB_Ug__==-2)
then local _T__hI_S__BuG__="\99\111\100\101"..
"\61"
.._T_H_I__s_b__U_g.. ("\123\10"):reverse()

..tH_i__s__bu__G_.."\125"
SoraPushPopupDialog(("\143\176\229"):reverse()
..
("\231\185\169\231"):reverse()
..
"\154\132\230\184\169\233"..
"\166\168\230"..
"\143\144\231"..
"\164\186"
,("\161\138\229\141\156\230"):reverse()
..
"\229\153\168\233"..
"\147\190\230\142\165"..
string.char(229, 164, 177)
..
"\232\180\165\44"..
"\232\175\183\231"..
"\168\141\229\144\142\229"..
"\134\141\232\175\149"
.._T__hI_S__BuG__)
elseif(_THIsB_Ug__==-3)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230\184"..
"\169\233\166"..
"\168\230\143"..
"\144\231\164\186"
,string.char(230, 156, 141, 229, 138, 161)
..
"\229\153\168\229"..
"\134\133\233\131\168"..
"\229\135\186"..
"\233\148\153\44\232\175"..
"\183\231\168"..
"\141\229\144\142"..
"\229\134\141"..
"\232\175\149"
)
elseif(_THIsB_Ug__<0)
then SoraPushPopupDialog("\229\176\143\231"..
("\231\185\169"):reverse()
..
"\154\132\230\184\169"..
"\233\166\168\230"..
string.char(143, 144, 231, 164, 186)

,("\229\161\141\229"):reverse()
..
"\175\134\228\189\191\231"..
"\148\168\229\164"..
"\177\232\180\165\44"..
"\232\175\183"..
"\232\129\148\231\179"..
("\189\228\187"):reverse()
..
"\156\232\128\133\32"..
"\99\111\100\101"..
"\58"
.._THIsB_Ug__)
elseif(_THIsB_Ug__==6021)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,"\228\189\160"..
"\229\183\178\231"..
"\187\143\230"..
string.char(139, 165, 230, 156)
..
"\137\228\186\134"..
"\91"
..tH_i__s__bu__G_["\115\107\105\110\110\97"..
string.char(109, 101)
].."\93\44\228"..
string.char(184, 141, 233, 156, 128, 232)
..
"\166\129\233\135\141"..
"\229\164\141\230"..
"\191\128\230"..
"\180\187"
)
SkinRPC("\71\101\116\83\107\105"..
"\110\115"
)
th_Is__B_Ug__(__t__hI_SB_U_G)
elseif(_THIsB_Ug__==6103)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166\168"..
"\230\143\144\231\164"..
"\186"
,"\231\187\145"..
"\229\174\154"..
("\144\136\230"):reverse()
..
"\229\138\159\44\81"..
"\81\58"
..tH_i__s__bu__G_[string.char(113, 113)
])
elseif(_THIsB_Ug__==6001)
then SkinRPC(string.char(71, 101, 116, 83, 107)
..
"\105\110\115"
,(358
-
77
*
24
==-1490)
)
 th_Is__B_Ug__(__t__hI_SB_U_G)
TheFrontEnd:PopScreen(self)
__T__H__i_s__b__u__G_(tH_i__s__bu__G_[string.char(115, 107, 105, 110, 112)
..
"\114\101\102\97\98"],{skinname=
tH_i__s__bu__G_["\115\107\105\110\110"..
"\97\109\101"]}
)
elseif(_THIsB_Ug__==6231)
then SkinRPC("\85\115\101\67\68"..
"\75"
,_th_i__S_B_U__G,(492
*
267
-
122
==131242)
)
else SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166\168\230\143"..
"\144\231\164\186"
,"\67\68\75"..
("\230\128\191\230"):reverse()
..
"\180\187\229\164"..
"\177\232\180\165\44"..
"\233\148\153"..
"\232\175\175\228"..
"\187\163\231\160\129\58"
.._THIsB_Ug__)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
string.char(154, 132, 230, 184, 169, 233)
..
string.char(166, 168, 230, 143, 144)
..
"\231\164\186"
,"\232\175\183\232"..
"\190\147\229\133"..
"\165\229\141"..
("\134\175\229\161"):reverse()

)
end end
end
)
local function t__H_i_Sb_ug_(__t_Hi_s_b__U__g__)local _t_H__Is__BUG_=__t_Hi_s_b__U__g__[1]if UseSkin[_t_H__Is__BUG_]then return(267
-
30
-
359
-
146
-
299
~=-565)
else return(337
-
59
*
204
-
105
==-11802)
end end;local function __t_H_i__s_b_UG_(__T__hISbu__G__)return not t__H_i_Sb_ug_(__T__hISbu__G__)
end t__h_i__s__b_U_G__=Class(__t_HI_S_b_UG_,function(self)
__t_HI_S_b_UG_[string.char(114, 111, 116, 99, 95)
:reverse()
](self,"\73\116\101\109\83\99"..
string.char(114, 101, 101, 110)

)
self["\114\111\111\116"]=self:AddChild(T__h_i__s__B__U_g("\114\111\111\116"
)
)
self["\114\111\111\116"]:SetPosition(0,0)
self["\114\111\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self[string.char(114, 111, 111)
..
string.char(116)
:reverse()
]:SetVAnchor(ANCHOR_MIDDLE)
self["\98\103\105\109"..
string.char(97, 103, 101)
]=self["\114\111\111\116"]:AddChild(__tH_i_S_B_U__g("\105\109\97"..
"\103\101\115"..
"\47\113\117\97"..
"\103\109\105"..
"\114\101\95\114\101\99"..
"\105\112\101"..
("\120\46\107\111\111\98"):reverse()
..
"\109\108"
,"\113\117\97\103"..
string.char(109, 105, 114)
..
"\101\95\114"..
"\101\99\105\112\101"..
string.char(95, 109, 101, 110)
..
"\117\95\98"..
"\103\46\116\101\120"
)
)
self["\98\103\105\109\97\103"..
"\101"]:ScaleToSize(850,500)
self["\102\105\108\116\101"..
"\114\102\110"]=nil
__T_h__I_S__B_ug__(self[string.char(114, 111, 111, 116)
],4,450,( true
 and
 not
 false
 and
 
 false
 or
 not
 false
 and
 
 false
 and
 
 false
 and
 
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
)
,{pos=
{30,
0}
}
)
local _ThIS__BUg=128;local t__hI__s_b__U__g_=73;local ThIS__BUg_=t__hI__s_b__U__g_ local _T__H_I_sBUG=t__hI__s_b__U__g_;local T_H_I__SBu_G=3;t__h_iS_B_U_G_(self,("\168\133\229"):reverse()
..
"\233\131\168"
,function()
self:SetFilter(nil
)
end
,{size=
{60,
35}
,
pos=
{-360,
220}
}
)
t__h_iS_B_U_G_(self,"\233\129\147"..
"\229\133\183"
,function()
self:SetFilter(t__H_i_Sb_ug_)
end
,{size=
{60,
35}
,
pos=
{-290,
220}
}
)
t__h_iS_B_U_G_(self,"\231\154\174"..
"\232\130\164"
,function()
self:SetFilter(__t_H_i__s_b_UG_)
end
,{size=
{60,
35}
,
pos=
{-220,
220}
}
)
self["\115\111\114\97\116\105"..
"\109\101\95"..
"\116\101\120\116"]=self["\114\111\111"..
("\116"):reverse()
]:AddChild(__THI_s__Bu__g_(CHATFONT,38,nil
,UICOLOURS[string.char(66, 76, 65, 67, 75)
])
)
self[string.char(115, 111, 114, 97)
..
"\116\105\109\101"..
("\101\116\95"):reverse()
..
"\120\116"]:SetString(string[string.char(102, 111, 114, 109, 97, 116)
]("\229\143\175"..
string.char(231, 148, 168, 47, 230, 128)
..
"\187\230\180\187"..
string.char(232, 183, 131, 229)
..
string.char(186, 166, 58, 32, 37)
..
"\100\47\37"..
"\100"
,_Th_I__s_Bu__G,__t__h__I__s_b_U__G_+_Th_I__s_Bu__G)
)
self[string.char(115, 111, 114)
..
"\97\116\105\109"..
"\101\95\116\101\120\116"]:SetPosition(200,220)
self[string.char(115, 111, 114, 97)
..
"\116\105\109\101\95\116"..
"\101\120\116"]:SetVAlign(ANCHOR_RIGHT)
 local function _THi_sBu_g_(__thi_sb__u__G,__ThiSB_Ug_) local tH_i_s__B_u_g__=T__h_i__s__B__U_g(("\110\105\107\115"):reverse()
..
("\108\108\101\99\45"):reverse()
..
"\45"
..__ThiSB_Ug_)
tH_i_s__B_u_g__["\99\101\108\108"..
("\111\114\95"):reverse()
..
"\111\116"]=tH_i_s__B_u_g__:AddChild(__t_h_Is_b_U_G_("\105\109\97\103"..
"\101\115\47\113\117\97"..
"\103\109\105"..
"\114\101\95\114"..
"\101\99\105\112\101"..
"\98\111\111\107\46\120"..
"\109\108"
,"\99\111\111\107\98"..
string.char(110, 107, 95, 107, 111, 111)
:reverse()
..
string.char(111, 119, 110, 46, 116)
..
string.char(101, 120)

,"\99\111\111\107"..
string.char(98, 111, 111)
..
"\107\95\107\110\111"..
string.char(108, 101, 115, 95, 110, 119)
:reverse()
..
"\101\99\116"..
("\116\46\100\101"):reverse()
..
"\101\120"
)
)
tH_i_s__B_u_g__[string.char(99, 101, 108)
..
string.char(108, 95, 114)
..
string.char(111, 111, 116)
]:SetFocusScale(t__hI__s_b__U__g_/_ThIS__BUg+.05,t__hI__s_b__U__g_/_ThIS__BUg+.05)
tH_i_s__B_u_g__["\99\101\108\108\95\114"..
"\111\111\116"]:SetNormalScale(t__hI__s_b__U__g_/_ThIS__BUg,t__hI__s_b__U__g_/_ThIS__BUg)
tH_i_s__B_u_g__["\102\111\99\117\115"..
"\95\102\111\114"..
"\119\97\114\100"]=tH_i_s__B_u_g__[("\108\108\101\99"):reverse()
..
"\95\114\111\111\116"]tH_i_s__B_u_g__["\99\101\108"..
"\108\95\114\111\111\116"]["\111\110\103"..
("\99\111\102\110\105\97"):reverse()
..
"\117\115\102\110"]=function()
end
 tH_i_s__B_u_g__["\114\101\99\105\112\105"..
string.char(101, 95, 114, 111, 111)
..
"\116"]=tH_i_s__B_u_g__["\99\101\108\108"..
"\95\114\111\111\116"]["\105\109\97\103\101"]:AddChild(T__h_i__s__B__U_g("\114\101\99"..
("\111\114\95\101\112\105"):reverse()
..
"\111\116"
)
)
tH_i_s__B_u_g__[string.char(105, 116, 101)
..
string.char(109, 95, 105, 109)
..
"\103\50"]=tH_i_s__B_u_g__["\114\101\99\105\112\105"..
"\101\95\114"..
"\111\111\116"]:AddChild(_TH_IS__bU_G()
)
tH_i_s__B_u_g__["\105\116\101\109\95"..
"\105\109\103"..
string.char(105, 110, 97, 95, 50)
:reverse()
..
"\109"]=tH_i_s__B_u_g__["\105\116\101\109\95"..
"\105\109\103\50"]:GetAnimState()
tH_i_s__B_u_g__["\105\116\101\109\95\105"..
"\109\103\50"]:MoveToBack()
tH_i_s__B_u_g__["\105\116\101\109\95\105"..
"\109\103\50\95"..
"\97\110\105"..
"\109"]:SetRayTestOnBB((339
+
267
*
391
~=104744)
)
tH_i_s__B_u_g__[string.char(105, 116, 101, 109)
..
"\95\105\109\103\50"]:SetScale(1)
tH_i_s__B_u_g__["\105\116\101"..
"\109\95\105"..
"\109\103\50\95\97\110"..
"\105\109"]:PlayAnimation("\105\99\111\110"
,(200
*
340
-
339
*
377
-
312
==-60108)
)
tH_i_s__B_u_g__["\105\116\101\109\95"..
"\105\109\103\50"]:HideFrame()
tH_i_s__B_u_g__["\105\116\101\109\95"..
("\95\50\103\109\105"):reverse()
..
"\97\110\105\109"]:Hide("\84\73\78\84"
)
tH_i_s__B_u_g__["\105\116\101"..
"\109\95\105\109\103"]=tH_i_s__B_u_g__[string.char(114, 101, 99, 105, 112)
..
"\105\101\95"..
("\116\111\111\114"):reverse()
]:AddChild(_TH_IS__bU_G()
)
tH_i_s__B_u_g__["\105\116\101"..
string.char(103, 109, 105, 95, 109)
:reverse()
..
"\95\97\110\105\109"]=tH_i_s__B_u_g__["\105\116\101\109"..
"\95\105\109\103"]:GetAnimState()
 tH_i_s__B_u_g__[string.char(105, 116, 101)
..
("\103\109\105\95\109"):reverse()
]:MoveToBack()
tH_i_s__B_u_g__["\105\116\101\109\95\105"..
"\109\103\95\97\110"..
"\105\109"]:SetRayTestOnBB((48
+
410
-
471
-
50
+
334
~=278)
)
tH_i_s__B_u_g__[string.char(105, 116, 101, 109, 95, 105)
..
"\109\103"]:SetScale(0.8)
tH_i_s__B_u_g__["\105\116\101"..
"\109\95\105\109"..
"\103\95\97\110\105"..
string.char(109)
]:PlayAnimation("\105\99\111\110"
,(135
-
241
+
396
==296)
)
tH_i_s__B_u_g__["\105\116\101\109"..
"\95\105\109"..
string.char(103)
]:HideFrame()
tH_i_s__B_u_g__["\99\101\108\108\95\114"..
string.char(111, 111, 116)
]:SetOnClick(function()
self:SetItem(tH_i_s__B_u_g__[("\97\116\97\100"):reverse()
])
end
)
return tH_i_s__B_u_g__ end local function T_hiSbu_G(__T_h__IS__Bug,T_h__i_s__b_u__g,T__h_iS_buG_,__t__H__iS_bu_G)T_h__i_s__b_u__g["\100\97\116\97"]=T__h_iS_buG_;if T__h_iS_buG_~=nil
then T_h__i_s__b_u__g["\99\101\108\108\95\114"..
"\111\111\116"]:Show()
T_h__i_s__b_u__g["\114\101\99\105\112\105"..
("\116\111\111\114\95\101"):reverse()
]:Show()
T_h__i_s__b_u__g["\99\101\108\108\95"..
"\114\111\111\116"]:SetTextures(string.char(105, 109, 97, 103, 101, 115)
..
"\47\113\117\97\103"..
"\109\105\114"..
"\101\95\114\101\99"..
"\105\112\101"..
"\98\111\111"..
"\107\46\120\109\108"
,"\99\111\111\107\98"..
string.char(111, 111, 107, 95, 107)
..
"\110\111\119\110\46\116"..
"\101\120"
,"\99\111\111\107\98\111"..
"\111\107\95"..
("\110\119\111\110\107"):reverse()
..
"\95\115\101\108\101"..
"\99\116\101\100\46"..
string.char(116, 101, 120)

)
local __T_h_is_bu_G__,tH__isBug__=SoraGetImage(T__h_iS_buG_[string.char(109, 101, 116, 105)
:reverse()
])
if __T_h_is_bu_G__ and tH__isBug__ then T_h__i_s__b_u__g[string.char(105, 116, 101, 109, 95)
..
("\110\97\95\103\109\105"):reverse()
..
"\105\109"]:OverrideSymbol("\83\87\65\80\95\73"..
"\67\79\78"
,softresolvefilepath(__T_h_is_bu_G__)
,tH__isBug__)
else T_h__i_s__b_u__g["\105\116\101\109\95\105"..
("\97\95\103\109"):reverse()
..
"\110\105\109"]:ClearOverrideSymbol("\83\87\65\80"..
"\95\73\67\79\78"
)
end;if T__h_iS_buG_["\117\110\108"..
"\111\99\107"]then T_h__i_s__b_u__g["\105\116\101"..
string.char(109, 95, 105, 109)
..
"\103\50\95"..
"\97\110\105\109"]:Hide("\84\73\78"..
string.char(84)

)
 T_h__i_s__b_u__g["\105\116\101\109\95"..
string.char(105, 109, 103, 95, 97)
..
"\110\105\109"]:Hide("\76\79\67\75"
)
else T_h__i_s__b_u__g[string.char(105, 116, 101, 109, 95, 105)
..
"\109\103\50"..
"\95\97\110\105"..
"\109"]:Show("\84\73\78\84"
)
T_h__i_s__b_u__g["\105\116\101\109\95"..
"\105\109\103\95\97"..
"\110\105\109"]:Show("\76\79\67\75"
)
end;T_h__i_s__b_u__g:Enable()
T_h__i_s__b_u__g["\105\116\101\109"]=T__h_iS_buG_["\112\114\101\102\97\98"]else T_h__i_s__b_u__g:Disable()
T_h__i_s__b_u__g["\105\116\101"..
"\109"]=nil
T_h__i_s__b_u__g[("\114\95\108\108\101\99"):reverse()
..
"\111\111\116"]:Hide()
end end;local __T__H__isB_ug=__t__HI_s_B_Ug[("\111\114\99\83"):reverse()
..
"\108\108\105\110\103"..
"\71\114\105\100"]({}
,{context=
{}
,
widget_width=
ThIS__BUg_+T_H_I__SBu_G,
widget_height=
_T__H_I_sBUG+T_H_I__SBu_G,
force_peek=
(233
+
468
+
57
-
228
-
85
==445)
,
num_visible_rows=
5,
num_columns=
5,
item_ctor_fn=
_THi_sBu_g_,
apply_fn=
T_hiSbu_G,
scrollbar_offset=
20,
scrollbar_height_offset=
-60}
)
self[string.char(103, 114, 105, 100)
]=self["\114\111\111"..
"\116"]:AddChild(__T__H__isB_ug)
__T__H__isB_ug:SetPosition(-200,-10)
self:RefreshItems()
self["\105\116\101\109\105\110"..
"\102\111\114"..
"\111\111\116"]=self["\114\111\111\116"]:AddChild(T__h_i__s__B__U_g("\114\111\111\116"
)
)
self["\105\116\101\109\105\110"..
("\116\111\111\114\111\102"):reverse()
]:SetPosition(210,-10)
local t_h_I__S_b_UG_=self["\105\116\101\109\105"..
"\110\102\111\114\111"..
string.char(111, 116)
]t_h_I__S_b_UG_[string.char(110, 97, 109, 101, 115)
..
string.char(116, 114)
]=_T_h_I_s__b_u__G(t_h_I__S_b_UG_,""
,{size=
40,
pos=
{0,
180}
}
)
t_h_I__S_b_UG_[string.char(105, 109, 103)
]=t_h_I__S_b_UG_:AddChild(__tH_i_S_B_U__g()
)
t_h_I__S_b_UG_[("\103\109\105"):reverse()
]:SetScale(2.5)
t_h_I__S_b_UG_[string.char(105, 109, 103)
]:SetPosition(0,60)
__T_h__I_S__B_ug__(t_h_I__S_b_UG_,4,400,(273
*
420
+
360
~=115030)
,{pos=
{0,
-40}
}
)
local __THiS_Bu_G_=_T_h_I_s__b_u__G(t_h_I__S_b_UG_,""
,{size=
30,
pos=
{0,
-40}
}
)
__THiS_Bu_G_:SetHAlign(ANCHOR_LEFT)
__THiS_Bu_G_:SetVAlign(ANCHOR_TOP)
__THiS_Bu_G_:SetRegionSize(260,200)
__THiS_Bu_G_:SetMultilineTruncatedString(""
,50,260,20,(178
*
353
*
229
-
230
==14388762)
)
__THiS_Bu_G_:SetPosition(0, -150)
t_h_I__S_b_UG_[string.char(100, 101, 115)
]=__THiS_Bu_G_;t_h_I__S_b_UG_["\97\99\116"]=t__h_iS_B_U_G_(t_h_I__S_b_UG_,"\230\191\128"..
"\230\180\187"
,function()
if t_h_I__S_b_UG_["\105\116\101"..
"\109"]and __T_HI_S_bUG[t_h_I__S_b_UG_[string.char(105, 116, 101, 109)
]]then local __tHi__s__b__U__G_=__T_HI_S_bUG[t_h_I__S_b_UG_[("\101\116\105"):reverse()
..
"\109"]](self,t_h_I__S_b_UG_["\105\116\101\109"])
if __tHi__s__b__U__G_ then __tHi__s__b__U__G_["\79\110\67\108"..
"\111\115\101\67"..
"\66"]=self end;TheFrontEnd:PushScreen(__tHi__s__b__U__G_)
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
t_h_I__S_b_UG_[("\101\115\117"):reverse()
]=t__h_iS_B_U_G_(t_h_I__S_b_UG_,"\228\189\191\231"..
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
t_h_I__S_b_UG_:Hide()
end
)
function t__h_i__s__b_U_G__:SetFilter(__t_h__IS_b__uG)self["\102\105\108\116\101\114"..
"\102\110"]=__t_h__IS_b__uG;self:RefreshItems()
self:SetItem()
end;function t__h_i__s__b_U_G__:RefreshItems()local _tH_i__s__BU__g={}
 for __T_Hi_s__b__u_g,_T__h__Is_bU_g in ipairs(T__H_i__s_bu_G)
do local __t__hi__s__b__U__g_=_T__h__Is_bU_g[2]if __T_HI_S_bUG[_T__h__Is_bU_g[1]]and _T__h__Is_bU_g[3]then __t__hi__s__b__U__g_=__t__hi__s__b__U__g_.."\10\32\32\45"..
"\45\230\182\136\232\128"..
string.char(151)

..tostring(_T__h__Is_bU_g[3])
.."\230\180\187"..
"\232\183\131\229\186"..
string.char(166, 229, 143, 175, 228, 187)
..
"\165\232\167"..
string.char(163, 233, 148, 129)

end;local _Thi_S__b_U__G__={item=
_T__h__Is_bU_g[1],
des=
__t__hi__s__b__U__g_,
unlock=
SoraSkinCheckFn(nil
,_T__h__Is_bU_g[1])
}
if not self[("\116\108\105\102"):reverse()
..
"\101\114\102\110"]or self[("\101\116\108\105\102"):reverse()
..
"\114\102\110"](_T__h__Is_bU_g)
then if _T__h__Is_bU_g[4]then if SoraSkinCheckFn(_T__h__Is_bU_g[1])
then table["\105\110\115\101"..
string.char(114, 116)
](_tH_i__s__BU__g,_Thi_S__b_U__G__)
end else table["\105\110\115"..
"\101\114\116"](_tH_i__s__BU__g,_Thi_S__b_U__G__)
end end end;self[("\100\105\114\103"):reverse()
]:SetItemsData(_tH_i__s__BU__g)
end;function t__h_i__s__b_U_G__:SetItem(__thisB__u__g__)local t_h_I__SbU__G_=__thisB__u__g__ and __thisB__u__g__[string.char(101, 116, 105)
:reverse()
..
"\109"] if t_h_I__SbU__G_ then local _T__h_i_sbU__G,thi_sBU__g=SoraGetImage(t_h_I__SbU__G_)
if _T__h_i_sbU__G and thi_sBU__g then self["\105\116\101"..
"\109\105\110"..
"\102\111\114\111"..
"\111\116"][("\103\109\105"):reverse()
]:SetTexture(_T__h_i_sbU__G,thi_sBU__g)
else self["\105\116\101"..
"\109\105\110"..
("\111\111\114\111\102"):reverse()
..
"\116"]["\105\109\103"]:SetTexture(GetInventoryItemAtlas("\108\111\103"..
string.char(46, 116, 101, 120)

)
,"\108\111\103"..
"\46\116\101\120"
)
end;self[string.char(101, 116, 105)
:reverse()
..
string.char(109, 105, 110)
..
("\114\111\102"):reverse()
..
"\111\111\116"]["\100\101\115"]:SetString(__thisB__u__g__["\100\101\115"]or""
)
self["\105\116\101\109"..
"\105\110\102\111\114\111"..
"\111\116"]["\105\116\101\109"]=t_h_I__SbU__G_;if GLOBAL["\80\114\101\102"..
("\115\98\97"):reverse()
][t_h_I__SbU__G_]["\105\115\95"..
"\115\107\105\110"]then self["\105\116\101\109\105"..
("\111\114\111\102\110"):reverse()
..
"\111\116"]["\110\97\109\101\115\116"..
"\114"]:SetString((STRINGS["\78\65\77\69\83"][GetSkinBase(t_h_I__SbU__G_)
:upper()
]or""
)
.."\124"
.. (STRINGS["\83\75\73\78\95"..
"\78\65\77\69\83"][t_h_I__SbU__G_]or""
)
)
else self["\105\116\101\109"..
"\105\110\102\111\114\111"..
string.char(116, 111)
:reverse()
]["\110\97\109\101\115\116"..
string.char(114)
]:SetString((STRINGS[("\77\65\78"):reverse()
..
"\69\83"][t_h_I__SbU__G_:upper()
]or""
)
)
end;self[string.char(105, 116, 101, 109)
..
string.char(105, 110, 102, 111)
..
"\114\111\111\116"]:Show()
if SoraSkinCheckFn(nil
,t_h_I__SbU__G_)
then self["\105\116\101\109"..
"\105\110\102\111\114\111"..
"\111\116"]["\97\99\116"]:Hide()
 if UseSkin[t_h_I__SbU__G_]then self["\105\116\101\109"..
"\105\110\102\111"..
"\114\111\111\116"]["\117\115\101"]:SetOnClick(function()
if not self["\117\115\101\99\100"]then self["\117\115\101\99\100"]=SoraCD(1)
end;if self[string.char(117, 115, 101, 99)
..
"\100"]()
then if not(UseSkin[t_h_I__SbU__G_]["\99\108\105\101\110"..
("\110\102\116"):reverse()
]and not UseSkin[t_h_I__SbU__G_]["\99\108\105"..
"\101\110\116\102\110"](ThePlayer,t_h_I__SbU__G_)
)
then SkinRPC("\85\115\101\83\107\105"..
"\110"
,t_h_I__SbU__G_)
end end end
)
self["\105\116\101\109\105\110"..
"\102\111\114\111\111\116"][string.char(117, 115, 101)
]:Show()
else self["\105\116\101\109\105\110"..
"\102\111\114\111\111\116"]["\117\115\101"]:SetOnClick(NilFn)
self["\105\116\101"..
"\109\105\110\102\111"..
string.char(114, 111, 111)
..
"\116"]["\117\115\101"]:Hide()
end else self["\105\116\101\109\105"..
string.char(110, 102, 111, 114, 111, 111)
..
"\116"]["\117\115\101"]:Hide()
self["\105\116\101\109\105\110"..
string.char(102, 111, 114)
..
string.char(111, 111, 116)
]["\117\115\101"]:SetOnClick(NilFn)
if __T_HI_S_bUG[t_h_I__SbU__G_]then self[string.char(105, 116, 101, 109, 105, 110)
..
"\102\111\114\111\111\116"]["\97\99\116"]:Show()
else self["\105\116\101\109\105"..
"\110\102\111\114\111"..
string.char(111, 116)
]["\97\99\116"]:Hide()
end end else self["\105\116\101"..
"\109\105\110\102\111\114"..
string.char(111, 111, 116)
]:Hide()
self[string.char(105, 116, 101, 109, 105, 110)
..
string.char(102, 111, 114, 111)
..
"\111\116"]["\105\116\101"..
"\109"]=nil
end end;function t__h_i__s__b_U_G__:OnControl(__Th_is__bU__g_,Th__i_sB_u_g_)if t__h_i__s__b_U_G__["\95\98\97"..
("\101\115"):reverse()
]["\79\110\67\111"..
"\110\116\114\111\108"](self,__Th_is__bU__g_,Th__i_sB_u_g_)
then return( false
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
 
 true
 and
 
 true
 and
 
 true
 and
 not
 false
 and
 not
 false
 or
 not
 false
 and
 
 true
 or
 
 true
)
end;if __Th_is__bU__g_==CONTROL_CANCEL and not Th__i_sB_u_g_ then self:Close()
 TheFrontEnd:GetSound()
:PlaySound(string.char(100, 111, 110, 116, 115, 116)
..
("\118\114\97"):reverse()
..
"\101\47\72"..
("\47\68\85"):reverse()
..
string.char(99, 108, 105, 99, 107, 95)
..
"\109\111\118\101"
)
return( false
 and
 not
 false
 and
 
 false
 or
 
 false
 and
 not
 true
 or
 not
 false
 and
 not
 true
 and
 not
 true
 and
 
 false
 and
 not
 false
 or
 not
 false
)
end end;function t__h_i__s__b_U_G__:CloseCB()self:RefreshItems()
self:SetItem()
end;function t__h_i__s__b_U_G__:Close()if self[string.char(79, 110, 67, 108, 111)
..
"\115\101\67\66"]then self["\79\110\67\108\111"..
string.char(115, 101, 67, 66)
]["\67\108\111"..
"\115\101\67\66"](self["\79\110\67\108\111\115"..
"\101\67\66"],self)
end;TheFrontEnd:PopScreen(self)
end AddClassPostConstruct("\119\105\100\103\101\116"..
string.char(115, 47, 114)
..
"\101\100\117\120\47"..
"\99\114\97"..
string.char(102, 116, 105, 110, 103, 109)
..
"\101\110\117"..
("\98\110\105\112\95"):reverse()
..
string.char(97, 114)

,function(__T_his__bU__G__)
if __T_his__bU__G__[string.char(101, 110, 119, 111)
:reverse()
..
"\114"]and __T_his__bU__G__["\111\119\110\101\114"]:HasTag("\115\111\114\97"
)
and __T_his__bU__G__["\111\112\101\110\95\109"..
"\101\110\117"..
"\95\98\117"..
"\116\116\111\110"]then tHIs_b__u_G_(__T_his__bU__G__["\111\112\101"..
("\101\109\95\110"):reverse()
..
"\110\117\95\98"..
"\117\116\116\111"..
string.char(110)
],"\115\111\114\97"..
"\95\117\105\95"..
"\105\116\101\109\105\99"..
"\111\110"
,function()
local __thI__S_b_U__G=PushItemScr()
if __thI__S_b_U__G then __thI__S_b_U__G:SetFilter(t__H_i_Sb_ug_)
end end
,{size=
{30,
30}
,
pos=
{80,
-32}
}
)
tHIs_b__u_G_(__T_his__bU__G__["\111\112\101\110\95"..
"\109\101\110\117"..
"\95\98\117"..
"\116\116\111\110"],string.char(115, 111, 114, 97, 95)
..
"\117\105\95\115\107\105"..
"\110\105\99"..
"\111\110"
,function()
local __t_h_I_s_b_u_G=PushItemScr()
if __t_h_I_s_b_u_G then __t_h_I_s_b_u_G:SetFilter(__t_H_i__s_b_UG_)
end end
,{size=
{30,
30}
,
pos=
{80,
32}
}
)
end end
)
end;global("\71\101\116\83"..
"\101\99\111"..
"\110\100\65\102\116"..
("\114\101"):reverse()

)
if not GLOBAL["\71\101\116\83\101"..
"\99\111\110\100"..
("\116\102\65"):reverse()
..
"\101\114"]then function GLOBAL.GetSecondAfter(_t__h__is_b__u__g__)local __t_H__I_S__bU_G=os["\99\108\111\99\107"]()
+_t__h__is_b__u__g__;while os["\99\108\111\99"..
string.char(107)
]()
<__t_H__I_S__bU_G do end;return os["\99\108\111"..
"\99\107"]()
end;GetSecondAfter(1)
end