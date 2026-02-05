--[[
授权级别:不授权
Copyright 2025 [FL]。
该文件仅限我自己使用 谢绝授权
]]-- 请勿破解本文件
local tH_i__s_B_u__g={}
local __t_h__I_sb__U_G_={}
local _t__HI_s__B_UG_={}
local THi__SBUg__={}
local tHis_B_uG_=SoraAPI["\106\115\111\110"]local _th__isBUg={}
local _thIs_B_ug__={}
local _t__h_IS_BUg_=TheNet:GetUserID()
local _T_h__i_SB__uG=""
local _tH__is__B__UG;local __t__HIS__b__Ug__={}
local function th__iSb_u_g__(__T__h__I__S_B_u__G__)return string["\115\117\98"](__T__h__I__S_B_u__G__,-5)
=="\95\110\111"..
"\110\101"
end;local _t__HIs_bu_G__=(206
-
378
*
170
-
193
==-64237)
function SoraSkinCheckFn(__t__hi_s_Bug,TH_I_s__b_U_g)if __t__hi_s_Bug and not TH_I_s__b_U_g then TH_I_s__b_U_g=__t__hi_s_Bug end;TH_I_s__b_U_g=GetSkinMap(TH_I_s__b_U_g)
return th__iSb_u_g__(TH_I_s__b_U_g)
or(__t_h__I_sb__U_G_[TH_I_s__b_U_g]or THi__SBUg__[TH_I_s__b_U_g])
and(283
-
358
-
46
==-121)
or(466
+
193
*
0
==471)
end;function SoraSkinCheckClientFn(_THi__SbU__g__,__T__H_i_sB__U_G,Th__I_S_B_u__G__)local Th_is_b_U__g_=Th__I_S_B_u__G__;Th__I_S_B_u__G__=GetSkinMap(Th__I_S_B_u__G__)
if __T__H_i_sB__U_G and Th__I_S_B_u__G__ then local THI__sb_u__g=GetSkin(Th__I_S_B_u__G__)
if not THI__sb_u__g and not IsItem({Th__I_S_B_u__G__}
)
then return(286
+
276
+
498
+
67
~=1127)
end;local T__h_I__S_B__UG;if Th_is_b_U__g_~=Th__I_S_B_u__G__ then T__h_I__S_B__UG=GetSkin(Th_is_b_U__g_)
end;if THI__sb_u__g and(T__h_I__S_B__UG or THI__sb_u__g)
["\105\115\99\104"..
"\97\114\97\99\116"..
"\101\114\115\107\105\110"..
"\115"]then if __t__HIS__b__Ug__[__T__H_i_sB__U_G]then return(134
*
101
*
482
-
187
~=6523208)
end;if not _th__isBUg[__T__H_i_sB__U_G]then return(75
-
457
-
254
-
50
~=-679)
end end;if _th__isBUg[__T__H_i_sB__U_G]then if tH_i__s_B_u__g[__T__H_i_sB__U_G]and tH_i__s_B_u__g[__T__H_i_sB__U_G][Th__I_S_B_u__G__]then return(75
-
387
+
137
+
435
~=264)
end;if _t__HI_s__B_UG_[__T__H_i_sB__U_G]and _t__HI_s__B_UG_[__T__H_i_sB__U_G][Th__I_S_B_u__G__]then return(145
*
218
+
153
*
117
-
420
~=49095)
end end;return(211
*
186
+
345
-
451
==39143)
end;return th__iSb_u_g__(Th__I_S_B_u__G__)
or(57
+
338
-
151
-
484
+
267
~=27)
end;UseSkin={}
function IsItem(__tHI_s__BuG_)local _T_H_IS_BuG_=__tHI_s__BuG_[1]if UseSkin[_T_H_IS_BuG_]then return(198
+
425
-
254
-
249
~=123)
else return(301
*
88
+
312
-
448
~=26352)
end end;function IsSkin(TH__Is__Bu_G_)return not IsItem(TH__Is__Bu_G_)
end;function RegUseSkinFN(_T_H__isB_U__g__,__tH_iSb__uG_,_T__Hi__S_Bu__G)UseSkin[_T_H__isB_U__g__]={serverfn=
__tH_iSb__uG_,
clientfn=
_T__Hi__S_Bu__G}
end;local _t_H__I_SB_U__g="\83\111\114\97\83\107"..
"\105\110\67"..
"\97\99\104"..
"\101"
local __T_h_i_s__b_U_G_=_t_H__I_SB_U__g.."\95\115\101"..
"\114\118\101\114"
if TheNet:GetIsServer()
then TheSim:GetPersistentString(__T_h_i_s__b_U_G_,function(_T__His_bU_g,
_T_h_i__sb_U__g__)
if _T__His_bU_g then local _T__h__i__s__B__u__g_,__t_h_i__s__bU_g__=pcall(tHis_B_uG_["\100\101\99"..
"\111\100\101"],_T_h_i__sb_U__g__)
if _T__h__i__s__B__u__g_ and __t_h_i__s__bU_g__["\116\109\112"]and __t_h_i__s__bU_g__[("\101\110\119\111"):reverse()
..
"\114"]then for T_h_i__Sbu__G,_t_HI__S__b__Ug__ in pairs(__t_h_i__s__bU_g__["\111\119\110\101\114"])
do if type(_t_HI__S__b__Ug__)
=="\116\97\98\108\101"
then tH_i__s_B_u__g[T_h_i__Sbu__G]=_t_HI__S__b__Ug__ end end;for __t__Hi__S_B_u__g_,__T_H__I_s__b__u_G in pairs(__t_h_i__s__bU_g__["\116\109\112"])
do if type(__T_H__I_s__b__u_G)
=="\116\97\98\108"..
string.char(101)

then _t__HI_s__B_UG_[__t__Hi__S_B_u__g_]=__T_H__I_s__b__u_G end end end end end
)
end;if not TheNet:IsDedicated()
then TheSim:GetPersistentString(_t_H__I_SB_U__g,function(t_h__i__s_bu__g__,
tH_i_sB_u_G)
if t_h__i__s_bu__g__ then local _tH__I_s__b__ug,__Th_iS_B__U__G_=pcall(tHis_B_uG_[string.char(100, 101, 99)
..
"\111\100\101"],tH_i_sB_u_G)
if _tH__I_s__b__ug and __Th_iS_B__U__G_["\116\109\112"]and __Th_iS_B__U__G_["\111\119\110\101"..
"\114"]then for thiS__b_uG__,T__H__I__s__b_U__g in pairs(__Th_iS_B__U__G_["\111\119\110\101\114"])
do if type(thiS__b_uG__)
=="\115\116\114\105\110"..
"\103"
and T__H__I__s__b_U__g==1 then __t_h__I_sb__U_G_[thiS__b_uG__]=T__H__I__s__b_U__g end end;for t_h_iS__bU__G_,__Th_i_SBu_G_ in pairs(__Th_iS_B__U__G_[("\112\109\116"):reverse()
])
do if type(t_h_iS__bU__G_)
=="\115\116\114\105"..
string.char(110, 103)

and __Th_i_SBu_G_==1 then THi__SBUg__[t_h_iS__bU__G_]=__Th_i_SBu_G_ end end end end end
)
end;function SaveSkinCache()if TheNet:GetIsServer()
then local _T_h_Is_b_u_g_,t_H__iSb__uG__=pcall(tHis_B_uG_[string.char(101, 110, 99, 111, 100)
..
"\101"],{owner=
tH_i__s_B_u__g,
tmp=
_t__HI_s__B_UG_}
)
if _T_h_Is_b_u_g_ then TheSim:SetPersistentString(__T_h_i_s__b_U_G_,t_H__iSb__uG__,(194
+
359
+
154
~=709)
)
end end;local __Th_I_S_B_u__G,__t_H_i_SBU__g=pcall(tHis_B_uG_[string.char(101, 110, 99, 111)
..
"\100\101"],{owner=
__t_h__I_sb__U_G_,
tmp=
THi__SBUg__}
)
if __Th_I_S_B_u__G then TheSim:SetPersistentString(_t_H__I_SB_U__g,__t_H_i_SBU__g,(170
-
267
*
393
==-104761)
)
end end;local __t__his_b_u_g__={sora_mysora=
1,
sora_mysora_r=
1,
sora_yhjd=
1,
sora_sby=
1}
RegUseSkinFN("\115\111\114\97\95\121"..
string.char(105, 110, 103, 121, 117)

,function(__t__h_Is__b_U_g_,
T_H__Isb_u__G_)
if __t__h_Is__b_U_g_ and __t__h_Is__b_U_g_[string.char(99, 111, 109)
..
"\112\111\110\101\110"..
"\116\115"]["\115\111\114\97\105\116"..
"\101\109\99"..
"\111\110\116\114"..
"\111\108"]then __t__h_Is__b_U_g_["\99\111\109"..
"\112\111\110\101\110"..
"\116\115"]["\115\111\114"..
string.char(97, 105, 116, 101, 109)
..
string.char(99, 111, 110, 116)
..
("\108\111\114"):reverse()
]:CreateItem("\115\111\114\97\95\121"..
string.char(105, 110, 103)
..
"\121\117"
)
end end
)
 RegUseSkinFN("\115\111\114\97\95\100"..
"\105\101\121\117"
,function(tH_i_S__b__U_G_,
_TH_i__sBuG_)
if tH_i_S__b__U_G_ and tH_i_S__b__U_G_["\99\111\109\112\111\110"..
"\101\110\116\115"][string.char(115, 111, 114, 97)
..
string.char(105, 116, 101, 109)
..
"\99\111\110\116\114"..
"\111\108"]then tH_i_S__b__U_G_["\99\111\109\112\111"..
string.char(115, 116, 110, 101, 110)
:reverse()
]["\115\111\114\97"..
"\105\116\101"..
string.char(109, 99, 111, 110, 116, 114)
..
"\111\108"]:CreateItem("\115\111\114\97"..
"\95\100\105"..
string.char(101, 121, 117)

)
end end
)
RegUseSkinFN("\115\111\114\97\95\113"..
("\117\121\105"):reverse()

,function(__T__h__Is__B__u__g,
_T_H__I_S_Bu_g)
if __T__h__Is__B__u__g and __T__h__Is__B__u__g[string.char(99, 111, 109, 112, 111)
..
string.char(110, 101, 110, 116, 115)
]["\115\111\114\97"..
string.char(105, 116, 101)
..
"\109\99\111"..
"\110\116\114\111\108"]then __T__h__Is__B__u__g["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114"..
"\97\105\116\101\109"..
"\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114\97\95"..
"\113\105\121\117"
)
end end
)
RegUseSkinFN(string.char(95, 97, 114, 111, 115)
:reverse()
..
"\108\121\106"
,function(__T_H_I__s__b__UG__,
_t_H__i__S__b__U_G__)
 if __T_H_I__s__b__UG__ and __T_H_I__s__b__UG__["\99\111\109\112\111\110"..
string.char(101, 110, 116, 115)
]["\115\111\114\97\105"..
"\116\101\109\99\111"..
string.char(110, 116, 114, 111, 108)
]then __T_H_I__s__b__UG__["\99\111\109\112\111\110"..
"\101\110\116"..
("\115"):reverse()
]["\115\111\114\97\105"..
"\116\101\109"..
"\99\111\110"..
"\116\114\111"..
"\108"]:CreateItem("\115\111\114\97\95"..
string.char(108, 121, 106)

)
end end
)
 RegUseSkinFN(string.char(115, 111, 114, 97)
..
"\95\108\97\110\116"..
"\101\114\110"
,function(_T_H__is_B_u__g__,
__t__h_is__b__U_G__)
if _T_H__is_B_u__g__ and _T_H__is_B_u__g__[string.char(99, 111, 109, 112, 111)
..
"\110\101\110\116"..
"\115"]["\115\111\114\97\105\116"..
"\101\109\99"..
"\111\110\116"..
"\114\111\108"]then _T_H__is_B_u__g__["\99\111\109\112\111"..
"\110\101\110"..
"\116\115"]["\115\111\114\97\105"..
string.char(116, 101, 109)
..
"\99\111\110"..
"\116\114\111\108"]:CreateItem("\115\111\114"..
"\97\95\108\97\110\116"..
"\101\114\110"
)
end end
)
RegUseSkinFN("\115\111\114\97"..
"\95\108\97\110\116\101"..
"\114\110\95"..
string.char(121, 104)

,function(_THi_s_b_u_G_,
__t__HiS__bu__g_)
if _THi_s_b_u_G_ and _THi_s_b_u_G_["\99\111\109\112\111\110"..
("\115\116\110\101"):reverse()
]["\115\111\114"..
"\97\105\116"..
"\101\109\99\111"..
"\110\116\114\111\108"]then _THi_s_b_u_G_["\99\111\109\112"..
("\116\110\101\110\111"):reverse()
..
string.char(115)
]["\115\111\114\97\105\116"..
("\111\99\109\101"):reverse()
..
"\110\116\114\111\108"]:CreateItem("\115\111\114"..
"\97\95\108\97"..
string.char(110, 116, 101)
..
"\114\110"
,string.char(114, 111, 115)
:reverse()
..
"\97\95\108"..
"\97\110\116\101"..
string.char(114, 110, 95, 121)
..
"\104"
)
end end
)
RegUseSkinFN(string.char(114, 111, 115)
:reverse()
..
("\114\95\97"):reverse()
..
"\105\110\103"
,function(_t__h__I__S__b__u__g,
__th_I__S_B__ug__)
if _t__h__I__S__b__u__g and _t__h__I__S__b__u__g["\99\111\109"..
("\101\110\111\112"):reverse()
..
string.char(110, 116, 115)
]["\115\111\114\97\105"..
"\116\101\109\99\111"..
"\110\116\114\111"..
string.char(108)
]then _t__h__I__S__b__u__g[string.char(99, 111, 109, 112)
..
string.char(111, 110, 101)
..
"\110\116\115"][("\114\111\115"):reverse()
..
("\101\116\105\97"):reverse()
..
"\109\99\111"..
"\110\116\114\111\108"]:CreateItem("\115\111\114\97"..
"\95\114\105\110\103"
)
end end
)
local function _th_I_sb_u__G__(_T_H_I_s__BuG__,THis__b_u_g_,__T__HISB_U_g__)local t__H__isBUG__={}
t__H__isBUG__[string.char(113, 117, 111, 116, 101)
..
"\115"]="\230\149\162\229\138"..
"\168\230\136"..
"\145\229\176\177\230\157"..
"\128\228\186"..
"\134\228\189"..
"\160\229\147\166"
t__H__isBUG__["\114\97\114"..
"\105\116\121"]="\230\149\162\229\138\168"..
"\230\136\145\229\176\177"..
"\230\157\128"..
"\228\186\134\228\189\160"..
string.char(229, 147, 166)

t__H__isBUG__["\114\97\114\105\116\121"..
"\99\111\114"..
"\108\111\114"]={255/255,
215/255,
0/255,
1}
t__H__isBUG__["\114\97\114\105"..
("\101\100\114\111\121\116"):reverse()
..
"\114"]=100;t__H__isBUG__[string.char(114, 101, 108, 101, 97)
..
string.char(115, 101, 95, 103)
..
"\114\111\117\112"]=-1006 t__H__isBUG__[string.char(115, 107, 105, 110, 95, 116)
..
"\97\103\115"]={"\66\65\83\69"
,
("\114\111\115"):reverse()
..
string.char(97)

,
"\67\72\65\82\65"..
"\67\84\69\82"
}
t__H__isBUG__["\115\107\105"..
string.char(110, 115)
]={normal_skin=
_T_H_I_s__BuG__,
ghost_skin=
"\103\104\111\115\116\95"..
"\115\111\114\97\95\98"..
"\117\105\108\100"
}
t__H__isBUG__["\99\104\101\99\107\102"..
"\110"]=SoraSkinCheckFn;t__H__isBUG__[string.char(99, 104, 101)
..
"\99\107\99\108\105\101"..
"\110\116\102"..
"\110"]=SoraSkinCheckClientFn;t__H__isBUG__["\115\104\97\114"..
"\101\95\98\105\103\112"..
"\111\114\116\114\97"..
("\95\116\105"):reverse()
..
"\110\97\109"..
string.char(101)
:reverse()
]="\115\111\114\97"
t__H__isBUG__["\70\114\97\109"..
("\121\83\101"):reverse()
..
"\109\98\111"..
string.char(108)
]="\68\105\115\116\105\110"..
"\103\117\105\115"..
"\104\101\100"
for thI__S__B__uG_,T__hI__S_B__uG_ in pairs(THis__b_u_g_)
do t__H__isBUG__[thI__S__B__uG_]=T__hI__S_B__uG_ end;if t__H__isBUG__[string.char(105, 115, 95, 108, 111, 110)
..
string.char(103, 104, 97, 105, 114)
]then t__H__isBUG__["\115\107\105\110\115"][("\95\116\115\111\104\103"):reverse()
..
"\115\107\105"..
"\110"]=string.char(103, 104, 111, 115, 116, 95)
..
"\115\111\114\97"..
("\98\95\114\95"):reverse()
..
"\117\105\108\100"
end;MakeCharacterSkin("\115\111\114\97"
,_T_H_I_s__BuG__,t__H__isBUG__)
 if not __T__HISB_U_g__ then local T__Hi__S__B__U_g_=shallowcopy(t__H__isBUG__)
T__Hi__S__B__U_g_["\114\97\114"..
"\105\116\121"]="\233\153\144\230"..
"\151\182\228\189\147\233"..
"\170\140"
T__Hi__S__B__U_g_["\114\97\114"..
"\105\116\121\111"..
string.char(101, 100, 114)
:reverse()
..
"\114"]=80;T__Hi__S__B__U_g_["\114\97\114\105\116\121"..
"\99\111\114"..
string.char(108, 111, 114)
]={0.957,
0.769,
0.188,
1}
T__Hi__S__B__U_g_["\70\114\97\109"..
string.char(101, 83, 121, 109, 98, 111)
..
"\108"]="\104\101\105"..
"\114\108\111\111\109"
T__Hi__S__B__U_g_[string.char(110, 97, 109, 101)
]=THis__b_u_g_["\110\97\109\101"].."\40\233\153\144\230"..
"\151\182\41"
SoraAPI["\77\97\107\101"..
"\67\104\97\114"..
"\97\99\116\101\114\83"..
"\107\105\110"](string.char(115, 111, 114, 97)

,_T_H_I_s__BuG__.."\95\116\109"..
"\112"
,T__Hi__S__B__U_g_)
end end;_th_I_sb_u__G__("\115\111\114\97"..
("\115\121\109\95"):reverse()
..
"\111\114\97"
,{name=
"\232\138\177\229"..
"\171\129"
,
des=
"\230\137\167\229"..
"\173\144\228\185\139"..
("\44\139\137\230"):reverse()
..
string.char(228, 184, 142)
..
("\129\229\144\173\229"):reverse()
..
"\149\232\128\129"
}
)
 _th_I_sb_u__G__("\115\111\114\97"..
"\95\109\121\115"..
"\111\114\97\95"..
"\114"
,{name=
"\232\138\177\229"..
("\45\129\171"):reverse()
..
"\233\149\191\229"..
"\143\145"
,
is_longhair=
(293
-
318
*
329
*
415
-
201
~=-43418036)
,
des=
string.char(230, 137, 167, 229, 173)
..
("\185\228\144"):reverse()
..
"\139\230\137\139\44"..
("\144\173\229\142\184\228"):reverse()
..
"\229\129\149\232\128"..
string.char(129)

}
)
 _th_I_sb_u__G__("\115\111\114"..
"\97\95\115\98"..
"\121"
,{name=
("\230\184\176\230"):reverse()
..
string.char(129, 146, 230, 176, 180)
..
"\229\133\181\230\156"..
("\136"):reverse()

,
des=
"\228\187\163\232"..
"\161\168\230"..
string.char(156, 136, 228, 186, 174)
..
"\230\182\136"..
"\231\129\173"..
"\228\189\160"
,
init_fn=
function(t__H_i_s__b__uG__)
if t__H_i_s__b__uG__ and TheWorld["\105\115\109"..
"\97\115\116\101"..
"\114\115\105\109"]then t__H_i_s__b__uG__[string.char(115, 111, 114, 97, 102, 111)
..
"\111\116\95\102\120"]=SpawnPrefab("\115\111\114\97\95"..
string.char(102, 111, 111, 116)
..
string.char(95, 102, 120, 95, 115, 98)
..
"\121"
)
t__H_i_s__b__uG__["\115\111\114\97"..
"\102\111\111\116\95"..
"\102\120"][string.char(101, 110, 116, 105)
..
"\116\121"]:SetParent(t__H_i_s__b__uG__[string.char(101, 110, 116, 105, 116)
..
("\121"):reverse()
])
t__H_i_s__b__uG__[string.char(115, 111, 114, 97, 102)
..
"\111\111\116\95"..
"\102\120"][string.char(114, 101, 110, 119, 111)
:reverse()
]=t__H_i_s__b__uG__;t__H_i_s__b__uG__["\115\111\114\97\100"..
"\97\110\99\101\102"..
"\120\112\114\101"..
string.char(102, 97, 98)
]="\115\111\114\97\95\102"..
("\116\97\101\102\95\120"):reverse()
..
"\104\101\114"
end end
,
clear_fn=
function(_tHi_Sb__u_G__)
if _tHi_Sb__u_G__ and _tHi_Sb__u_G__["\115\111\114"..
"\97\102\111\111\116"..
"\95\102\120"]and TheWorld["\105\115\109"..
"\97\115\116\101"..
"\114\115\105\109"]then _tHi_Sb__u_G__[string.char(115, 111, 114)
..
"\97\102\111\111\116"..
"\95\102\120"]:Remove()
_tHi_Sb__u_G__[string.char(115, 111, 114, 97, 100, 97)
..
"\110\99\101\102"..
"\120\112\114"..
string.char(97, 102, 101)
:reverse()
..
"\98"]=nil
end end
}
)
MakeSkinNameMap("\115\111\114\97\95\115"..
"\100\115\122"
,"\115\111\114"..
"\97\95\115"..
"\100\115\122\95"..
"\114"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\115\100\115\122"
,"\115\111\114\97"..
string.char(98, 97, 103)
..
"\95\115\100"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\119\115\113"..
("\121"):reverse()

,"\115\111\114\97\98\97"..
"\103\95\119\115"..
string.char(113, 121)

)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110"..
("\108\95\116\111"):reverse()
..
"\100"
,"\115\111\114\97\112"..
"\97\99\107\101\114"..
"\95\108\100"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111"..
"\116\95\108\100"
,"\115\111\114\97\51"..
"\112\97\99\107\101\114"..
"\95\108\100"
)
MakeSkinNameMap(string.char(114, 111, 115)
:reverse()
..
"\97\98\111\119\107\110"..
string.char(111, 116, 95, 115, 98, 121)

,"\115\111\114\97"..
"\112\97\99\107\101"..
"\114\95\115"..
"\98\121"
)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107\110"..
string.char(111, 116, 95, 115)
..
"\98\121"
,"\115\111\114\97\51\112"..
"\97\99\107"..
"\101\114\95\115"..
"\98\121"
)
MakeSkinNameMap("\115\111\114"..
"\97\98\111"..
"\119\107\110\111\116"..
"\95\100\119"
,"\115\111\114\97"..
("\99\97\112"):reverse()
..
"\107\101\114\95\100"..
"\119"
)
MakeSkinNameMap(("\97\114\111\115"):reverse()
..
"\98\111\119\107"..
"\110\111\116\95"..
"\100\119"
,"\115\111\114\97\51"..
"\112\97\99\107"..
"\101\114\95\100\119"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110\111\116\95"..
"\119\115\113"..
"\121"
,string.char(114, 111, 115)
:reverse()
..
"\97\112\97\99\107\101"..
"\114\95\119\115\113\121"
)
 MakeSkinNameMap("\115\111\114\97\98"..
"\111\119\107\110"..
"\111\116\95\119\115"..
string.char(113, 121)

,("\112\51\97\114\111\115"):reverse()
..
"\97\99\107\101"..
"\114\95\119"..
"\115\113\121"
)
MakeSkinNameMap(string.char(115, 111, 114, 97)
..
string.char(98, 111, 119, 107, 110, 111)
..
"\116\95\100\119\95\116"..
"\109\112"
,"\115\111\114\97\112\97"..
("\101\107\99"):reverse()
..
"\114\95\100"..
string.char(119, 95, 116, 109, 112)

)
MakeSkinNameMap("\115\111\114"..
string.char(97, 98, 111, 119, 107)
..
"\110\111\116\95\100"..
"\119\95\116"..
"\109\112"
,"\115\111\114\97"..
"\51\112\97\99\107"..
"\101\114\95\100\119"..
("\112\109\116\95"):reverse()

)
MakeSkinNameMap(("\97\114\111\115"):reverse()
..
"\95\115\100\115"..
"\122\95\116"..
string.char(109, 112)

,string.char(115, 111, 114, 97, 95)
..
"\115\100\115\122\95\114"..
"\95\116\109"..
"\112"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(95, 115, 100)
..
"\115\122\95\116\109"..
"\112"
,string.char(115, 111, 114, 97, 98)
..
"\97\103\95\115\100"..
string.char(95, 116, 109, 112)

)
 AddSimPostInit(function()
local THi_S__b_Ug=ShouldDisplayItemInCollection;GLOBAL["\83\104\111\117\108"..
"\100\68\105"..
"\115\112\108\97\121\73"..
string.char(116, 101, 109, 73, 110, 67)
..
"\111\108\108\101"..
"\99\116\105\111\110"]=function(__T__H__ISBU__g__,...
)
if(__t__his_b_u_g__[__T__H__ISBU__g__]or __T__H__ISBU__g__:match("\94\115\111\114\97"..
"\95\46\43"..
"\95\116\109"..
"\112\36"
)
)
and not SoraSkinCheckFn(TheInventory,__T__H__ISBU__g__)
then return(424
+
414
-
224
+
107
-
449
~=272)
end;return THi_S__b_Ug(__T__H__ISBU__g__,...
)
end
end
)
local th_iS_B__U__g__;if SkinAPIThankYouPopup then th_iS_B__U__g__=SkinAPIThankYouPopup else th_iS_B__U__g__=require"screens/thankyoupopup"end;local function _T_H__i__S__B_U_g__(__t_h_i_S_bUg_,__t_h__i__s__B_uG_)local __T__HI_SBU_G__=GetSkinMapByBase(__t_h_i_S_bUg_)
local __T_h_i_s__b_Ug__={}
for t_H__i__S_Bu__G,_T__H__i__sBU_g in pairs(__T__HI_SBU_G__)
do table[string.char(105, 110, 115, 101)
..
"\114\116"](__T_h_i_s__b_Ug__,{item=
t_H__i__S_Bu__G,
item_id=
1,
gifttype=
string.char(83, 79, 82, 65, 83, 75)
..
"\73\78"
}
)
end;local __tH__i__s_bu_g=th_iS_B__U__g__(__T_h_i_s__b_Ug__)
if __t_h__i__s__B_uG_ then if __t_h__i__s__B_uG_[string.char(115, 107, 105, 110)
..
"\110\97\109"..
("\101"):reverse()
]then local __T_HI_s__B__u_g__=__tH__i__s_bu_g["\83\101\116\83"..
("\97\78\110\105\107"):reverse()
..
string.char(109, 101)
]__tH__i__s_bu_g["\83\101\116\83\107"..
"\105\110\78\97\109"..
"\101"]=function(_T__H_I_s__B__u__g_,...
)
__T_HI_s__B__u_g__(_T__H_I_s__B__u__g_,...
)
__tH__i__s_bu_g["\105\116\101\109\95\110"..
"\97\109\101"]:SetString(__t_h__i__s__B_uG_["\115\107\105"..
"\110\110\97\109\101"])
end
end if __t_h_i_S_bUg_:match("\94\73\79"..
"\85\95"
)
then local t_hisb_u__G__=__tH__i__s_bu_g[string.char(67, 104, 97)
..
"\110\103\101\71\105\102"..
string.char(116)
]__tH__i__s_bu_g["\67\104\97\110\103\101"..
"\71\105\102"..
"\116"]=function(Th__I__SBU__G,...
)
t_hisb_u__G__(Th__I__SBU__G,...
)
 __tH__i__s_bu_g["\115\112\97\119\110\95"..
"\112\111\114\116\97\108"]:GetAnimState()
:OverrideSkinSymbol(("\80\65\87\83"):reverse()
..
"\95\73\67\79\78"
,GetInventoryItemAtlas("\119\97\120\112"..
"\97\112\101\114\46"..
"\116\101\120"
)
,"\119\97\120\112"..
"\97\112\101\114"..
"\46\116\101\120"
)
end
local __t_HiS_bu__g__=__tH__i__s_bu_g[string.char(79, 112, 101, 110, 71, 105)
..
"\102\116"]__tH__i__s_bu_g[string.char(79, 112, 101)
..
"\110\71\105"..
"\102\116"]=function(_t__hIS__B_ug__,...
)
__t_HiS_bu__g__(_t__hIS__B_ug__,...
)
__tH__i__s_bu_g["\115\112\97\119\110"..
string.char(95, 112, 111, 114, 116)
..
"\97\108"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,GetInventoryItemAtlas("\119\97\120\112\97"..
"\112\101\114\46\116"..
("\120\101"):reverse()

)
,"\119\97\120"..
string.char(112, 97, 112)
..
"\101\114\46\116\101"..
"\120"
)
end
__tH__i__s_bu_g[string.char(116, 105, 116, 108, 101)
]:SetString("\230\172\160"..
string.char(230, 157, 161)
..
"\40\229\136\176\230\156"..
"\159\232\135"..
"\170\229\138\168\229"..
"\133\145\230\141\162\41"
)
end end;TheFrontEnd:PushScreen(__tH__i__s_bu_g)
end;local _tHIsb__uG="\104\116\116\112\58"..
"\47\47\115\107\105\110"..
"\46\102\108\97\112"..
"\105\46\99\110"..
string.char(47, 97, 112)
..
"\105\47\68\115"..
string.char(116)

local _TH__i_S__bu__G__=""
local _T_HIsB_ug=0;local function _T__HI__s_bu_g()end local __T__hi_s_b_u__g__=SoraCD(5,(65
-
332
*
398
*
252
-
101
==-33298308)
)
local function _thIsB_U_g__(__T__h__is__B__U__g,__t_H_IS__bU_G__,_t__H_iSb__u_G_)if not __T__h__is__B__U__g then return(331
-
89
-
227
-
230
==-206)
end;__t_H_IS__bU_G__=__t_H_IS__bU_G__ or{}
__t_H_IS__bU_G__["\109\111\100"]=modname;__t_H_IS__bU_G__["\101\120\116"]=DATASKINEXT or{}
if DATASKINFN then DATASKINFN(__t_H_IS__bU_G__)
end;_t__H_iSb__u_G_=_t__H_iSb__u_G_ or _T__HI__s_bu_g;local _thI__S__bU__g__,__t__h__ISb__u__g=pcall(tHis_B_uG_["\101\110\99\111"..
"\100\101"],__t_H_IS__bU_G__)
if _thI__S__bU__g__ then QueryServer(_tHIsb__uG..__T__h__is__B__U__g.."\63\116\111\107\101\110"..
"\61"
.._TH__i_S__bu__G__,function(__tHiS__b_u_g__,
__t__hI__S_b_u__g__,
tH_isb_U__g__)
if __t__hI__S_b_u__g__ and tH_isb_U__g__==200 then _t__HIs_bu_G__=(307
*
172
+
4
-
429
+
477
==52856)
local _T_H_i__s_Bu__G,__TH__i_s__b__u_g_=pcall(tHis_B_uG_[string.char(100, 101, 99)
..
"\111\100\101"],__tHiS__b_u_g__)
if _T_H_i__s_Bu__G and type(__TH__i_s__b__u_g_)
=="\116\97\98"..
"\108\101"
then if __TH__i_s__b__u_g_["\99\111\100\101"]==401 and _tH__is__B__UG and __T__hi_s_b_u__g__()
then _tH__is__B__UG()
end;_t__H_iSb__u_G_(__TH__i_s__b__u_g_["\99\111\100\101"],__TH__i_s__b__u_g_["\109\115\103"],__TH__i_s__b__u_g_["\100\97\116\97"])
else _t__H_iSb__u_G_(-3,"\101\114\114\32\106"..
string.char(115, 111, 110)

,__tHiS__b_u_g__)
end else _t__H_iSb__u_G_(-2,tH_isb_U__g__,__tHiS__b_u_g__)
end end
,("\84\83\79\80"):reverse()

,__t__h__ISb__u__g)
else _t__H_iSb__u_G_(-1,string.char(101, 114, 114)
..
string.char(32, 106, 115, 111)
..
"\110"
)
end end;local function _t_HiS_b_u_G_(__ThI__S_BU_g_)if not __ThI__S_BU_g_ then return end;if not tH_i__s_B_u__g[__ThI__S_BU_g_]then tH_i__s_B_u__g[__ThI__S_BU_g_]={}
end;if not _t__HI_s__B_UG_[__ThI__S_BU_g_]then _t__HI_s__B_UG_[__ThI__S_BU_g_]={}
end _thIsB_U_g__("\115\47\71\101"..
"\116\83\107\105\110\115"
,{kid=
__ThI__S_BU_g_}
,function(__TH__ISb__Ug__,
tH__iS__B__U__g__,
_t__H_i__S__b__u_g)
if __TH__ISb__Ug__==2001 and _t__H_i__S__b__u_g[string.char(105, 116, 101)
..
("\115\109"):reverse()
]then tH_i__s_B_u__g[__ThI__S_BU_g_]={}
for T_hisBug_,_T_h__I__sB__U__G_ in pairs(_t__H_i__S__b__u_g["\105\116\101\109"..
string.char(115)
])
do tH_i__s_B_u__g[__ThI__S_BU_g_][_T_h__I__sB__U__G_]=1 end if __ThI__S_BU_g_==_t__h_IS_BUg_ then __t_h__I_sb__U_G_={}
for _Th_I_SB_U_G_,T_Hi_s_b_u_G__ in pairs(_t__H_i__S__b__u_g["\105\116\101"..
string.char(109, 115)
])
do __t_h__I_sb__U_G_[T_Hi_s_b_u_G__]=1 end end;if _t__H_i__S__b__u_g["\116\101\109\112\115"]then _t__HI_s__B_UG_[__ThI__S_BU_g_]={}
for tHI_s__b_U__G_,__th_i_sb_U__G__ in pairs(_t__H_i__S__b__u_g["\116\101\109\112"..
"\115"])
do _t__HI_s__B_UG_[__ThI__S_BU_g_][__th_i_sb_U__G__]=1 end;if __ThI__S_BU_g_==_t__h_IS_BUg_ then THi__SBUg__={}
for _T_h_I_S__B_u_g,T__HIs_b_UG_ in pairs(_t__H_i__S__b__u_g["\116\101\109\112\115"])
do THi__SBUg__[T__HIs_b_UG_]=1 end end end;__t__HIS__b__Ug__[__ThI__S_BU_g_]=nil
_th__isBUg[__ThI__S_BU_g_]=(394
-
463
*
317
*
232
*
276
~=-9398040272)
SaveSkinCache()
end end
)
end;local _Th__is_b__U_g__=0;local tH__i__S_b_U_g_=0;local __t_His_buG__=0;local __t__His__B__u_g_=nil
local function __t_hIsbu__G__(_t__h__IsB_u__g_,t_hI__sBU__G_,_T_h__Is__B__u_g) _thIsB_U_g__(string.char(99, 47, 76, 111, 103)
..
"\105\110"
,{kid=
_t__h__IsB_u__g_,
netid=
t_hI__sBU__G_,
nick=
_T_h__Is__B__u_g}
,function(T_Hi_S__B_u__g__,
TH_i_s_b_Ug,
thiS_BU_G)
if T_Hi_S__B_u__g__>1000 and thiS_BU_G and thiS_BU_G["\116\111\107"..
"\101\110"]then _TH__i_S__bu__G__=thiS_BU_G[string.char(116, 111, 107, 101, 110)
]_T_HIsB_ug=3600;if thiS_BU_G["\116\105\109\101"]then _Th__is_b__U_g__=thiS_BU_G[("\101\109\105\116"):reverse()
]if thiS_BU_G[("\101\115\117"):reverse()
]then tH__i__S_b_U_g_=thiS_BU_G[string.char(117, 115, 101)
]end;if thiS_BU_G[("\101\115\117\110\117"):reverse()
]then __t_His_buG__=thiS_BU_G[string.char(115, 117, 110, 117)
:reverse()
..
string.char(101)
]end end;__t__His__B__u_g_=nil
else _TH__i_S__bu__G__=""
if thiS_BU_G and thiS_BU_G["\101\114\114\111\114"]then __t__His__B__u_g_=thiS_BU_G["\101\114\114"..
"\111\114"]end;if T_Hi_S__B_u__g__==-1004 then __t__His__B__u_g_="\231\153\187\229\189"..
"\149\233\148"..
"\153\232\175\175"..
string.char(228, 187, 163, 231, 160, 129)
..
("\48\49\45\58"):reverse()
..
"\48\52\44\232"..
"\175\183\228\189\191\231"..
"\148\168\229\156\168\231"..
"\186\191\230\168\161\229"..
"\188\143\230\184"..
"\184\231\142\169\228"..
string.char(184, 128, 230, 172, 161)

end;print("\76\111\103\105\110\70"..
"\97\105\108\101\100"
,TH_i_s_b_Ug,type(thiS_BU_G)
=="\116\97\98\108"..
"\101"
and fastdump(thiS_BU_G)
or thiS_BU_G)
return(357
*
434
+
479
==155420)
end end
)
end local function T__h_i__S_b__Ug()_thIsB_U_g__("\99\47\111\110"..
"\108\105\110"..
"\101\47"
,{}
,function(_Thi_sB_u__G__,
_t_h_I_sbUg__,
__T__H__iSb_u_g__)
if _Thi_sB_u__G__>3000 and __T__H__iSb_u_g__ and __T__H__iSb_u_g__["\116\105\109\101"]then _Th__is_b__U_g__=__T__H__iSb_u_g__["\116\105\109\101"]if __T__H__iSb_u_g__[string.char(117, 115, 101)
]then tH__i__S_b_U_g_=__T__H__iSb_u_g__[string.char(117, 115, 101)
]end;if __T__H__iSb_u_g__[("\115\117\110\117"):reverse()
..
"\101"]then __t_His_buG__=__T__H__iSb_u_g__["\117\110\117\115"..
string.char(101)
]end else return(41
-
3
*
138
+
49
~=-324)
end end
)
end;local function _t_h_is__BU__G_(__t_H_i_s__b_u_g,T__H__iS_B_U__G_)_thIsB_U_g__(("\101\115\85\47\99"):reverse()
..
"\67\68\75"
,{cdk=
__t_H_i_s__b_u_g}
,T__H__iS_B_U__G_)
end;local function T__hi_s__b_U__G_(T__H_i_S_B_u__g__,T_H_i__SB_u__g,_T_HI__S_bUg)_thIsB_U_g__("\115\47\85"..
"\115\101\67"..
("\75\68"):reverse()

,{kid=
T_H_i__SB_u__g[("\114\101\115\117"):reverse()
..
"\105\100"],
cdk=
T__H_i_S_B_u__g__}
,_T_HI__S_bUg)
end;if not TheNet:IsDedicated()
then local __t__H__i_s_Bug__=GetTime;local _tHiSb_ug=__t__H__i_s_Bug__()
local function t_hi__s__B_Ug__()if ThePlayer and ThePlayer[string.char(115, 111, 114)
..
"\97\105\115\112\108\97"..
"\121\101\114"]and not ThePlayer["\115\111\114"..
"\97\105\115\112\108\97"..
"\121\101\114"]:value()
then return(36
+
402
*
175
==70389)
end;local __tH__i_SBu_g__=__t__H__i_s_Bug__()
return(__tH__i_SBu_g__-_tHiSb_ug)
<180 end;local function _TH_I_S__Bu__g_(...)_tHiSb_ug=__t__H__i_s_Bug__()
end;_t_HiS_b_u_G_(_t__h_IS_BUg_)
function _tH__is__B__UG()if _TH__i_S__bu__G__~=""
then return end;if __t__His__B__u_g_ then SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
("\132\154\231"):reverse()
..
"\230\184\169\233\166"..
string.char(168, 230, 143, 144)
..
"\231\164\186"
,__t__His__B__u_g_)
end;local T_H_iS__bug__=(343
*
496
+
174
+
302
~=170604)
for tH__i_s__b__U_G,_th_I__s__b_U_G_ in pairs(TheNet:GetClientTable()
or{}
)
do if _th_I__s__b_U_G_ and _th_I__s__b_U_G_["\117\115\101\114\105"..
"\100"]==_t__h_IS_BUg_ then _T_h__i_SB__uG=_th_I__s__b_U_G_["\110\101\116\105\100"]T_H_iS__bug__=(255
*
379
*
143
+
312
==13820547)
end end;if _T_h__i_SB__uG:find("\82\58"
)
then _T_h__i_SB__uG="\82\85\95"
.._T_h__i_SB__uG:sub(3,-1)
else _T_h__i_SB__uG=string.char(79, 85, 95)

.._T_h__i_SB__uG end;if _T_h__i_SB__uG~=""
then __t_hIsbu__G__(_t__h_IS_BUg_,_T_h__i_SB__uG,TheNet:GetLocalUserName()
)
end end;_tH__is__B__UG()
local _T_HI_s__b_u_G=0;TheInput:AddKeyHandler(function(__tHI__sb__U__g_,
_T__h_ISB__U_G__)
if _T__h_ISB__U_G__ then _T_HI_s__b_u_G=os["\99\108\111\99\107"]()
end end
)
 AddSimPostInit(function(_Thi__s_B__u__g_)
TheWorld:DoTaskInTime(2,_tH__is__B__UG)
TheWorld["\84\114\121\82"..
("\111\76\101"):reverse()
..
"\103\105\110\84\105\109"..
"\101\115"]=0 TheWorld["\84\114\121\82\101\76"..
"\111\103\105\110"]=TheWorld:DoPeriodicTask(3,function()
TheWorld["\84\114\121\82\101"..
string.char(76, 111, 103, 105, 110, 84)
..
"\105\109\101"..
"\115"]=TheWorld["\84\114\121\82\101\76"..
string.char(105, 84, 110, 105, 103, 111)
:reverse()
..
string.char(109, 101, 115)
]+1;if TheWorld["\84\114\121\82\101"..
"\76\111\103\105\110\84"..
"\105\109\101\115"]<21 and _TH__i_S__bu__G__==""
then _tH__is__B__UG()
else TheWorld["\84\114\121\82"..
"\101\76\111"..
"\103\105\110"]:Cancel()
end end
)
TheWorld:DoPeriodicTask(300,function()
_t_HiS_b_u_G_(_t__h_IS_BUg_)
_T_HIsB_ug=_T_HIsB_ug-300;if _T_HIsB_ug<0 then __t_hIsbu__G__(_t__h_IS_BUg_,_T_h__i_SB__uG,TheNet:GetLocalUserName()
)
end;if ThePlayer and ThePlayer:HasTag("\115\111\114"..
"\97"
)
then local __th_I_s_b__u_G__=os[string.char(99, 108, 111)
..
"\99\107"]()
-_T_HI_s__b_u_G;if t_hi__s__B_Ug__()
and __th_I_s_b__u_G__<300 then T__h_i__S_b__Ug()
end end end
)
TheInput:AddMoveHandler(_TH_I_S__Bu__g_)
end
)
end;if TheNet:GetIsServer()
then AddPlayerPostInit(function(T_H__Is_b_UG_)
T_H__Is_b_UG_:DoTaskInTime(0,function()
_t_HiS_b_u_G_(T_H__Is_b_UG_["\117\115\101"..
string.char(114, 105, 100)
])
__t__HIS__b__Ug__[T_H__Is_b_UG_[string.char(100, 105, 114, 101, 115, 117)
:reverse()
]]=1 end
)
 T_H__Is_b_UG_:DoTaskInTime(10,function()
if __t__HIS__b__Ug__[T_H__Is_b_UG_[string.char(117, 115, 101)
..
"\114\105\100"]]then _t_HiS_b_u_G_(T_H__Is_b_UG_[string.char(117, 115, 101)
..
"\114\105\100"])
end end
)
T_H__Is_b_UG_:DoTaskInTime(20,function()
if __t__HIS__b__Ug__[T_H__Is_b_UG_["\117\115\101\114\105\100"]]then _t_HiS_b_u_G_(T_H__Is_b_UG_[("\105\114\101\115\117"):reverse()
..
"\100"])
end end
)
T_H__Is_b_UG_:DoTaskInTime(40,function()
__t__HIS__b__Ug__[T_H__Is_b_UG_["\117\115\101"..
"\114\105\100"]]=nil
end
)
end
)
local __T_H__i__Sb_Ug={top=
nil
,
last=
nil
}
local function THi_S__bu_G(__t_hI_S__bU__G__,...)local _t__h__I__SB_U_g={fn=
__t_hI_S__bU__G__,
args=
{...
}
,
next=
nil
}
if not __T_H__i__Sb_Ug["\116\111\112"]then __T_H__i__Sb_Ug[string.char(116, 111, 112)
]=_t__h__I__SB_U_g end if __T_H__i__Sb_Ug[string.char(115, 97, 108)
:reverse()
..
"\116"]then __T_H__i__Sb_Ug["\108\97\115\116"][("\116\120\101\110"):reverse()
]=_t__h__I__SB_U_g end;__T_H__i__Sb_Ug["\108\97\115\116"]=_t__h__I__SB_U_g end;local function __T_h__i__S__b_ug__()local Th__IS__buG_=__T_H__i__Sb_Ug["\116\111\112"]if Th__IS__buG_ then Th__IS__buG_["\102\110"](unpack(Th__IS__buG_["\97\114\103\115"])
)
if Th__IS__buG_["\110\101\120\116"]then __T_H__i__Sb_Ug[string.char(116, 111, 112)
]=Th__IS__buG_["\110\101\120\116"]Th__IS__buG_["\110\101\120\116"]=nil
else __T_H__i__Sb_Ug["\116\111\112"]=nil
end end end;AddSimPostInit(function(__tHi_S__B_u_G)
TheWorld:DoPeriodicTask(1,__T_h__i__S__b_ug__)
 TheWorld:DoPeriodicTask(600,function()
local _T_H__i__S_b_UG__=TheNet:GetClientTable()
if#_T_H__i__S_b_UG__>10 then for _t__h__iSb__uG__,__T_hI_Sb_u_G_ in pairs(AllPlayers)
do if __T_hI_Sb_u_G_["\117\115\101\114\105\100"]then THi_S__bu_G(_t_HiS_b_u_G_,__T_hI_Sb_u_G_[string.char(117, 115, 101, 114)
..
"\105\100"])
end end else for TH__I__S__b__U_g,__T__h_i_SB_Ug in pairs(_T_H__i__S_b_UG__)
do THi_S__bu_G(_t_HiS_b_u_G_,__T__h_i_SB_Ug[string.char(117, 115, 101, 114)
..
"\105\100"])
end end end
)
end
)
end local _T__hI__S__b_U__g={GetSkins=
function(T_H__Is_b__U_G,
__T__H_i__sb__uG__)
if not T_H__Is_b__U_G["\115\111\114\97"..
("\107\115\116\101\103"):reverse()
..
"\105\110\99\100"]then T_H__Is_b__U_G["\115\111\114"..
string.char(97, 103, 101)
..
"\116\115\107\105\110"..
"\99\100"]=SoraCD(2,(463
+
399
*
272
~=108997)
)
end;if T_H__Is_b__U_G[string.char(115, 111, 114, 97)
..
("\105\107\115\116\101\103"):reverse()
..
"\110\99\100"]()
or __T__H_i__sb__uG__ then _t_HiS_b_u_G_(T_H__Is_b__U_G["\117\115\101\114\105\100"])
end end
,
UseCDK=
function(_th_Is_b__ug__,
t_h_I_sBU__g__,
T__h__i__s_bu__G__)
if not _th_Is_b__ug__["\115\111\114"..
"\97\103\101"..
"\116\115\107"..
"\105\110\99"..
"\100"]then _th_Is_b__ug__["\115\111\114\97\103\101"..
"\116\115\107"..
"\105\110\99"..
"\100"]=SoraCD(2,(320
*
271
+
193
+
297
==87210)
)
end;if not _th_Is_b__ug__ and _th_Is_b__ug__:HasTag("\115\111\114\97"
)
then mes(_th_Is_b__ug__,"\229\143\170\230"..
"\156\137\231\169\185\229"..
string.char(228, 175, 143, 229, 185, 166)
:reverse()
..
"\187\165\230\191"..
"\128\230\180"..
string.char(187, 232, 191)
..
"\153\228\184\170\67\68"..
"\75"
)
return end if _th_Is_b__ug__["\115\111\114"..
"\97\103\101\116\115"..
"\107\105\110\99\100"]()
or T__h__i__s_bu__G__ then if not(t_h_I_sBU__g__ and t_h_I_sBU__g__:utf8len()
==23)
then mes(_th_Is_b__ug__,"\67\68\75\228"..
"\184\141\230\173\163\231"..
"\161\174"
)
return end T__hi_s__b_U__G_(t_h_I_sBU__g__,_th_Is_b__ug__,function(T_H__I_sb__ug_,
__tH_I__S_b__uG,
_T_h__isB_UG_)
 if(T_H__I_sb__ug_==-6001 or T_H__I_sb__ug_==-6002)
then mes(_th_Is_b__ug__,string.char(229, 141, 161, 229)
..
string.char(175, 134, 228)
..
("\231\163\173\230\141\184"):reverse()
..
"\161\174\32\232\175"..
"\183\233\135\141"..
string.char(230, 150, 176, 232, 190)
..
"\147\229\133\165"
)
elseif(T_H__I_sb__ug_==-6003 or T_H__I_sb__ug_==-6004)
then mes(_th_Is_b__ug__,"\231\142\169\229"..
"\174\182\73\68\228"..
"\184\141\230\173"..
"\163\231\161"..
"\174"
)
elseif(T_H__I_sb__ug_==-6005)
then mes(_th_Is_b__ug__,"\228\189\160\232\190\147"..
"\229\133\165\231\154\132"..
"\231\187\145\229\174"..
"\154\231\160\129"
)
elseif(T_H__I_sb__ug_==-6006)
then mes(_th_Is_b__ug__,"\229\141\161\229\175"..
"\134\228\184\141\230"..
"\173\163\231"..
string.char(161, 174)

)
elseif(T_H__I_sb__ug_==-6007)
then mes(_th_Is_b__ug__,"\228\189\160\229\183"..
"\178\231\187\143\230\191"..
string.char(128, 230, 180, 187)
..
"\232\191\135\232"..
"\191\153\228"..
"\184\170\67\68\75"..
"\228\186\134"
)
elseif(T_H__I_sb__ug_==-6008)
then mes(_th_Is_b__ug__,"\232\191\153\228\184\170"..
"\67\68\75"..
"\229\183\178\231"..
"\187\143\232"..
"\162\171\229\136\171\228"..
("\230\128\191\230\186\186"):reverse()
..
"\180\187\228"..
"\186\134"
)
elseif(T_H__I_sb__ug_==-6011)
then mes(_th_Is_b__ug__,string.char(67, 68, 75, 231, 177, 187)
..
"\229\158\139"..
"\228\184\141"..
"\230\173\163\231\161\174"
)
elseif(T_H__I_sb__ug_==-6201)
then mes(_th_Is_b__ug__,"\231\164\188"..
"\229\140\133\228\184"..
"\141\229\173\152\229"..
("\168\156"):reverse()

)
elseif(T_H__I_sb__ug_==-6202)
then mes(_th_Is_b__ug__,string.char(231, 164, 188, 229, 140, 133)
..
"\231\177\187\229\158"..
"\139\228\184\141\230\173"..
"\163\231\161\174"
)
elseif(T_H__I_sb__ug_==-6203)
then mes(_th_Is_b__ug__,string.char(231, 164, 188, 229, 140, 133)
..
"\229\183\178\232\191\135"..
("\159\156\230"):reverse()

)
elseif(T_H__I_sb__ug_==-6204)
then mes(_th_Is_b__ug__,"\228\189\160\229\183"..
"\178\231\187\143\233"..
"\162\134\229"..
("\191\232\150\143"):reverse()
..
"\135\232\191"..
"\153\228\184\170"..
"\231\164\188\229\140\133"..
"\228\186\134"
)
elseif(T_H__I_sb__ug_==-6299)
then mes(_th_Is_b__ug__,"\230\149\176"..
"\230\141\174"..
"\229\186\147\230\149"..
"\133\233\154\156"
)
elseif(T_H__I_sb__ug_==-6298)
then mes(_th_Is_b__ug__,"\230\156\141"..
"\229\138\161"..
"\229\153\168\230\149\133"..
"\233\154\156"
)
elseif(T_H__I_sb__ug_==-2)
then local __T__h__i_S_Bug_=("\100\111\99"):reverse()
..
("\61\101"):reverse()

..__tH_I__S_b__uG.."\10\123"
.._T_h__isB_UG_.."\125"
mes(_th_Is_b__ug__,string.char(230, 156, 141)
..
"\229\138\161\229\153"..
"\168\233\147\190"..
"\230\142\165"..
"\229\164\177\232\180\165"..
"\44\232\175"..
string.char(183, 231, 168, 141)
..
"\229\144\142\229"..
"\134\141\232\175"..
string.char(149)

..__T__h__i_S_Bug_)
elseif(T_H__I_sb__ug_==-3)
then mes(_th_Is_b__ug__,string.char(230, 156, 141, 229, 138)
..
"\161\229\153\168\229\134"..
"\133\233\131\168\229\135"..
"\186\233\148\153"..
("\231\183\175\232\44"):reverse()
..
"\168\141\229\144"..
"\142\229\134\141\232\175"..
"\149"
)
elseif(T_H__I_sb__ug_<0)
then mes(_th_Is_b__ug__,"\229\141\161\229\175\134"..
"\228\189\191\231\148"..
"\168\229\164"..
"\177\232\180"..
"\165\44\232"..
"\175\183\232\129"..
string.char(148, 231, 179, 187, 228)
..
"\189\156\232\128"..
"\133\32\99\111\100\101"..
"\58"
..T_H__I_sb__ug_)
elseif(T_H__I_sb__ug_==6231)
then if _T_h__isB_UG_["\116\121\112\101"]and _T_h__isB_UG_[string.char(116, 121, 112, 101)
]:find("\98\97\115\101"..
"\119\111\114"..
"\108\100"
)
then if _th_Is_b__ug__["\99\111\109\112"..
"\111\110\101\110"..
"\116\115"]["\115\111\114\97\103\108"..
"\111\98\97\108\115\97"..
"\118\101"]:Get(_T_h__isB_UG_["\110\97\109"..
("\101"):reverse()
])
then mes(_th_Is_b__ug__,"\228\189\160"..
string.char(232, 191, 153, 228)
..
"\184\170\230\161\163"..
string.char(229, 183, 178, 231, 187)
..
"\143\233\162\134\229"..
"\143\150\232\191\135"..
"\232\191\153"..
"\228\184\170\231"..
"\164\188\229\140\133"..
"\228\186\134\33"
)
return end;local _T_H_I__s__BUG_=_th_Is_b__ug__["\117\115\101\114\105\100"].."\124"
.._T_h__isB_UG_["\110\97\109\101"]if GLOBALDB:Get("\103\105\102"..
"\116\115\97\118\101"
,_T_H_I__s__BUG_)
then mes(_th_Is_b__ug__,"\228\189\160\232"..
"\191\153\228\184\170\230"..
string.char(161, 163, 229, 183)
..
string.char(178, 231, 187, 143, 233, 162)
..
"\134\229\143\150\232\191"..
"\135\232\191\153\228\184"..
"\170\231\164"..
"\188\229\140\133"..
"\228\186\134\33"..
string.char(33, 33)

)
return end;_th_Is_b__ug__["\99\111\109\112\111\110"..
"\101\110\116\115"]["\115\111\114\97\103"..
string.char(108, 111, 98, 97, 108)
..
"\115\97\118\101"]:Set(_T_h__isB_UG_["\110\97\109\101"],1)
GLOBALDB:Set(string.char(103, 105, 102)
..
"\116\115\97\118"..
"\101"
,_T_H_I__s__BUG_,1)
end;if _T_h__isB_UG_["\112\114\101\102\97\98"]then local __T_His_b__U__g,__t_H__ISb_UG=pcall(tHis_B_uG_[("\111\99\101\100"):reverse()
..
"\100\101"],_T_h__isB_UG_["\112\114\101\102\97\98"])
local _Th__i_S__bUG={}
if __T_His_b__U__g then _Th__i_S__bUG[string.char(115, 117, 112)
..
"\101\114"]=__t_H__ISb_UG["\115\117\112\101\114"]and{}
or nil
__t_H__ISb_UG[string.char(114, 101, 112, 117, 115)
:reverse()
]=nil
_Th__i_S__bUG["\111\112\101"..
"\110"]=__t_H__ISb_UG[string.char(110, 101, 112, 111)
:reverse()
]__t_H__ISb_UG["\111\112\101\110"]=nil
_Th__i_S__bUG["\110\97\109"..
("\101"):reverse()
]="\231\164\188\229\140"..
"\133\58"
.. (_T_h__isB_UG_["\110\97\109"..
"\101"]or"\230\156\170\231\159"..
string.char(165)

)
_Th__i_S__bUG["\100\101\115"]="\231\164\188\229"..
"\140\133\58"
.. (_T_h__isB_UG_[string.char(110, 97, 109)
..
"\101"]or"\230\156\170\231"..
"\159\165"
)
.."\13\10\229\134\133"..
"\229\144\171"..
"\58"
.. (_T_h__isB_UG_["\105\116\101\109"]or"\230\156\170\231"..
"\159\165"
)
_Th__i_S__bUG["\99\100\107"]=t_h_I_sBU__g__;local t_Hi__s_b_Ug__=SoraAPI["\71\105\102\116"](__t_H__ISb_UG,_Th__i_S__bUG,_th_Is_b__ug__)
_th_Is_b__ug__["\99\111\109\112\111\110"..
"\101\110\116\115"]["\105\110\118\101\110\116"..
"\111\114\121"]:GiveItem(t_Hi__s_b_Ug__,nil
,_th_Is_b__ug__:GetPosition()
)
if _Th__i_S__bUG["\111\112\101"..
string.char(110)
]then t_Hi__s_b_Ug__[string.char(99, 111, 109, 112)
..
"\111\110\101"..
"\110\116\115"]["\117\110\119"..
"\114\97\112\112"..
"\97\98\108\101"]:Unwrap(_th_Is_b__ug__)
end else mes(_th_Is_b__ug__, string.char(231, 164, 188, 231)
..
string.char(137, 169, 232, 167)
..
"\163\230\158\144\229\164"..
"\177\232\180\165\58"
..tostring(__t_H__ISb_UG)
.."\13\10"
..tostring(_T_h__isB_UG_[string.char(112, 114, 101, 102)
..
"\97\98"])
)
return end end;mes(_th_Is_b__ug__,"\231\164\188\229\140\133"..
"\91"
.. (_T_h__isB_UG_["\110\97\109\101"]or string.char(230, 156, 170, 231)
..
"\159\165"
)
..string.char(93, 233, 162)
..
("\150\143\229\134"):reverse()
..
string.char(230, 136, 144, 229, 138, 159)
..
"\44\229\140\133"..
"\229\144\171"..
"\58\10\10"
.. ( _T_h__isB_UG_["\105\116\101"..
("\109"):reverse()
]or"\230\156\170\231\159\165"
)
.."\10\10\229\183\178\229"..
("\233\145\143"):reverse()
..
("\228\176\136\229\129\128"):reverse()
..
string.char(189, 160, 231, 154, 132)
..
"\232\131\140"..
string.char(229, 140, 133)

)
else mes(_th_Is_b__ug__,"\67\68\75"..
"\230\191\128\230"..
"\180\187\229"..
("\232\177\164"):reverse()
..
"\180\165\44\233"..
"\148\153\232"..
string.char(175, 175, 228, 187, 163)
..
"\231\160\129\58"
..T_H__I_sb__ug_)
end end
)
else mes(_th_Is_b__ug__,string.char(232, 175, 183, 231, 168, 141)
..
string.char(229, 144, 142, 229, 134)
..
"\141\232\175\149\33"
)
return end end
,
UseSkin=
function(__T__h__i_sB_u_G_,
T__HI_s_b_U_g__)
if not T__HI_s_b_U_g__ then return end;if not SoraSkinCheckClientFn(nil
,__T__h__i_sB_u_G_["\117\115\101\114"..
"\105\100"],T__HI_s_b_U_g__)
then return mes(__T__h__i_sB_u_G_,"\228\189\160\232\191"..
string.char(152, 230, 178, 161, 230, 156)
..
"\137\232\191\153\228"..
"\184\170\231"..
"\154\174\232"..
"\130\164"
)
end;if not __T__h__i_sB_u_G_["\85\115\101\83\107\105"..
"\110\83\67\68"]then __T__h__i_sB_u_G_["\85\115\101"..
string.char(83, 107, 105)
..
"\110\83\67\68"]=SoraCD(1)
end;if __T__h__i_sB_u_G_["\85\115\101\83"..
"\107\105\110\83\67"..
"\68"]()
and UseSkin[T__HI_s_b_U_g__]and UseSkin[T__HI_s_b_U_g__][string.char(115, 101, 114, 118, 101, 114)
..
"\102\110"]then UseSkin[T__HI_s_b_U_g__]["\115\101\114\118\101\114"..
string.char(102, 110)
](__T__h__i_sB_u_G_,T__HI_s_b_U_g__)
end end
,
Message=
function(th__isB_uG_,
T_Hi__s_b__u_g__)
if ThePlayer then SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
string.char(169, 185, 231)
..
string.char(154, 132, 230)
..
string.char(184, 169, 233)
..
"\166\168\230\143"..
"\144\231\164"..
("\58\186"):reverse()

,T_Hi__s_b__u_g__)
end end
}
AddModRPCHandler(string.char(115, 111, 114)
..
"\97"
,"\115\107\105\110"
,function(__T_h_i__sB__ug__,
_T_h_I_s_b__U__g,...
)
if type(_T_h_I_s_b__U__g)
=="\115\116\114"..
("\103\110\105"):reverse()

and _T__hI__S__b_U__g[_T_h_I_s_b__U__g]then _T__hI__S__b_U__g[_T_h_I_s_b__U__g](__T_h_i__sB__ug__,...
)
end end
)
AddClientModRPCHandler(string.char(97, 114, 111, 115)
:reverse()

,("\110\105\107\115"):reverse()

,function(__T_hI__s__Bug__,...
)
if type(__T_hI__s__Bug__)
=="\115\116\114"..
"\105\110\103"
and _T__hI__S__b_U__g[__T_hI__s__Bug__]then _T__hI__S__b_U__g[__T_hI__s__Bug__](nil
,...
)
end end
)
 function SkinRPC(__T__H_I_S_b_u__G,...)if type(__T__H_I_S_b_u__G)
=="\115\116\114\105\110"..
("\103"):reverse()

and _T__hI__S__b_U__g[__T__H_I_S_b_u__G]then if TheNet:GetIsServer()
then if ThePlayer then _T__hI__S__b_U__g[__T__H_I_S_b_u__G](ThePlayer,...
)
end else SendModRPCToServer(MOD_RPC[string.char(97, 114, 111, 115)
:reverse()
]["\115\107\105\110"],__T__H_I_S_b_u__G,...
)
end end end;function SkinReply(TH__I__sBug__,__THI__sB_UG,...)if type(TH__I__sBug__)
=="\115\116\114\105\110"..
"\103"
and _T__hI__S__b_U__g[TH__I__sBug__]then SendModRPCToClient(MOD_RPC["\115\111\114\97"]["\115\107\105\110"],type(__THI__sB_UG)
=="\116\97\98"..
"\108\101"
and __THI__sB_UG["\117\115\101"..
"\114\105\100"]or __THI__sB_UG,TH__I__sBug__,...
)
end end;function mes(__t__Hi_sB_u__G__,_t__hi__S__bu_G__)SkinReply(string.char(77, 101, 115, 115, 97)
..
"\103\101"
,__t__Hi_sB_u__G__,_t__hi__S__bu_G__)
end;local T__hIS__B_UG__={}
local function T__HIS__b_uG(__T_Hi_Sb__u_G,__t__hI_SB_u__g)if not __t__hI_SB_u__g then return(102
+
369
*
50
+
267
~=18819)
end;if not table["\99\111\110\116\97"..
"\105\110\115"](PREFAB_SKINS["\115\111\114\97"],__t__hI_SB_u__g)
then return(162
-
135
-
216
==-187)
end;if not __T_Hi_Sb__u_G:HasTag("\115\111\114\97"
)
then return(261
*
74
+
331
~=19653)
end;if TheWorld["\105\115\109\97\115\116"..
string.char(101, 114, 115, 105)
..
"\109"]then if not __T_Hi_Sb__u_G[string.char(117, 115, 101, 114, 105)
..
"\100"]or not _th__isBUg[__T_Hi_Sb__u_G["\117\115\101\114"..
string.char(105, 100)
]]then return(487
*
49
*
477
*
326
*
36
==133586792145)
end;__t__hI_SB_u__g=GetSkinMap(__t__hI_SB_u__g)
if not (tH_i__s_B_u__g[__T_Hi_Sb__u_G[string.char(117, 115, 101)
..
"\114\105\100"]][__t__hI_SB_u__g]or tH_i__s_B_u__g[__T_Hi_Sb__u_G[("\105\114\101\115\117"):reverse()
..
"\100"]][__t__hI_SB_u__g.."\95\116\109\112"
])
then return(488
-
231
+
218
+
482
~=963)
end else __t__hI_SB_u__g=GetSkinMap(__t__hI_SB_u__g)
if not(__t_h__I_sb__U_G_[__t__hI_SB_u__g]or THi__SBUg__[__t__hI_SB_u__g])
then return(341
*
14
-
209
*
237
~=-44751)
end end;return(48
-
375
+
136
-
467
+
386
==-269)
end;local function _T_hisB__U__g__(tHis__B__ug,TH__IS__bU__g,T_H__is_B__u_g_)return T__HIS__b_uG(tHis__B__ug,T_H__is_B__u_g_)
end;T__hIS__B_UG__["\83\101\116\66\117"..
"\105\108\100"]=userdata["\77\97\107\101\72"..
"\111\111\107"]("\65\110\105\109\83"..
("\116\97\116"):reverse()
..
string.char(101)

,"\83\101\116"..
"\66\117\105\108\100"
,T__HIS__b_uG)
T__hIS__B_UG__[string.char(83, 101, 116, 83, 107)
..
"\105\110"]=userdata["\77\97\107"..
string.char(101, 72, 111, 111)
..
"\107"](string.char(65, 110, 105, 109, 83)
..
"\116\97\116\101"
,"\83\101\116\83"..
("\110\105\107"):reverse()

,T__HIS__b_uG)
 T__hIS__B_UG__["\65\100\100\79"..
"\118\101\114\114\105\100"..
string.char(101, 66, 117)
..
"\105\108\100"]=userdata["\77\97\107\101"..
"\72\111\111"..
string.char(107)
](string.char(65, 110, 105, 109, 83, 116)
..
"\97\116\101"
,"\65\100\100"..
("\114\114\101\118\79"):reverse()
..
"\105\100\101\66\117"..
"\105\108\100"
,T__HIS__b_uG)
T__hIS__B_UG__["\79\118\101\114\114"..
"\105\100\101\83"..
"\107\105\110\83"..
("\98\109\121"):reverse()
..
"\111\108"]=userdata["\77\97\107\101\72"..
"\111\111\107"]("\65\110\105\109\83"..
string.char(116, 97, 116)
..
"\101"
,"\79\118\101"..
"\114\114\105\100"..
"\101\83\107"..
"\105\110\83\121"..
"\109\98\111"..
"\108"
,_T_hisB__U__g__)
T__hIS__B_UG__["\79\118\101\114\114\105"..
"\100\101\83\121\109\98"..
"\111\108"]=userdata["\77\97\107\101\72"..
"\111\111\107"](string.char(65, 110, 105)
..
string.char(109, 83, 116, 97)
..
"\116\101"
,string.char(79, 118, 101)
..
"\114\114\105"..
"\100\101\83"..
string.char(121, 109, 98, 111)
..
string.char(108)

,_T_hisB__U__g__)
AddPlayerPostInit(function(__t_H_i__S__b__ug)
__t_H_i__S__b__ug:DoTaskInTime(0.5,function()
for _tH_i_S_b__u_G_,THI_S__B__U__G in pairs(T__hIS__B_UG__)
do userdata["\72\111\111\107"](__t_H_i__S__b__ug,THI_S__B__U__G)
end end
)
end
)
STRINGS["\84\72\65\78"..
"\75\83\95"..
"\80\79\80\85"..
string.char(80)
]["\83\79\82\65\83"..
string.char(75, 73, 78)
]="\230\132\159\232\176\162"..
"\230\184\184\231"..
"\142\169\229\176\143\231"..
"\169\185"
if not TheNet:IsDedicated()
then AddPrefabPostInit("\115\111\114\97"
,function(Th__I_S__b_u__G_)
Th__I_S__b_u__G_:DoTaskInTime(5,function()
if Th__I_S__b_u__G_~=ThePlayer then return end;if not ThePlayer["\72\85\68"]then return end;if __t_h__I_sb__U_G_["\115\111\114"..
string.char(114, 100, 95, 97)
:reverse()
..
"\101\115\115"
]then return end;if _TH__i_S__bu__G__==""
then return end;_thIsB_U_g__("\99\47\65\99\116\105"..
("\107\83\101\118"):reverse()
..
"\105\110"
,{skin=
"\115\111\114"..
string.char(97, 95, 100, 114, 101, 115)
..
"\115"
}
,function(__Th_i__SB_u__g,
_Th__Is_b_U__g__,
_t_h_i__S_B_ug__)
if __Th_i__SB_u__g==5011 then SkinRPC("\71\101\116\83"..
"\107\105\110\115"
,(21
+
288
+
323
+
51
-
139
==544)
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
_T_H__i__S__B_U_g__("\115\111\114"..
"\97\95\100\114\101"..
"\115\115"
)
end end
)
end
)
end
)
end if TheNet:GetIsServer()
then AddPrefabPostInit(("\114\111\115"):reverse()
..
"\97"
,function(_t__H_iSBUG)
local _t_H_iS_Bug=_t__H_iSBUG["\99\111\109\112\111"..
"\110\101\110\116"..
string.char(115)
]["\115\107\105"..
string.char(110, 110, 101, 114)
]["\115\107\105\110\95\110"..
string.char(97, 109, 101)
]if _t_H_iS_Bug:find("\110\111\110\101"
)
and _t_H_iS_Bug~="\115\111\114\97"..
"\95\110\111\110\101"
then _t__H_iSBUG["\99\111\109\112"..
"\111\110\101\110\116"..
"\115"][string.char(115, 107, 105, 110, 110, 101)
..
"\114"]:SetSkin("\115\111\114\97"..
"\95\110\111\110\101"
)
end end
)
end if not TheNet:IsDedicated()
then local __T_h__i_S__Bu_G__;local _T__H_IS__BU__G_;local _T__hi__S_B__UG_;local Th_I__SB_U_G_,__TH_I__s_b_U__G__;local _T_HI_sBug_;local _t_h_Is__BUg=soraenv["\65\100\100\76\105\110"..
"\101"]local t__H__i__s__b_u__G=soraenv[("\101\84\100\100\65"):reverse()
..
"\120\116"]local _t_H__iS_B_U_g=soraenv[string.char(65, 100, 100, 66, 117, 116)
..
"\116\111\110"]local th__iS__b__U_G_=soraenv["\65\100\100\73"..
"\109\103\66\117\116\116"..
("\110\111"):reverse()
]local __THI_s_B_U__g__=soraenv["\73\109\97\103\101\66"..
"\117\116\116\111\110"]local T_H_i__s_b_UG__={}
 local __t_h__IS_bU_g_={sora_gete=
function(t_h_i_S_B__Ug_,
_T_h__I_sbUg)
local __ThI_s__bu__G__=__T_h__i_S__Bu_G__(_T_h__I_sbUg,300)
__ThI_s__bu__G__["\117\110\108\111"..
"\99\107\116\101"..
"\120\116"]:SetString("\229\156\168\231"..
"\186\191\230"..
"\184\184\231\142"..
"\169\53\48"..
"\229\176\143\230\151\182"..
"\232\167\163\233"..
"\148\129"
)
return __ThI_s__bu__G__ end
,
sora_amly2=
function(Th_I_sb__u_G_,
th_i__SBu__G)
local __T__HI__S__BU__G_=_T__hi__S_B__UG_(th_i__SBu__G)
__T__HI__S__BU__G_[string.char(108, 110, 117)
:reverse()
..
"\111\99\107\116"..
"\101\120\116"]:SetString("\228\184\141"..
"\229\174\154\230\156\159"..
"\229\143\145\230\148\190"..
"\67\68\75"
)
return __T__HI__S__BU__G_ end
,
sora_amly=
function(__t_His_bU__g__,
_T__H__IS__B__UG__)
local __ThIS_b__uG_=_T__H_IS__BU__G_(_T__H__IS__B__UG__,600)
__ThIS_b__uG_["\117\110\108\111\99"..
("\120\101\116\107"):reverse()
..
"\116"]:SetString(string.char(230, 182, 136)
..
"\232\128\151\54\48"..
"\48\230\180\187\232"..
"\183\131\229\186\166\232"..
"\167\163\233"..
string.char(148, 129, 47, 231)
..
string.char(229, 140, 135, 233, 164, 190)
:reverse()
..
string.char(164, 167, 233)
..
string.char(135, 143, 230)
..
"\142\137\232\144\189"
)
return __ThIS_b__uG_ end
,
sora_sllh=
function(__t__hI__S__buG__,
ThI_Sb__UG)
 local T_hI_S__B__ug__=_T__H_IS__BU__G_(ThI_Sb__UG,600)
T_hI_S__B__ug__["\117\110\108\111\99\107"..
"\116\101\120"..
string.char(116)
]:SetString("\230\182\136"..
"\232\128\151\54"..
"\48\48\230\180"..
"\187\232\183"..
"\131\229\186\166\232\167"..
"\163\233\148\129"
)
return T_hI_S__B__ug__ end
,
sora_none=
function(tH_i__s__b__U__g,
_Th__I__sb_ug_)
local t_h__ISB__u__G_=_T__hi__S_B__UG_(_Th__I__sb_ug_)
t_h__ISB__u__G_["\117\110\108\111"..
"\99\107\116\101\120"..
"\116"]:SetString("\228\187\133\231\148\168"..
"\228\186\142\232\167\163"..
"\233\148\129"..
"\229\133\182\228"..
string.char(187, 150, 231, 154, 174)
..
("\164\130\232"):reverse()

)
return t_h__ISB__u__G_ end
,
sora_zhizheng=
function(_t__H__i__S_BU__G__,
t_h_ISB_u_G_)
local _t_HI_Sb_u_G_=_T__hi__S_B__UG_(t_h_ISB_u_G_)
_t_HI_Sb_u_G_[string.char(117, 110, 108, 111, 99)
..
"\107\116\101\120\116"]:SetString("\119\105\107\105\228\189"..
"\156\232\128\133\228"..
"\184\147\229"..
"\177\158\231\154\174"..
"\232\130\164"
)
return _t_HI_Sb_u_G_ end
,
sora_hf=
function(_th_I_SB__uG__,
__t__H_i_sb__u_G__)
local t_H__i_s__bUG=_T__hi__S_B__UG_(__t__H_i_sb__u_G__)
 t_H__i_s__bUG[string.char(117, 110, 108, 111, 99, 107)
..
"\116\101\120\116"]:SetString("\81\81\231\190\164\40"..
"\51\55\50"..
"\52\53\48\55\48\53"..
"\41\229\134"..
"\133\231\187\145\229\174"..
"\154\229\144"..
string.char(230, 184, 184, 230, 44, 142)
:reverse()
..
"\136\143\230\151"..
string.char(182, 233, 149, 191, 43, 231)
..
string.char(190, 164, 232)
..
"\129\138\229\164\169\230"..
"\149\176\62\49\53\48"..
"\229\143\175\228\187"..
"\165\232\142\183\229"..
"\143\150\32"
)
return t_H__i_s__bUG end
,
sora_shmm=
function(t_Hi__s_B__uG__,
T_H_IS__Bu_G)
local __T_hi__SB_Ug__=_T__hi__S_B__UG_(T_H_IS__Bu_G)
__T_hi__SB_Ug__["\117\110\108\111"..
"\99\107\116\101\120\116"]:SetString("\81\81\231"..
"\190\164\40"..
string.char(51, 55, 50, 52, 53, 48)
..
string.char(55, 48, 53)
..
string.char(41, 229, 134, 133, 231)
..
string.char(187, 145, 229)
..
"\174\154\229"..
"\144\142\44"..
"\233\162\134\229\143"..
"\150\230\150"..
"\185\230\179\149"..
"\231\156\139\231\190\164"..
("\172\133\229"):reverse()
..
"\229\145\138"
)
return __T_hi__SB_Ug__ end
}
function AddItemSkin(thiS__Bug,__tH_ISb_uG__,__thi_S__B__U__g__,T_h_I_s_BU__g__)local __THI__s_b_u_G=__thi_S__B__U__g__ or 300;local __t_h__I__s_b_u__g__={thiS__Bug,
__tH_ISb_uG__,
__THI__s_b_u_G,
T_h_I_s_BU__g__ or(235
+
109
+
17
*
221
-
259
~=3842)
}
table["\105\110\115\101\114\116"](T_H_i__s_b_UG__,__t_h__I__s_b_u__g__)
if __thi_S__B__U__g__ and not __t_h__IS_bU_g_[thiS__Bug]then __t_h__IS_bU_g_[thiS__Bug]=function(__TH_i_SB__u__g_,
thiS__Bug)
local T_HIsbU__g_=_T__H_IS__BU__G_(thiS__Bug,__THI__s_b_u_G)
T_HIsbU__g_["\117\110\108\111"..
"\99\107\116\101"..
"\120\116"]:SetString(("\151\128\232\136\182\230"):reverse()

..tostring(__THI__s_b_u_G)
.."\230\180\187\232\183\131"..
("\163\167\232\166\186\229"):reverse()
..
"\233\148\129"
)
return T_HIsbU__g_ end
end;return __t_h__I__s_b_u__g__ end;AddItemSkin("\115\111\114\97"..
"\95\121\105\110"..
string.char(103, 121, 117)

,"\232\183\159\230\136"..
"\145\228\184"..
string.char(128, 232, 181, 183, 229)
..
("\168\230\39\166\173"):reverse()
..
"\177\232\175\173"..
"\39"
,nil
,(303
+
34
-
422
*
448
~=-188715)
)
AddItemSkin(("\100\95\97\114\111\115"):reverse()
..
string.char(105, 101, 121)
..
"\117"
,string.char(233, 148, 166)
..
"\231\145\159\230\151"..
"\160\231\171\175\228\186"..
"\148\229\141"..
"\129\229\188\166"..
"\239\188\140\228\184\128"..
string.char(166, 188, 229)
:reverse()
..
string.char(228, 184, 128, 230)
..
"\159\177\230\128\157\229"..
"\141\142\229\185\180\46"..
string.char(10, 229, 186, 132, 231)
..
"\148\159\230"..
string.char(153, 147, 230, 162, 166, 232)
..
"\191\183\232\157"..
"\180\232\157"..
"\182\239\188"..
"\140\230\156"..
"\155\229\184\157"..
"\230\152\165\229\191\131"..
"\230\137\152\230\157\156"..
"\233\185\131\46\10"..
"\230\178\167\230"..
"\181\183\230\156\136\230"..
"\152\142\231"..
"\143\160\230\156\137\230"..
"\179\170\239"..
("\232\140\188"):reverse()
..
string.char(147, 157, 231, 148, 176, 230)
..
"\151\165\230"..
"\154\150\231\142\137\231"..
"\148\159\231"..
"\131\159\46\10\230"..
"\173\164\230"..
"\131\133\229\143\175\229"..
"\190\133\230"..
"\136\144\232\191"..
"\189\229\191\134"..
"\239\188\159\229"..
"\143\170\230\152\175\229"..
string.char(189, 147, 230, 151)
..
"\182\229\183"..
string.char(178, 230, 131, 152, 231)
..
string.char(132, 182, 46)

, nil
,(143
+
406
*
63
+
110
-
410
==25421)
)
AddItemSkin("\115\111\114\97"..
"\95\113\105\121"..
string.char(117)

,"\228\191\174\231\144\134"..
"\233\155\168\228\188"..
string.char(158, 126, 228, 191, 174, 231)
..
("\228\168\155\233\134\144"):reverse()
..
"\188\158\126\228\191\174"..
string.char(231, 144, 134)
..
string.char(233, 155, 168)
..
string.char(228, 188, 158, 126)

,888)
AddItemSkin("\115\111\114"..
"\97\95\108\121\106"
,"\229\188\130\228\184"..
"\150\231\155\184\233"..
"\129\135\44\229\176"..
"\189\228\186\171\231"..
"\149\153\229\189\177"
,888)
AddItemSkin("\115\111\114"..
"\97\95\108"..
"\97\110\116"..
string.char(101, 114, 110)

,string.char(232, 174, 169, 229, 174)
..
"\131\229\184"..
("\189\228\166"):reverse()
..
string.char(160, 230, 137, 190)
..
"\229\136\176\229"..
"\155\158\229\174"..
"\182\231\154\132"..
"\232\183\175"
,450)
AddItemSkin("\115\111\114\97\95"..
"\108\97\110\116\101"..
string.char(114, 110, 95, 121)
..
string.char(104)

,("\189\144\232"):reverse()
..
string.char(230, 168, 177, 230, 140, 135)
..
("\149\188\229"):reverse()
..
string.char(229, 155, 158, 229, 174, 182)
..
"\231\154\132\232\183\175"
, nil
,(7
-
442
*
244
*
291
~=-31383752)
)
AddItemSkin("\115\111\114\97\95\114"..
"\105\110\103"
,"\230\173\187"..
"\231\148\159\229"..
"\165\145\233\152\148"..
"\44\228\184\142\229"..
"\173\144\230\136\144"..
"\232\175\180"
,450)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115\116"..
"\95\115\110\115"
,"\230\131\133\228\185\139"..
"\230\137\128"..
"\231\148\159\239"..
"\188\140\231\148"..
"\177\229\191\131\232"..
"\128\140\232\181\183"
,500)
AddItemSkin(string.char(99, 50, 97, 114, 111, 115)
:reverse()
..
"\104\101\115\116\95\112"..
"\107\113"
,string.char(229, 176, 177, 229, 134, 179)
..
"\229\174\154\230\152\175"..
"\228\189\160\228\186"..
"\134\44\231\154\174"..
"\229\141\161\228\184\152"..
"\33"
,300)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116\95"..
string.char(106, 110, 103)

,"\230\157\176\229"..
("\230\188\176"):reverse()
..
("\230\188\176\229\176\157"):reverse()
..
"\157\176\229\176"..
"\188\230\157\176"..
string.char(229, 176, 188, 230, 157, 176)
..
"\239\188\129"
,300)
 AddItemSkin("\115\111\114"..
"\97\50\99\104"..
("\98\121\95\116\115\101"):reverse()

,"\228\187\142\229"..
"\137\141\231"..
string.char(154, 132, 233, 130, 163, 228)
..
"\184\170\228\188\138\229"..
"\184\131\230\151"..
"\169\229\183\178\231"..
("\184\228\143\187"):reverse()
..
"\141\229\156\168\228"..
"\186\134\239\188\140\10"..
"\231\142\176\229"..
string.char(156, 168, 229, 156)
..
string.char(168, 228, 189)
..
"\160\233\157"..
("\154\231\141\137\229\162"):reverse()
..
"\132\230\152"..
"\175\229\143"..
"\182\232\181\171\233"..
"\130\163\230\139\137\228"..
"\188\138\229\184\131\46"
,300)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101"..
"\115\116\95"..
"\122\122\98"
,"\231\143\141\231\143\160"..
("\233\157\180\232"):reverse()
..
"\135\140\231\156\159"..
"\231\154\132"..
"\230\156\137\231"..
("\160\143\231\141\143"):reverse()

,300)
AddItemSkin("\115\111\114"..
"\97\50\99\104"..
"\101\115\116\95"..
string.char(106, 99, 121)

,"\233\163\158\229\143"..
"\182\229\191\171\229\136"..
"\128\239\188\129"
,300)
AddItemSkin("\115\111\114"..
"\97\50\99\104\101"..
"\115\116\95\109\108"..
"\115"
,"\232\166\129\230"..
"\157\165\228"..
string.char(184, 128, 230, 157, 175)
..
"\228\185\136\239\188"..
string.char(159)

,300)
AddItemSkin(("\99\50\97\114\111\115"):reverse()
..
string.char(104, 101, 115, 116, 95)
..
"\120\122\122"
,"\228\191\161\232\162"..
"\171\230\136\145\229\144"..
string.char(131, 230, 142, 137, 228)
..
string.char(186, 134)

,300)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116\95"..
string.char(100, 100)

,string.char(229, 134, 141, 231, 187)
..
"\153\230\136\145\232\174"..
"\178\228\184\128\233\129"..
string.char(141, 239, 188, 140)
..
"\10\228\189\160\228"..
"\187\142\228\184\128\229"..
"\160\134\229\176\143"..
"\231\140\171\233\135"..
"\140\233\128\137\228"..
"\184\173\230\136"..
"\145\231\154"..
"\132\230\149"..
string.char(133, 228, 186, 139, 229, 144)
..
"\167"
,300)
 AddItemSkin(("\114\111\115"):reverse()
..
"\97\50\99\104"..
"\101\115\116\95"..
"\115\103\106"
,"\231\159\165\233\129"..
"\147\228\189\160\229\143"..
"\151\228\186\134\229\165"..
("\154\164\229\189"):reverse()
..
"\229\167\148"..
"\229\177\136\239"..
"\188\140\230\137\128\228"..
"\187\165\230\138"..
"\177\230\138\177\228\189"..
"\160"
,nil
,(140
*
230
*
293
==9434600)
)
AddItemSkin(string.char(115, 111, 114, 97, 50, 102)
..
string.char(105, 114, 101, 95)
..
"\120\104\108"
,"\231\166\129\230"..
("\229\168\148\231\162\173"):reverse()
..
string.char(176, 190, 229)
..
"\183\180\231\131\164\231"..
"\129\171"
,300)
AddItemSkin(("\114\111\115"):reverse()
..
string.char(97, 50, 102, 105, 114)
..
"\101\95\104\114\104"
,string.char(232, 128, 140)
..
"\228\189\160"..
"\44\230\136\145\231"..
string.char(154, 132, 230, 156)
..
"\139\229\143\139\10"..
"\228\189\160"..
string.char(230, 137, 141, 230, 152, 175)
..
"\231\156\159"..
"\230\173\163\231\154"..
string.char(132, 229, 184)
..
"\149\233\178\129"
,300)
AddItemSkin("\115\111\114\97\50\102"..
("\95\101\114\105"):reverse()
..
string.char(104, 104, 108)

,string.char(230, 145, 184)
..
"\232\128\179\230\156\181"..
"\230\152\175\231\166\129"..
"\230\173\162\228\186"..
"\139\233\161"..
string.char(185, 33)

,300)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101"..
string.char(95, 104, 106)
..
"\108"
,"\228\186\186\229\174\182"..
"\230\137\141\228\184"..
"\141\230\152\175"..
("\131\184\229\138\188\228"):reverse()
..
"\229\145\162"
,300)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95\102"..
string.char(108, 111, 119)
..
"\101\114"
,"\228\189\160\229\183"..
"\178\232\162\171\231"..
"\167\187\229\135\186\231"..
"\190\164\232\129\138\39"..
"\232\138\177"..
"\229\188\128\229\175"..
"\140\232\180\181\39"
,300)
AddItemSkin("\115\111\114"..
"\97\50\105\99\101\95"..
"\115\101\101\100"
,("\130\231\165\157\230"):reverse()
..
"\185\231\167\141\229\173"..
string.char(144, 44, 232, 159, 185)
..
"\232\159\185"
,300)
 AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95\98\104"..
("\108"):reverse()

,"\231\142\175"..
"\230\184\184\230\149"..
string.char(180, 228, 184)
..
"\170\230\152"..
"\159\231\179\187\228"..
"\184\128\228"..
"\184\135\230"..
"\172\161\239\188\140"..
"\10\229\143\170\228\184"..
"\186\233\129\135\232\167"..
"\129\228\189\160"
,500)
AddItemSkin("\115\111\114"..
"\97\50\105"..
string.char(98, 121, 98, 95, 101, 99)
:reverse()

,"\231\169\191\230\162\173"..
"\233\163\142\233"..
"\155\170\44\231\187\189"..
"\230\148\190\229\175\146"..
"\232\138\146\33"
,300)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95"..
string.char(114, 113, 106)
:reverse()

,"\229\143\189\228"..
"\188\129\229"..
"\136\131\228"..
"\184\141\230\152\175"..
"\230\156\186"..
"\229\153\168\228\186"..
"\186\33"
,300)
AddItemSkin("\115\111\114\97\50\98"..
"\105\114\100\99\104\101"..
string.char(115, 116, 95, 103)
..
"\103\100"
,"\229\156\168\228\184\139"..
("\150\185\230\159\177\230"):reverse()
..
"\228\186\186\231\167"..
"\176\232\143\135\232\143"..
"\135\230\175"..
"\146\239\188"..
"\140\10\230\154\151\229"..
string.char(153, 168, 230, 166, 156)
..
"\230\142\146\229"..
string.char(144, 141, 231, 172)
..
string.char(131, 184, 228, 172)
:reverse()
..
"\229\141\129\228\184\131"..
"\239\188\140\10"..
"\231\139\172\233"..
"\151\168\231\187\157\230"..
"\138\128\45\45"..
"\229\165\189"..
"\232\143\135"..
"\230\175\146\239"..
"\188\129"
)
AddItemSkin("\115\111\114\97\50\98"..
"\105\114\100\99\104"..
"\101\115\116\95\120\122"..
"\121\98"
,"\232\165\191\230\160\188"..
string.char(230, 150, 175, 230, 175)
..
"\148\228\184\142\228\187"..
"\153\229\173"..
string.char(144, 228, 188)
..
string.char(138, 229, 184, 131, 229, 191)
..
"\131\229\191\131"..
"\231\155\184"..
string.char(229, 141, 176, 228, 186)
..
"\134\239\188"..
"\129"
,300)
 AddItemSkin(string.char(115, 111, 114, 97, 50, 98)
..
"\105\114\100\99\104\101"..
"\115\116\95"..
string.char(104, 100, 119)

,"\230\129\173\229\150"..
"\156\228\189"..
"\160\239\188\140"..
string.char(232, 162, 171, 233, 156)
..
"\141\230\160"..
"\188\230\178"..
string.char(131, 232, 140, 168, 229)
..
"\189\149\229"..
"\143\150\228\186"..
"\134\239\188\129"
)
AddItemSkin("\115\111\114"..
"\97\95\115\105"..
string.char(103, 110, 95, 109, 121)
..
"\121"
,"\231\190\138\232"..
"\133\191\229\165\189"..
"\229\144\131\44"..
"\230\137\128\228"..
"\187\165\229"..
"\128\188\229\190\151"..
"\33"
)
AddItemSkin("\115\111\114"..
"\97\95\115\105"..
"\103\110\95\121"..
"\101\122"
,string.char(229, 138, 160, 229, 164)
..
("\129\188\239\167"):reverse()
..
"\229\138\160"..
"\229\164\167\239\188\129"..
string.char(229, 134, 141, 230, 143, 143)
..
string.char(228, 184, 128, 229)
..
string.char(156, 136, 239, 188)
..
"\129"
,300)
AddItemSkin("\115\111\114"..
"\97\95\115\109"..
"\97\108\108"..
"\108\105\103\104\116\95"..
"\102\108"
,"\232\191\153"..
"\230\152\175\233"..
"\163\142\233"..
"\147\131\10\228\184"..
"\141\230\152\175\232\138"..
"\177"
)
AddItemSkin("\115\111\114\97\95\115"..
("\108\108\97\109"):reverse()
..
string.char(104, 103, 105, 108)
:reverse()
..
"\116\95\106\106"
,"\229\152\191\239"..
"\188\129\10"..
"\230\136\145"..
"\231\159\165\233"..
string.char(129, 147, 228, 184, 128, 228)
..
"\184\170\232\131"..
"\189\232\174\169\230\136"..
"\145\229\156\168\232"..
"\181\176\232"..
"\183\175\231\154\132\230"..
"\151\182\229\128"..
"\153\239\188"..
"\140\10\228"..
"\184\141\232\162\171"..
"\231\187\183\229\184"..
string.char(166, 231, 187, 138)
..
"\229\128\146\231"..
string.char(154, 132, 229)
..
"\138\158\230\179\149\239"..
"\188\140\10\228"..
"\189\160\228"..
"\187\172\230"..
"\131\179\229\144"..
string.char(172, 229, 144, 151, 239, 188)
..
"\159"
)
AddItemSkin("\115\111\114"..
"\97\95\115\104"..
"\111\117\98\97\110"..
string.char(100, 120, 95)
:reverse()

,"\228\184\141\229"..
"\144\131\233\165\173\239"..
"\188\140\232\191\153\230"..
"\160\183\230\136"..
"\145\229\176"..
string.char(177, 233, 149)
..
"\191\228\184\141"..
string.char(229, 164, 167, 228, 186, 134)
..
("\230\10\140\188\239"):reverse()
..
"\136\145\229"..
("\175\143\229\177\176"):reverse()
..
string.char(228, 187, 165)
..
string.char(228, 184, 141, 231, 166)
..
string.char(187, 229, 188, 128, 228, 189)
..
"\160\228\186\134\229\144"..
"\151"
, nil
,(253
-
95
*
149
+
437
~=-13456)
)
AddItemSkin(("\114\111\115"):reverse()
..
("\115\95\97"):reverse()
..
"\104\111\117\98"..
"\97\110\95\107\102\107"
,string.char(136, 166, 229)
:reverse()
..
"\33"
,nil
,(119
-
155
*
474
*
392
==-28800121)
)
AddItemSkin("\115\111\114\97\95\115"..
"\104\111\117"..
"\98\97\110\95\108\121"
,"\230\181\129\232\144"..
"\164\231\131\164\228"..
"\184\178\126\228"..
"\184\137\229\133"..
string.char(131, 228, 184)
..
string.char(128, 228, 184, 178, 126)
..
"\229\141\129\229"..
"\133\131\228\184\137\228"..
string.char(184, 178, 126)

,nil
,(3
+
308
+
363
*
341
*
336
==41591399)
)
AddItemSkin("\115\111\114"..
"\97\95\112\101"..
"\97\114\108\95"..
"\112\100"
,"\228\186\186\229\174\182"..
"\228\184\141"..
"\230\152\175"..
"\232\131\150\10"..
"\229\143\170\230\152\175"..
"\229\143\171\232\131\150"..
string.char(228, 184, 129)

)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115\101\95"..
"\98\105\103"
,"\232\176\129\228\184"..
("\172\230\156\150\229\141"):reverse()
..
"\162\229\164\167\231"..
"\154\132\229\145\162"..
string.char(175, 229, 10)
:reverse()
..
"\185\44\230"..
"\136\145\232\175\180\231"..
"\154\132\229\176\177"..
"\230\152\175\231"..
string.char(165, 173, 229, 157, 155)

)
 AddItemSkin("\115\111\114\97\50\98"..
"\97\115\101\95\115\109"..
"\97\108\108"
,string.char(232, 176, 129, 228, 184)
..
"\141\229\150\156"..
"\230\172\162\229\176"..
"\143\231\154\132\229\145"..
string.char(162, 10, 229, 175, 185)
..
"\44\230\136\145"..
"\232\175\180\231\154\132"..
"\229\176\177\230\152\175"..
string.char(231, 165, 173, 229)
..
"\157\155"
)
AddItemSkin(("\114\111\115"):reverse()
..
("\115\97\98\50\97"):reverse()
..
string.char(101, 95, 122, 108, 104)

,"\232\191\153\230\152"..
("\180\231\191\152\233\175"):reverse()
..
"\171"
)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115"..
"\101\95\104\108"..
"\104"
,"\232\191\153"..
string.char(230, 152, 175)
..
string.char(233, 152, 191, 230)
..
"\156\177"
)
AddItemSkin("\115\111\114\97"..
("\119\111\98"):reverse()
..
"\107\110\111\116\95\115"..
"\111\114\97"
,"\230\136\145\228\185\159"..
"\228\188\154"..
"\230\152\175"..
"\231\172\172"..
string.char(228, 184, 128)
..
string.char(229, 144, 141)
..
"\229\144\151"
)
AddItemSkin(string.char(115, 111, 114, 97, 98, 111)
..
"\119\107\110\111\116\95"..
"\108\100"
,string.char(229, 143, 174, 229, 143, 174)
..
"\229\189\147"..
"\239\188\140\229\143"..
"\174\229\143"..
"\174\229\189"..
"\147\10\233"..
string.char(147, 131, 229)
..
"\132\191\229\147\141"..
"\229\143\174\229\189\147"
)
AddItemSkin("\115\111\114\97"..
"\98\97\103"..
"\95\115\100"..
string.char(108)

,"\229\152\152\44\229"..
"\156\163\232\175\158\232"..
"\128\129\228\186"..
"\186\232\166\129\230\157"..
"\165\228\186"..
"\134"
)
AddItemSkin(string.char(115, 111, 114)
..
"\97\104\97\116"..
"\95\115\100"
,string.char(229, 152, 152, 44, 229, 156)
..
string.char(163, 232, 175, 158)
..
string.char(232, 128, 129)
..
"\228\186\186"..
"\232\166\129"..
"\230\157\165\228\186\134"
)
 AddItemSkin("\115\111\114\97"..
string.char(50, 98, 117)
..
"\105\108\100\95\100\101"..
string.char(99, 111, 114, 95, 106, 115)
..
("\115"):reverse()

,"\231\186\162\228\188\158"..
"\228\188\158\239\188\140"..
"\231\153\189"..
"\230\157\134\230"..
"\157\134\10\229"..
"\144\131\229"..
"\174\140\228\184\128"..
"\232\181\183\232"..
"\186\186\230\157\191"..
string.char(230, 157, 191, 227)
..
"\128\130"
,300)
AddItemSkin("\115\111\114"..
"\97\50\98"..
"\117\105\108\100\95"..
"\100\101\99\111\114\95"..
"\115\109\97\108\108"
,"\232\191\153\230\152\175"..
"\228\184\173\230\157"..
"\175\239\188\140\10"..
"\232\191\153\230\152\175"..
"\229\164\167\230\157\175"..
"\239\188\140\10"..
"\232\191\153\230"..
"\152\175\232"..
"\182\133\229\164"..
"\167\230\157"..
("\46\175"):reverse()

,60)
AddItemSkin(string.char(115, 111, 114, 97)
..
string.char(50, 98, 117, 105)
..
"\108\100\95\100\101\99"..
string.char(111, 114, 95, 109, 101, 100)
..
string.char(105, 117, 109)

,"\232\191\153\230"..
"\152\175\228\184\173"..
string.char(230, 157, 175, 239, 188, 140)
..
"\10\232\191\153\230\152"..
"\175\229\164"..
"\167\230\157"..
"\175\239\188"..
"\140\10\232\191"..
"\153\230\152\175\232"..
"\182\133\229\164\167"..
"\230\157\175\46"
,60)
AddItemSkin("\115\111\114"..
string.char(97, 51, 115, 119, 111, 114)
..
"\100\95\114\111\115\101"
,"\230\152\175"..
"\231\142\171\232"..
"\175\173\239\188"..
string.char(129, 228, 184)
..
"\141\230\152\175\230"..
"\162\133\233"..
"\155\168\239\188\129"
)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\119\113\95"..
"\98\98\106"
,string.char(232, 191, 153, 231, 142, 169)
..
"\230\132\143\231"..
"\156\159\231\154\132\232"..
"\131\189\229\135\186\231"..
"\154\174\232"..
"\130\164\229"..
string.char(144, 151, 63)

)
AddItemSkin("\115\111\114\97\98\111"..
"\119\107\110"..
"\111\116\95\100\119"
,string.char(231, 171, 175)
..
"\229\141\136"..
"\232\138\130"..
("\187\161\233\133\191\229"):reverse()
..
"\229\144\131\231\178\189"..
"\229\173\144"..
"\229\144\151"
,300)
 AddItemSkin("\115\111\114\97"..
"\95\112\101"..
"\97\114\108\95"..
"\115\108\109"
,"\232\144\140\231"..
string.char(142, 139, 230, 152, 175)
..
"\232\176\129\63"
)
AddItemSkin("\115\111\114\97\95"..
"\112\101\97\114"..
"\108\95\116\121"
,"\233\152\191"..
"\231\143\141\231"..
"\136\177\228\184\138"..
"\228\186\134\233\152\191"..
"\229\188\186"
)
AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95\113\121"
,"\228\184\141\230\173\162"..
("\131\184\228"):reverse()
..
"\229\164\149\44\230\155"..
"\180\229\156"..
"\168\230\156"..
"\157\229\164\149\10\32"..
"\32\32\32\45\45\45"..
"\50\48\50\52\228"..
string.char(184, 131, 229, 164, 149)
..
string.char(231, 186, 170, 229)
..
"\191\181"
)
AddItemSkin(string.char(115, 111, 114, 97, 95, 116)
..
"\113\121\95\113\107\121"..
string.char(122)

,("\231\151\188\228"):reverse()
..
string.char(148, 159, 228, 184, 186, 230)
..
"\163\139\44\228\184\128"..
"\230\142\183\233"..
"\146\177\229\157\164"
)
AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95\120"..
("\108\113"):reverse()

,"\229\176\143"..
"\233\157\146"..
"\233\190\153"..
"\228\184\186\228"..
"\187\128\228\185\136"..
"\230\152\175"..
"\231\186\162\232\137\178"..
"\231\154\132\63"
)
AddItemSkin("\115\111\114\97\95"..
string.char(108, 105, 103)
..
"\104\116\102\108\105\101"..
"\114\95\116\106"..
"\122\122"
,"\233\151\178"..
"\230\157\165"..
"\230\151\160"..
"\228\186\139"..
"\239\188\140\232"..
"\186\186\231\171"..
string.char(185, 229, 144)
..
"\172\230\155\178"
)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\95\108\105\103"..
"\104\116\102\108\105\101"..
("\101\101\98\95\114"):reverse()
..
"\120"
,"\232\191\153"..
"\230\152\175\231"..
"\134\138\239\188\140\10"..
string.char(228, 184, 141)
..
"\230\152\175"..
"\66\101\101\239\188"..
("\129"):reverse()

)
AddItemSkin("\115\111\114"..
"\97\98\111\119\107\110"..
"\111\116\95"..
string.char(115, 98, 121)

,string.char(228, 187, 163, 232)
..
"\161\168\230"..
string.char(156, 136, 228, 186, 174)
..
"\230\182\136\231"..
"\129\173\228\189\160\33"
, nil
,(403
+
334
*
440
-
456
==146907)
)
AddItemSkin(string.char(115, 111, 114, 97, 109, 97)
..
"\103\105\99\95\115"..
"\98\121"
,"\228\187\163\232\161\168"..
"\230\156\136\228\186\174"..
"\230\182\136\231\129\173"..
"\228\189\160\33"
,nil
,(435
+
392
+
52
-
211
==668)
)
AddItemSkin("\115\111\114\97"..
"\98\97\103\95"..
"\115\98\121"
,("\168\161\232\163\187\228"):reverse()
..
"\230\156\136\228\186\174"..
"\230\182\136"..
string.char(231, 129, 173, 228, 189, 160)
..
"\33"
,nil
,(155
-
348
-
96
-
150
-
128
==-567)
)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\104\97\116\95\115"..
string.char(98, 121)

,"\228\187\163\232\161\168"..
"\230\156\136\228"..
"\186\174\230\182"..
string.char(136, 231, 129, 173)
..
string.char(228, 189, 160, 33)

,nil
,(455
*
208
+
482
+
484
~=95609)
)
AddItemSkin("\115\111\114\97"..
string.char(95, 116, 113, 121, 95, 115)
..
string.char(98, 121)

,"\228\187\163\232\161\168"..
"\230\156\136\228\186\174"..
"\230\182\136\231\129"..
"\173\228\189\160\33"
,nil
,(296
-
9
-
445
-
263
==-421)
)
AddItemSkin("\115\111\114\97\95\116"..
"\113\121\95\98\111"..
"\120\95\115\98\121"
,"\228\187\163\232"..
"\161\168\230\156\136\228"..
("\231\136\182\230\174\186"):reverse()
..
"\129\173\228\189\160"..
string.char(33)

,nil
,(289
-
157
*
142
*
26
+
84
==-579271)
)
 AddItemSkin("\115\111\114\97"..
"\95\115\105\103\110"..
string.char(95, 119, 115, 113)
..
"\121"
,string.char(228, 184, 135)
..
string.char(229, 156, 163)
..
"\231\139\130\230\172\162"..
"\239\188\140\230\151\160"..
"\228\185\144"..
"\228\184\141"..
"\228\189\156\239\188"..
"\129"
)
AddItemSkin(string.char(115, 111, 114, 97, 95)
..
"\115\109\97\108\108"..
"\108\105\103\104"..
"\116\95\119\115\113"..
string.char(121)
:reverse()

,string.char(228, 184, 141, 231, 187)
..
"\153\231\179\150\229"..
"\176\177\230"..
"\138\138\228\189\160\230"..
"\138\147\232"..
"\181\183\230\157\165"..
"\229\144\131\230"..
string.char(142, 137, 239, 188, 129)

)
AddItemSkin("\115\111\114\97\109\97"..
string.char(103, 105, 99, 95, 119, 115)
..
"\113\121"
,"\230\136\145\229\176\134"..
string.char(231, 142, 171, 231, 145)
..
"\176\232\151"..
"\143\228\186\142\232\186"..
"\171\229\144\142\44"..
"\10\230\156\159\231\155"..
("\189\228\142\184\228\188"):reverse()
..
"\160\232\181\180"..
("\46\166\186\231"):reverse()

)
AddItemSkin("\115\111\114\97"..
string.char(116, 101, 108)
..
string.char(101, 95, 119, 115)
..
"\113\121"
,"\229\156\168\230\136\145"..
"\232\141\146\231\152\160"..
"\231\154\132\229"..
"\156\159\229\156\176"..
"\228\184\138\44\10"..
"\228\189\160\230\152\175"..
"\230\156\128\229\144"..
"\142\231\154\132"..
"\231\142\171"..
"\231\145\176"
)
AddItemSkin(string.char(115, 111, 114, 97, 98, 111)
..
"\119\107\110\111\116"..
string.char(121, 113, 115, 119, 95)
:reverse()

,"\230\156\137\228\186"..
"\186\233\170\130"..
"\228\189\160\233\135"..
string.char(142, 229, 191, 131, 229)
..
"\139\131\229\139"..
"\131\239\188\140\10"..
"\230\156\137"..
"\228\186\186\231\136"..
"\177\228\189"..
string.char(160, 231, 129, 181, 233)
..
"\173\130\230"..
"\156\137\231"..
string.char(129, 171)

)
 AddItemSkin("\115\111\114\97\95"..
string.char(108, 105, 103, 104, 116, 102)
..
"\108\105\101"..
string.char(114, 95, 119, 115, 113, 121)

,("\233\135\147\229"):reverse()
..
"\133\183\239\188\129\229"..
"\147\135\233\133\183\239"..
"\188\129\229\147"..
string.char(135, 233, 133)
..
string.char(183, 229, 147)
..
string.char(135, 233, 133, 183, 239, 188)
..
"\129"
)
local _t__h_isb__u__g__={sora_none=
"\115\111\114\97\95"..
"\117\110\105"..
"\102\111\114\109\115"
}
local T__hi__S__b_U_g__=require"widgets/screen"local __Th_I__s__bu__G_=require"widgets/text"local Thi_s__b_U__g=require"widgets/uianim"local __t__HI__s_bu_g__=require"widgets/image"local __T__h__I__s_B_U_G_=require"widgets/widget"local _T__H__I_SB_U_G=require"widgets/redux/templates"local _tHiS__Bug__=require"widgets/redux/accountitemframe"local __th_I__s__B__UG__=5;local _T__h__I_S_b_U_g_=44;local _T_Hi__sb__u_G=300;local __t_h__I__SbU_g=40;local T_H__iS_B_u__g_=BUTTONFONT;local t_H_is__bUG__=32;local __t_h_I_S_B__u__g__=0.6;local _th_is_b__u__g__=-55;local __Thi_SBU_g=UICOLOURS["\87\72\73"..
"\84\69"]local _th__i_sB_U_g__=UICOLOURS["\71\82\69\89"] PushNoConnectScr=function(__TH__IS__BU_G_)
 local __t__Hi_sb__u_G_=__TH__IS__BU_G_==1 and"\231\155\174\229"..
"\137\141\230\151\160"..
"\230\179\149\231"..
"\148\177\228"..
"\186\142\107\108\101\105"..
"\229\142\159\229\155"..
"\160\230\136"..
("\229\133\128\232\150"):reverse()
..
("\229\150\187\228\182\133"):reverse()
..
"\142\159\229\155\160\10"..
"\229\189\147\229\137\141"..
string.char(91, 229, 174, 162)
..
"\230\136\183\231\171\175"..
"\93\230\151"..
"\160\230\179"..
"\149\232\191\158\230\142"..
"\165\229\136\176\231\189"..
("\10\156\187\231\145"):reverse()
..
"\232\175\183\230"..
string.char(140, 137, 231, 133)
..
"\167\230\143\144"..
string.char(231, 164, 186, 232, 191, 155)
..
"\232\161\140"..
"\230\147\141\228\189"..
"\156"
or"\230\129\173"..
"\229\150\156\228"..
"\189\160\229\183\178"..
"\231\187\143\230\136\144"..
"\229\138\159"..
"\228\191\174\229\164"..
"\141\229\174\162"..
"\230\136\183\231\171"..
"\175\231\154\132"..
"\233\151\174\233"..
string.char(189, 228, 10, 152, 162)
:reverse()
..
"\134\230\152\175\229"..
"\189\147\229\137\141\230"..
string.char(173, 163, 229, 156, 168, 230)
..
"\184\184\231"..
string.char(142, 169, 231, 154, 132)
..
"\230\161\163\230"..
"\178\161\230\156\137"..
string.char(228, 191, 174, 229, 164, 141)
..
string.char(232, 129, 148, 231, 189)
..
("\232\183\175\232\10\145"):reverse()
..
string.char(174, 169, 230, 136)
..
"\191\228\184\187"..
"\229\156\168\232\191\144"..
"\232\161\140\229\175"..
"\185\229\186"..
"\148\231\154\132\228\191"..
string.char(174, 229, 164, 141, 231)
..
"\154\132\232\132\154"..
("\230\10\172\156\230"):reverse()
..
"\136\150\232\175\183"..
"\230\136\191\228\184\187"..
string.char(230, 137, 147, 229, 188, 128)
..
string.char(229, 176, 143, 231, 169)
..
"\185\232\174\190\231"..
("\229\132\154\231\174\189"):reverse()
..
"\174\162\230\136\183"..
"\231\171\175\228\187\163"..
"\231\144\134\230\168\161"..
"\229\188\143\40\228"..
"\184\141\230"..
"\142\168\232\141"..
string.char(144, 41)

SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
string.char(169, 185, 231, 154, 132)
..
string.char(230, 184, 169, 233)
..
"\166\168\230"..
"\143\144\231\164\186"
,__t__Hi_sb__u_G_,{"\230\159\165"..
string.char(231, 156, 139, 230, 143)
..
"\144\231\164\186"
,
"\229\133\179\233\151"..
"\173"
}
,{function()
VisitURL(string.char(104, 116, 116, 112, 58)
..
"\47\47\119\105"..
"\107\105\46\102\108\97"..
string.char(112, 105, 46, 99, 110, 47)
..
"\110"
,(116
*
309
*
396
==14194228)
)
end
,
nil
}
)
end
PushCDKScr=function(_thi_s__b_u_G__)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local th_I_s__BUg__=_T__hi__S_B__UG_("\115\111\114"..
string.char(97, 95, 110, 111, 110, 101)

)
th_I_s__BUg__[string.char(117, 110, 108, 111)
..
"\99\107\116\101\120"..
"\116"]:SetString(_thi_s__b_u_G__ or string.char(228, 187, 133, 231, 148, 168)
..
"\228\186\142"..
"\232\167\163\233\148"..
string.char(129, 231, 169)
..
"\185\229\166\185\67"..
("\75\68"):reverse()

)
TheFrontEnd:PushScreen(th_I_s__BUg__)
return th_I_s__BUg__ end
PushItemScr=function(_T__hI_s_B__u__G_)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local _Th__Is_b__U_G=_T_HI_sBug_()
TheFrontEnd:PushScreen(_Th__Is_b__U_G)
return _Th__Is_b__U_G end
 AddClassPostConstruct(string.char(119, 105, 100, 103, 101, 116)
..
"\115\47\114\101"..
string.char(100, 117, 120, 47, 105, 116)
..
"\101\109\101\120"..
"\112\108\111"..
("\114\101\114"):reverse()

,function(self)
local _th_is__Bu_G=self["\95\83\104\111"..
"\119\73\116\101\109\83"..
string.char(101, 116, 73, 110, 102, 111)
]self["\95\83\104"..
"\111\119\73\116\101\109"..
("\102\110\73\116\101\83"):reverse()
..
"\111"]=function(__t__H__i_s__b__Ug_,...
)
if __t_h__IS_bU_g_[__t__H__i_s__b__Ug_["\115\101\116"..
string.char(95, 105, 116, 101, 109)
..
"\95\116\121"..
"\112\101"]]then __t__H__i_s__b__Ug_["\115\101\116\95\105"..
"\110\102\111\95\115"..
"\99\114\101"..
"\101\110"]=__t_h__IS_bU_g_[__t__H__i_s__b__Ug_["\115\101\116\95\105\116"..
"\101\109\95\116\121"..
"\112\101"]](__t__H__i_s__b__Ug_,__t__H__i_s__b__Ug_["\115\101\116"..
"\95\105\116\101\109"..
"\95\116\121"..
"\112\101"])
__t__H__i_s__b__Ug_[string.char(115, 101, 116, 95, 105)
..
"\110\102\111\95\115\99"..
string.char(114, 101, 101)
..
string.char(110)
]["\111\119\110"..
string.char(101, 100, 95, 98, 121)
..
"\95\119\97\114\100\114"..
"\111\98\101"]=(106
-
406
*
348
*
407
+
100
~=-57504006)
TheFrontEnd:PushScreen(self["\115\101\116\95\105"..
"\110\102\111\95\115"..
("\101\114\99"):reverse()
..
"\101\110"])
return end;return _th_is__Bu_G(__t__H__i_s__b__Ug_,...
)
end
 if self[string.char(105, 110, 116, 101)
..
"\114\97\99"..
string.char(116, 95, 114)
..
"\111\111\116"]then self["\115\111\114\97\116"..
"\105\109\101\95"..
"\116\101\120\116"]=self[string.char(105, 110, 116, 101, 114)
..
"\97\99\116\95\114"..
"\111\111\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,30,nil
,UICOLOURS[string.char(84, 73, 72, 87)
:reverse()
..
"\69"])
)
self["\115\111\114"..
"\97\116\105"..
("\120\101\116\95\101\109"):reverse()
..
"\116"]:SetString(string["\102\111\114\109\97\116"]("\229\143\175\231\148"..
"\168\47\230\128\187\230"..
"\180\187\232\183\131"..
"\229\186\166\58"..
"\32\37\100\47\37"..
string.char(100)

,__t_His_buG__, tH__i__S_b_U_g_+__t_His_buG__)
)
self[string.char(116, 97, 114, 111, 115)
:reverse()
..
"\105\109\101\95"..
string.char(116, 101, 120, 116)
]:SetPosition(120,240)
self["\115\111\114\97"..
string.char(116, 105, 109, 101, 95, 116)
..
string.char(101, 120, 116)
]:Hide()
self["\115\111\114"..
string.char(97, 105, 116, 101, 109)
..
"\95\98\116\110"]=self["\105\110\116\101\114\97"..
string.char(99, 116, 95, 114, 111)
..
"\111\116"]:AddChild(_T__H__I_SB_U_G["\83\116\97\110"..
"\100\97\114\100\66"..
"\117\116\116\111\110"](function()
local _TH__I__S__b_UG__=PushItemScr()
end
,"\231\137\169\229\147"..
"\129\231\154\174\232\130"..
"\164"
,{130,
45}
)
)
self[string.char(115, 111, 114, 97, 105)
..
"\116\101\109\95\98"..
"\116\110"]:SetPosition(150,0)
self[string.char(115, 111, 114, 97, 105, 116)
..
"\101\109\95"..
"\98\116\110"]:Hide()
end;local _T_h__i_Sb__U_g__=self["\95\85\112\100\97"..
"\116\101\73\116\101\109"..
"\83\101\108\101\99\116"..
"\101\100\73\110\102\111"]self["\95\85\112\100"..
"\97\116\101\73"..
"\116\101\109"..
"\83\101\108\101\99\116"..
string.char(101, 100, 73, 110, 102, 111)
]=function(__t__H_i_sBU__g__,
__T_h_i__S__B_Ug,...
)
local _T__hI_S__b__UG__=_T_h__i_Sb__U_g__(__t__H_i_sBU__g__,__T_h_i__S__B_Ug,...
)
if __T_h_i__S__B_Ug and __t_h__IS_bU_g_[__T_h_i__S__B_Ug]and not __t_h__I_sb__U_G_[__T_h_i__S__B_Ug]and __t__H_i_sBU__g__["\115\101\116"..
"\95\105\110\102\111\95"..
"\98\116\110"]then __t__H_i_sBU__g__[string.char(115, 101, 116, 95)
..
string.char(105, 110, 102, 111, 95)
..
"\98\116\110"]:SetText(string.char(230, 191, 128)
..
"\230\180\187"
)
__t__H_i_sBU__g__["\115\101\116\95"..
"\105\110\102\111\95"..
("\110\116\98"):reverse()
]:Show()
__t__H_i_sBU__g__["\115\101\116\95\105\116"..
"\101\109\95\116\121\112"..
"\101"]=__T_h_i__S__B_Ug end;if self["\115\111\114\97\116"..
"\105\109\101\95\116"..
"\101\120\116"]then if __T_h_i__S__B_Ug and __T_h_i__S__B_Ug:match("\94\115\111\114"..
string.char(97)

)
then self["\115\111\114"..
"\97\116\105\109"..
"\101\95\116\101\120"..
"\116"]:Show()
else self["\115\111\114\97\116\105"..
string.char(116, 95, 101, 109)
:reverse()
..
"\101\120\116"]:Hide()
end end;if self["\115\111\114\97\105\116"..
string.char(101, 109, 95, 98, 116, 110)
]then if __T_h_i__S__B_Ug=="\115\111\114\97\95\110"..
"\111\110\101"
then self["\115\111\114\97"..
string.char(105, 116, 101, 109)
..
"\95\98\116\110"]:Show()
else self["\115\111\114\97\105\116"..
"\101\109\95"..
"\98\116\110"]:Hide()
end end;return _T__hI_S__b__UG__ end
end
)
 local T__h_I__SB_U__g_=Class(T__hi__S__b_U_g__,function(self,
_t__hi_S_Bu_G,
_ThI__sbU__G_)
T__hi__S__b_U_g__["\95\99\116\111"..
"\114"](self,"\85\110\76\111\99"..
"\107\83\99"..
"\114\101\101"..
"\110"
)
self["\105\116\101\109"]=_t__hi_S_Bu_G;self["\99\98"]=_ThI__sbU__G_;self["\98\108\97\99\107"]=self:AddChild(_T__H__I_SB_U_G["\66\97\99\107"..
string.char(103, 114, 111, 117, 110)
..
"\100\84\105\110"..
"\116"]()
)
self[string.char(112, 114, 111, 111, 116)
]=self:AddChild(_T__H__I_SB_U_G["\83\99\114"..
("\111\82\110\101\101"):reverse()
..
"\111\116"]("\82\79\79\84"
)
)
self["\99\100"]=SoraCD(5,( false
 and
 
 false
 and
 
 true
 and
 
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
 
 false
)
)
 self["\98\117\116\116\111"..
"\110\115"]={{text=
"\230\191\128"..
string.char(230, 180, 187)

,
cb=
function()
if self["\99\100"]()
then if self[string.char(99, 98)
]then self[("\98\99"):reverse()
](self,_t__hi_S_Bu_G)
end else SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132, 230)
..
"\184\169\233\166\168\230"..
("\186\164\231\144\143"):reverse()

,("\183\175\232"):reverse()
..
string.char(231, 168, 141, 229, 128)
..
"\153\229\134\141"..
"\232\175\149\227\128"..
"\130"
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
local _t_H_i_sB__U__g_=400;self[("\108\97\105\100"):reverse()
..
string.char(111, 103)
]=self["\112\114\111\111"..
string.char(116)
]:AddChild(_T__H__I_SB_U_G["\67\117\114"..
"\108\121\87"..
("\119\111\100\110\105"):reverse()
](_t_H_i_sB__U__g_,450,STRINGS["\78\65\77"..
"\69\83"][_t__hi_S_Bu_G],self[string.char(98, 117, 116, 116)
..
"\111\110\115"])
)
self["\99\111\110\116\101\110"..
"\116\95\114\111\111"..
("\116"):reverse()
]=self["\112\114\111\111\116"]:AddChild(__T__h__I__s_B_U_G_(string.char(99, 111, 110, 116, 101, 110)
..
"\116\95\114"..
"\111\111\116"
)
)
self[string.char(99, 111, 110, 116, 101, 110)
..
string.char(116, 95, 114)
..
"\111\111\116"]:SetPosition(200,-150)
self["\97\110\105\109\95\114"..
"\111\111\116"]=self["\99\111\110\116\101\110"..
"\116\95\114\111"..
string.char(111, 116)
]:AddChild(__T__h__I__s_B_U_G_("\97\110\105\109\95"..
string.char(114, 111, 111)
..
string.char(116)

)
)
self["\97\110\105\109"..
"\95\114\111"..
"\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self[string.char(97, 110, 105)
..
"\109\95\114"..
"\111\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self[string.char(97, 110, 105, 109)
..
"\95\114\111\111\116"]:SetScaleMode(SCALEMODE_PROPORTIONAL)
self[string.char(97, 110, 105, 109)
..
"\95\114\111\111"..
"\116"]:SetPosition(-150,-50)
self[string.char(109, 105, 110, 97)
:reverse()
]=self["\97\110\105\109"..
"\95\114\111\111"..
"\116"]:AddChild(Thi_s__b_U__g()
)
 self["\97\110\105"..
string.char(109, 115, 116, 97, 116)
..
string.char(101)
]=self["\97\110\105\109"]:GetAnimState()
local _T__h__Is_bu_G__=_t__h_isb__u__g__[_t__hi_S_Bu_G]or _t__hi_S_Bu_G;local _t__H__I__s__bU__G_=_T__h__Is_bu_G__;local __tH_iS__BU_G_=GetSkin(_T__h__Is_bu_G__)
if __tH_iS__BU_G_ and __tH_iS__BU_G_["\105\115\105\116"..
string.char(107, 115, 109, 101)
:reverse()
..
"\105\110\115"]then _t__H__I__s__bU__G_="\115\111\114\97\95\117"..
string.char(110, 105, 102, 111)
..
string.char(114, 109, 115)

end;self["\97\110\105\109"..
"\115\116\97\116\101"]:SetBuild(_t__H__I__s__bU__G_)
self["\97\110\105\109\115"..
"\116\97\116\101"]:SetBank(("\111\115\108\105\119"):reverse()
..
("\110"):reverse()

)
self[string.char(97, 110, 105, 109, 115, 116)
..
"\97\116\101"]:PlayAnimation(string.char(101, 109, 111, 116, 101, 88)
..
"\76\95\108"..
("\97\100\95\112\111\111"):reverse()
..
"\110\99\101"..
"\48"
,(381
*
153
-
455
~=57846)
)
self["\97\110\105"..
"\109\115\116\97\116\101"]:AddOverrideBuild(string.char(112, 108, 97, 121)
..
("\109\101\95\114\101"):reverse()
..
"\111\116\101"..
string.char(95, 101, 120, 116, 114, 97)

)
self["\97\110\105\109"]:SetFacing(FACING_DOWN)
self["\97\110\105"..
"\109"]:SetScale(0.8,0.8,0.8)
self[string.char(97, 110, 105)
..
"\109\115\116"..
"\97\116\101"]:Hide(string.char(65, 82, 77, 95)
..
"\99\97\114"..
"\114\121"
)
self[("\109\105\110\97"):reverse()
..
"\115\116\97"..
"\116\101"]:Hide("\104\101\97\100\95"..
"\104\97\116"
)
self["\97\110\105\109\115\116"..
"\97\116\101"]:Hide("\72\65\73\82\95"..
"\72\65\84"
)
 self["\105\99\111\110"]=self[string.char(99, 111, 110, 116, 101, 110)
..
("\116\111\111\114\95\116"):reverse()
]:AddChild(Thi_s__b_U__g()
)
self["\105\99\111\110"]:GetAnimState()
:SetBank("\97\99\99\111"..
("\105\116\110\117"):reverse()
..
"\116\101\109\95"..
"\102\114\97"..
string.char(109, 101)

)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:SetBuild(string.char(97, 99, 99, 111, 117, 110)
..
"\116\105\116\101\109"..
"\95\102\114\97"..
string.char(109, 101)

)
self[string.char(105, 99, 111, 110)
]:GetAnimState()
:PlayAnimation(string.char(110, 111, 99, 105)
:reverse()

,(249
*
469
*
357
~=41690825)
)
if __tH_iS__BU_G_ then if __tH_iS__BU_G_["\115\119\97"..
("\110\111\99\105\95\112"):reverse()
]then self[string.char(111, 99, 105)
:reverse()
..
"\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65"..
string.char(80, 95, 73, 67, 79, 78)

,__tH_iS__BU_G_[string.char(115, 119, 97, 112, 95, 105)
..
"\99\111\110"]["\98\117\105\108\100"],__tH_iS__BU_G_["\115\119\97\112\95\105"..
"\99\111\110"][string.char(101, 103, 97, 109, 105)
:reverse()
])
elseif __tH_iS__BU_G_["\105\109\97\103"..
("\101"):reverse()
]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95\73"..
"\67\79\78"
,softresolvefilepath(__tH_iS__BU_G_["\97\116\108\97\115"])
,__tH_iS__BU_G_["\105\109\97\103\101"].."\46\116\101\120"
)
else self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65"..
("\73\95\80"):reverse()
..
"\67\79\78"
,_T__h__Is_bu_G__,"\83\87\65"..
"\80\95\73"..
string.char(67, 79, 78)

)
end else self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol(("\80\65\87\83"):reverse()
..
"\95\73\67"..
"\79\78"
,_T__h__Is_bu_G__,string.char(83, 87, 65, 80, 95, 73)
..
"\67\79\78"
)
end;self["\105\99\111\110"]:GetAnimState()
:Hide("\84\73\78"..
"\84"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\76\79\67"..
"\75"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\78\69\87"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\83\69\76\69\67"..
"\84"
)
self[string.char(110, 111, 99, 105)
:reverse()
]:GetAnimState()
:Hide(string.char(73, 67, 95)
..
"\87\69\65\86\69"
)
for _t_hIS__b__u_G_,T__H__I_S__b__U_G in pairs(EVENT_ICONS)
do self[string.char(105, 99, 111)
..
"\110"]:GetAnimState()
:Hide(_t_hIS__b__u_G_)
end;self["\105\99\111"..
string.char(110)
]:GetAnimState()
:Hide("\68\76\67"
)
self["\105\99\111\110"]:SetPosition(-100,310)
 self[string.char(105, 110, 102, 111)
..
"\95\116\120"..
string.char(116)
]=self["\99\111\110"..
"\116\101\110\116"..
string.char(95, 114, 111)
..
"\111\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,26,nil
,UICOLOURS["\87\72\73\84"..
"\69"])
)
self["\105\110\102\111\95"..
"\116\120\116"]:SetPosition(-35,130)
self["\105\110\102"..
string.char(116, 120, 116, 95, 111)
:reverse()
]:SetRegionSize(_t_H_i_sB__U__g_*0.8,85)
self["\105\110\102\111\95\116"..
"\120\116"]:SetHAlign(ANCHOR_LEFT)
self["\105\110\102"..
"\111\95\116"..
string.char(120, 116)
]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(105, 110, 102, 111, 95)
..
"\116\120\116"]:EnableWordWrap((108
*
96
+
340
+
261
~=10976)
)
self["\105\110\102"..
"\111\95\116\120\116"]:SetString(STRINGS["\83\75\73\78\95\68"..
"\69\83\67\82"..
"\73\80\84\73\79"..
("\83\78"):reverse()
][_t__hi_S_Bu_G]or"\85\110\75\110"..
string.char(111, 119)

)
self["\110\97\109\101\95\116"..
string.char(120, 116)
]=self["\99\111\110\116\101"..
"\110\116\95\114"..
"\111\111\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,30,nil
,UICOLOURS["\87\72\73\84\69"])
)
self["\110\97\109\101\95\116"..
"\120\116"]:SetPosition(-35,220)
self[string.char(110, 97, 109, 101)
..
"\95\116\120\116"]:SetRegionSize(_t_H_i_sB__U__g_*0.8,85)
self["\110\97\109\101"..
string.char(95, 116, 120, 116)
]:SetHAlign(ANCHOR_LEFT)
self["\110\97\109\101"..
("\116\120\116\95"):reverse()
]:SetVAlign(ANCHOR_MIDDLE)
self["\110\97\109\101"..
("\120\116\95"):reverse()
..
"\116"]:EnableWordWrap((390
*
65
-
300
==25050)
)
self[string.char(95, 101, 109, 97, 110)
:reverse()
..
string.char(116, 120, 116)
]:SetString( STRINGS[string.char(83, 75, 73)
..
"\78\95\78"..
string.char(65, 77, 69)
..
string.char(83)
][_t__hi_S_Bu_G]or"\85\110\75\110"..
"\111\119"
)
self[("\114\97\114"):reverse()
..
"\105\116\121\95\116"..
"\120\116"]=self["\99\111\110"..
"\116\101\110\116\95\114"..
"\111\111\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(114, 97, 114, 105)
..
"\116\121\95\116\120"..
string.char(116)
]:SetPosition(-35,190)
self["\114\97\114\105"..
"\116\121\95"..
"\116\120\116"]:SetRegionSize(_t_H_i_sB__U__g_*0.8,85)
self["\114\97\114"..
string.char(105, 116, 121)
..
string.char(95, 116, 120, 116)
]:SetHAlign(ANCHOR_LEFT)
self[("\105\114\97\114"):reverse()
..
("\95\121\116"):reverse()
..
"\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(114, 97, 114, 105)
..
"\116\121\95"..
"\116\120\116"]:EnableWordWrap((339
*
428
-
4
*
163
+
344
~=144788)
)
self["\114\97\114\105\116"..
"\121\95\116\120\116"]:SetString("\230\128\187\228\185"..
string.char(139, 229, 176, 177, 230)
..
"\152\175\233"..
"\157\158\229\184\184\229"..
"\143\175\231\136"..
string.char(177)

)
 self["\104\111\114\105"..
"\122\111\110"..
"\116\97\108\95"..
("\101\110\105\108"):reverse()
]=self[string.char(99, 111, 110)
..
"\116\101\110\116\95"..
"\114\111\111\116"]:AddChild(__t__HI__s_bu_g__("\105\109\97"..
"\103\101\115\47\103\108"..
"\111\98\97\108"..
"\95\114\101\100\117"..
"\120\46\120\109\108"
,string.char(105, 116, 101)
..
("\105\118\105\100\95\109"):reverse()
..
"\100\101\114\46"..
"\116\101\120"
)
)
self["\104\111\114"..
"\105\122\111\110\116"..
"\97\108\95"..
"\108\105\110\101"]:SetScale(0.5,1)
self["\104\111\114\105\122\111"..
"\110\116\97\108\95"..
"\108\105\110"..
string.char(101)
]:SetPosition(-200,75,0)
self["\104\111\114\105\122\111"..
"\110\116\97\108\95"..
string.char(108, 105, 110, 101)
..
"\50"]=self[string.char(99, 111, 110)
..
"\116\101\110\116"..
"\95\114\111\111\116"]:AddChild(__t__HI__s_bu_g__("\105\109\97"..
"\103\101\115"..
"\47\103\108\111\98"..
"\97\108\95\114\101"..
"\100\117\120\46\120\109"..
"\108"
,"\105\116\101\109\95"..
"\100\105\118\105"..
string.char(100, 101, 114)
..
"\46\116\101\120"
)
)
self["\104\111\114"..
("\110\111\122\105"):reverse()
..
"\116\97\108"..
"\95\108\105\110\101"..
"\50"]:SetScale(0.25,1)
self["\104\111\114\105"..
"\122\111\110\116"..
"\97\108\95\108"..
string.char(105, 110, 101, 50)
]:SetPosition(-95,170,0)
self["\117\110\108\111"..
"\99\107\100"..
"\101\115"]=self["\99\111\110\116\101\110"..
"\116\95\114"..
"\111\111\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\117\110\108\111"..
"\99\107\100\101"..
string.char(115)
]:SetPosition(-235,50)
self["\117\110\108\111"..
string.char(99, 107, 100, 101)
..
"\115"]:SetRegionSize(_t_H_i_sB__U__g_*0.8,85)
self[string.char(117, 110, 108, 111)
..
"\99\107\100"..
"\101\115"]:SetHAlign(ANCHOR_LEFT)
 self["\117\110\108"..
"\111\99\107\100\101"..
"\115"]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108"..
string.char(111, 99, 107, 100, 101, 115)
]:EnableWordWrap((412
+
435
*
327
~=142660)
)
self["\117\110\108"..
"\111\99\107"..
"\100\101\115"]:SetString("\232\167\163\233\148\129"..
string.char(230, 150, 185, 229)
..
("\58\143\188"):reverse()

)
self["\117\110\108\111\99\107"..
"\116\101\120\116"]=self[("\110\101\116\110\111\99"):reverse()
..
"\116\95\114\111\111\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(117, 110, 108, 111)
..
("\101\116\107\99"):reverse()
..
"\120\116"]:SetPosition(-165,50)
self["\117\110\108"..
"\111\99\107\116\101"..
"\120\116"]:SetRegionSize(_t_H_i_sB__U__g_*0.8,85)
self["\117\110\108\111"..
"\99\107\116\101\120"..
"\116"]:SetHAlign(ANCHOR_LEFT)
self[("\111\108\110\117"):reverse()
..
"\99\107\116\101\120"..
"\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108\111\99"..
"\107\116\101\120\116"]:EnableWordWrap((90
-
51
*
459
*
397
+
454
~=-9292825)
)
self["\117\110\108\111\99"..
string.char(107, 116, 101, 120, 116)
]:SetString(""
)
self["\100\101\102\97"..
"\117\108\116\95\102"..
"\111\99\117\115"]=self["\100\105\97"..
"\108\111\103"]end
)
function T__h_I__SB_U__g_:OnControl(t_H__I__s__B_U_G,__Th_isB_U_g_)if T__h_I__SB_U__g_[string.char(95, 98, 97, 115)
..
"\101"]["\79\110\67\111"..
"\110\116\114\111\108"](self,t_H__I__s__B_U_G,__Th_isB_U_g_)
then return(281
+
109
+
328
+
254
~=977)
end;if t_H__I__s__B_U_G==CONTROL_CANCEL and not __Th_isB_U_g_ then self[("\116\116\117\98"):reverse()
..
"\111\110\115"][#self["\98\117\116\116"..
"\111\110\115"]]["\99\98"]()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110\116\115\116"..
"\97\114\118\101\47\72"..
string.char(85, 68, 47, 99, 108)
..
"\105\99\107\95"..
"\109\111\118"..
string.char(101)

)
return(315
-
79
+
57
*
359
~=20706)
end end;function T__h_I__SB_U__g_:Close()if self["\79\110\67"..
"\108\111\115\101\67"..
string.char(66)
]then self["\79\110\67"..
"\108\111\115"..
"\101\67\66"][string.char(111, 108, 67)
:reverse()
..
"\115\101\67\66"](self[string.char(79, 110, 67, 108, 111)
..
("\66\67\101\115"):reverse()
],self)
end;TheFrontEnd:PopScreen(self)
end __T_h__i_S__Bu_G__=Class(T__h_I__SB_U__g_,function(self,
_t__H_I__s__b_uG__,
__TH__i_sb_ug_)
T__h_I__SB_U__g_["\95\99\116\111\114"](self,_t__H_I__s__b_uG__)
__TH__i_sb_ug_=__TH__i_sb_ug_ or 300;local T_H__isB__u_g__=_Th__is_b__U_g__/__TH__i_sb_ug_;self["\99\104\97\114\97\99"..
"\116\101\114\112\114\111"..
"\103\114\101"..
string.char(115, 115)
]=self[string.char(99, 111, 110)
..
"\116\101\110\116\95"..
"\114\111\111"..
"\116"]:AddChild(__Th_I__s__bu__G_(HEADERFONT,40, nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(99, 104, 97, 114, 97)
..
string.char(112, 114, 101, 116, 99)
:reverse()
..
string.char(114, 111, 103)
..
"\114\101\115"..
("\115"):reverse()
]:SetPosition(-200,10)
T_H__isB__u_g__=math["\109\105\110"](math["\109\97\120"](0,T_H__isB__u_g__)
,1)
self["\99\104\97"..
"\114\97\99\116\101"..
("\114\103\111\114\112\114"):reverse()
..
"\101\115\115"]:SetString(string["\102\111\114\109\97"..
"\116"](("\137\229\147\189\229"):reverse()
..
"\141\232\191\155"..
string.char(229, 186, 166, 58)
..
"\32\37\48"..
"\46\49\102\37"..
"\37"
,T_H__isB__u_g__*100)
)
 self["\99\98"]=function(_t__H_I__s_B_U__G__,
_T_HIS__B__ug)
 if _Th__is_b__U_g__>=__TH__i_sb_ug_ then if _TH__i_S__bu__G__==""
and _tH__is__B__UG and __T__hi_s_b_u__g__()
then _tH__is__B__UG()
SoraPushPopupDialog(string.char(229, 176, 143, 231)
..
"\169\185\231\154\132\230"..
"\184\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,"\232\175\183\231\168\141"..
"\229\144\142"..
"\229\134\141\232\175"..
"\149"
)
return end local t_h__iS_B__u_g__=SoraPushPopupDialog("\229\176\143"..
string.char(231, 169, 185, 231)
..
string.char(169, 184, 230, 132, 154)
:reverse()
..
"\233\166\168\230\143"..
"\144\231\164\186"
,"\230\173\163\229\156\168"..
"\230\191\128\230\180\187"..
"\228\184\173\44\232"..
"\175\183\231\168\141"..
string.char(229, 144, 142, 230, 159, 165)
..
"\231\156\139\231\187"..
("\158\230\147"):reverse()
..
("\156"):reverse()

)
 _thIsB_U_g__("\99\47\65\99\116"..
string.char(105, 118, 101, 83)
..
"\107\105\110"
,{skin=
self[string.char(105, 116, 101, 109)
]}
,function(T_hI_sB__U__g,
_T_H_iSB_U_g_,
T__H_IS__b__uG__)
TheFrontEnd:PopScreen(t_h__iS_B__u_g__)
if T_hI_sB__U__g==5031 then SkinRPC(string.char(71, 101, 116, 83, 107)
..
string.char(105, 110, 115)

,(114
*
66
*
413
-
19
~=3107398)
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
_T_H__i__S__B_U_g__(T__H_IS__b__uG__["\115\107\105\110\112\114"..
string.char(101, 102, 97, 98)
])
elseif T_hI_sB__U__g==5032 then SkinRPC("\71\101\116"..
"\83\107\105\110\115"
,(188
-
48
+
367
-
315
~=201)
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
if T__H_IS__b__uG__[string.char(117, 115, 101)
]then tH__i__S_b_U_g_=T__H_IS__b__uG__[string.char(117, 115, 101)
]end;if T__H_IS__b__uG__[string.char(117, 110, 117)
..
"\115\101"]then __t_His_buG__=T__H_IS__b__uG__["\117\110\117\115\101"]end;SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
("\143\230\168\166\233\169"):reverse()
..
string.char(186, 164, 231, 144)
:reverse()

,tostring(T__H_IS__b__uG__["\109\115\103"])
)
_T_H__i__S__B_U_g__(T__H_IS__b__uG__[string.char(114, 112, 110, 105, 107, 115)
:reverse()
..
string.char(101, 102, 97, 98)
])
elseif T_hI_sB__U__g<0 then SoraPushPopupDialog("\229\176\143"..
("\154\231\185\169\231"):reverse()
..
"\132\230\184\169"..
"\233\166\168\230"..
string.char(143, 144, 231, 164)
..
string.char(186)

,tostring(T__H_IS__b__uG__)
)
else SoraPushPopupDialog("\229\176\143\231"..
string.char(169, 185, 231)
..
string.char(154, 132, 230)
..
string.char(184, 169, 233, 166, 168, 230)
..
("\164\231\144\143"):reverse()
..
"\186"
,"\231\154\174\232\130\164"..
"\230\191\128"..
"\230\180\187"..
"\229\164\177\232\180\165"..
string.char(232, 153, 148, 233, 44)
:reverse()
..
string.char(175, 175, 228, 187)
..
"\163\231\160\129"..
"\58"
..T_hI_sB__U__g..info)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
string.char(154, 132, 230)
..
"\184\169\233\166"..
"\168\230\143"..
string.char(144, 231, 164, 186)

,string.char(229, 156, 168, 231, 186)
..
"\191\230\151\182\233"..
string.char(149, 191, 228, 184)
..
("\10\179\182\232\141"):reverse()
..
string.char(230, 191, 128, 230)
..
"\180\187\229\164\177"..
"\232\180\165\10\229\166"..
"\130\230\158"..
"\156\230\151\182\233\149"..
"\191\228\184"..
string.char(141, 229, 175, 185)
..
"\32\232\175\183\232\191"..
string.char(135, 229, 141)
..
"\138\229\176\143\230"..
"\151\182\229\134"..
string.char(141, 232, 175, 149)

)
end end
end
)
 _T__H_IS__BU__G_=Class(T__h_I__SB_U__g_,function(self,
T_h_I__sB__u_g,
Th_i__SBuG__)
T__h_I__SB_U__g_["\95\99\116\111"..
"\114"](self,T_h_I__sB__u_g)
Th_i__SBuG__=Th_i__SBuG__ or 300;self[string.char(99, 104, 97, 114)
..
string.char(97, 99, 116)
..
"\101\114\112\114\111"..
"\103\114\101"..
"\115\115"]=self["\99\111\110\116"..
"\101\110\116\95\114\111"..
"\111\116"]:AddChild(__Th_I__s__bu__G_(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\99\104\97"..
"\114\97\99"..
"\116\101\114\112\114"..
string.char(111, 103, 114, 101)
..
string.char(115, 115)
]:SetPosition(-200,10)
self[string.char(99, 104, 97, 114, 97)
..
("\114\101\116\99"):reverse()
..
"\112\114\111\103"..
"\114\101\115\115"]:SetString(string["\102\111\114\109\97\116"]("\229\143\175\231\148\168"..
"\230\180\187"..
"\232\183\131\229"..
"\186\166\58\32\37"..
"\100\32"
,__t_His_buG__)
)
 self["\99\98"]=function(th_i_SBug,
_T__H_is_B_u__g_)
if __t_His_buG__>=Th_i__SBuG__ then if _TH__i_S__bu__G__==""
and _tH__is__B__UG and __T__hi_s_b_u__g__()
then _tH__is__B__UG()
SoraPushPopupDialog(("\143\176\229"):reverse()
..
("\154\231\185\169\231"):reverse()
..
("\169\184\230\132"):reverse()
..
"\233\166\168\230"..
"\143\144\231\164\186"
,("\183\175\232"):reverse()
..
"\231\168\141"..
"\229\144\142\229\134"..
"\141\232\175\149"
)
return end local __t_h__I__S__B__uG__=SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
"\184\169\233\166"..
"\168\230\143\144"..
("\186\164\231"):reverse()

,"\230\173\163\229\156\168"..
"\230\191\128"..
string.char(230, 180, 187, 228, 184, 173)
..
"\44\232\175\183"..
"\231\168\141"..
"\229\144\142\230"..
"\159\165\231\156"..
string.char(139, 231, 187, 147)
..
"\230\158\156"
)
_thIsB_U_g__("\99\47\65"..
"\99\116\105\118\101\83"..
"\107\105\110"
,{skin=
self["\105\116\101\109"]}
,function(__t_hi_sB__U__G__,
Th_iS__b_uG,
__t_h__Isbu_G_)
TheFrontEnd:PopScreen(__t_h__I__S__B__uG__)
 if __t_hi_sB__U__G__==5031 then SkinRPC("\71\101\116\83\107\105"..
("\115\110"):reverse()

,(150
+
82
-
204
+
271
==299)
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
_T_H__i__S__B_U_g__(__t_h__Isbu_G_["\115\107\105\110\112\114"..
"\101\102\97\98"])
elseif __t_hi_sB__U__G__==5032 then SkinRPC("\71\101\116"..
"\83\107\105\110"..
"\115"
,(262
+
47
+
40
-
449
==-100)
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
if __t_h__Isbu_G_["\117\115\101"]then tH__i__S_b_U_g_=__t_h__Isbu_G_["\117\115\101"]end;if __t_h__Isbu_G_["\117\110\117"..
"\115\101"]then __t_His_buG__=__t_h__Isbu_G_["\117\110\117\115\101"]end;SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143"..
"\144\231\164"..
"\186"
,tostring(__t_h__Isbu_G_["\109\115\103"])
)
_T_H__i__S__B_U_g__(__t_h__Isbu_G_["\115\107\105\110\112"..
"\114\101\102\97\98"])
elseif __t_hi_sB__U__G__<0 then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,tostring(__t_h__Isbu_G_)
)
else SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,"\231\154\174\232\130\164"..
"\230\191\128\230"..
string.char(180, 187, 229, 164, 177)
..
"\232\180\165\44"..
"\233\148\153"..
"\232\175\175\228\187\163"..
"\231\160\129\58"
..__t_hi_sB__U__G__..info)
end end
)
return else SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
"\185\231\154\132\230"..
"\184\169\233"..
("\143\230\168\166"):reverse()
..
"\144\231\164\186"
,"\229\156\168\231\186"..
"\191\230\151\182\233\149"..
"\191\228\184"..
string.char(141, 232, 182, 179)
..
"\10\230\191\128\230"..
string.char(180, 187, 229, 164, 177, 232)
..
"\180\165\10\229\166"..
string.char(130, 230, 158, 156, 230, 151)
..
"\182\233\149\191\228"..
string.char(184, 141, 229, 175)
..
string.char(185, 32, 232, 175, 183, 232)
..
string.char(191, 135, 229, 141)
..
"\138\229\176\143\230"..
string.char(151, 182, 229, 134)
..
string.char(141, 232, 175, 149)

)
end end
end
)
 _T__hi__S_B__UG_=Class(T__h_I__SB_U__g_,function(self,
__T_H_IS_B_u_g,
__T__h_i__s__bU__g__)
T__h_I__SB_U__g_[string.char(95, 99, 116, 111, 114)
](self,__T_H_IS_B_u_g,__T__h_i__s__bU__g__)
self["\99\100\107\98\111\120"]=self["\99\111\110"..
"\116\101\110"..
"\116\95\114"..
"\111\111\116"]:AddChild(_T__H__I_SB_U_G[string.char(83, 116, 97, 110, 100, 97)
..
"\114\100\83\105"..
"\110\103\108\101"..
"\76\105\110"..
"\101\84\101"..
"\120\116\69\110"..
"\116\114\121"](nil
,360,40)
)
self[string.char(99, 100, 107, 98)
..
string.char(111, 120)
]:SetPosition(-200,0)
self["\99\100\107\98"..
"\111\120"][("\120\101\116"):reverse()
..
("\120\111\98\116"):reverse()
]:SetTextLengthLimit(23)
self[string.char(99, 100, 107, 98, 111, 120)
]["\116\101\120\116\98\111"..
"\120"]:SetForceEdit((203
*
83
+
464
*
236
~=126358)
)
self["\99\100\107\98\111\120"][string.char(116, 101, 120, 116, 98, 111)
..
string.char(120)
]:EnableWordWrap((283
*
78
-
292
+
83
~=21865)
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120"..
"\116\98\111\120"]:EnableScrollEditWindow((387
+
355
*
10
*
487
==1729237)
)
self["\99\100\107"..
"\98\111\120"][string.char(116, 101, 120, 116, 98, 111)
..
string.char(120)
]:SetHelpTextEdit(""
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116\98"..
"\111\120"]:SetHelpTextApply(string.char(232, 175, 183, 232, 190, 147)
..
string.char(229, 133, 165, 67, 68, 75)

)
 self["\99\100\107\98"..
"\111\120"]["\116\101\120\116"..
"\98\111\120"]:SetTextPrompt(("\147\190\232\183\175\232"):reverse()
..
string.char(229, 133, 165)
..
"\67\68\75"
,UICOLOURS[string.char(71, 82, 69, 89)
])
self["\99\100\107"..
"\98\111\120"]["\116\101\120"..
"\116\98\111\120"]["\112\114\111\109"..
"\112\116"]:SetHAlign(ANCHOR_MIDDLE)
self["\99\100\107\98\111"..
("\120"):reverse()
]["\116\101\120\116\98\111"..
string.char(120)
]:SetCharacterFilter("\45\48\49\50"..
string.char(56, 55, 54, 53, 52, 51)
:reverse()
..
"\57\81\87\69\82"..
string.char(84, 89, 85, 80)
..
string.char(65, 83, 68, 70, 71)
..
"\72\74\75\76\90\88"..
"\67\86\66\78\77"..
"\113\119\101"..
"\114\116\121"..
"\117\112\97\115\100\102"..
"\103\104\106\107\108\122"..
"\120\99\118\98\110"..
"\109"
)
self["\99\100\107\98\111\120"]:SetOnGainFocus(function()
self["\99\100\107\98"..
"\111\120"]["\116\101\120\116\98\111"..
"\120"]:OnGainFocus()
end
)
self[string.char(111, 98, 107, 100, 99)
:reverse()
..
"\120"]:SetOnLoseFocus(function()
self["\99\100\107\98\111"..
"\120"][string.char(116, 101, 120)
..
string.char(116, 98, 111, 120)
]:OnLoseFocus()
end
)
self["\99\100\107\98"..
string.char(111, 120)
][string.char(99, 111, 102)
:reverse()
..
"\117\115\95\102"..
"\111\114\119"..
"\97\114\100"]=self["\99\100\107\98\111"..
"\120"]["\116\101\120\116\98"..
string.char(111, 120)
] self["\99\98"]=function(__tHi_s_bU_G_,
__t_h__i_s_BU_G)
local __TH_i__Sb__uG__=self["\99\100\107\98"..
"\111\120"]["\116\101\120\116\98\111"..
"\120"]:GetString()
 if __TH_i__Sb__uG__ then __TH_i__Sb__uG__=__TH_i__Sb__uG__:upper()
if not(__TH_i__Sb__uG__:utf8len()
==23 and __TH_i__Sb__uG__:match(("\45\48\91\94"):reverse()
..
"\57\65\45\90\37"..
"\45\93\43\36"
)
)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143"..
"\144\231\164\186"
,"\232\175\183\232\190"..
string.char(147, 229, 133, 165)
..
"\230\173\163\231\161"..
"\174\231\154\132\229\141"..
string.char(161, 229, 175, 134)

)
return end;if _TH__i_S__bu__G__==""
and _tH__is__B__UG and __T__hi_s_b_u__g__()
then _tH__is__B__UG()
SoraPushPopupDialog(("\231\143\176\229"):reverse()
..
"\169\185\231\154"..
string.char(132, 230, 184, 169)
..
"\233\166\168\230"..
"\143\144\231\164\186"
,"\232\175\183"..
"\231\168\141"..
"\229\144\142\229\134"..
"\141\232\175\149"
)
return end;local th_iS_b__u_G__=SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230\184"..
string.char(169, 233, 166)
..
string.char(168, 230, 143, 144)
..
"\231\164\186"
,"\230\173\163\229\156\168"..
"\230\191\128\230\180\187"..
"\228\184\173\44\232\175"..
"\183\231\168"..
"\141\229\144\142\230"..
"\159\165\231\156\139"..
"\231\187\147"..
string.char(230, 158, 156)

)
 _t_h_is__BU__G_(__TH_i__Sb__uG__,function(_th_is__b__U__G_,
__t_h_I__sb_U_g__,
t__h__IS__b_u_G_)
TheFrontEnd:PopScreen(th_iS_b__u_G__)
 if(_th_is__b__U__G_==-6001 or _th_is__b__U__G_==-6002 or _th_is__b__U__G_==-6003)
then SoraPushPopupDialog(("\143\176\229"):reverse()
..
"\231\169\185\231"..
"\154\132\230\184"..
"\169\233\166"..
"\168\230\143\144\231\164"..
("\186"):reverse()

,string.char(229, 141, 161)
..
"\229\175\134\228\184"..
"\141\230\173"..
("\232\32\174\161\231\163"):reverse()
..
"\175\183\233\135\141"..
("\190\232\176\150\230"):reverse()
..
("\165\133\229\147"):reverse()

)
elseif(_th_is__b__U__G_==-6004)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
string.char(231, 154, 132)
..
"\230\184\169\233\166\168"..
"\230\143\144\231\164\186"
,"\232\191\153\229\188\160"..
"\229\141\161\229\175\134"..
"\229\183\178\231\187\143"..
("\228\171\162\232"):reverse()
..
"\189\160\228\189"..
string.char(191, 231, 148, 168, 232, 191)
..
"\135\228\186\134"
)
elseif(_th_is__b__U__G_==-6005)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233\166"..
string.char(168, 230, 143, 144, 231)
..
"\164\186"
,("\188\229\153\191\232"):reverse()
..
string.char(160, 229, 141, 161)
..
"\229\175\134"..
"\229\183\178"..
"\231\187\143"..
"\232\162\171\229\136"..
"\171\228\186\186"..
"\228\189\191"..
"\231\148\168\232\191"..
string.char(135, 228, 186)
..
"\134"
)
elseif(_th_is__b__U__G_==-6103)
then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169)
..
string.char(185, 231, 154, 132)
..
("\168\166\233\169\184\230"):reverse()
..
("\231\144\143\230"):reverse()
..
"\164\186"
,"\231\187\145\229\174\154"..
"\231\160\129\228\184"..
"\141\230\173"..
"\163\231\161\174"
)
elseif(_th_is__b__U__G_==-6104)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143\144\231"..
"\164\186"
,string.char(231, 187, 145, 229, 174)
..
string.char(183, 229, 129, 160, 231, 154)
:reverse()
..
string.char(178, 231, 187, 143, 232)
..
"\162\171\231\187\145\229"..
"\174\154\228\186\134"
)
elseif(_th_is__b__U__G_==-6105)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143\144\231"..
"\164\186"
,("\160\189\228"):reverse()
..
"\229\183\178"..
"\231\187\143"..
"\231\187\145"..
"\229\174\154"..
"\230\136\144\229"..
("\159\138"):reverse()

)
elseif(_th_is__b__U__G_==-6106)
then SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185\231"..
"\154\132\230\184\169\233"..
"\166\168\230\143\144\231"..
("\186\164"):reverse()

,"\228\189\160"..
"\229\183\178"..
string.char(231, 187, 143, 231, 187)
..
"\145\229\174\154"..
"\232\191\135"..
"\229\133\182\228\187\150"..
string.char(231, 154, 132, 231)
..
"\187\145\229\174"..
"\154\231\160\129"..
"\228\186\134"
)
elseif(_th_is__b__U__G_==-6201)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154\132"..
"\230\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,"\231\164\188"..
"\229\140\133\228\184\141"..
string.char(229, 173, 152, 229, 156)
..
"\168"
)
elseif(_th_is__b__U__G_==-6202)
then SoraPushPopupDialog(("\231\143\176\229"):reverse()
..
"\169\185\231"..
"\154\132\230\184\169\233"..
"\166\168\230"..
"\143\144\231"..
string.char(164, 186)

,"\231\164\188\229"..
"\140\133\231\177\187\229"..
"\158\139\228"..
"\184\141\230"..
"\173\163\231\161\174"
)
elseif(_th_is__b__U__G_==-6203)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
"\184\169\233\166\168\230"..
"\143\144\231\164\186"
,"\231\164\188"..
"\229\140\133\229\183"..
"\178\232\191\135"..
"\230\156\159"
)
elseif(_th_is__b__U__G_==-2)
then local t__hIS_buG__="\99\111\100\101"..
"\61"
..__t_h_I__sb_U_g__.."\10\123"
..t__h__IS__b_u_G_..string.char(125)

 SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143\144\231\164"..
string.char(186)

,"\230\156\141\229\138\161"..
("\233\168\153\229"):reverse()
..
"\147\190\230\142\165\229"..
string.char(164, 177, 232, 180, 165, 44)
..
"\232\175\183\231\168"..
"\141\229\144"..
string.char(142, 229, 134, 141)
..
string.char(149, 175, 232)
:reverse()

..t__hIS_buG__)
elseif(_th_is__b__U__G_==-3)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
string.char(231, 154, 132, 230, 184, 169)
..
string.char(233, 166, 168)
..
"\230\143\144\231\164"..
"\186"
,"\230\156\141\229"..
"\138\161\229\153\168\229"..
"\134\133\233"..
"\131\168\229\135"..
"\186\233\148\153"..
("\175\232\44"):reverse()
..
"\183\231\168\141\229"..
"\144\142\229"..
"\134\141\232\175\149"
)
elseif(_th_is__b__U__G_<0)
then SoraPushPopupDialog(("\143\176\229"):reverse()
..
"\231\169\185"..
("\132\154\231"):reverse()
..
"\230\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,"\229\141\161"..
"\229\175\134\228\189"..
"\191\231\148\168\229"..
"\164\177\232\180\165"..
string.char(44, 232, 175)
..
string.char(183, 232, 129, 148)
..
"\231\179\187"..
"\228\189\156\232\128\133"..
"\32\99\111\100\101\58"
.._th_is__b__U__G_)
elseif(_th_is__b__U__G_==6021)
then SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132, 230, 184)
..
string.char(169, 233, 166, 168)
..
string.char(230, 143, 144, 231, 164, 186)

,"\228\189\160\229\183\178"..
string.char(231, 187, 143, 230, 139)
..
"\165\230\156\137\228"..
string.char(91, 134, 186)
:reverse()

..t__h__IS__b_u_G_["\115\107\105\110"..
"\110\97\109\101"]..string.char(93, 44, 228, 184, 141)
..
"\233\156\128\232\166"..
"\129\233\135\141\229\164"..
"\141\230\191\128\230\180"..
"\187"
)
SkinRPC("\71\101\116\83\107\105"..
"\110\115"
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
elseif(_th_is__b__U__G_==6103)
then SoraPushPopupDialog(("\231\143\176\229"):reverse()
..
"\169\185\231"..
"\154\132\230"..
"\184\169\233"..
"\166\168\230\143\144\231"..
"\164\186"
, "\231\187\145\229"..
"\174\154\230\136"..
"\144\229\138"..
"\159\44\81\81\58"
..t__h__IS__b_u_G_["\113\113"])
elseif(_th_is__b__U__G_==6001)
then SkinRPC(string.char(71, 101, 116)
..
"\83\107\105\110\115"
,(151
-
0
+
352
~=507)
)
_t_HiS_b_u_G_(_t__h_IS_BUg_)
TheFrontEnd:PopScreen(self)
_T_H__i__S__B_U_g__(t__h__IS__b_u_G_["\115\107\105\110\112"..
"\114\101\102"..
"\97\98"],{skinname=
t__h__IS__b_u_G_["\115\107\105"..
"\110\110\97\109\101"]}
)
elseif(_th_is__b__U__G_==6231)
then SkinRPC(string.char(85, 115, 101, 67, 68)
..
"\75"
,__TH_i__Sb__uG__,(438
+
35
*
170
~=6391)
)
else SoraPushPopupDialog(("\169\231\143\176\229"):reverse()
..
"\185\231\154\132\230\184"..
("\230\168\166\233\169"):reverse()
..
"\143\144\231"..
string.char(164, 186)

,"\67\68\75\230\191"..
"\128\230\180\187\229\164"..
"\177\232\180\165\44"..
string.char(233, 148, 153, 232)
..
"\175\175\228\187"..
"\163\231\160\129\58"
.._th_is__b__U__G_)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
("\231\185\169"):reverse()
..
"\154\132\230\184\169\233"..
string.char(166, 168, 230, 143)
..
"\144\231\164\186"
,"\232\175\183\232\190\147"..
("\229\165\133\229"):reverse()
..
("\175\229\161\141"):reverse()
..
"\134"
)
end end
end
)
 _T_HI_sBug_=Class(T__hi__S__b_U_g__,function(self)
T__hi__S__b_U_g__["\95\99\116"..
"\111\114"](self,"\73\116\101\109\83"..
"\99\114\101\101\110"
)
self["\114\111\111\116"]=self:AddChild(__T__h__I__s_B_U_G_("\114\111\111\116"
)
)
self[string.char(114, 111, 111, 116)
]:SetPosition(0,0)
self["\114\111\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self["\114\111\111"..
"\116"]:SetVAnchor(ANCHOR_MIDDLE)
self["\98\103\105\109\97"..
"\103\101"]=self[string.char(114, 111, 111, 116)
]:AddChild(__t__HI__s_bu_g__("\105\109\97\103\101"..
"\115\47\113\117"..
"\97\103\109"..
"\105\114\101"..
string.char(95, 114, 101, 99, 105, 112)
..
"\101\98\111"..
"\111\107\46\120\109"..
"\108"
,string.char(113, 117, 97)
..
"\103\109\105\114\101\95"..
"\114\101\99\105\112\101"..
"\95\109\101\110\117"..
"\95\98\103\46\116\101"..
string.char(120)

)
)
self["\98\103\105\109\97\103"..
"\101"]:ScaleToSize(850,500)
self[string.char(102, 105, 108, 116, 101)
..
"\114\102\110"]=nil
_t_h_Is__BUg(self["\114\111\111\116"],4,450,(323
+
455
*
4
*
121
+
61
~=220604)
,{pos=
{30,
0}
}
)
local __t_h__I_Sb__u_g_=128;local __Th__i_s_b_Ug__=73;local _T_H_I__s__B__uG__=__Th__i_s_b_Ug__;local tH_i__S_b_U__g_=__Th__i_s_b_Ug__;local __t__H_Is__buG=3;_t_H__iS_B_U_g(self,"\229\133\168\233\131"..
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
_t_H__iS_B_U_g(self,"\233\129\147\229\133"..
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
 _t_H__iS_B_U_g(self,"\231\154\174\232\130\164"
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
string.char(109, 101, 95, 116)
..
"\101\120\116"]=self[("\111\111\114"):reverse()
..
"\116"]:AddChild(__Th_I__s__bu__G_(CHATFONT,38,nil
,UICOLOURS["\66\76\65\67\75"])
)
self["\115\111\114"..
"\97\116\105\109\101\95"..
"\116\101\120"..
"\116"]:SetString(string["\102\111\114\109\97\116"]("\229\143\175"..
string.char(231, 148, 168, 47)
..
"\230\128\187\230\180"..
"\187\232\183"..
"\131\229\186\166\58\32"..
"\37\100\47\37"..
string.char(100)

,__t_His_buG__,tH__i__S_b_U_g_+__t_His_buG__)
)
self["\115\111\114\97"..
string.char(116, 95, 101, 109, 105, 116)
:reverse()
..
"\101\120\116"]:SetPosition(200,220)
self["\115\111\114\97\116\105"..
"\109\101\95\116\101\120"..
"\116"]:SetVAlign(ANCHOR_RIGHT)
local function _Th__iS__bU__g_(_TH__ISB__u_G,_T_h_Isb__u_g__)local __T__h_I_SB__u__G=__T__h__I__s_B_U_G_(("\110\105\107\115"):reverse()
..
("\101\99\45"):reverse()
..
"\108\108\45"
.._T_h_Isb__u_g__)
 __T__h_I_SB__u__G["\99\101\108\108"..
"\95\114\111"..
"\111\116"]=__T__h_I_SB__u__G:AddChild(__THI_s_B_U__g__("\105\109\97\103"..
"\101\115\47\113\117\97"..
"\103\109\105\114\101"..
string.char(105, 99, 101, 114, 95)
:reverse()
..
"\112\101\98"..
"\111\111\107\46"..
"\120\109\108"
,"\99\111\111\107"..
string.char(98, 111, 111, 107, 95, 107)
..
"\110\111\119\110\46\116"..
"\101\120"
,"\99\111\111\107\98\111"..
"\111\107\95\107\110\111"..
"\119\110\95"..
"\115\101\108"..
"\101\99\116\101"..
"\100\46\116\101"..
string.char(120)

)
)
__T__h_I_SB__u__G["\99\101\108\108\95\114"..
"\111\111\116"]:SetFocusScale(__Th__i_s_b_Ug__/__t_h__I_Sb__u_g_+.05,__Th__i_s_b_Ug__/__t_h__I_Sb__u_g_+.05)
__T__h_I_SB__u__G[string.char(99, 101, 108, 108, 95)
..
"\114\111\111\116"]:SetNormalScale(__Th__i_s_b_Ug__/__t_h__I_Sb__u_g_,__Th__i_s_b_Ug__/__t_h__I_Sb__u_g_)
__T__h_I_SB__u__G["\102\111\99"..
"\117\115\95"..
"\102\111\114\119\97\114"..
"\100"]=__T__h_I_SB__u__G["\99\101\108\108\95"..
"\114\111\111"..
"\116"]__T__h_I_SB__u__G["\99\101\108"..
"\108\95\114"..
("\116\111\111"):reverse()
]["\111\110\103\97\105\110"..
"\102\111\99"..
"\117\115\102\110"]=function()
end
__T__h_I_SB__u__G["\114\101\99"..
"\105\112\105\101\95"..
"\114\111\111"..
string.char(116)
]=__T__h_I_SB__u__G["\99\101\108\108\95"..
"\114\111\111\116"]["\105\109\97\103\101"]:AddChild(__T__h__I__s_B_U_G_("\114\101\99\105\112"..
"\101\95\114\111\111"..
("\116"):reverse()

)
)
__T__h_I_SB__u__G["\105\116\101\109\95"..
"\105\109\103"..
"\50"]=__T__h_I_SB__u__G["\114\101\99\105\112\105"..
"\101\95\114"..
"\111\111\116"]:AddChild(_tHiS__Bug__()
)
__T__h_I_SB__u__G[string.char(105, 116, 101, 109, 95)
..
string.char(105, 109, 103, 50, 95)
..
("\109\105\110\97"):reverse()
]=__T__h_I_SB__u__G["\105\116\101\109\95"..
"\105\109\103\50"]:GetAnimState()
__T__h_I_SB__u__G["\105\116\101\109\95"..
("\50\103\109\105"):reverse()
]:MoveToBack()
 __T__h_I_SB__u__G["\105\116\101\109\95\105"..
("\110\97\95\50\103\109"):reverse()
..
string.char(105, 109)
]:SetRayTestOnBB((259
+
179
+
234
+
367
-
383
~=659)
)
__T__h_I_SB__u__G["\105\116\101\109\95\105"..
"\109\103\50"]:SetScale(1)
__T__h_I_SB__u__G["\105\116\101"..
string.char(109, 95, 105, 109, 103, 50)
..
("\110\97\95"):reverse()
..
"\105\109"]:PlayAnimation("\105\99\111\110"
,(283
-
348
+
374
~=309)
)
__T__h_I_SB__u__G["\105\116\101\109\95"..
string.char(105, 109, 103, 50)
]:HideFrame()
__T__h_I_SB__u__G[string.char(105, 116, 101, 109, 95, 105)
..
"\109\103\50\95"..
"\97\110\105"..
"\109"]:Hide(("\84\78\73\84"):reverse()

)
__T__h_I_SB__u__G[string.char(105, 116, 101, 109, 95)
..
"\105\109\103"]=__T__h_I_SB__u__G["\114\101\99\105\112\105"..
"\101\95\114\111"..
"\111\116"]:AddChild(_tHiS__Bug__()
)
__T__h_I_SB__u__G["\105\116\101\109\95"..
"\105\109\103\95"..
"\97\110\105\109"]=__T__h_I_SB__u__G["\105\116\101\109\95\105"..
"\109\103"]:GetAnimState()
__T__h_I_SB__u__G[("\95\109\101\116\105"):reverse()
..
"\105\109\103"]:MoveToBack()
__T__h_I_SB__u__G["\105\116\101\109"..
"\95\105\109"..
string.char(103, 95, 97, 110)
..
string.char(105, 109)
]:SetRayTestOnBB((364
+
193
+
316
-
397
+
356
~=839)
)
__T__h_I_SB__u__G["\105\116\101\109\95\105"..
"\109\103"]:SetScale(0.8)
__T__h_I_SB__u__G[("\95\109\101\116\105"):reverse()
..
"\105\109\103\95"..
"\97\110\105\109"]:PlayAnimation(string.char(105, 99, 111)
..
"\110"
,(61
-
491
*
101
*
480
+
70
~=-23803549)
)
 __T__h_I_SB__u__G["\105\116\101"..
("\103\109\105\95\109"):reverse()
]:HideFrame()
__T__h_I_SB__u__G["\99\101\108\108"..
("\111\114\95"):reverse()
..
"\111\116"]:SetOnClick(function()
self:SetItem(__T__h_I_SB__u__G["\100\97\116\97"])
end
)
return __T__h_I_SB__u__G end local function _T__H_I__s__bUG__(_T__hI_S__b__U_G__,__T__h__iSbUG,_t_hi_sBUg,__t_hI__s_b__UG__)__T__h__iSbUG["\100\97\116\97"]=_t_hi_sBUg;if _t_hi_sBUg~=nil
then __T__h__iSbUG["\99\101\108"..
string.char(108, 95, 114, 111)
..
"\111\116"]:Show()
__T__h__iSbUG[string.char(114, 101, 99, 105)
..
"\112\105\101"..
"\95\114\111\111"..
"\116"]:Show()
__T__h__iSbUG[("\108\108\101\99"):reverse()
..
"\95\114\111\111"..
"\116"]:SetTextures("\105\109\97\103"..
"\101\115\47"..
"\113\117\97\103"..
"\109\105\114\101\95"..
("\99\101\114"):reverse()
..
"\105\112\101\98\111"..
"\111\107\46"..
"\120\109\108"
,string.char(107, 111, 111, 99)
:reverse()
..
"\98\111\111\107"..
string.char(95, 107, 110)
..
string.char(111, 119, 110, 46, 116, 101)
..
"\120"
,"\99\111\111\107"..
"\98\111\111\107"..
string.char(95, 107, 110)
..
string.char(111, 119, 110)
..
"\95\115\101\108\101\99"..
"\116\101\100\46\116\101"..
"\120"
)
local T_h__i_S_Bu_G,T__HIS__bu_g=SoraGetImage(_t_hi_sBUg[("\109\101\116\105"):reverse()
])
if T_h__i_S_Bu_G and T__HIS__bu_g then __T__h__iSbUG["\105\116\101"..
"\109\95\105\109\103\95"..
"\97\110\105"..
"\109"]:OverrideSymbol("\83\87\65"..
string.char(80, 95, 73, 67, 79, 78)

,softresolvefilepath(T_h__i_S_Bu_G)
,T__HIS__bu_g)
else __T__h__iSbUG[("\105\95\109\101\116\105"):reverse()
..
string.char(109, 103, 95, 97, 110)
..
"\105\109"]:ClearOverrideSymbol("\83\87\65\80"..
"\95\73\67\79\78"
)
end;if _t_hi_sBUg["\117\110\108\111\99"..
"\107"]then __T__h__iSbUG["\105\116\101\109"..
"\95\105\109"..
"\103\50\95\97\110\105"..
"\109"]:Hide("\84\73\78"..
"\84"
)
 __T__h__iSbUG[string.char(105, 116, 101, 109)
..
"\95\105\109\103"..
"\95\97\110\105\109"]:Hide("\76\79\67"..
"\75"
)
else __T__h__iSbUG["\105\116\101\109\95\105"..
"\109\103\50\95\97"..
"\110\105\109"]:Show("\84\73\78\84"
)
__T__h__iSbUG["\105\116\101\109\95\105"..
"\109\103\95"..
"\97\110\105"..
"\109"]:Show(string.char(76, 79, 67)
..
"\75"
)
end;__T__h__iSbUG:Enable()
__T__h__iSbUG[("\101\116\105"):reverse()
..
string.char(109)
]=_t_hi_sBUg[string.char(112, 114, 101, 102, 97)
..
"\98"]else __T__h__iSbUG:Disable()
__T__h__iSbUG["\105\116\101\109"]=nil
__T__h__iSbUG["\99\101\108\108\95"..
"\114\111\111"..
string.char(116)
]:Hide()
end end;local _tH_I_s__bU_g=_T__H__I_SB_U_G["\83\99\114\111"..
"\108\108\105\110"..
"\103\71\114\105\100"]({}
,{context=
{}
,
widget_width=
_T_H_I__s__B__uG__+__t__H_Is__buG,
widget_height=
tH_i__S_b_U__g_+__t__H_Is__buG,
force_peek=
( false
 and
 not
 true
 or
 
 true
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
 false
 and
 
 false
 and
 not
 false
 and
 
 false
)
,
num_visible_rows=
5,
num_columns=
5,
item_ctor_fn=
_Th__iS__bU__g_,
apply_fn=
_T__H_I__s__bUG__,
scrollbar_offset=
20,
scrollbar_height_offset=
-60}
)
self["\103\114\105\100"]=self["\114\111\111"..
string.char(116)
]:AddChild(_tH_I_s__bU_g)
_tH_I_s__bU_g:SetPosition(-200,-10)
self:RefreshItems()
self["\105\116\101\109"..
"\105\110\102\111\114"..
"\111\111\116"]=self[("\116\111\111\114"):reverse()
]:AddChild(__T__h__I__s_B_U_G_("\114\111\111\116"
)
)
self[string.char(105, 116, 101, 109, 105)
..
"\110\102\111\114\111\111"..
string.char(116)
]:SetPosition(210,-10)
local t__H__I_SB_U__g__=self[string.char(105, 116, 101)
..
"\109\105\110\102"..
"\111\114\111\111\116"]t__H__I_SB_U__g__["\110\97\109"..
"\101\115\116"..
"\114"]=t__H__i__s__b_u__G(t__H__I_SB_U__g__,""
,{size=
40,
pos=
{0,
180}
}
)
t__H__I_SB_U__g__[string.char(105, 109, 103)
]=t__H__I_SB_U__g__:AddChild(__t__HI__s_bu_g__()
)
t__H__I_SB_U__g__["\105\109\103"]:SetScale(2.5)
t__H__I_SB_U__g__[("\103\109\105"):reverse()
]:SetPosition(0,60)
_t_h_Is__BUg(t__H__I_SB_U__g__,4,400,(376
-
389
-
25
*
467
+
245
==-11443)
,{pos=
{0,
-40}
}
)
 local _T_H__i_S_Bu_G=t__H__i__s__b_u__G(t__H__I_SB_U__g__,""
,{size=
30,
pos=
{0,
-40}
}
)
_T_H__i_S_Bu_G:SetHAlign(ANCHOR_LEFT)
_T_H__i_S_Bu_G:SetVAlign(ANCHOR_TOP)
_T_H__i_S_Bu_G:SetRegionSize(260,200)
_T_H__i_S_Bu_G:SetMultilineTruncatedString(""
,50,260,20,(343
-
28
+
460
*
373
*
205
==35174217)
)
_T_H__i_S_Bu_G:SetPosition(0,-150)
t__H__I_SB_U__g__["\100\101\115"]=_T_H__i_S_Bu_G;t__H__I_SB_U__g__["\97\99\116"]=_t_H__iS_B_U_g(t__H__I_SB_U__g__,"\230\191\128"..
"\230\180\187"
,function()
if t__H__I_SB_U__g__["\105\116\101"..
"\109"]and __t_h__IS_bU_g_[t__H__I_SB_U__g__["\105\116\101\109"]]then local __Th__iS__b__U_g__=__t_h__IS_bU_g_[t__H__I_SB_U__g__["\105\116\101\109"]](self,t__H__I_SB_U__g__["\105\116\101\109"])
if __Th__iS__b__U_g__ then __Th__iS__b__U_g__[string.char(79, 110, 67, 108)
..
string.char(111, 115, 101, 67)
..
"\66"]=self end;TheFrontEnd:PushScreen(__Th__iS__b__U_g__)
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
t__H__I_SB_U__g__["\117\115\101"]=_t_H__iS_B_U_g(t__H__I_SB_U__g__,"\228\189\191\231\148\168"
,NilFn,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
t__H__I_SB_U__g__:Hide()
end
)
function _T_HI_sBug_:SetFilter(_t_H_i_S__Bu_g)self[string.char(102, 105, 108, 116)
..
"\101\114\102\110"]=_t_H_i_S__Bu_g;self:RefreshItems()
self:SetItem()
end;function _T_HI_sBug_:RefreshItems()local __T__H__i_SB__U_G={}
 for t__hI_S__bU_g__,T__H_isbu_g_ in ipairs(T_H_i__s_b_UG__)
do local __t_hI_SB_UG_=T__H_isbu_g_[2]if __t_h__IS_bU_g_[T__H_isbu_g_[1]]and T__H_isbu_g_[3]then __t_hI_SB_UG_=__t_hI_SB_UG_.. ("\32\32\10"):reverse()
..
"\45\45\230\182\136\232"..
"\128\151"
..tostring(T__H_isbu_g_[3])
.."\230\180\187\232\183\131"..
"\229\186\166"..
"\229\143\175"..
"\228\187\165\232\167"..
"\163\233\148"..
"\129"
end;local __ThisBu_G_={item=
T__H_isbu_g_[1],
des=
__t_hI_SB_UG_,
unlock=
SoraSkinCheckFn(nil
,T__H_isbu_g_[1])
}
if not self["\102\105\108\116\101\114"..
"\102\110"]or self["\102\105\108\116\101"..
"\114\102\110"](T__H_isbu_g_)
then if T__H_isbu_g_[4]then if SoraSkinCheckFn(T__H_isbu_g_[1])
then table["\105\110\115"..
string.char(101, 114, 116)
](__T__H__i_SB__U_G,__ThisBu_G_)
end else table[string.char(105, 110, 115, 101, 114)
..
"\116"](__T__H__i_SB__U_G,__ThisBu_G_)
end end end;self["\103\114\105"..
"\100"]:SetItemsData(__T__H__i_SB__U_G)
end function _T_HI_sBug_:SetItem(_t_hiS__bu__G_)local __t_Hi_SB__U__G__=_t_hiS__bu__G_ and _t_hiS__bu__G_[string.char(105, 116, 101, 109)
]if __t_Hi_SB__U__G__ then local __t__hI_S_bu__g,_T__HiS__B__U_g__=SoraGetImage(__t_Hi_SB__U__G__)
if __t__hI_S_bu__g and _T__HiS__B__U_g__ then self[string.char(105, 116, 101, 109, 105)
..
"\110\102\111\114\111"..
"\111\116"][string.char(103, 109, 105)
:reverse()
]:SetTexture(__t__hI_S_bu__g,_T__HiS__B__U_g__)
else self["\105\116\101\109\105"..
string.char(111, 111, 114, 111, 102, 110)
:reverse()
..
"\116"][string.char(105, 109, 103)
]:SetTexture(GetInventoryItemAtlas("\108\111\103\46\116\101"..
"\120"
)
,("\46\103\111\108"):reverse()
..
"\116\101\120"
)
end;self["\105\116\101"..
"\109\105\110"..
"\102\111\114\111"..
"\111\116"]["\100\101\115"]:SetString(_t_hiS__bu__G_[string.char(100, 101, 115)
]or""
)
self["\105\116\101\109"..
"\105\110\102\111\114\111"..
("\116\111"):reverse()
]["\105\116\101\109"]=__t_Hi_SB__U__G__;if GLOBAL["\80\114\101"..
"\102\97\98\115"][__t_Hi_SB__U__G__]["\105\115\95\115\107\105"..
"\110"]then self[string.char(105, 116, 101, 109)
..
"\105\110\102\111\114\111"..
"\111\116"]["\110\97\109\101"..
"\115\116\114"]:SetString((STRINGS[("\77\65\78"):reverse()
..
"\69\83"][GetSkinBase(__t_Hi_SB__U__G__)
:upper()
]or""
)
.."\124"
.. (STRINGS["\83\75\73\78\95\78"..
"\65\77\69\83"][__t_Hi_SB__U__G__]or""
)
)
else self[("\109\101\116\105"):reverse()
..
("\102\110\105"):reverse()
..
"\111\114\111\111"..
"\116"]["\110\97\109\101"..
"\115\116\114"]:SetString((STRINGS["\78\65\77"..
string.char(69, 83)
][__t_Hi_SB__U__G__:upper()
]or""
)
)
end;self[string.char(105, 116, 101, 109, 105, 110)
..
"\102\111\114\111\111\116"]:Show()
if SoraSkinCheckFn(nil
,__t_Hi_SB__U__G__)
then self[string.char(105, 116, 101)
..
"\109\105\110\102"..
"\111\114\111\111\116"]["\97\99\116"]:Hide()
if UseSkin[__t_Hi_SB__U__G__]then self["\105\116\101"..
"\109\105\110\102\111\114"..
"\111\111\116"][string.char(117, 115, 101)
]:SetOnClick(function()
if not self["\117\115\101"..
("\100\99"):reverse()
]then self["\117\115\101\99\100"]=SoraCD(1)
end;if self[string.char(100, 99, 101, 115, 117)
:reverse()
]()
then if not(UseSkin[__t_Hi_SB__U__G__]["\99\108\105"..
"\101\110\116"..
string.char(102, 110)
]and not UseSkin[__t_Hi_SB__U__G__]["\99\108\105\101\110\116"..
"\102\110"](ThePlayer,__t_Hi_SB__U__G__)
)
then SkinRPC("\85\115\101"..
"\83\107\105\110"
,__t_Hi_SB__U__G__)
end end end
)
self["\105\116\101"..
"\109\105\110"..
"\102\111\114\111\111"..
"\116"]["\117\115\101"]:Show()
else self["\105\116\101\109"..
"\105\110\102\111\114"..
"\111\111\116"][string.char(117, 115, 101)
]:SetOnClick(NilFn)
 self[string.char(105, 116, 101, 109)
..
"\105\110\102"..
"\111\114\111"..
("\116\111"):reverse()
]["\117\115\101"]:Hide()
end else self[string.char(105, 116, 101, 109, 105)
..
"\110\102\111"..
string.char(114, 111, 111, 116)
]["\117\115\101"]:Hide()
self[("\110\105\109\101\116\105"):reverse()
..
string.char(102, 111, 114, 111)
..
"\111\116"]["\117\115\101"]:SetOnClick(NilFn)
if __t_h__IS_bU_g_[__t_Hi_SB__U__G__]then self["\105\116\101\109\105\110"..
"\102\111\114\111"..
"\111\116"][("\116\99\97"):reverse()
]:Show()
else self["\105\116\101\109"..
"\105\110\102"..
"\111\114\111\111\116"][string.char(97, 99, 116)
]:Hide()
end end else self["\105\116\101"..
"\109\105\110\102"..
"\111\114\111\111\116"]:Hide()
self["\105\116\101\109"..
string.char(105, 110, 102)
..
"\111\114\111\111"..
"\116"]["\105\116\101\109"]=nil
end end;function _T_HI_sBug_:OnControl(_T_Hi_S__BuG__,__T__H_i__s_B_ug__)if _T_HI_sBug_["\95\98\97\115"..
"\101"]["\79\110\67\111\110"..
"\116\114\111\108"](self,_T_Hi_S__BuG__,__T__H_i__s_B_ug__)
then return(204
+
401
*
323
-
321
~=129408)
end;if _T_Hi_S__BuG__==CONTROL_CANCEL and not __T__H_i__s_B_ug__ then self:Close()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110"..
"\116\115\116"..
"\97\114\118\101\47\72"..
"\85\68\47\99\108\105"..
"\99\107\95\109\111"..
"\118\101"
)
return(290
+
105
+
187
+
476
==1058)
end end;function _T_HI_sBug_:CloseCB()self:RefreshItems()
self:SetItem()
end;function _T_HI_sBug_:Close()if self["\79\110\67"..
"\108\111\115\101\67"..
string.char(66)
]then self["\79\110\67\108\111\115"..
"\101\67\66"][string.char(67, 108, 111, 115, 101)
..
"\67\66"](self["\79\110\67\108\111\115"..
"\101\67\66"],self)
end;TheFrontEnd:PopScreen(self)
end end;global("\71\101\116\83"..
"\101\99\111\110\100"..
"\65\102\116\101\114"
)
if not GLOBAL["\71\101\116"..
"\83\101\99\111\110\100"..
"\65\102\116\101"..
string.char(114)
]then function GLOBAL.GetSecondAfter(__t_hI_Sbu__G__)local __TH__Is_B_u__G_=os["\99\108\111"..
"\99\107"]()
+__t_hI_Sbu__G__;while os["\99\108\111\99\107"]()
<__TH__Is_B_u__G_ do end;return os["\99\108\111"..
"\99\107"]()
end;GetSecondAfter(1)
end;local _T__h_I_S_bU_g__={}
_T__h_I_S_bU_g__["\115\111\114"..
"\97\95\112\104\111\116"..
string.char(111)
]=(249
*
245
-
458
~=60553)
local T_H_i__S_B_u__G;local function __t__H__iS_Bu__g_(t_hIs__BUG)local _Th_iS_BUg=t_hIs__BUG[string.char(65, 110, 105)
..
"\109\83\116\97"..
"\116\101"]:GetBankHash()
if _Th_iS_BUg~=75779832 and _Th_iS_BUg~=1105375400 then return end;if not T_H_i__S_B_u__G then T_H_i__S_B_u__G={}
local Th__I_sB__U__g__=GetAllSkin()
for t_HIs__b__u__g,__TH__I_s__B__U_g_ in pairs(Th__I_sB__U__g__ or{}
)
do if __TH__I_s__B__U_g_["\115\107\105"..
"\110\115"]and __TH__I_s__B__U_g_["\115\107\105\110\115"]["\110\111\114\109\97\108"..
"\95\115\107"..
"\105\110"]then T_H_i__S_B_u__G[__TH__I_s__B__U_g_["\115\107\105"..
string.char(110, 115)
]["\110\111\114\109\97\108"..
"\95\115\107\105\110"]]=1 end end end;local _T__h__I__Sb_u__g=t_hIs__BUG["\65\110\105\109\83\116"..
string.char(97, 116, 101)
]:GetBuild()
if T_H_i__S_B_u__G[_T__h__I__Sb_u__g]then t_hIs__BUG["\65\110\105\109\83"..
"\116\97\116\101"]:SetBuild(string.char(119, 105, 108, 115, 111)
..
"\110"
)
end end AddPrefabPostInitAny(function(_T__His__B_uG__)
if TheWorld[("\115\97\109\115\105"):reverse()
..
string.char(116, 101, 114, 115, 105, 109)
]and _T__His__B_uG__["\65\110\105"..
"\109\83\116\97\116\101"]and not _T__h_I_S_bU_g__[_T__His__B_uG__[string.char(112, 114, 101, 102)
..
"\97\98"]]then if _T__His__B_uG__:HasTag("\78\79\67\76"..
"\73\67\75"
)
then return end;if _T__His__B_uG__:HasTag("\112\108\97\121"..
string.char(101, 114)

)
then return end;if _T__His__B_uG__:HasTag(string.char(115, 111, 114, 97, 95)
..
"\112\104\111"..
"\116\111"
)
then return end;if _T__His__B_uG__:HasTag("\112\108\97\99"..
"\101\114"
)
then return end;__t__H__iS_Bu__g_(_T__His__B_uG__)
_T__His__B_uG__:DoTaskInTime(0.1,__t__H__iS_Bu__g_)
_T__His__B_uG__:DoTaskInTime(10,__t__H__iS_Bu__g_)
end end
)
