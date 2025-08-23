--[[
授权级别:不授权
Copyright 2025 [FL]。
该文件仅限我自己使用 谢绝授权
]]-- 请勿破解本文件
local T__HIS__B_u_g={}
local t_hIs__b__uG__={}
local __tHi__s__BUg_={}
local tH__IS__B_u_g_={}
local _tH_i__SB__u_G_=SoraAPI["\106\115\111\110"]local T__H__iS_b_u__G_={}
local __T_H__i__S_b__Ug={}
local _T__h__I_Sb__UG__=TheNet:GetUserID()
local T__his_Bu_G=""
local t__h_i__S_b__u__G_;local _T_H_i__sb__U__G_={}
local function _th__I__sB__u__G_(Th__i__s_B__U__G)return string["\115\117\98"](Th__i__s_B__U__G,-5)
=="\95\110\111\110\101"
end;local __t__H__is_b__u_g__=(274
*
115
+
153
==31669)
function SoraSkinCheckFn(_T_HI__s__B__u__G_,__T__h__i__sbug__)if _T_HI__s__B__u__G_ and not __T__h__i__sbug__ then __T__h__i__sbug__=_T_HI__s__B__u__G_ end;__T__h__i__sbug__=GetSkinMap(__T__h__i__sbug__)
return _th__I__sB__u__G_(__T__h__i__sbug__)
or(t_hIs__b__uG__[__T__h__i__sbug__]or tH__IS__B_u_g_[__T__h__i__sbug__])
and(87
+
409
-
255
~=243)
or(439
+
165
-
364
~=240)
end;function SoraSkinCheckClientFn(_TH_I_S__B__u__G_,t_hIS_BU__G,__t_H__i__S__Bu_g__)__t_H__i__S__Bu_g__=GetSkinMap(__t_H__i__S__Bu_g__)
if t_hIS_BU__G and __t_H__i__S__Bu_g__ then local __TH__Is_b_Ug=GetSkin(__t_H__i__S__Bu_g__)
if not __TH__Is_b_Ug and not IsItem({__t_H__i__S__Bu_g__}
)
then return(23
+
8
+
53
-
434
+
180
~=-170)
end;if __TH__Is_b_Ug and __TH__Is_b_Ug["\105\115\99\104\97\114"..
("\101\116\99\97"):reverse()
..
"\114\115\107\105"..
"\110\115"]then if _T_H_i__sb__U__G_[t_hIS_BU__G]then return(42
+
363
*
421
~=152871)
end;if not T__H__iS_b_u__G_[t_hIS_BU__G]then return(263
*
303
+
110
-
132
==79667)
end end;if T__H__iS_b_u__G_[t_hIS_BU__G]then if T__HIS__B_u_g[t_hIS_BU__G]and T__HIS__B_u_g[t_hIS_BU__G][__t_H__i__S__Bu_g__]then return(27
+
248
*
288
+
288
==71739)
end;if __tHi__s__BUg_[t_hIS_BU__G]and __tHi__s__BUg_[t_hIS_BU__G][__t_H__i__S__Bu_g__]then return(297
-
148
+
217
~=375)
end end;return(261
+
202
-
474
~=-11)
end;return _th__I__sB__u__G_(__t_H__i__S__Bu_g__)
or(253
-
323
*
145
~=-46582)
end;UseSkin={}
function IsItem(__t__H__I_S_B_U_G)local __T__hI_s_B__U_g=__t__H__I_S_B_U_G[1]if UseSkin[__T__hI_s_B__U_g]then return(47
+
59
-
363
*
82
-
61
==-29721)
else return(470
-
228
+
16
*
419
*
453
~=3037154)
end end;function IsSkin(__tHIsB__u_G_)return not IsItem(__tHIsB__u_G_)
end;function RegUseSkinFN(_t__H_IS_b__u__G__,_T_hI_s_bu_G_,_t_hI_S__bU_G_)UseSkin[_t__H_IS_b__u__G__]={serverfn=
_T_hI_s_bu_G_,
clientfn=
_t_hI_S__bU_G_}
end;local _TH_i__sB_UG=string.char(97, 114, 111, 83)
:reverse()
..
"\83\107\105\110\67\97"..
"\99\104\101"
local _T_h__i_sb_u_G=_TH_i__sB_UG.."\95\115\101\114\118"..
("\114\101"):reverse()

 if TheNet:GetIsServer()
then TheSim:GetPersistentString(_T_h__i_sb_u_G,function(_t__h__I_S__bu_g_,
_T__h__i_S__b_uG__)
if _t__h__I_S__bu_g_ then local T__h_ISBUg__,tHi__S_b__uG_=pcall(_tH_i__SB__u_G_["\100\101\99"..
string.char(111, 100, 101)
],_T__h__i_S__b_uG__)
if T__h_ISBUg__ and tHi__S_b__uG_["\116\109\112"]and tHi__S_b__uG_["\111\119\110\101\114"]then for _T__H_I__S_b_ug_,_tHi_s_b__UG in pairs(tHi__S_b__uG_["\111\119\110\101\114"])
do if type(_tHi_s_b__UG)
== ("\108\98\97\116"):reverse()
..
"\101"
then T__HIS__B_u_g[_T__H_I__S_b_ug_]=_tHi_s_b__UG end end;for _t__H__I_s__B_u__g_,__t_H__Is_B_ug in pairs(tHi__S_b__uG_["\116\109\112"])
do if type(__t_H__Is_B_ug)
==string.char(116, 97, 98, 108, 101)

then __tHi__s__BUg_[_t__H__I_s__B_u__g_]=__t_H__Is_B_ug end end end end end
)
end;if not TheNet:IsDedicated()
then TheSim:GetPersistentString(_TH_i__sB_UG,function(__Th__i_s__bu_g_,
_t__h__i__s__B_UG__)
if __Th__i_s__bu_g_ then local __t__hI__sb__UG__,_t__h__i_S_Bu_g=pcall(_tH_i__SB__u_G_["\100\101\99\111\100"..
"\101"],_t__h__i__s__B_UG__)
if __t__hI__sb__UG__ and _t__h__i_S_Bu_g[("\112\109\116"):reverse()
]and _t__h__i_S_Bu_g[("\110\119\111"):reverse()
..
string.char(101, 114)
]then for _t_H__Is__b__u_g__,__T__hI_s__bU__g in pairs(_t__h__i_S_Bu_g["\111\119\110\101\114"])
do if type(_t_H__Is__b__u_g__)
=="\115\116\114\105\110\103"
and __T__hI_s__bU__g==1 then t_hIs__b__uG__[_t_H__Is__b__u_g__]=__T__hI_s__bU__g end end;for tHIsB_u_g__,_th__Is__b__u_g__ in pairs(_t__h__i_S_Bu_g["\116\109\112"])
do if type(tHIsB_u_g__)
==string.char(115, 116, 114)
..
"\105\110\103"
and _th__Is__b__u_g__==1 then tH__IS__B_u_g_[tHIsB_u_g__]=_th__Is__b__u_g__ end end end end end
)
end;function SaveSkinCache()if TheNet:GetIsServer()
then local t_H_iSB__u__g_,T_hI__s_bu__g=pcall(_tH_i__SB__u_G_["\101\110\99\111\100\101"],{owner=
T__HIS__B_u_g,
tmp=
__tHi__s__BUg_}
)
if t_H_iSB__u__g_ then TheSim:SetPersistentString(_T_h__i_sb_u_G,T_hI__s_bu__g,(320
*
338
-
423
*
406
*
231
~=-39563310)
)
end end;local t__h__IsB__Ug_,tH__i_s__b_UG__=pcall(_tH_i__SB__u_G_[string.char(101, 110, 99)
..
string.char(111, 100, 101)
],{owner=
t_hIs__b__uG__,
tmp=
tH__IS__B_u_g_}
)
if t__h__IsB__Ug_ then TheSim:SetPersistentString(_TH_i__sB_UG,tH__i_s__b_UG__,( false
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
 not
 false
 or
 
 true
 and
 
 false
 and
 
 false
 and
 
 false
)
)
end end;local __tH_I__s_bUg={sora_mysora=
1,
sora_mysora_r=
1,
sora_yhjd=
1,
sora_sby=
1}
RegUseSkinFN("\115\111\114"..
"\97\95\121"..
"\105\110\103\121\117"
,function(__t_Hi__SB_UG_,
__T_His__B_Ug__)
if __t_Hi__SB_UG_ and __t_Hi__SB_UG_["\99\111\109\112"..
"\111\110\101"..
"\110\116\115"][string.char(115, 111, 114, 97)
..
"\105\116\101\109\99"..
"\111\110\116\114"..
"\111\108"]then __t_Hi__SB_UG_[string.char(99, 111, 109, 112)
..
string.char(111, 110, 101)
..
"\110\116\115"]["\115\111\114\97"..
"\105\116\101"..
("\116\110\111\99\109"):reverse()
..
"\114\111\108"]:CreateItem(("\114\111\115"):reverse()
..
"\97\95\121\105\110\103"..
"\121\117"
)
end end
)
 RegUseSkinFN("\115\111\114"..
"\97\95\100"..
"\105\101\121\117"
,function(THIs_B_ug__,
_t__H_i__s_B_u__G)
if THIs_B_ug__ and THIs_B_ug__["\99\111\109"..
string.char(112, 111, 110, 101, 110)
..
string.char(116, 115)
][string.char(115, 111, 114, 97, 105)
..
"\116\101\109"..
"\99\111\110\116\114\111"..
string.char(108)
]then THIs_B_ug__["\99\111\109"..
"\112\111\110\101\110"..
("\115\116"):reverse()
]["\115\111\114"..
"\97\105\116"..
"\101\109\99\111"..
string.char(110, 116, 114, 111, 108)
]:CreateItem("\115\111\114\97\95"..
"\100\105\101"..
string.char(121, 117)

)
end end
)
RegUseSkinFN("\115\111\114\97\95\113"..
"\105\121\117"
,function(T__h__i_s_bUG_,
__t__h_iS__B_uG)
if T__h__i_s_bUG_ and T__h__i_s_bUG_[("\110\111\112\109\111\99"):reverse()
..
"\101\110\116"..
"\115"]["\115\111\114"..
string.char(97, 105, 116, 101)
..
"\109\99\111\110\116\114"..
"\111\108"]then T__h__i_s_bUG_["\99\111\109\112"..
"\111\110\101"..
string.char(110, 116, 115)
]["\115\111\114\97"..
"\105\116\101\109\99"..
"\111\110\116"..
("\108\111\114"):reverse()
]:CreateItem("\115\111\114"..
"\97\95\113\105\121\117"
)
end end
)
RegUseSkinFN("\115\111\114\97\95"..
"\108\121\106"
,function(Th_i_S__b__u_G__,
T__HI__S__b_U__g__)
 if Th_i_S__b__u_G__ and Th_i_S__b__u_G__["\99\111\109"..
"\112\111\110"..
("\116\110\101"):reverse()
..
"\115"]["\115\111\114"..
string.char(97, 105, 116, 101, 109, 99)
..
"\111\110\116\114\111\108"]then Th_i_S__b__u_G__["\99\111\109\112\111"..
("\115\116\110\101\110"):reverse()
]["\115\111\114\97"..
string.char(105, 116, 101, 109, 99)
..
"\111\110\116\114\111"..
string.char(108)
]:CreateItem("\115\111\114\97\95"..
"\108\121\106"
)
end end
)
 RegUseSkinFN("\115\111\114\97\95\108"..
"\97\110\116\101\114\110"
,function(_t_hIS__buG__,
_t_h__I__s__bUg)
if _t_hIS__buG__ and _t_hIS__buG__["\99\111\109\112"..
"\111\110\101\110\116"..
"\115"]["\115\111\114\97"..
string.char(105, 116, 101, 109, 99, 111)
..
"\110\116\114\111\108"]then _t_hIS__buG__[string.char(99, 111, 109, 112)
..
"\111\110\101"..
"\110\116\115"][string.char(115, 111, 114, 97)
..
("\99\109\101\116\105"):reverse()
..
"\111\110\116"..
string.char(114, 111, 108)
]:CreateItem("\115\111\114\97\95\108"..
"\97\110\116\101\114"..
"\110"
)
end end
)
RegUseSkinFN("\115\111\114\97"..
"\95\108\97\110\116\101"..
"\114\110\95\121"..
"\104"
,function(__T_hi_Sb_u__g__,
THI__sbU_g__)
if __T_hi_Sb_u__g__ and __T_hi_Sb_u__g__[string.char(99, 111, 109, 112)
..
"\111\110\101\110\116"..
string.char(115)
:reverse()
]["\115\111\114\97\105\116"..
"\101\109\99\111"..
"\110\116\114\111\108"]then __T_hi_Sb_u__g__["\99\111\109\112"..
"\111\110\101\110"..
string.char(116, 115)
][("\114\111\115"):reverse()
..
"\97\105\116\101"..
string.char(109, 99, 111, 110)
..
"\116\114\111\108"]:CreateItem("\115\111\114\97\95"..
"\108\97\110"..
"\116\101\114\110"
,"\115\111\114\97\95"..
"\108\97\110"..
"\116\101\114\110\95\121"..
("\104"):reverse()

)
end end
)
RegUseSkinFN("\115\111\114"..
"\97\95\114\105"..
string.char(110, 103)

,function(_th_ISbU_G__,
t__h_i__S_B__U__g_)
if _th_ISbU_G__ and _th_ISbU_G__[string.char(99, 111, 109, 112)
..
"\111\110\101"..
"\110\116\115"]["\115\111\114"..
"\97\105\116\101\109\99"..
"\111\110\116\114\111\108"]then _th_ISbU_G__[string.char(99, 111, 109)
..
"\112\111\110\101\110"..
"\116\115"]["\115\111\114\97\105\116"..
string.char(101, 109, 99, 111)
..
"\110\116\114\111\108"]:CreateItem(string.char(115, 111, 114, 97, 95)
..
"\114\105\110"..
"\103"
)
end end
)
 local function T_H__i__s_b__u__g(__t_H__i__s_B__U_G,t__hiSB_U_G_,__tH__i__S__BUG_)local TH_I_S__bu_G__={}
TH_I_S__bu_G__[("\101\116\111\117\113"):reverse()
..
"\115"]=string.char(230, 149, 162)
..
"\229\138\168\230\136"..
"\145\229\176\177\230"..
"\157\128\228\186"..
"\134\228\189\160\229"..
"\147\166"
TH_I_S__bu_G__[string.char(114, 97, 114, 105)
..
string.char(116, 121)
]=("\229\162\149\230"):reverse()
..
string.char(138, 168, 230, 136)
..
"\145\229\176"..
"\177\230\157\128\228\186"..
"\134\228\189\160"..
"\229\147\166"
TH_I_S__bu_G__["\114\97\114\105"..
"\116\121\99"..
"\111\114\108\111\114"]={255/255,
215/255,
0/255,
1}
TH_I_S__bu_G__["\114\97\114\105\116"..
"\121\111\114\100\101"..
"\114"]=100;TH_I_S__bu_G__["\114\101\108\101"..
"\97\115\101\95\103"..
"\114\111\117\112"]=-1006;TH_I_S__bu_G__[("\110\105\107\115"):reverse()
..
"\95\116\97\103\115"]={("\83\65\66"):reverse()
..
string.char(69)

,
("\97\114\111\115"):reverse()

,
"\67\72\65\82\65\67"..
"\84\69\82"
}
TH_I_S__bu_G__["\115\107\105\110\115"]={normal_skin=
__t_H__i__s_B__U_G,
ghost_skin=
"\103\104\111\115"..
"\116\95\115\111"..
string.char(114, 97, 95, 98, 117)
..
"\105\108\100"
}
TH_I_S__bu_G__[string.char(99, 104, 101)
..
"\99\107\102\110"]=SoraSkinCheckFn;TH_I_S__bu_G__[("\101\104\99"):reverse()
..
"\99\107\99"..
"\108\105\101\110\116\102"..
"\110"]=SoraSkinCheckClientFn TH_I_S__bu_G__["\115\104\97\114\101"..
"\95\98\105\103\112"..
"\111\114\116"..
"\114\97\105"..
"\116\95\110\97\109"..
"\101"]="\115\111\114\97"
TH_I_S__bu_G__["\70\114\97\109"..
"\101\83\121\109\98\111"..
"\108"]="\68\105\115\116\105\110"..
"\103\117\105\115\104\101"..
"\100"
for __T__h__i__S_b_u__g,__T_H__I_s__B__u_G_ in pairs(t__hiSB_U_G_)
do TH_I_S__bu_G__[__T__h__i__S_b_u__g]=__T_H__I_s__B__u_G_ end;if TH_I_S__bu_G__["\105\115\95\108\111"..
string.char(110, 103, 104, 97, 105)
..
"\114"]then TH_I_S__bu_G__["\115\107\105\110"..
"\115"][string.char(116, 115, 111, 104, 103)
:reverse()
..
string.char(95, 115, 107)
..
"\105\110"]="\103\104\111\115"..
"\116\95\115"..
string.char(111, 114, 97, 95, 114, 95)
..
string.char(98, 117, 105, 108, 100)

end;MakeCharacterSkin("\115\111\114\97"
,__t_H__i__s_B__U_G,TH_I_S__bu_G__)
if not __tH__i__S__BUG_ then local __T__h_I__S_Bu__g=shallowcopy(TH_I_S__bu_G__)
__T__h_I__S_Bu__g["\114\97\114\105"..
"\116\121"]=string.char(233, 153, 144, 230, 151, 182)
..
("\140\170\233\147\189\228"):reverse()

__T__h_I__S_Bu__g["\114\97\114\105"..
"\116\121\111\114\100\101"..
"\114"]=80;__T__h_I__S_Bu__g["\114\97\114\105"..
"\116\121\99\111"..
"\114\108\111"..
string.char(114)
]={0.957,
0.769,
0.188,
1}
__T__h_I__S_Bu__g["\70\114\97\109\101"..
string.char(83, 121, 109)
..
string.char(108, 111, 98)
:reverse()
]="\104\101\105\114\108"..
"\111\111\109"
__T__h_I__S_Bu__g["\110\97\109\101"]=t__hiSB_U_G_[string.char(101, 109, 97, 110)
:reverse()
].."\40\233\153\144\230\151"..
"\182\41"
SoraAPI[string.char(77, 97, 107, 101, 67)
..
"\104\97\114\97\99"..
"\116\101\114\83\107"..
("\110\105"):reverse()
]("\115\111\114\97"
,__t_H__i__s_B__U_G.."\95\116\109"..
"\112"
,__T__h_I__S_Bu__g)
end end;T_H__i__s_b__u__g("\115\111\114\97\95"..
"\109\121\115\111\114"..
string.char(97)

,{name=
"\232\138\177"..
"\229\171\129"
,
des=
"\230\137\167"..
"\229\173\144"..
"\228\185\139"..
"\230\137\139\44"..
("\229\142\184\228"):reverse()
..
"\173\144\229\129\149"..
"\232\128\129"
}
)
T_H__i__s_b__u__g("\115\111\114\97\95\109"..
"\121\115\111\114"..
"\97\95\114"
,{name=
("\129\171\229\177\138\232"):reverse()
..
"\45\233\149\191\229\143"..
"\145"
,
is_longhair=
(429
*
402
+
177
-
261
+
193
~=172572)
,
des=
"\230\137\167"..
"\229\173\144\228\185\139"..
string.char(139, 137, 230)
:reverse()
..
"\44\228\184\142"..
"\229\173\144\229\129"..
"\149\232\128"..
string.char(129)

}
)
 T_H__i__s_b__u__g(("\114\111\115"):reverse()
..
"\97\95\115\98"..
"\121"
,{name=
"\230\176\184\230"..
string.char(129, 146, 230, 176, 180, 229)
..
"\133\181\230\156"..
"\136"
,
des=
string.char(137, 156, 230, 170, 143, 229)
:reverse()
..
"\228\184\128\228\184\170"..
"\228\186\186\239"..
("\145\136\230\10\140\188"):reverse()
..
("\230\191\132\230"):reverse()
..
"\132\143\228\184\186\229"..
"\165\185\228\187\152\229"..
"\135\186\231\148\159\229"..
"\145\189"
,
init_fn=
function(_TH_I_Sb__uG)
if _TH_I_Sb__uG and TheWorld["\105\115\109\97\115\116"..
string.char(101, 114, 115)
..
"\105\109"]then _TH_I_Sb__uG["\115\111\114\97"..
"\102\111\111"..
string.char(116, 95, 102)
..
"\120"]=SpawnPrefab("\115\111\114\97\95"..
string.char(102, 111, 111, 116, 95)
..
string.char(95, 120, 102)
:reverse()
..
"\115\98\121"
)
_TH_I_Sb__uG[string.char(115, 111, 114)
..
"\97\102\111\111\116\95"..
"\102\120"]["\101\110\116"..
string.char(105, 116, 121)
]:SetParent(_TH_I_Sb__uG["\101\110\116\105\116"..
"\121"])
_TH_I_Sb__uG["\115\111\114\97"..
"\102\111\111\116\95"..
"\102\120"]["\111\119\110"..
"\101\114"]=_TH_I_Sb__uG _TH_I_Sb__uG[("\97\100\97\114\111\115"):reverse()
..
"\110\99\101\102\120"..
"\112\114\101\102"..
"\97\98"]=("\114\111\115"):reverse()
..
"\97\95\102\120\95\102"..
"\101\97\116\104\101\114"
end end
,
clear_fn=
function(T__H__I_SBUG)
if T__H__I_SBUG and T__H__I_SBUG["\115\111\114"..
"\97\102\111\111\116\95"..
string.char(102, 120)
]and TheWorld["\105\115\109\97"..
"\115\116\101\114\115\105"..
"\109"]then T__H__I_SBUG["\115\111\114\97"..
"\102\111\111\116\95\102"..
"\120"]:Remove()
T__H__I_SBUG[("\100\97\114\111\115"):reverse()
..
string.char(120, 102, 101, 99, 110, 97)
:reverse()
..
string.char(112, 114, 101, 102)
..
"\97\98"]=nil
end end
}
)
MakeSkinNameMap("\115\111\114"..
"\97\95\115\100"..
string.char(115, 122)

,"\115\111\114\97\95"..
"\115\100\115"..
string.char(122, 95, 114)

)
MakeSkinNameMap("\115\111\114"..
"\97\95\115"..
"\100\115\122"
,string.char(115, 111, 114, 97, 98)
..
string.char(97, 103, 95)
..
"\115\100"
)
MakeSkinNameMap("\115\111\114"..
"\97\95\119\115\113\121"
,"\115\111\114\97"..
"\98\97\103\95\119\115"..
"\113\121"
)
MakeSkinNameMap(string.char(111, 98, 97, 114, 111, 115)
:reverse()
..
"\119\107\110\111"..
"\116\95\108\100"
,"\115\111\114"..
"\97\112\97\99\107"..
"\101\114\95\108\100"
)
MakeSkinNameMap(("\97\114\111\115"):reverse()
..
"\98\111\119"..
"\107\110\111\116"..
"\95\108\100"
,"\115\111\114\97\51\112"..
"\97\99\107\101\114"..
"\95\108\100"
)
MakeSkinNameMap(("\97\114\111\115"):reverse()
..
"\98\111\119\107\110\111"..
"\116\95\115\98\121"
,"\115\111\114\97\112\97"..
"\99\107\101\114"..
"\95\115\98\121"
)
MakeSkinNameMap(string.char(115, 111, 114, 97, 98, 111)
..
string.char(119, 107, 110, 111, 116, 95)
..
string.char(115, 98, 121)

,"\115\111\114\97\51"..
string.char(112, 97, 99, 107)
..
string.char(101, 114, 95)
..
"\115\98\121"
)
MakeSkinNameMap("\115\111\114\97"..
string.char(98, 111, 119, 107, 110, 111)
..
"\116\95\100\119"
,string.char(112, 97, 114, 111, 115)
:reverse()
..
"\97\99\107\101"..
string.char(114, 95, 100, 119)

)
MakeSkinNameMap(("\98\97\114\111\115"):reverse()
..
("\116\111\110\107\119\111"):reverse()
..
"\95\100\119"
,string.char(115, 111, 114)
..
"\97\51\112\97\99"..
string.char(107, 101, 114, 95)
..
"\100\119"
)
 MakeSkinNameMap("\115\111\114"..
"\97\98\111\119\107"..
"\110\111\116"..
"\95\119\115\113"..
"\121"
,"\115\111\114\97\112"..
"\97\99\107\101\114\95"..
"\119\115\113\121"
)
MakeSkinNameMap("\115\111\114"..
"\97\98\111\119"..
"\107\110\111\116\95\119"..
("\121\113\115"):reverse()

,"\115\111\114\97\51"..
"\112\97\99\107"..
"\101\114\95\119"..
"\115\113\121"
)
MakeSkinNameMap("\115\111\114\97\98\111"..
"\119\107\110"..
("\100\95\116\111"):reverse()
..
"\119\95\116\109"..
string.char(112)

,"\115\111\114\97\112"..
("\114\101\107\99\97"):reverse()
..
"\95\100\119\95"..
"\116\109\112"
)
MakeSkinNameMap("\115\111\114\97"..
"\98\111\119\107\110"..
"\111\116\95\100\119"..
string.char(95, 116, 109)
..
"\112"
,"\115\111\114\97\51\112"..
"\97\99\107"..
"\101\114\95\100\119"..
("\112\109\116\95"):reverse()

)
MakeSkinNameMap("\115\111\114\97"..
"\95\115\100"..
"\115\122\95\116"..
"\109\112"
,string.char(115, 111, 114, 97, 95)
..
"\115\100\115\122\95"..
"\114\95\116\109\112"
)
MakeSkinNameMap("\115\111\114\97"..
("\115\100\115\95"):reverse()
..
"\122\95\116\109\112"
,"\115\111\114"..
"\97\98\97\103\95"..
string.char(115, 100, 95, 116)
..
"\109\112"
)
AddSimPostInit(function()
local _T__h_I_SB_U_G=ShouldDisplayItemInCollection GLOBAL["\83\104\111\117\108"..
string.char(115, 105, 68, 100)
:reverse()
..
"\112\108\97\121\73"..
"\116\101\109\73\110\67"..
"\111\108\108"..
"\101\99\116"..
"\105\111\110"]=function(_Thi__s_BU__G__,...
)
if(__tH_I__s_bUg[_Thi__s_BU__G__]or _Thi__s_BU__G__:match("\94\115\111\114"..
"\97\95\46\43"..
"\95\116\109\112"..
"\36"
)
)
and not SoraSkinCheckFn(TheInventory,_Thi__s_BU__G__)
then return(236
*
262
+
36
-
56
==61814)
end;return _T__h_I_SB_U_G(_Thi__s_BU__G__,...
)
end
end
)
local __t_h__I_S__B_UG_=require"screens/thankyoupopup" local function __t_hI__sb__ug(_TH_i_S_b_U_G__,_TH_i__SB__uG__)local __t_H__IsB__u_g=GetSkinMapByBase(_TH_i_S_b_U_G__)
local __T__h__I__S_B__uG__={}
for Th_Is__b_U__G__,_TH__I__s_b_u__g__ in pairs(__t_H__IsB__u_g)
do table["\105\110\115"..
"\101\114\116"](__T__h__I__S_B__uG__,{item=
Th_Is__b_U__G__,
item_id=
1,
gifttype=
string.char(83, 79, 82, 65, 83)
..
"\75\73\78"
}
)
end;local _T_hi_S_B__U_G=__t_h__I_S__B_UG_(__T__h__I__S_B__uG__)
if _TH_i__SB__uG__ then if _TH_i__SB__uG__[string.char(115, 107, 105)
..
"\110\110\97\109"..
"\101"]then local __thI__sbug__=_T_hi_S_B__U_G["\83\101\116\83\107"..
string.char(105, 110, 78)
..
"\97\109\101"]_T_hi_S_B__U_G["\83\101\116\83\107"..
string.char(105, 110, 78, 97, 109)
..
"\101"]=function(t_hi__S_Bu_g_,...
)
__thI__sbug__(t_hi__S_Bu_g_,...
)
_T_hi_S_B__U_G["\105\116\101"..
"\109\95\110\97\109"..
"\101"]:SetString(_TH_i__SB__uG__["\115\107\105\110\110"..
string.char(97, 109, 101)
])
end
end;if _TH_i_S_b_U_G__:match("\94\73\79\85"..
"\95"
)
then local _t_h_I__S__B_u_G__=_T_hi_S_B__U_G["\67\104\97\110"..
"\103\101\71"..
"\105\102\116"]_T_hi_S_B__U_G["\67\104\97\110\103"..
("\116\102\105\71\101"):reverse()
]=function(__t__hisb__U__g__,...
)
_t_h_I__S__B_u_G__(__t__hisb__U__g__,...
)
_T_hi_S_B__U_G["\115\112\97"..
"\119\110\95\112\111"..
string.char(114, 116, 97, 108)
]:GetAnimState()
:OverrideSkinSymbol(string.char(83, 87, 65, 80, 95, 73)
..
"\67\79\78"
,GetInventoryItemAtlas("\119\97\120"..
"\112\97\112"..
"\101\114\46\116\101"..
"\120"
)
,"\119\97\120\112\97\112"..
("\101\116\46\114\101"):reverse()
..
string.char(120)

)
end
local __T__H_i_s__bU_g_=_T_hi_S_B__U_G["\79\112\101\110\71\105"..
"\102\116"] _T_hi_S_B__U_G["\79\112\101"..
"\110\71\105\102"..
string.char(116)
]=function(th__I_sb__Ug,...
)
__T__H_i_s__bU_g_(th__I_sb__Ug,...
)
_T_hi_S_B__U_G[string.char(115, 112, 97, 119, 110, 95)
..
string.char(112, 111, 114, 116, 97)
..
string.char(108)
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95"..
"\73\67\79\78"
,GetInventoryItemAtlas("\119\97\120"..
"\112\97\112"..
"\101\114\46\116"..
"\101\120"
)
,"\119\97\120"..
"\112\97\112\101\114\46"..
"\116\101\120"
)
end
_T_hi_S_B__U_G["\116\105\116\108"..
("\101"):reverse()
]:SetString("\230\172\160\230\157\161"..
"\40\229\136\176\230"..
string.char(156, 159, 232, 135, 170, 229)
..
string.char(138, 168, 229, 133)
..
string.char(41, 162, 141, 230, 145)
:reverse()

)
end end;TheFrontEnd:PushScreen(_T_hi_S_B__U_G)
end;local __t__H_IsB__U__G="\104\116\116\112\58"..
"\47\47\115\107\105"..
"\110\46\102\108\97\112"..
string.char(47, 110, 99, 46, 105)
:reverse()
..
string.char(97, 112, 105, 47, 68)
..
"\115\116"
local __tH__IS__B__u_g=""
local _T__h__IS_b__U__G_=0;local function __t_hi__s_B__u_G()end;local Th__I__S_b__uG_=SoraCD(5,(107
+
43
-
327
-
125
==-302)
)
 local function _T_H__I_s_B__U_g(tH__i_S__b_u__g__,tH_i_sBug__,__t_h_I__sB__u__g)if not tH__i_S__b_u__g__ then return(28
+
95
-
109
-
353
*
302
==-106582)
end;tH_i_sBug__=tH_i_sBug__ or{}
tH_i_sBug__["\109\111\100"]=modname;tH_i_sBug__["\101\120\116"]=DATASKINEXT or{}
if DATASKINFN then DATASKINFN(tH_i_sBug__)
end;__t_h_I__sB__u__g=__t_h_I__sB__u__g or __t_hi__s_B__u_G;local t__HiS__BU_G_,T__H_I_S_BUg__=pcall(_tH_i__SB__u_G_["\101\110\99"..
string.char(111, 100, 101)
],tH_i_sBug__)
if t__HiS__BU_G_ then QueryServer(__t__H_IsB__U__G..tH__i_S__b_u__g__.."\63\116\111\107"..
"\101\110\61"
..__tH__IS__B__u_g,function(_t__h_I_sBUg_,
t__hI_sB__u_G_,
__T__hI__SBU_G)
 if t__hI_sB__u_G_ and __T__hI__SBU_G==200 then __t__H__is_b__u_g__=(142
+
274
*
66
*
456
~=8246451)
local __t_H__Is_BU__G__,__T__h__I__s__bu__G__=pcall(_tH_i__SB__u_G_["\100\101\99"..
string.char(111, 100, 101)
],_t__h_I_sBUg_)
if __t_H__Is_BU__G__ and type(__T__h__I__s__bu__G__)
=="\116\97\98\108\101"
then if __T__h__I__s__bu__G__["\99\111\100\101"]==401 and t__h_i__S_b__u__G_ and Th__I__S_b__uG_()
then t__h_i__S_b__u__G_()
end;__t_h_I__sB__u__g(__T__h__I__s__bu__G__[string.char(99, 111, 100, 101)
],__T__h__I__s__bu__G__["\109\115\103"],__T__h__I__s__bu__G__["\100\97\116\97"])
else __t_h_I__sB__u__g(-3,"\101\114\114\32\106\115"..
"\111\110"
,_t__h_I_sBUg_)
end else __t_h_I__sB__u__g(-2,__T__hI__SBU_G,_t__h_I_sBUg_)
end end
,string.char(80, 79, 83, 84)

,T__H_I_S_BUg__)
else __t_h_I__sB__u__g(-1,"\101\114\114\32\106\115"..
"\111\110"
)
end end local function _t__H_I__s_Bu_g(__th__i_s_B_U_G__)if not __th__i_s_B_U_G__ then return end;if not T__HIS__B_u_g[__th__i_s_B_U_G__]then T__HIS__B_u_g[__th__i_s_B_U_G__]={}
end;if not __tHi__s__BUg_[__th__i_s_B_U_G__]then __tHi__s__BUg_[__th__i_s_B_U_G__]={}
end;_T_H__I_s_B__U_g(string.char(115, 47, 71, 101, 116)
..
string.char(83, 107, 105, 110, 115)

,{kid=
__th__i_s_B_U_G__}
,function(th_I_S_b__UG__,
_T_h__I__s_B__u_g,
_T__HI_sb__u_G_)
 if th_I_S_b__UG__==2001 and _T__HI_sb__u_G_["\105\116\101"..
"\109\115"]then T__HIS__B_u_g[__th__i_s_B_U_G__]={}
for T__h_isB_u__G_,_t__H_i_S_b_U__G__ in pairs(_T__HI_sb__u_G_[("\101\116\105"):reverse()
..
"\109\115"])
do T__HIS__B_u_g[__th__i_s_B_U_G__][_t__H_i_S_b_U__G__]=1 end;if __th__i_s_B_U_G__==_T__h__I_Sb__UG__ then t_hIs__b__uG__={}
for _t__hiS__bu_G_,__TH__i_SB_U__g__ in pairs(_T__HI_sb__u_G_["\105\116\101\109\115"])
do t_hIs__b__uG__[__TH__i_SB_U__g__]=1 end end;if _T__HI_sb__u_G_["\116\101\109\112\115"]then __tHi__s__BUg_[__th__i_s_B_U_G__]={}
for __thi_Sb__u_g__,_t_h__Is_BUg_ in pairs(_T__HI_sb__u_G_[string.char(116, 101, 109, 112, 115)
])
do __tHi__s__BUg_[__th__i_s_B_U_G__][_t_h__Is_BUg_]=1 end;if __th__i_s_B_U_G__==_T__h__I_Sb__UG__ then tH__IS__B_u_g_={}
for __tH__IS_BU__G,tH__iS__b_UG_ in pairs(_T__HI_sb__u_G_["\116\101\109\112\115"])
do tH__IS__B_u_g_[tH__iS__b_UG_]=1 end end end;_T_H_i__sb__U__G_[__th__i_s_B_U_G__]=nil
T__H__iS_b_u__G_[__th__i_s_B_U_G__]=(329
*
166
+
401
+
84
~=55102)
SaveSkinCache()
end end
)
end;local __t_H_ISBu_g__=0;local __t__h__Is_B__u__G_=0;local __Th_isb__u_G=0;local T_H__iSBU__g__=nil
 local function Th__IsB__U__G(__T__H_IS_B_u_G_,_THi_s_B__U_g,__t__HI_s__bu__g__)_T_H__I_s_B__U_g("\99\47\76\111\103"..
string.char(105, 110)

,{kid=
__T__H_IS_B_u_G_,
netid=
_THi_s_B__U_g,
nick=
__t__HI_s__bu__g__}
,function(tH__I__sb__u_G__,
__t__H__i_S_bu__G_,
_t_h_is_B__U__g)
 if tH__I__sb__u_G__>1000 and _t_h_is_B__U__g and _t_h_is_B__U__g["\116\111\107\101"..
"\110"]then __tH__IS__B__u_g=_t_h_is_B__U__g[("\110\101\107\111\116"):reverse()
]_T__h__IS_b__U__G_=3600;if _t_h_is_B__U__g["\116\105\109\101"]then __t_H_ISBu_g__=_t_h_is_B__U__g["\116\105\109"..
string.char(101)
]if _t_h_is_B__U__g[("\101\115\117"):reverse()
]then __t__h__Is_B__u__G_=_t_h_is_B__U__g["\117\115\101"]end;if _t_h_is_B__U__g["\117\110\117\115\101"]then __Th_isb__u_G=_t_h_is_B__U__g["\117\110\117\115"..
"\101"]end end;T_H__iSBU__g__=nil
else __tH__IS__B__u_g=""
if _t_h_is_B__U__g and _t_h_is_B__U__g[("\111\114\114\101"):reverse()
..
"\114"]then T_H__iSBU__g__=_t_h_is_B__U__g["\101\114\114\111\114"]end;if tH__I__sb__u_G__==-1004 then T_H__iSBU__g__="\231\153\187\229\189\149"..
("\175\232\153\148\233"):reverse()
..
"\175\228\187"..
"\163\231\160\129"..
string.char(58, 45, 49, 48)
..
string.char(48, 52, 44, 232, 175)
..
"\183\228\189"..
"\191\231\148\168\229\156"..
"\168\231\186\191"..
("\161\168\230"):reverse()
..
"\229\188\143\230\184"..
"\184\231\142"..
"\169\228\184\128\230"..
string.char(172, 161)

end;print("\76\111\103\105\110"..
"\70\97\105"..
"\108\101\100"
,__t__H__i_S_bu__G_,type(_t_h_is_B__U__g)
=="\116\97\98\108"..
string.char(101)

and fastdump(_t_h_is_B__U__g)
or _t_h_is_B__U__g)
return(385
-
209
-
258
==-75)
end end
)
end;local function t_hiS_B__U_g_()_T_H__I_s_B__U_g("\99\47\111\110\108\105"..
"\110\101\47"
,{}
,function(_th__i__S_B_u_G,
__Th__i__S__B__U__g,
t_h__i_sB__U_g_)
if _th__i__S_B_u_G>3000 and t_h__i_sB__U_g_ and t_h__i_sB__U_g_[string.char(116, 105, 109)
..
string.char(101)
]then __t_H_ISBu_g__=t_h__i_sB__U_g_["\116\105\109\101"]if t_h__i_sB__U_g_["\117\115\101"]then __t__h__Is_B__u__G_=t_h__i_sB__U_g_["\117\115\101"]end;if t_h__i_sB__U_g_["\117\110\117\115"..
"\101"]then __Th_isb__u_G=t_h__i_sB__U_g_["\117\110\117"..
"\115\101"]end else return(49
*
35
*
218
*
110
-
104
~=41125596)
end end
)
end;local function __T__h__i_s_B_UG_(__T_HI_Sb_u_g_,__tH_i__SbuG__)_T_H__I_s_B__U_g("\99\47\85"..
string.char(115, 101, 67, 68, 75)

,{cdk=
__T_HI_Sb_u_g_}
,__tH_i__SbuG__)
end local function T__H_i__sb_U_g(T__H_i_s__B_u__g,Th_i_s__B__U__G,_t_H__i__S__BU__G)_T_H__I_s_B__U_g("\115\47\85\115\101\67"..
string.char(68, 75)

,{kid=
Th_i_s__B__U__G[string.char(117, 115, 101, 114, 105, 100)
],
cdk=
T__H_i_s__B_u__g}
,_t_H__i__S__BU__G)
end if not TheNet:IsDedicated()
then local __Thi_S_B_UG_=GetTime;local t__Hi_s__bu__G__=__Thi_S_B_UG_()
local function __T__H_i_S_bU_g()if ThePlayer and ThePlayer["\115\111\114"..
"\97\105\115"..
"\112\108\97"..
"\121\101\114"]and not ThePlayer["\115\111\114\97"..
"\105\115\112\108\97\121"..
"\101\114"]:value()
then return(220
-
22
+
480
==685)
end;local T__H__iS__B_ug__=__Thi_S_B_UG_()
return(T__H__iS__B_ug__-t__Hi_s__bu__G__)
<180 end;local function _T__h__isB__u_G(...)t__Hi_s__bu__G__=__Thi_S_B_UG_()
end;_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
 function t__h_i__S_b__u__G_()if __tH__IS__B__u_g~=""
then return end;if T_H__iSBU__g__ then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233\166\168\230"..
"\143\144\231\164\186"
,T_H__iSBU__g__)
end;local _t_Hi__sBUG=(388
-
383
*
384
==-146680)
for th__i_S_b_u_G__,t_His__b__U__G in pairs(TheNet:GetClientTable()
or{}
)
do if t_His__b__U__G and t_His__b__U__G["\117\115\101\114\105\100"]==_T__h__I_Sb__UG__ then T__his_Bu_G=t_His__b__U__G[string.char(116, 101, 110)
:reverse()
..
"\105\100"]_t_Hi__sBUG=(77
+
137
*
365
-
98
*
114
==38910)
end end;if T__his_Bu_G:find(string.char(82, 58)

)
then T__his_Bu_G="\82\85\95"
..T__his_Bu_G:sub(3,-1)
else T__his_Bu_G="\79\85\95"
..T__his_Bu_G end;if T__his_Bu_G~=""
then Th__IsB__U__G(_T__h__I_Sb__UG__,T__his_Bu_G,TheNet:GetLocalUserName()
)
end end;t__h_i__S_b__u__G_()
AddSimPostInit(function(_T__H__iS_b_U__g)
TheWorld:DoTaskInTime(2,t__h_i__S_b__u__G_)
TheWorld["\84\114\121\82"..
"\101\76\111\103\105\110"..
string.char(84, 105, 109, 101, 115)
]=0;TheWorld[string.char(84, 114, 121, 82, 101)
..
"\76\111\103\105\110"]=TheWorld:DoPeriodicTask(3,function()
TheWorld[string.char(84, 114, 121, 82, 101, 76)
..
"\111\103\105\110\84\105"..
"\109\101\115"]=TheWorld["\84\114\121"..
string.char(82, 101, 76, 111, 103, 105)
..
"\110\84\105\109\101"..
"\115"]+1;if TheWorld["\84\114\121\82\101"..
string.char(76, 111, 103, 105, 110, 84)
..
"\105\109\101\115"]<21 and __tH__IS__B__u_g==""
then t__h_i__S_b__u__G_()
else TheWorld["\84\114\121"..
"\82\101\76\111\103"..
"\105\110"]:Cancel()
end end
)
 TheWorld:DoPeriodicTask(300,function()
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
_T__h__IS_b__U__G_=_T__h__IS_b__U__G_-300;if _T__h__IS_b__U__G_<0 then Th__IsB__U__G(_T__h__I_Sb__UG__,T__his_Bu_G,TheNet:GetLocalUserName()
)
end;if ThePlayer and ThePlayer:HasTag("\115\111\114\97"
)
then if __T__H_i_S_bU_g()
then t_hiS_B__U_g_()
end end end
)
TheInput:AddMoveHandler(_T__h__isB__u_G)
end
)
end if TheNet:GetIsServer()
then AddPlayerPostInit(function(T__H__i_S__B__ug)
T__H__i_S__B__ug:DoTaskInTime(0,function()
_t__H_I__s_Bu_g(T__H__i_S__B__ug[string.char(117, 115, 101, 114, 105)
..
string.char(100)
:reverse()
])
_T_H_i__sb__U__G_[T__H__i_S__B__ug["\117\115\101\114\105"..
"\100"]]=1 end
)
T__H__i_S__B__ug:DoTaskInTime(10,function()
if _T_H_i__sb__U__G_[T__H__i_S__B__ug["\117\115\101\114\105"..
"\100"]]then _t__H_I__s_Bu_g(T__H__i_S__B__ug["\117\115\101\114\105\100"])
end end
)
T__H__i_S__B__ug:DoTaskInTime(20,function()
if _T_H_i__sb__U__G_[T__H__i_S__B__ug[string.char(117, 115, 101, 114, 105, 100)
]]then _t__H_I__s_Bu_g(T__H__i_S__B__ug["\117\115\101\114"..
"\105\100"])
end end
)
T__H__i_S__B__ug:DoTaskInTime(40,function()
_T_H_i__sb__U__G_[T__H__i_S__B__ug[string.char(117, 115, 101, 114, 105, 100)
]]=nil
end
)
end
)
local TH_I_s__B_u__g__={top=
nil
,
last=
nil
}
local function __T__H_iS_bU_g__(__T__h_I__s_b__U_g__,...)local T_hI__Sb__U__g={fn=
__T__h_I__s_b__U_g__,
args=
{...
}
,
next=
nil
}
if not TH_I_s__B_u__g__["\116\111\112"]then TH_I_s__B_u__g__["\116\111\112"]=T_hI__Sb__U__g end;if TH_I_s__B_u__g__["\108\97\115"..
"\116"]then TH_I_s__B_u__g__["\108\97\115"..
"\116"]["\110\101\120"..
"\116"]=T_hI__Sb__U__g end;TH_I_s__B_u__g__[string.char(108, 97, 115, 116)
]=T_hI__Sb__U__g end;local function _T_H__I_s__B__U__G__()local _Th__is_B__U__G=TH_I_s__B_u__g__["\116\111\112"]if _Th__is_B__U__G then _Th__is_B__U__G["\102\110"](unpack(_Th__is_B__U__G["\97\114\103\115"])
)
if _Th__is_B__U__G[string.char(110, 101, 120, 116)
]then TH_I_s__B_u__g__["\116\111\112"]=_Th__is_B__U__G["\110\101\120\116"]_Th__is_B__U__G["\110\101\120\116"]=nil
else TH_I_s__B_u__g__[string.char(112, 111, 116)
:reverse()
]=nil
end end end;AddSimPostInit(function(_T__h_i__sB_u_g__)
TheWorld:DoPeriodicTask(1,_T_H__I_s__B__U__G__)
TheWorld:DoPeriodicTask(600,function()
local __tH__IsbU__g_=TheNet:GetClientTable()
 if#__tH__IsbU__g_>10 then for t_hIsB__u_g__,__t_HI__sBu__G__ in pairs(AllPlayers)
do if __t_HI__sBu__G__["\117\115\101\114\105"..
"\100"]then __T__H_iS_bU_g__(_t__H_I__s_Bu_g,__t_HI__sBu__G__["\117\115\101"..
"\114\105\100"])
end end else for t__H__IS_b_Ug_,__TH_iS__BuG in pairs(__tH__IsbU__g_)
do __T__H_iS_bU_g__(_t__H_I__s_Bu_g,__TH_iS__BuG["\117\115\101\114"..
string.char(100, 105)
:reverse()
])
end end end
)
end
)
end local tHI_s__B_uG__={GetSkins=
function(T__h_i_S_B_uG_,
tH__i__S__B__uG__)
if not T__h_i_S_B_uG_["\115\111\114\97\103\101"..
"\116\115\107"..
string.char(105, 110, 99, 100)
]then T__h_i_S_B_uG_[string.char(115, 111, 114, 97, 103)
..
string.char(101, 116, 115, 107, 105, 110)
..
"\99\100"]=SoraCD(2,(249
*
16
-
42
~=3945)
)
end;if T__h_i_S_B_uG_[("\114\111\115"):reverse()
..
string.char(97, 103, 101, 116)
..
("\105\107\115"):reverse()
..
"\110\99\100"]()
or tH__i__S__B__uG__ then _t__H_I__s_Bu_g(T__h_i_S_B_uG_["\117\115\101\114\105\100"])
end end
,
UseCDK=
function(t__hI__s__b__Ug_,
T_h_i_s_B__U__G_,
T__h__I__S_b_u_G)
if not t__hI__s__b__Ug_[string.char(115, 111, 114, 97, 103)
..
"\101\116\115\107\105"..
"\110\99\100"]then t__hI__s__b__Ug_[("\103\97\114\111\115"):reverse()
..
"\101\116\115\107"..
"\105\110\99"..
"\100"]=SoraCD(2,(496
-
246
*
289
-
83
~=-70672)
)
end;if not t__hI__s__b__Ug_ and t__hI__s__b__Ug_:HasTag("\115\111\114\97"
)
then mes(t__hI__s__b__Ug_,"\229\143\170\230"..
"\156\137\231\169\185"..
"\229\166\185\229"..
"\143\175\228\187\165"..
"\230\191\128\230\180"..
"\187\232\191\153"..
"\228\184\170\67"..
"\68\75"
)
return end if t__hI__s__b__Ug_[("\114\111\115"):reverse()
..
string.char(97, 103, 101, 116, 115, 107)
..
"\105\110\99\100"]()
or T__h__I__S_b_u_G then if not(T_h_i_s_B__U__G_ and T_h_i_s_B__U__G_:utf8len()
==23)
then mes(t__hI__s__b__Ug_,"\67\68\75\228"..
"\184\141\230\173\163"..
string.char(231, 161, 174)

)
return end T__H_i__sb_U_g(T_h_i_s_B__U__G_,t__hI__s__b__Ug_,function(_t__HiSBU_G__,
_T_h_I__s_bU_G,
T__hIs__bU__g__)
 if(_t__HiSBU_G__==-6001 or _t__HiSBU_G__==-6002)
then mes(t__hI__s__b__Ug_,"\229\141\161\229"..
"\175\134\228\184\141"..
"\230\173\163\231\161\174"..
"\32\232\175\183\233"..
string.char(232, 176, 150, 230, 141, 135)
:reverse()
..
"\190\147\229\133\165"
)
elseif(_t__HiSBU_G__==-6003 or _t__HiSBU_G__==-6004)
then mes(t__hI__s__b__Ug_,"\231\142\169\229"..
"\174\182\73\68\228"..
("\231\163\173\230\141\184"):reverse()
..
"\161\174"
)
elseif(_t__HiSBU_G__==-6005)
then mes(t__hI__s__b__Ug_,string.char(228, 189, 160, 232)
..
"\190\147\229"..
"\133\165\231\154\132\231"..
"\187\145\229\174"..
"\154\231\160\129"
)
elseif(_t__HiSBU_G__==-6006)
then mes(t__hI__s__b__Ug_,"\229\141\161\229\175\134"..
string.char(228, 184, 141)
..
"\230\173\163\231"..
("\174\161"):reverse()

)
elseif(_t__HiSBU_G__==-6007)
then mes(t__hI__s__b__Ug_,"\228\189\160\229\183"..
"\178\231\187\143"..
"\230\191\128\230"..
"\180\187\232"..
"\191\135\232\191"..
string.char(153, 228, 184)
..
"\170\67\68"..
"\75\228\186\134"
)
elseif(_t__HiSBU_G__==-6008)
then mes(t__hI__s__b__Ug_,"\232\191\153\228"..
"\184\170\67\68\75\229"..
"\183\178\231"..
"\187\143\232\162\171\229"..
"\136\171\228\186\186"..
string.char(230, 191, 128, 230, 180)
..
"\187\228\186\134"
)
elseif(_t__HiSBU_G__==-6011)
then mes(t__hI__s__b__Ug_,"\67\68\75\231\177\187"..
"\229\158\139"..
"\228\184\141\230\173"..
"\163\231\161\174"
)
elseif(_t__HiSBU_G__==-6201)
then mes(t__hI__s__b__Ug_,"\231\164\188"..
"\229\140\133\228\184"..
"\141\229\173"..
"\152\229\156\168"
)
elseif(_t__HiSBU_G__==-6202)
then mes(t__hI__s__b__Ug_,"\231\164\188\229\140\133"..
("\229\187\177\231"):reverse()
..
"\158\139\228\184\141"..
"\230\173\163\231\161"..
"\174"
)
elseif(_t__HiSBU_G__==-6203)
then mes(t__hI__s__b__Ug_,"\231\164\188"..
("\229\133\140\229"):reverse()
..
"\183\178\232\191"..
"\135\230\156\159"
)
elseif(_t__HiSBU_G__==-6204)
then mes(t__hI__s__b__Ug_,("\178\183\229\160\189\228"):reverse()
..
("\143\187\231"):reverse()
..
"\233\162\134\229\143\150"..
"\232\191\135\232\191"..
string.char(153, 228, 184, 170, 231)
..
"\164\188\229"..
"\140\133\228\186\134"
)
elseif(_t__HiSBU_G__==-6299)
then mes(t__hI__s__b__Ug_,"\230\149\176\230"..
"\141\174\229\186\147\230"..
"\149\133\233\154"..
string.char(156)

)
elseif(_t__HiSBU_G__==-6298)
then mes(t__hI__s__b__Ug_,"\230\156\141\229\138"..
"\161\229\153\168"..
"\230\149\133\233\154\156"
)
elseif(_t__HiSBU_G__==-2)
then local _t__H__i_SB_U__g__="\99\111\100"..
"\101\61"
.._T_h_I__s_bU_G..string.char(10, 123)

..T__hIs__bU__g__.."\125"
mes(t__hI__s__b__Ug_,"\230\156\141"..
"\229\138\161\229"..
"\153\168\233\147"..
"\190\230\142\165\229\164"..
string.char(177, 232, 180)
..
string.char(165, 44, 232)
..
string.char(175, 183, 231)
..
("\144\229\141\168"):reverse()
..
"\142\229\134\141\232\175"..
"\149"
.._t__H__i_SB_U__g__)
elseif(_t__HiSBU_G__==-3)
then mes(t__hI__s__b__Ug_,"\230\156\141\229\138\161"..
"\229\153\168\229\134\133"..
("\186\135\229\168\131\233"):reverse()
..
"\233\148\153\44\232"..
"\175\183\231\168\141\229"..
"\144\142\229\134\141"..
"\232\175\149"
)
elseif(_t__HiSBU_G__<0)
then mes(t__hI__s__b__Ug_,"\229\141\161\229\175\134"..
("\231\191\189\228"):reverse()
..
"\148\168\229\164\177"..
("\165\180\232"):reverse()
..
"\44\232\175\183"..
"\232\129\148\231\179"..
"\187\228\189\156"..
"\232\128\133\32\99\111"..
"\100\101\58"
.._t__HiSBU_G__)
elseif(_t__HiSBU_G__==6231)
then if T__hIs__bU__g__["\116\121\112"..
"\101"]and T__hIs__bU__g__[("\112\121\116"):reverse()
..
string.char(101)
:reverse()
]:find(string.char(98, 97, 115, 101)
..
string.char(119, 111, 114, 108)
..
string.char(100)

)
then if t__hI__s__b__Ug_[string.char(99, 111, 109, 112, 111)
..
"\110\101\110\116\115"]["\115\111\114\97\103"..
("\98\111\108"):reverse()
..
"\97\108\115"..
"\97\118\101"]:Get(T__hIs__bU__g__["\110\97\109\101"])
then mes(t__hI__s__b__Ug_,string.char(228, 189, 160, 232)
..
"\191\153\228\184\170"..
"\230\161\163\229"..
string.char(183, 178, 231, 187)
..
"\143\233\162"..
"\134\229\143"..
string.char(150, 232, 191, 135, 232, 191)
..
string.char(153, 228, 184, 170, 231, 164)
..
"\188\229\140\133\228"..
"\186\134\33"
)
return end;local _T_H__I_SB__U_G=t__hI__s__b__Ug_["\117\115\101\114\105"..
"\100"]..string.char(124)

..T__hIs__bU__g__["\110\97\109"..
"\101"]if GLOBALDB:Get("\103\105\102\116\115\97"..
"\118\101"
,_T_H__I_SB__U_G)
then mes(t__hI__s__b__Ug_,"\228\189\160\232\191"..
"\153\228\184"..
("\183\229\163\161\230\170"):reverse()
..
"\178\231\187\143\233\162"..
("\191\232\150\143\229\134"):reverse()
..
string.char(135, 232, 191, 153, 228)
..
"\184\170\231\164\188\229"..
("\33\134\186\228\133\140"):reverse()
..
"\33\33"
)
return end t__hI__s__b__Ug_[string.char(99, 111, 109, 112, 111)
..
("\115\116\110\101\110"):reverse()
]["\115\111\114\97\103"..
("\115\108\97\98\111\108"):reverse()
..
"\97\118\101"]:Set(T__hIs__bU__g__["\110\97\109\101"],1)
GLOBALDB:Set("\103\105\102\116"..
"\115\97\118\101"
,_T_H__I_SB__U_G,1)
end if T__hIs__bU__g__[("\98\97\102\101\114\112"):reverse()
]then local t__h__I__s__Bug_,_t__HIS__B__U__G_=pcall(_tH_i__SB__u_G_["\100\101\99\111\100"..
string.char(101)
],T__hIs__bU__g__[string.char(112, 114, 101, 102)
..
"\97\98"])
local _T__hIs_b_uG={}
if t__h__I__s__Bug_ then _T__hIs_b_uG["\115\117\112\101"..
"\114"]=_t__HIS__B__U__G_[("\114\101\112\117\115"):reverse()
]and{}
or nil
_t__HIS__B__U__G_["\115\117\112"..
"\101\114"]=nil
_T__hIs_b_uG[string.char(111, 112, 101, 110)
]=_t__HIS__B__U__G_[("\101\112\111"):reverse()
..
string.char(110)
]_t__HIS__B__U__G_["\111\112\101\110"]=nil
_T__hIs_b_uG["\110\97\109"..
"\101"]=("\133\140\229\188\164\231"):reverse()
..
string.char(58)

.. (T__hIs__bU__g__["\110\97\109\101"]or"\230\156\170\231"..
string.char(159, 165)

)
 _T__hIs_b_uG["\100\101\115"]="\231\164\188"..
"\229\140\133\58"
.. (T__hIs__bU__g__["\110\97\109\101"]or"\230\156\170\231\159"..
"\165"
)
.. ("\229\133\134\229\10\13"):reverse()
..
"\144\171\58"
.. (T__hIs__bU__g__["\105\116\101\109"]or"\230\156\170\231\159"..
"\165"
)
_T__hIs_b_uG["\99\100\107"]=T_h_i_s_B__U__G_;local T__h__IS_B__U__g_=SoraAPI["\71\105\102"..
"\116"](_t__HIS__B__U__G_,_T__hIs_b_uG,t__hI__s__b__Ug_)
t__hI__s__b__Ug_["\99\111\109\112\111"..
"\110\101\110\116"..
"\115"]["\105\110\118\101"..
"\110\116\111\114\121"]:GiveItem(T__h__IS_B__U__g_,nil
,t__hI__s__b__Ug_:GetPosition()
)
if _T__hIs_b_uG["\111\112\101"..
("\110"):reverse()
]then T__h__IS_B__U__g_[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116\115"][("\97\114\119\110\117"):reverse()
..
"\112\112\97\98\108\101"]:Unwrap(t__hI__s__b__Ug_)
end else mes(t__hI__s__b__Ug_,"\231\164\188\231\137"..
"\169\232\167\163\230"..
"\158\144\229\164\177\232"..
"\180\165\58"
..tostring(_t__HIS__B__U__G_)
.."\13\10"
..tostring(T__hIs__bU__g__["\112\114\101\102\97"..
"\98"])
)
return end end;mes(t__hI__s__b__Ug_,"\231\164\188\229"..
"\140\133\91"
.. (T__hIs__bU__g__[string.char(110, 97, 109, 101)
]or"\230\156\170\231\159\165"
)
.."\93\233\162\134\229\143"..
"\150\230\136\144\229\138"..
"\159\44\229\140"..
"\133\229\144\171\58\10"..
"\10"
.. (T__hIs__bU__g__["\105\116\101"..
"\109"]or"\230\156\170\231"..
string.char(159, 165)

)
.."\10\10\229\183"..
"\178\229\143\145"..
"\233\128\129\229\136"..
"\176\228\189\160\231"..
"\154\132\232"..
"\131\140\229\140"..
string.char(133)

)
else mes(t__hI__s__b__Ug_,"\67\68\75"..
"\230\191\128\230\180\187"..
"\229\164\177\232\180\165"..
"\44\233\148\153"..
string.char(232, 175, 175, 228)
..
"\187\163\231"..
string.char(160, 129, 58)

.._t__HiSBU_G__)
end end
)
else mes(t__hI__s__b__Ug_,string.char(232, 175, 183, 231)
..
"\168\141\229\144\142"..
"\229\134\141\232\175\149"..
string.char(33)

)
return end end
,
UseSkin=
function(__t__h_i__s_b__UG_,
__T__hISB__u__g)
if not __T__hISB__u__g then return end;if not SoraSkinCheckClientFn(nil
,__t__h_i__s_b__UG_["\117\115\101\114"..
"\105\100"],__T__hISB__u__g)
then return mes(__t__h_i__s_b__UG_,"\228\189\160\232"..
("\230\152\191"):reverse()
..
string.char(178, 161, 230, 156, 137, 232)
..
"\191\153\228"..
string.char(184, 170, 231, 154)
..
"\174\232\130\164"
)
end;if not __t__h_i__s_b__UG_[string.char(85, 115, 101, 83, 107, 105)
..
string.char(110, 83, 67, 68)
]then __t__h_i__s_b__UG_["\85\115\101"..
string.char(83, 107, 105, 110, 83)
..
"\67\68"]=SoraCD(1)
end;if __t__h_i__s_b__UG_["\85\115\101\83"..
"\107\105\110\83"..
"\67\68"]()
and UseSkin[__T__hISB__u__g]and UseSkin[__T__hISB__u__g]["\115\101\114\118"..
"\101\114\102"..
"\110"]then UseSkin[__T__hISB__u__g]["\115\101\114\118\101\114"..
string.char(102, 110)
](__t__h_i__s_b__UG_,__T__hISB__u__g)
end end
,
Message=
function(_th_I__s__Bug_,
_t__H_i__sbu__g__)
if ThePlayer then SoraPushPopupDialog(("\143\176\229"):reverse()
..
"\231\169\185\231\154\132"..
"\230\184\169"..
"\233\166\168"..
string.char(231, 144, 143, 230)
:reverse()
..
"\164\186\58"
,_t__H_i__sbu__g__)
end end
}
AddModRPCHandler("\115\111\114"..
"\97"
,"\115\107\105\110"
,function(t__h_I__S_b_U_G__,
_T__Hisb_Ug__,...
)
if type(_T__Hisb_Ug__)
=="\115\116\114"..
string.char(105, 110, 103)

and tHI_s__B_uG__[_T__Hisb_Ug__]then tHI_s__B_uG__[_T__Hisb_Ug__](t__h_I__S_b_U_G__,...
)
end end
)
AddClientModRPCHandler("\115\111\114\97"
,("\105\107\115"):reverse()
..
"\110"
,function(T__H__I_S_b_Ug_,...
)
if type(T__H__I_S_b_Ug_)
=="\115\116\114\105"..
"\110\103"
and tHI_s__B_uG__[T__H__I_S_b_Ug_]then tHI_s__B_uG__[T__H__I_S_b_Ug_](nil
,...
)
end end
)
function SkinRPC(_TH__I_S_bUG__,...)if type(_TH__I_S_bUG__)
==string.char(115, 116, 114)
..
"\105\110\103"
and tHI_s__B_uG__[_TH__I_S_bUG__]then if TheNet:GetIsServer()
then if ThePlayer then tHI_s__B_uG__[_TH__I_S_bUG__](ThePlayer,...
)
end else SendModRPCToServer(MOD_RPC["\115\111\114\97"]["\115\107\105\110"],_TH__I_S_bUG__,...
)
end end end;function SkinReply(tH_iSb_u__G__,__tH__i__S_BU__G,...)if type(tH_iSb_u__G__)
=="\115\116\114\105"..
"\110\103"
and tHI_s__B_uG__[tH_iSb_u__G__]then SendModRPCToClient(MOD_RPC["\115\111\114\97"]["\115\107\105"..
string.char(110)
],type(__tH__i__S_BU__G)
== "\116\97\98\108"..
"\101"
and __tH__i__S_BU__G["\117\115\101\114\105"..
"\100"]or __tH__i__S_BU__G,tH_iSb_u__G__,...
)
end end;function mes(t_H__i__S_B__UG__,_T__H_i__s_b_U_g)SkinReply("\77\101\115\115\97\103"..
"\101"
,t_H__i__S_B__UG__,_T__H_i__s_b_U_g)
end;local _t_h_i_sb_u__G__={}
local function _T_h_I__s__Bu_G(__thISb__UG_,thi_Sb_UG__)if not thi_Sb_UG__ then return(315
*
99
+
190
~=31375)
end;if not table["\99\111\110\116\97\105"..
"\110\115"](PREFAB_SKINS["\115\111\114"..
string.char(97)
:reverse()
],thi_Sb_UG__)
then return(432
+
71
-
169
-
283
+
291
==347)
end;if not __thISb__UG_:HasTag("\115\111\114\97"
)
then return(295
+
48
*
15
==1015)
end;if TheWorld["\105\115\109\97\115"..
"\116\101\114\115\105"..
"\109"]then if not __thISb__UG_["\117\115\101\114"..
"\105\100"]or not T__H__iS_b_u__G_[__thISb__UG_[string.char(117, 115, 101)
..
("\100\105\114"):reverse()
]]then return(282
+
298
-
305
+
319
-
227
~=367)
end;thi_Sb_UG__=GetSkinMap(thi_Sb_UG__)
if not(T__HIS__B_u_g[__thISb__UG_["\117\115\101\114\105\100"]][thi_Sb_UG__]or T__HIS__B_u_g[__thISb__UG_[("\101\115\117"):reverse()
..
string.char(114, 105, 100)
]][thi_Sb_UG__.."\95\116\109"..
"\112"
])
then return(254
-
106
-
257
-
146
==-255)
end else thi_Sb_UG__=GetSkinMap(thi_Sb_UG__)
if not(t_hIs__b__uG__[thi_Sb_UG__]or tH__IS__B_u_g_[thi_Sb_UG__])
then return(287
+
120
+
60
==467)
end end;return(291
-
344
*
200
==-68505)
end;local function __T_H_is__B__U__G__(__t_H__i_SB__u__G_,T__h__I_S_Bu__G,__T__H__isbu_G_)return _T_h_I__s__Bu_G(__t_H__i_SB__u__G_,__T__H__isbu_G_)
end;_t_h_i_sb_u__G__["\83\101\116\66\117\105"..
"\108\100"]=userdata["\77\97\107\101"..
string.char(72, 111, 111, 107)
]("\65\110\105\109\83\116"..
"\97\116\101"
,("\66\116\101\83"):reverse()
..
"\117\105\108\100"
,_T_h_I__s__Bu_G)
_t_h_i_sb_u__G__["\83\101\116"..
("\105\107\83"):reverse()
..
"\110"]=userdata["\77\97\107\101\72"..
"\111\111\107"]("\65\110\105\109\83"..
("\116\97\116"):reverse()
..
"\101"
,"\83\101\116"..
string.char(83, 107, 105, 110)

,_T_h_I__s__Bu_G)
 _t_h_i_sb_u__G__["\65\100\100\79"..
string.char(118, 101, 114, 114, 105, 100)
..
"\101\66\117"..
"\105\108\100"]=userdata["\77\97\107"..
"\101\72\111"..
string.char(111, 107)
]("\65\110\105\109\83"..
"\116\97\116\101"
,("\101\118\79\100\100\65"):reverse()
..
"\114\114\105\100"..
"\101\66\117\105"..
"\108\100"
,_T_h_I__s__Bu_G)
_t_h_i_sb_u__G__["\79\118\101\114\114"..
"\105\100\101\83\107\105"..
("\98\109\121\83\110"):reverse()
..
"\111\108"]=userdata["\77\97\107"..
"\101\72\111\111"..
string.char(107)
]("\65\110\105\109\83"..
"\116\97\116\101"
,"\79\118\101"..
"\114\114\105"..
"\100\101\83"..
"\107\105\110\83"..
"\121\109\98\111\108"
,__T_H_is__B__U__G__)
_t_h_i_sb_u__G__["\79\118\101\114"..
string.char(114, 105, 100, 101, 83, 121)
..
"\109\98\111\108"]=userdata["\77\97\107\101"..
"\72\111\111"..
"\107"]("\65\110\105"..
string.char(109, 83, 116, 97, 116)
..
"\101"
,"\79\118\101\114\114\105"..
"\100\101\83"..
("\108\111\98\109\121"):reverse()

,__T_H_is__B__U__G__)
AddPlayerPostInit(function(_Th__i_S_Bu__g_)
_Th__i_S_Bu__g_:DoTaskInTime(0.5,function()
for _T_HI__s__b_Ug,tH_i__s_b__u_g__ in pairs(_t_h_i_sb_u__G__)
do userdata["\72\111\111\107"](_Th__i_S_Bu__g_,tH_i__s_b__u_g__)
end end
)
end
)
STRINGS["\84\72\65\78\75\83"..
"\95\80\79\80\85"..
"\80"]["\83\79\82\65"..
string.char(83, 75, 73, 78)
]="\230\132\159\232"..
("\230\162\176"):reverse()
..
"\184\184\231\142\169"..
string.char(229, 176, 143, 231, 169, 185)

if not TheNet:IsDedicated()
then AddPrefabPostInit("\115\111\114\97"
,function(_tHiS__b__U__g__)
_tHiS__b__U__g__:DoTaskInTime(5,function()
if _tHiS__b__U__g__~=ThePlayer then return end;if not ThePlayer["\72\85\68"]then return end;if t_hIs__b__uG__["\115\111\114"..
("\114\100\95\97"):reverse()
..
"\101\115\115"
]then return end;if __tH__IS__B__u_g==""
then return end;_T_H__I_s_B__U_g("\99\47\65\99"..
"\116\105\118\101"..
"\83\107\105\110"
,{skin=
"\115\111\114\97\95\100"..
"\114\101\115\115"
}
,function(T_h__I__sBUg__,
__th_IS_b_U_g,
__t_H_IS_BUG)
if T_h__I__sBUg__==5011 then SkinRPC(string.char(71, 101, 116, 83)
..
"\107\105\110\115"
,(409
+
382
-
485
~=312)
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
__t_hI__sb__ug("\115\111\114\97\95"..
string.char(100, 114, 101, 115, 115)

)
end end
)
end
)
end
)
end if TheNet:GetIsServer()
then AddPrefabPostInit("\115\111\114"..
"\97"
,function(_tHi_S_BUG_)
local __T__H__i_S_B_U__g_=_tHi_S_BUG_[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116"..
("\115"):reverse()
]["\115\107\105"..
"\110\110\101"..
"\114"]["\115\107\105\110\95\110"..
"\97\109\101"]if __T__H__i_S_B_U__g_:find("\110\111\110\101"
)
and __T__H__i_S_B_U__g_~="\115\111\114"..
string.char(110, 111, 110, 95, 97)
:reverse()
..
"\101"
then _tHi_S_BUG_[string.char(99, 111, 109, 112, 111, 110)
..
"\101\110\116\115"][string.char(115, 107, 105)
..
"\110\110\101"..
("\114"):reverse()
]:SetSkin("\115\111\114\97\95\110"..
"\111\110\101"
)
end end
)
end if not TheNet:IsDedicated()
then local __th_I__sB__uG_;local __t__H__IS_Bu__G__;local T__H_IS__b_u_G__;local __t_h__I__S__b_ug_,_T_H__I_S__b_u__G_;local __T_H__I_s_Bu__G__;local _t_HIS_Bug=soraenv["\65\100\100"..
"\76\105\110"..
"\101"]local t_HIsbUg__=soraenv["\65\100\100\84\101\120"..
("\116"):reverse()
]local _t_H__i__sb__ug__=soraenv[("\116\117\66\100\100\65"):reverse()
..
string.char(116, 111, 110)
]local __T_HI__s__B__uG=soraenv["\65\100\100\73\109"..
"\103\66\117\116\116"..
"\111\110"]local __tHi__S_B_u__g__=soraenv[("\101\103\97\109\73"):reverse()
..
"\66\117\116\116\111\110"]local _th__I_s__B__u_g_={}
 local __ThI_s_bu_g_={sora_gete=
function(__T_H_I__s_Bu_G__,
__T_H_iS_b_u_G)
local t__H__isb_U__g__=__th_I__sB__uG_(__T_H_iS_b_u_G,300)
t__H__isb_U__g__["\117\110\108"..
"\111\99\107"..
"\116\101\120"..
string.char(116)
]:SetString("\229\156\168\231\186"..
("\142\231\184\184\230\191"):reverse()
..
"\169\53\48\229"..
string.char(176, 143, 230, 151, 182, 232)
..
"\167\163\233"..
string.char(148, 129)

)
return t__H__isb_U__g__ end
,
sora_amly2=
function(_t_h__I__SbU__g_,
_T__H_I_S_Bu_G)
local __t_H__i_sBu__g_=T__H_IS__b_u_G__(_T__H_I_S_Bu_G)
__t_H__i_sBu__g_["\117\110\108"..
"\111\99\107\116\101\120"..
"\116"]:SetString("\228\184\141\229\174"..
string.char(154, 230, 156, 159)
..
"\229\143\145\230\148\190"..
"\67\68\75"
)
return __t_H__i_sBu__g_ end
,
sora_amly=
function(T_hI_sbu__g__,
_TH__Is_bU__G__)
local TH_i_s_Bu_G__=__t__H__IS_Bu__G__(_TH__Is_bU__G__,600)
TH_i_s_Bu_G__["\117\110\108\111\99"..
"\107\116\101\120"..
"\116"]:SetString("\230\182\136\232\128\151"..
"\54\48\48"..
"\230\180\187"..
"\232\183\131\229"..
("\233\163\167\232\166\186"):reverse()
..
"\148\129\47"..
"\231\190\164\233\135"..
"\140\229\164\167\233"..
"\135\143\230\142"..
"\137\232\144\189"
)
return TH_i_s_Bu_G__ end
,
sora_sllh=
function(_t__H_i__sb__U_G__,
Th_I__s__B_u_G__)
 local __t__H_is__BUg__=__t__H__IS_Bu__G__(Th_I__s__B_u_G__,600)
__t__H_is__BUg__["\117\110\108"..
"\111\99\107\116\101"..
"\120\116"]:SetString("\230\182\136"..
"\232\128\151\54"..
"\48\48\230"..
"\180\187\232\183"..
"\131\229\186\166"..
"\232\167\163\233\148\129"
)
return __t__H_is__BUg__ end
,
sora_none=
function(t_H_iS__B_u_g__,
__t_H__iS__b_UG)
local tH__I_s_B__U__G__=T__H_IS__b_u_G__(__t_H__iS__b_UG)
tH__I_s_B__U__G__["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString(string.char(228, 187, 133, 231, 148)
..
"\168\228\186\142\232"..
string.char(229, 129, 148, 233, 163, 167)
:reverse()
..
"\133\182\228\187"..
string.char(150, 231, 154, 174)
..
"\232\130\164"
)
return tH__I_s_B__U__G__ end
,
sora_zhizheng=
function(__Th__I_S__b__u_g__,
__t__H__I_sb_u_G_)
local _TH__i__S_buG=T__H_IS__b_u_G__(__t__H__I_sb_u_G_)
_TH__i__S_buG["\117\110\108\111\99"..
"\107\116\101"..
string.char(120, 116)
]:SetString("\119\105\107\105"..
"\228\189\156"..
("\147\184\228\133\128\232"):reverse()
..
"\229\177\158"..
string.char(231, 154, 174, 232, 130, 164)

)
return _TH__i__S_buG end
,
sora_hf=
function(_t__Hi__S__b_u_G__,
T_h_I_S__b_ug_)
local _Thisb__u_g__=T__H_IS__b_u_G__(T_h_I_S__b_ug_)
 _Thisb__u_g__["\117\110\108\111\99\107"..
string.char(116, 101, 120, 116)
]:SetString("\81\81\231\190\164"..
"\40\51\55\50"..
("\53\48\55\48\53\52"):reverse()
..
"\41\229\134\133"..
"\231\187\145"..
"\229\174\154"..
"\229\144\142\44"..
"\230\184\184\230"..
"\136\143\230\151"..
"\182\233\149\191\43\231"..
"\190\164\232\129"..
string.char(138, 229, 164, 169)
..
"\230\149\176\62\49"..
"\53\48\229\143\175\228"..
("\229\183\142\232\165\187"):reverse()
..
"\143\150\32"
)
return _Thisb__u_g__ end
,
sora_shmm=
function(__T__H_i__s__B_u_G__,
__T__HIs__Bu__G)
local tH_i__s_b_U_G=T__H_IS__b_u_G__(__T__HIs__Bu__G)
tH_i__s_b_U_G["\117\110\108"..
"\111\99\107"..
"\116\101\120"..
("\116"):reverse()
]:SetString("\81\81\231"..
"\190\164\40\51\55\50"..
"\52\53\48\55\48"..
"\53\41\229\134\133\231"..
"\187\145\229\174"..
"\154\229\144\142"..
"\44\233\162\134\229"..
"\143\150\230\150\185"..
"\230\179\149\231\156"..
"\139\231\190"..
string.char(164, 229, 133)
..
"\172\229\145"..
"\138"
)
return tH_i__s_b_U_G end
}
function AddItemSkin(__tH_iS_b__U_G,__TH_i__SB__U_g,t_h_i_S_bU__g_,T__h__i__S_b_U__g__)local th__i_sbu_g__=t_h_i_S_bU__g_ or 300;local _t__hi_S_B_u_G__={__tH_iS_b__U_G,
__TH_i__SB__U_g,
th__i_sbu_g__,
T__h__i__S_b_U__g__ or(88
+
447
*
177
+
165
+
33
~=79405)
}
table["\105\110\115"..
"\101\114\116"](_th__I_s__B__u_g_,_t__hi_S_B_u_G__)
if t_h_i_S_bU__g_ and not __ThI_s_bu_g_[__tH_iS_b__U_G]then __ThI_s_bu_g_[__tH_iS_b__U_G]=function(Thi__S__b_u_g,
__tH_iS_b__U_G)
local T_HiS__Bu_g__=__t__H__IS_Bu__G__(__tH_iS_b__U_G,th__i_sbu_g__)
T_HiS__Bu_g__[("\111\108\110\117"):reverse()
..
"\99\107\116"..
"\101\120\116"]:SetString("\230\182\136\232\128\151"
..tostring(th__i_sbu_g__)
.. ("\232\187\180\230"):reverse()
..
"\183\131\229\186"..
string.char(166, 232, 167, 163)
..
"\233\148\129"
)
return T_HiS__Bu_g__ end
end;return _t__hi_S_B_u_G__ end AddItemSkin("\115\111\114\97\95"..
string.char(121, 105, 110, 103)
..
"\121\117"
,"\232\183\159\230"..
"\136\145\228"..
"\184\128\232\181"..
string.char(183, 229, 173, 166)
..
string.char(39, 230, 168, 177)
..
"\232\175\173\39"
,nil
,(85
+
330
-
295
-
81
~=45)
)
AddItemSkin("\115\111\114\97\95"..
string.char(100, 105, 101)
..
string.char(117, 121)
:reverse()

,string.char(233, 148, 166, 231, 145, 159)
..
"\230\151\160\231\171\175"..
string.char(228, 186, 148, 229, 141)
..
"\129\229\188\166\239"..
string.char(184, 228, 140, 188)
:reverse()
..
"\128\229\188\166"..
("\128\184\228"):reverse()
..
("\230\177\159\230"):reverse()
..
"\128\157\229\141"..
string.char(142, 229, 185)
..
"\180\46\10\229\186"..
string.char(132, 231, 148, 159, 230)
..
"\153\147\230"..
string.char(162, 166, 232)
..
string.char(191, 183, 232, 157)
..
"\180\232\157\182"..
"\239\188\140"..
"\230\156\155\229\184\157"..
"\230\152\165\229\191\131"..
"\230\137\152\230"..
"\157\156\233\185\131\46"..
"\10\230\178\167"..
("\136\156\230\183\181\230"):reverse()
..
("\231\142\152\230"):reverse()
..
"\143\160\230"..
"\156\137\230\179"..
"\170\239\188\140\232"..
"\147\157\231\148\176\230"..
("\150\154\230\165\151"):reverse()
..
string.char(231, 142, 137, 231)
..
string.char(148, 159, 231, 131, 159)
..
"\46\10\230\173\164"..
"\230\131\133\229\143\175"..
string.char(229, 190, 133)
..
"\230\136\144\232"..
"\191\189\229"..
string.char(191, 134, 239)
..
"\188\159\229\143"..
"\170\230\152\175\229\189"..
"\147\230\151\182\229\183"..
string.char(178, 230, 131, 152)
..
"\231\132\182"..
string.char(46)

,nil
,( true
 and
 
 false
 and
 
 true
 and
 
 false
 or
 
 false
 and
 not
 true
 or
 not
 true
 and
 not
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
 not
 false
 and
 not
 false
)
)
 AddItemSkin("\115\111\114"..
string.char(97, 95, 113, 105, 121)
..
"\117"
,"\228\191\174\231\144\134"..
"\233\155\168\228\188\158"..
string.char(126, 228, 191, 174, 231)
..
"\144\134\233\155\168"..
string.char(228, 188, 158)
..
"\126\228\191\174\231"..
"\144\134\233\155\168\228"..
"\188\158\126"
,888)
AddItemSkin("\115\111\114\97"..
string.char(95, 108, 121, 106)

,"\229\188\130\228\184\150"..
"\231\155\184\233\129\135"..
"\44\229\176\189\228\186"..
"\171\231\149"..
string.char(153, 229, 189)
..
("\177"):reverse()

,888)
AddItemSkin("\115\111\114"..
"\97\95\108\97"..
("\101\116\110"):reverse()
..
string.char(114, 110)

,"\232\174\169\229\174"..
("\184\229\131"):reverse()
..
"\166\228\189\160\230\137"..
"\190\229\136\176"..
"\229\155\158"..
"\229\174\182\231\154\132"..
string.char(175, 183, 232)
:reverse()

,450)
AddItemSkin("\115\111\114\97\95\108"..
string.char(97, 110, 116, 101)
..
("\104\121\95\110\114"):reverse()

,"\232\144\189\230"..
"\168\177\230\140\135"..
"\229\188\149\229"..
"\155\158\229\174\182"..
"\231\154\132\232\183\175"
,nil
,(420
*
419
-
310
-
210
*
456
==79910)
)
AddItemSkin("\115\111\114\97\95\114"..
"\105\110\103"
,"\230\173\187\231\148\159"..
("\145\165\229"):reverse()
..
string.char(233, 152, 148, 44, 228, 184)
..
"\142\229\173\144\230\136"..
"\144\232\175"..
"\180"
,450)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115"..
"\116\95\115\110\115"
,"\230\131\133\228"..
string.char(185, 139, 230, 137, 128, 231)
..
"\148\159\239\188\140\231"..
string.char(148, 177, 229, 191)
..
string.char(131, 232, 128)
..
("\10\183\181\232\140"):reverse()
..
"\81\231\190\164\57"..
"\52\51\49\48"..
"\53\56\48\52\10"..
string.char(233, 162, 134, 229, 143)
..
string.char(230, 185, 150, 230, 150)
:reverse()
..
"\179\149\231\156"..
"\139\231\190\164\229"..
"\133\172\229\145\138"
)
 AddItemSkin(string.char(114, 111, 115)
:reverse()
..
"\97\50\99"..
string.char(104, 101, 115)
..
"\116\95\112"..
"\107\113"
,("\134\229\177\176\229"):reverse()
..
"\179\229\174\154\230\152"..
("\189\228\175"):reverse()
..
"\160\228\186\134"..
"\44\231\154\174"..
"\229\141\161\228\184"..
"\152\33"
)
AddItemSkin(string.char(115, 111, 114, 97)
..
("\101\104\99\50"):reverse()
..
string.char(115, 116, 95, 106, 110, 103)

,string.char(230, 157, 176)
..
"\229\176\188"..
"\230\157\176\229\176\188"..
("\176\229\176\157\230"):reverse()
..
"\188\230\157\176\229\176"..
"\188\230\157\176\239\188"..
"\129"
)
AddItemSkin("\115\111\114\97"..
"\50\99\104\101\115\116"..
string.char(95, 121, 98)

,"\228\187\142\229\137"..
"\141\231\154\132\233"..
"\130\163\228"..
"\184\170\228\188"..
string.char(138, 229, 184, 131)
..
"\230\151\169\229\183\178"..
string.char(231, 187, 143, 228, 184, 141)
..
"\229\156\168\228\186\134"..
"\239\188\140\10\231"..
"\142\176\229\156"..
"\168\229\156"..
string.char(160, 189, 228, 168)
:reverse()
..
"\233\157\162\229\137"..
"\141\231\154"..
"\132\230\152\175\229"..
string.char(143, 182, 232, 181, 171, 233)
..
"\130\163\230"..
string.char(139, 137, 228, 188, 138)
..
"\229\184\131"..
"\46"
)
AddItemSkin(string.char(115, 111, 114, 97, 50, 99)
..
"\104\101\115"..
"\116\95\122"..
"\122\98"
,string.char(231, 143, 141, 231, 143)
..
"\160\232\180\157"..
"\233\135\140\231\156\159"..
"\231\154\132\230\156\137"..
"\231\143\141"..
("\160\143\231"):reverse()

)
AddItemSkin("\115\111\114\97\50\99"..
"\104\101\115\116"..
"\95\106\99\121"
,"\233\163\158\229\143"..
string.char(182, 229, 191)
..
"\171\229\136\128"..
"\239\188\129"
,300)
AddItemSkin(string.char(97, 114, 111, 115)
:reverse()
..
"\50\99\104"..
"\101\115\116"..
"\95\109\108"..
"\115"
,"\232\166\129\230\157"..
"\165\228\184\128"..
("\228\175\157\230"):reverse()
..
string.char(185, 136, 239)
..
"\188\159"
)
 AddItemSkin("\115\111\114\97"..
"\50\99\104\101"..
"\115\116\95"..
string.char(120, 122, 122)

,"\228\191\161"..
"\232\162\171\230"..
"\136\145\229"..
"\144\131\230\142\137\228"..
"\186\134"
)
AddItemSkin(string.char(115, 111, 114)
..
"\97\50\99\104\101"..
string.char(115, 116, 95, 100, 100)

,"\229\134\141\231\187"..
string.char(153, 230, 136, 145, 232)
..
string.char(174, 178, 228, 184, 128)
..
"\233\129\141\239\188\140"..
"\228\189\160\228"..
"\187\142\228\184\128"..
string.char(229, 160, 134, 229, 176)
..
"\143\231\140"..
"\171\233\135\140\233"..
"\128\137\228\184\173\230"..
"\136\145\231\154\132\230"..
"\149\133\228\186\139\229"..
"\144\167"
)
AddItemSkin("\115\111\114\97\50"..
"\99\104\101\115\116"..
"\95\115\103\106"
,"\231\159\165\233"..
("\228\147\129"):reverse()
..
"\189\160\229\143\151\228"..
"\186\134\229"..
"\165\189\229\164\154"..
("\148\167\229"):reverse()
..
"\229\177\136\239\188"..
"\140\230\137\128"..
"\228\187\165\230\138"..
"\177\230\138\177\228"..
"\189\160"
,nil
,(209
*
444
*
354
~=32849790)
)
AddItemSkin("\115\111\114"..
"\97\50\102\105\114"..
"\101\95\120\104\108"
,"\231\166\129\230\173"..
string.char(162, 231, 148, 168, 229, 176)
..
"\190\229\183\180"..
"\231\131\164\231\129\171"
,300)
AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101\95\104"..
"\114\104"
,("\228\140\128\232"):reverse()
..
"\189\160\44"..
"\230\136\145\231\154"..
"\132\230\156\139\229"..
"\143\139\10"..
"\228\189\160\230"..
"\137\141\230"..
"\152\175\231\156\159\230"..
"\173\163\231\154"..
("\233\149\184\229\132"):reverse()
..
"\178\129"
,300)
AddItemSkin("\115\111\114\97"..
"\50\102\105\114\101"..
string.char(108, 104, 104, 95)
:reverse()

,"\230\145\184\232\128\179"..
"\230\156\181"..
string.char(175, 152, 230)
:reverse()
..
string.char(231, 166, 129, 230, 173)
..
("\233\139\186\228\162"):reverse()
..
"\161\185\33"
,300)
 AddItemSkin("\115\111\114\97\50"..
"\102\105\114\101"..
string.char(95, 104, 106, 108)

,"\228\186\186"..
"\229\174\182"..
"\230\137\141"..
"\228\184\141\230"..
string.char(152, 175, 228)
..
"\188\138\229\184"..
"\131\229\145"..
"\162"
,300)
AddItemSkin("\115\111\114\97\50"..
"\105\99\101\95\102"..
string.char(108, 111, 119, 101)
..
string.char(114)

,"\228\189\160\229\183\178"..
"\232\162\171\231\167\187"..
"\229\135\186"..
"\231\190\164\232\129"..
"\138\39\232\138"..
("\128\188\229\177"):reverse()
..
"\229\175\140"..
"\232\180\181\39"
)
AddItemSkin("\115\111\114"..
"\97\50\105\99"..
"\101\95\115\101\101"..
"\100"
,"\230\157\165\231\130\185"..
"\231\167\141\229\173"..
"\144\44\232"..
"\159\185\232\159"..
"\185"
)
AddItemSkin("\115\111\114\97\50\105"..
"\99\101\95\98\104"..
string.char(108)

,"\231\142\175"..
"\230\184\184\230\149\180"..
"\228\184\170\230\152\159"..
string.char(231, 179, 187, 228, 184)
..
"\128\228\184\135\230\172"..
"\161\239\188\140\10"..
"\229\143\170\228"..
"\184\186\233\129"..
string.char(135, 232, 167, 129, 228, 189)
..
"\160"
)
AddItemSkin("\115\111\114\97"..
"\50\105\99\101\95\98"..
"\121\98"
,"\231\169\191\230\162"..
"\173\233\163\142"..
"\233\155\170\44\231\187"..
"\189\230\148\190"..
"\229\175\146\232\138"..
string.char(146, 33)

,300)
AddItemSkin(string.char(115, 111, 114, 97, 50, 105)
..
"\99\101\95\106\113\114"
,"\229\143\189\228"..
"\188\129\229\136"..
("\184\228\131"):reverse()
..
"\141\230\152\175"..
"\230\156\186\229\153\168"..
"\228\186\186"..
"\33"
)
 AddItemSkin("\115\111\114\97\50"..
("\99\100\114\105\98"):reverse()
..
"\104\101\115\116\95\103"..
"\103\100"
,string.char(229, 156, 168, 228, 184, 139)
..
"\230\177\159"..
string.char(230, 185, 150, 228, 186, 186)
..
string.char(231, 167, 176, 232, 143, 135)
..
"\232\143\135"..
"\230\175\146\239\188\140"..
("\153\229\151\154\230\10"):reverse()
..
"\168\230\166\156"..
"\230\142\146\229\144\141"..
"\231\172\172"..
"\228\184\131"..
"\229\141\129\228"..
"\184\131\239\188\140"..
"\10\231\139\172\233\151"..
"\168\231\187"..
"\157\230\138\128\45\45"..
"\229\165\189\232\143"..
string.char(135, 230, 175, 146)
..
"\239\188\129"
)
AddItemSkin(string.char(115, 111, 114, 97)
..
"\50\98\105"..
"\114\100\99\104\101"..
"\115\116\95"..
string.char(120, 122, 121, 98)

,string.char(232, 165, 191)
..
"\230\160\188\230"..
"\150\175\230\175"..
string.char(148, 228, 184, 142, 228)
..
"\187\153\229\173\144"..
"\228\188\138"..
"\229\184\131\229"..
string.char(191, 131, 229)
..
string.char(191, 131, 231)
..
"\155\184\229\141\176"..
string.char(228, 186, 134, 239)
..
"\188\129"
,300)
AddItemSkin("\115\111\114\97\50\98"..
"\105\114\100\99"..
"\104\101\115\116"..
string.char(119, 100, 104, 95)
:reverse()

,"\230\129\173\229\150"..
string.char(160, 189, 228, 156)
:reverse()
..
("\232\140\188\239"):reverse()
..
"\162\171\233\156\141\230"..
"\160\188\230\178\131"..
"\232\140\168\229\189"..
"\149\229\143"..
("\188\239\134\186\228\150"):reverse()
..
"\129"
)
AddItemSkin(string.char(115, 111, 114, 97, 95, 115)
..
string.char(105, 103, 110, 95)
..
string.char(109, 121, 121)

,string.char(231, 190, 138, 232)
..
"\133\191\229"..
"\165\189\229\144"..
"\131\44\230\137"..
"\128\228\187\165"..
string.char(229, 128, 188, 229, 190)
..
string.char(151, 33)

)
AddItemSkin("\115\111\114\97\95"..
"\115\105\103\110\95\121"..
"\101\122"
,"\229\138\160\229\164\167"..
"\239\188\129\229"..
string.char(138, 160, 229, 164)
..
"\167\239\188"..
"\129\229\134\141\230"..
"\143\143\228"..
"\184\128\229\156\136"..
"\239\188\129"
,300)
AddItemSkin("\115\111\114"..
"\97\95\115"..
"\109\97\108\108\108"..
"\105\103\104\116"..
"\95\102\108"
,"\232\191\153\230"..
"\152\175\233\163"..
"\142\233\147\131"..
"\10\228\184\141"..
"\230\152\175\232\138"..
("\177"):reverse()

)
 AddItemSkin("\115\111\114"..
"\97\95\115\109\97\108"..
string.char(108, 108, 105, 103, 104, 116)
..
"\95\106\106"
,string.char(229, 152, 191, 239, 188, 129)
..
string.char(10, 230, 136, 145)
..
"\231\159\165"..
("\184\228\147\129\233"):reverse()
..
string.char(128, 228, 184, 170)
..
"\232\131\189\232\174\169"..
string.char(229, 145, 136, 230)
:reverse()
..
"\156\168\232\181"..
"\176\232\183"..
"\175\231\154"..
"\132\230\151\182"..
"\229\128\153\239\188\140"..
"\10\228\184\141\232\162"..
"\171\231\187"..
"\183\229\184\166\231\187"..
"\138\229\128"..
string.char(138, 229, 132, 154, 231, 146)
:reverse()
..
"\158\230\179\149\239\188"..
"\140\10\228"..
"\189\160\228\187"..
"\172\230\131\179\229\144"..
"\172\229\144\151\239"..
("\159\188"):reverse()

)
AddItemSkin("\115\111\114\97\95"..
"\115\104\111\117\98\97"..
"\110\95\120\100"
,string.char(228, 184, 141)
..
"\229\144\131\233"..
string.char(165, 173, 239, 188, 140, 232)
..
"\191\153\230\160"..
"\183\230\136\145\229"..
"\176\177\233\149"..
"\191\228\184"..
"\141\229\164"..
string.char(167, 228, 186, 134, 239, 188)
..
"\140\10\230\136\145"..
string.char(229, 176, 177, 229, 143, 175)
..
string.char(228, 187, 165)
..
"\228\184\141\231"..
"\166\187\229\188\128\228"..
("\134\186\228\160\189"):reverse()
..
"\229\144\151"
,nil
,(8
-
110
-
36
*
85
~=-3159)
)
AddItemSkin("\115\111\114\97\95\115"..
string.char(97, 98, 117, 111, 104)
:reverse()
..
"\110\95\107\102"..
"\107"
,"\229\166\136\33"
,nil
,(376
+
456
-
47
*
53
-
8
~=-1662)
)
AddItemSkin("\115\111\114\97\95"..
"\115\104\111"..
"\117\98\97\110"..
"\95\108\121"
,"\230\181\129\232\144\164"..
"\231\131\164\228\184\178"..
string.char(126, 228, 184)
..
string.char(137, 229, 133, 131, 228)
..
string.char(178, 184, 228, 128, 184)
:reverse()
..
"\126\229\141\129"..
"\229\133\131\228\184\137"..
"\228\184\178\126"
,nil
,(496
-
293
+
21
-
309
+
92
~=16)
)
AddItemSkin("\115\111\114\97\95\112"..
string.char(101, 97, 114, 108, 95, 112)
..
("\100"):reverse()

,"\228\186\186\229\174"..
string.char(141, 184, 228, 182)
:reverse()
..
"\230\152\175\232"..
"\131\150\10\229"..
"\143\170\230\152\175\229"..
"\143\171\232\131\150"..
string.char(228, 184, 129)

)
 AddItemSkin("\115\111\114\97\50"..
string.char(98, 97, 115, 101, 95, 98)
..
"\105\103"
,"\232\176\129"..
string.char(228, 184, 141, 229, 150, 156)
..
"\230\172\162\229"..
"\164\167\231"..
"\154\132\229\145"..
"\162\10\229\175"..
string.char(185, 44, 230)
..
"\136\145\232\175"..
string.char(180, 231, 154, 132)
..
"\229\176\177\230\152"..
"\175\231\165\173"..
"\229\157\155"
)
AddItemSkin("\115\111\114"..
"\97\50\98\97"..
"\115\101\95\115\109\97"..
string.char(108, 108)

,string.char(232, 176, 129, 228, 184)
..
"\141\229\150"..
"\156\230\172\162\229"..
"\176\143\231\154\132\229"..
"\145\162\10\229"..
"\175\185\44\230"..
"\136\145\232\175"..
"\180\231\154\132\229"..
("\231\175\152\230\177\176"):reverse()
..
string.char(165, 173, 229, 157)
..
"\155"
)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115"..
string.char(101, 95, 122, 108, 104)

,("\153\191\232"):reverse()
..
"\230\152\175\233"..
"\152\191\231\180"..
"\171"
)
AddItemSkin("\115\111\114\97"..
"\50\98\97\115\101"..
string.char(104, 108, 104, 95)
:reverse()

,"\232\191\153\230"..
"\152\175\233\152\191\230"..
string.char(156, 177)

)
AddItemSkin("\115\111\114\97\98"..
"\111\119\107\110\111\116"..
"\95\115\111\114\97"
,string.char(230, 136, 145, 228)
..
"\185\159\228\188\154\230"..
"\152\175\231\172\172\228"..
"\184\128\229\144\141\229"..
("\151\144"):reverse()

)
AddItemSkin(string.char(111, 98, 97, 114, 111, 115)
:reverse()
..
"\119\107\110\111\116\95"..
"\108\100"
,"\229\143\174\229\143\174"..
"\229\189\147"..
"\239\188\140"..
string.char(229, 143, 174, 229, 143)
..
string.char(174, 229, 189)
..
string.char(147, 10, 233)
..
"\147\131\229"..
"\132\191\229\147\141\229"..
string.char(143, 174, 229)
..
"\189\147"
)
AddItemSkin("\115\111\114"..
string.char(97, 98, 97)
..
string.char(103, 95, 115)
..
string.char(100, 108)

,"\229\152\152\44"..
string.char(229, 156, 163, 232, 175)
..
"\158\232\128"..
"\129\228\186\186\232"..
string.char(166, 129, 230, 157, 165, 228)
..
"\186\134"
)
 AddItemSkin(string.char(115, 111, 114, 97, 104)
..
"\97\116\95\115"..
string.char(100)
:reverse()

,("\156\229\44\152\152\229"):reverse()
..
"\163\232\175\158\232\128"..
("\186\186\228\129"):reverse()
..
"\232\166\129\230"..
("\186\228\165\157"):reverse()
..
"\134"
)
AddItemSkin("\115\111\114"..
string.char(97, 50, 98, 117, 105)
..
"\108\100\95\100\101\99"..
"\111\114\95\106\115"..
("\115"):reverse()

,"\231\186\162"..
"\228\188\158\228\188\158"..
"\239\188\140"..
"\231\153\189\230"..
string.char(157, 134, 230, 157, 134, 10)
..
"\229\144\131\229\174\140"..
"\228\184\128\232\181"..
"\183\232\186\186\230"..
string.char(157, 191, 230, 157, 191, 227)
..
"\128\130"
,300)
AddItemSkin(("\98\50\97\114\111\115"):reverse()
..
"\117\105\108\100"..
"\95\100\101\99\111\114"..
"\95\115\109\97"..
"\108\108"
,string.char(152, 230, 153, 191, 232)
:reverse()
..
"\175\228\184\173\230\157"..
"\175\239\188"..
"\140\10\232"..
"\191\153\230"..
string.char(152, 175, 229)
..
"\164\167\230\157"..
string.char(175, 239, 188, 140)
..
string.char(10, 232, 191, 153, 230, 152)
..
"\175\232\182"..
"\133\229\164\167\230\157"..
"\175\46"
,60)
AddItemSkin("\115\111\114\97\50\98"..
("\100\95\100\108\105\117"):reverse()
..
"\101\99\111\114\95\109"..
"\101\100\105\117\109"
,"\232\191\153\230\152\175"..
("\173\184\228"):reverse()
..
string.char(188, 239, 175, 157, 230)
:reverse()
..
"\140\10\232"..
("\152\230\153\191"):reverse()
..
"\175\229\164\167\230\157"..
"\175\239\188\140"..
("\152\230\153\191\232\10"):reverse()
..
string.char(175, 232, 182, 133, 229)
..
"\164\167\230\157\175"..
"\46"
,60)
AddItemSkin("\115\111\114\97"..
"\51\115\119\111\114\100"..
("\115\111\114\95"):reverse()
..
"\101"
,("\142\231\175\152\230"):reverse()
..
string.char(171, 232, 175, 173)
..
"\239\188\129\228\184"..
("\162\230\175\152\230\141"):reverse()
..
"\133\233\155\168\239"..
"\188\129"
)
 AddItemSkin("\115\111\114"..
"\97\95\119\113\95"..
string.char(98, 98, 106)

,"\232\191\153\231\142"..
string.char(169, 230, 132, 143, 231)
..
string.char(132, 154, 231, 159, 156)
:reverse()
..
"\232\131\189\229"..
"\135\186\231\154\174\232"..
"\130\164\229\144\151"..
"\63"
)
AddItemSkin("\115\111\114\97\98\111"..
"\119\107\110\111"..
"\116\95\100"..
"\119"
,string.char(231, 171, 175, 229, 141)
..
"\136\232\138"..
"\130\229\191"..
string.char(229, 187, 161, 233, 133)
:reverse()
..
"\144\131\231\178\189\229"..
"\173\144\229\144\151"
,300)
AddItemSkin("\115\111\114\97"..
"\95\112\101\97"..
"\114\108\95\115"..
"\108\109"
,"\232\144\140\231\142"..
"\139\230\152\175"..
"\232\176\129\63"
)
AddItemSkin("\115\111\114\97\95"..
"\112\101\97\114"..
"\108\95\116\121"
,"\233\152\191"..
"\231\143\141\231\136\177"..
"\228\184\138\228"..
"\186\134\233"..
"\152\191\229"..
string.char(188, 186)

)
AddItemSkin(string.char(115, 111, 114, 97, 95)
..
"\116\113\121\95\113\121"
,"\228\184\141\230\173\162"..
"\228\184\131"..
"\229\164\149\44\230\155"..
"\180\229\156\168\230"..
"\156\157\229\164"..
"\149\10\32"..
"\32\32\32\45"..
"\45\45\50\48\50"..
"\52\228\184\131\229\164"..
("\186\231\149"):reverse()
..
"\170\229\191\181"
)
AddItemSkin("\115\111\114"..
string.char(97, 95, 116, 113, 121)
..
"\95\113\107\121\122"
,string.char(228, 188, 151)
..
"\231\148\159\228\184\186"..
string.char(230, 163, 139, 44, 228, 184)
..
"\128\230\142\183"..
"\233\146\177\229\157\164"
)
AddItemSkin("\115\111\114\97\95\116"..
"\113\121\95\120"..
"\113\108"
,"\229\176\143"..
"\233\157\146\233"..
"\190\153\228"..
"\184\186\228\187\128"..
"\228\185\136"..
"\230\152\175\231\186"..
string.char(162, 232, 137, 178)
..
string.char(231, 154, 132)
..
"\63"
)
 AddItemSkin("\115\111\114\97\95\108"..
"\105\103\104"..
"\116\102\108"..
"\105\101\114\95"..
("\122\122\106\116"):reverse()

,("\157\230\178\151\233"):reverse()
..
"\165\230\151\160\228\186"..
"\139\239\188"..
"\140\232\186\186\231"..
string.char(172, 144, 229, 185, 171)
:reverse()
..
"\230\155\178"
)
AddItemSkin("\115\111\114\97\95\108"..
"\105\103\104\116"..
"\102\108\105\101\114\95"..
("\101\101\98"):reverse()
..
string.char(120)

,string.char(232, 191, 153, 230)
..
string.char(152, 175, 231)
..
"\134\138\239"..
"\188\140\10\228\184"..
string.char(141, 230, 152, 175, 66)
..
"\101\101\239\188\129"
)
AddItemSkin("\115\111\114\97"..
"\98\111\119\107\110\111"..
"\116\95\115\98"..
"\121"
,"\228\184\141\232"..
"\131\189\229\155\160\228"..
"\184\186\230\152\175\229"..
"\165\179\229\173"..
"\169\229\173"..
"\144\229\176\177"..
"\232\167\137\229\190"..
("\170\135\232\151"):reverse()
..
"\229\183\177\230"..
"\152\175\229\188\177"..
"\10\232\128"..
string.char(133, 239, 188, 140, 229)
..
"\166\130\230"..
string.char(158, 156, 228, 184, 141)
..
"\229\188\186\229"..
"\164\167\229"..
"\176\177\228\184"..
("\189\131\232\141"):reverse()
..
string.char(228, 191, 157)
..
"\230\138\164\232\186\171"..
"\232\190\185\10\230\156"..
"\128\233\135\141\232"..
"\166\129\231\154"..
"\132\228\186\186"
,nil
,(327
+
125
*
133
+
53
==17005)
)
AddItemSkin("\115\111\114\97"..
"\109\97\103\105\99\95"..
string.char(115, 98, 121)

,string.char(230, 156, 137, 229)
..
"\133\137\231"..
"\154\132\229\156\176"..
"\230\150\185"..
"\229\176\177\230\156"..
"\137\233\187"..
"\145\230\154\151\239"..
"\188\140\10"..
string.char(233, 187, 145, 230)
..
string.char(229, 151, 154)
:reverse()
..
"\145\188\229\148\164\229"..
"\133\137\230\152\142\239"..
"\188\140\229\133\137\230"..
string.char(152, 142, 228, 185)
..
"\159\229\145\188\229\148"..
"\164\233\187\145"..
"\230\154\151\227"..
"\128\130"
,nil
,(189
+
266
+
91
~=552)
)
AddItemSkin("\115\111\114\97"..
string.char(98, 97, 103)
..
"\95\115\98\121"
,"\230\136\145\230\131\179"..
"\230\136\144\228\184\186"..
string.char(233, 163, 142)
..
"\239\188\140\231\169\191"..
string.char(232, 191, 135, 230, 151, 160)
..
"\229\189\162\231\154"..
"\132\233\152\187"..
"\229\138\155\239\188"..
"\140\10\232"..
"\135\170\231"..
"\148\177\229\156\176"..
string.char(233, 163, 158)
..
"\231\191\148\227\128"..
"\130"
, nil
,(370
-
461
-
2
~=-84)
)
AddItemSkin("\115\111\114\97"..
string.char(104, 97, 116)
..
"\95\115\98\121"
,("\154\174\229\128\184\228"):reverse()
..
"\230\152\175\231"..
"\154\132\239\188\140\230"..
"\151\160\230\149\176\230"..
string.char(172, 161, 231, 154)
..
string.char(132, 233, 130, 130, 233)
..
"\128\133\239\188\140\10"..
("\154\174\229\128\184\228"):reverse()
..
string.char(184, 228, 175, 152, 230)
:reverse()
..
"\186\228\186"..
string.char(134, 229, 146, 140)
..
"\231\139\172"..
"\228\184\128\230\151\160"..
"\228\186\140\231\154\132"..
"\10\233\130"..
"\163\228\184\170"..
"\228\186\186"..
string.char(231, 155, 184, 233, 129, 135)
..
"\229\144\167\227"..
"\128\130"
,nil
,(384
*
90
*
68
+
251
~=2350336)
)
AddItemSkin(("\95\97\114\111\115"):reverse()
..
"\116\113\121"..
"\95\115\98\121"
,"\230\156\136"..
"\228\185\139\229"..
string.char(134, 149, 229, 135, 186)
..
string.char(229, 135, 187, 239)
..
"\188\129"
,nil
,(177
*
463
*
148
+
72
*
22
~=12130338)
)
AddItemSkin("\115\111\114\97\95"..
"\116\113\121\95"..
"\98\111\120"..
"\95\115\98\121"
,"\230\175\129\231"..
string.char(129, 173, 228)
..
"\185\139\229\144"..
"\142\230\152\175\229"..
"\184\140\230\156\155\229"..
string.char(146, 140, 229, 134, 141)
..
"\231\148\159\227"..
"\128\130"
,nil
,(247
-
7
-
465
~=-221)
)
 AddItemSkin("\115\111\114\97\95"..
"\115\105\103"..
string.char(110, 95, 119, 115)
..
"\113\121"
,"\228\184\135\229"..
"\156\163\231\139\130\230"..
string.char(172, 162, 239)
..
string.char(188, 140, 230, 151, 160, 228)
..
"\185\144\228\184\141\228"..
"\189\156\239"..
"\188\129"
)
AddItemSkin("\115\111\114\97"..
"\95\115\109\97"..
"\108\108\108\105\103"..
"\104\116\95"..
"\119\115\113\121"
,"\228\184\141"..
"\231\187\153\231\179"..
"\150\229\176\177"..
"\230\138\138\228\189"..
"\160\230\138\147\232"..
"\181\183\230\157"..
"\165\229\144\131\230"..
"\142\137\239\188\129"
)
AddItemSkin("\115\111\114"..
string.char(97, 109, 97, 103, 105)
..
("\113\115\119\95\99"):reverse()
..
string.char(121)

,"\230\136\145"..
"\229\176\134"..
"\231\142\171\231\145\176"..
"\232\151\143"..
string.char(228, 186, 142)
..
"\232\186\171\229\144\142"..
("\230\10\44"):reverse()
..
"\156\159\231\155\188\228"..
string.char(184, 142, 228, 189, 160)
..
"\232\181\180\231\186\166"..
"\46"
)
AddItemSkin("\115\111\114\97\116\101"..
"\108\101\95\119\115"..
string.char(113, 121)

,string.char(229, 156, 168, 230)
..
("\232\145\136"):reverse()
..
"\141\146\231\152\160"..
"\231\154\132"..
"\229\156\159\229\156\176"..
"\228\184\138\44\10"..
"\228\189\160"..
"\230\152\175\230"..
"\156\128\229\144\142"..
"\231\154\132\231\142\171"..
"\231\145\176"
)
AddItemSkin("\115\111\114"..
"\97\98\111\119\107\110"..
"\111\116\95\119\115"..
"\113\121"
,"\230\156\137"..
"\228\186\186\233"..
"\170\130\228"..
("\142\135\233\160\189"):reverse()
..
"\229\191\131"..
"\229\139\131\229"..
("\188\239\131\139"):reverse()
..
("\230\10\140"):reverse()
..
"\156\137\228"..
"\186\186\231"..
"\136\177\228\189"..
"\160\231\129\181"..
"\233\173\130\230"..
"\156\137\231\129\171"
)
 AddItemSkin(string.char(115, 111, 114, 97)
..
"\95\108\105\103"..
"\104\116\102\108"..
("\114\101\105"):reverse()
..
string.char(95, 119, 115, 113, 121)

,"\229\147\135\233"..
string.char(133, 183, 239)
..
"\188\129\229\147"..
"\135\233\133\183\239"..
"\188\129\229\147\135\233"..
"\133\183\229\147\135\233"..
"\133\183\239\188"..
"\129"
)
local _T__H__i_S_Bu__g={sora_none=
"\115\111\114\97\95\117"..
"\110\105\102\111\114"..
"\109\115"
}
local __t_hi__SbU__G__=require"widgets/screen"local _THIsB__u__g__=require"widgets/text"local tHi__sBu__g=require"widgets/uianim"local thi_s_b_ug_=require"widgets/image"local T__h__i_S_B__U_G__=require"widgets/widget"local __t__h__I__s__bu_g_=require"widgets/redux/templates"local T__h_IsbUG_=require"widgets/redux/accountitemframe"local __t_hI_sBuG_=5;local T__HI_S__B_u_g_=44;local __THi_SBU_g__=300;local _T_h_Is__b__Ug_=40;local __T__H_I_s_B__u__g_=BUTTONFONT;local _t__h_I__s__BuG__=32;local _T__h__IsB__Ug__=0.6;local TH_ISB__U_G__=-55;local TH__I_S_Bu_g__=UICOLOURS[string.char(87, 72, 73, 84, 69)
]local __TH__I__s_b_u__g_=UICOLOURS["\71\82\69\89"] PushNoConnectScr=function(__thi_SBU_G__)
 local _t__h__is_B__u_g_=__thi_SBU_G__==1 and string.char(231, 155, 174)
..
"\229\137\141"..
"\230\151\160"..
"\230\179\149\231\148\177"..
"\228\186\142\107"..
"\108\101\105\229\142"..
"\159\229\155\160"..
"\230\136\150\232"..
"\128\133\229\133\182\228"..
"\187\150\229"..
("\160\155\229\159\142"):reverse()
..
("\137\229\147\189\229\10"):reverse()
..
("\230\162\174\229\91\141"):reverse()
..
("\93\175\171\231\183\136"):reverse()
..
"\230\151\160\230"..
"\179\149\232"..
"\191\158\230"..
string.char(142, 165, 229, 136, 176, 231)
..
"\189\145\231\187\156"..
"\10\232\175\183\230\140"..
"\137\231\133\167\230\143"..
"\144\231\164\186\232"..
string.char(191, 155, 232, 161, 140)
..
"\230\147\141"..
"\228\189\156"
or string.char(231, 155, 174, 229, 137)
..
"\141\230\151\160\230"..
"\179\149\231\148"..
string.char(107, 142, 186, 228, 177)
:reverse()
..
string.char(108, 101, 105)
..
"\229\142\159\229\155\160"..
"\230\136\150"..
"\232\128\133\229"..
"\133\182\228\187"..
("\142\229\150"):reverse()
..
"\159\229\155"..
"\160\10\229\189\147\229"..
"\137\141\91\230\156"..
"\141\229\138"..
"\161\229\153\168\93"..
"\230\151\160\230\179\149"..
string.char(232, 191, 158, 230)
..
"\142\165\229\136\176\231"..
string.char(189, 145, 231, 187, 156, 10)
..
"\232\175\183\230\140"..
"\137\231\133"..
"\167\230\143\144"..
"\231\164\186"..
"\232\191\155\232"..
string.char(161, 140, 230, 147, 141)
..
("\156\189\228"):reverse()

SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185"..
string.char(231, 154, 132, 230, 184, 169)
..
"\233\166\168\230\143\144"..
string.char(231, 164, 186)

,_t__h__is_B__u_g_,{"\230\159\165\231\156\139"..
string.char(230, 143, 144)
..
"\231\164\186"
,
string.char(229, 133, 179, 233, 151, 173)

}
,{function()
VisitURL(string.char(104, 116, 116)
..
"\112\58\47"..
"\47\119\105"..
"\107\105\46\102\108"..
string.char(97, 112, 105, 46)
..
string.char(99, 110, 47, 110)

,(340
*
131
*
157
~=6992780)
)
end
,
nil
}
)
end
PushCDKScr=function(_T__H__i_SBu__g_)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local _T__hI_S__B_uG=T__H_IS__b_u_G__("\115\111\114"..
string.char(111, 110, 95, 97)
:reverse()
..
"\110\101"
)
_T__hI_S__B_uG["\117\110\108\111\99\107"..
"\116\101\120\116"]:SetString(_T__H__i_SBu__g_ or"\228\187\133\231\148\168"..
("\167\232\142\186\228"):reverse()
..
string.char(163, 233, 148)
..
string.char(129, 231, 169, 185, 229)
..
"\166\185\67\68"..
"\75"
)
TheFrontEnd:PushScreen(_T__hI_S__B_uG)
return _T__hI_S__B_uG end
PushItemScr=function(__tH_ISb__U__g__)
if not HasHttpOK()
then return PushNoConnectScr(1)
end;if not ServerHasHttpOK()
then return PushNoConnectScr(2)
end;local __TH_i_s_b__u_g__=__T_H__I_s_Bu__G__()
TheFrontEnd:PushScreen(__TH_i_s_b__u_g__)
return __TH_i_s_b__u_g__ end
 AddClassPostConstruct(string.char(119, 105, 100, 103)
..
"\101\116\115\47"..
"\114\101\100\117\120"..
"\47\105\116\101"..
string.char(109, 101, 120, 112, 108, 111)
..
"\114\101\114"
,function(self)
local __T_h__i_sbUG__=self[string.char(95, 83, 104, 111, 119, 73)
..
"\116\101\109\83\101\116"..
string.char(73, 110, 102, 111)
]self["\95\83\104\111\119"..
"\73\116\101"..
"\109\83\101\116\73\110"..
"\102\111"]=function(__Th__i_Sb__u__g_,...
)
if __ThI_s_bu_g_[__Th__i_Sb__u__g_["\115\101\116\95\105\116"..
"\101\109\95\116"..
string.char(121, 112, 101)
]]then __Th__i_Sb__u__g_[string.char(115, 101, 116, 95, 105, 110)
..
"\102\111\95\115"..
string.char(99, 114, 101, 101, 110)
]=__ThI_s_bu_g_[__Th__i_Sb__u__g_["\115\101\116\95"..
"\105\116\101\109\95"..
string.char(116, 121, 112)
..
"\101"]](__Th__i_Sb__u__g_,__Th__i_Sb__u__g_["\115\101\116\95"..
"\105\116\101\109\95"..
"\116\121\112\101"])
__Th__i_Sb__u__g_["\115\101\116\95\105"..
"\110\102\111\95"..
"\115\99\114\101"..
"\101\110"]["\111\119\110\101\100"..
string.char(95, 98, 121, 95)
..
"\119\97\114\100\114"..
string.char(101, 98, 111)
:reverse()
]=(67
-
325
*
76
*
228
~=-5631524)
TheFrontEnd:PushScreen(self[string.char(115, 101, 116, 95)
..
("\95\111\102\110\105"):reverse()
..
"\115\99\114\101"..
"\101\110"])
return end;return __T_h__i_sbUG__(__Th__i_Sb__u__g_,...
)
end
 if self["\105\110\116\101"..
"\114\97\99\116\95"..
string.char(116, 111, 111, 114)
:reverse()
]then self["\115\111\114\97\116\105"..
"\109\101\95\116\101\120"..
"\116"]=self["\105\110\116\101\114"..
"\97\99\116\95\114\111"..
"\111\116"]:AddChild(_THIsB__u__g__(CHATFONT,30,nil
,UICOLOURS["\87\72\73"..
"\84\69"])
)
self["\115\111\114\97\116\105"..
string.char(109, 101, 95, 116)
..
"\101\120\116"]:SetString(string[string.char(102, 111, 114, 109)
..
("\116\97"):reverse()
]("\229\143\175"..
"\231\148\168"..
"\47\230\128"..
string.char(187, 230, 180)
..
string.char(187, 232, 183, 131, 229)
..
"\186\166\58\32\37\100"..
"\47\37\100"
,__Th_isb__u_G, __t__h__Is_B__u__G_+__Th_isb__u_G)
)
self["\115\111\114\97"..
string.char(116, 105, 109, 101, 95, 116)
..
"\101\120\116"]:SetPosition(120,240)
self["\115\111\114\97\116"..
"\105\109\101"..
"\95\116\101"..
"\120\116"]:Hide()
self[string.char(115, 111, 114)
..
"\97\105\116\101"..
"\109\95\98\116"..
"\110"]=self[string.char(97, 114, 101, 116, 110, 105)
:reverse()
..
"\99\116\95\114\111\111"..
"\116"]:AddChild(__t__h__I__s__bu_g_["\83\116\97\110"..
"\100\97\114"..
"\100\66\117"..
"\116\116\111"..
"\110"](function()
local th_I__s_B__U_g__=PushItemScr()
end
,("\229\169\137\231"):reverse()
..
"\147\129\231"..
"\154\174\232\130\164"
,{130,
45}
)
)
self["\115\111\114\97\105\116"..
"\101\109\95\98"..
"\116\110"]:SetPosition(150,0)
self["\115\111\114"..
"\97\105\116\101"..
"\109\95\98\116\110"]:Hide()
end;local _t__H__i__s__bu_G=self["\95\85\112\100"..
"\97\116\101\73\116"..
"\101\109\83\101\108"..
"\101\99\116\101\100"..
string.char(73, 110, 102, 111)
]self[("\116\97\100\112\85\95"):reverse()
..
"\101\73\116\101\109"..
"\83\101\108\101\99"..
"\116\101\100\73\110"..
"\102\111"]=function(_t_hiS_b_UG,
T_h_i_Sb__U__G__,...
)
local _tHI__S_B__Ug_=_t__H__i__s__bu_G(_t_hiS_b_UG,T_h_i_Sb__U__G__,...
)
if T_h_i_Sb__U__G__ and __ThI_s_bu_g_[T_h_i_Sb__U__G__]and not t_hIs__b__uG__[T_h_i_Sb__U__G__]and _t_hiS_b_UG["\115\101\116"..
"\95\105\110\102\111"..
"\95\98\116"..
"\110"]then _t_hiS_b_UG["\115\101\116\95\105"..
string.char(110, 102, 111, 95, 98)
..
"\116\110"]:SetText("\230\191\128\230\180\187"
)
_t_hiS_b_UG[string.char(115, 101, 116)
..
"\95\105\110"..
("\98\95\111\102"):reverse()
..
"\116\110"]:Show()
_t_hiS_b_UG["\115\101\116\95\105"..
string.char(116, 101, 109, 95, 116)
..
"\121\112\101"]=T_h_i_Sb__U__G__ end;if self[string.char(115, 111, 114, 97, 116, 105)
..
"\109\101\95\116\101"..
"\120\116"]then if T_h_i_Sb__U__G__ and T_h_i_Sb__U__G__:match(string.char(94, 115, 111, 114, 97)

)
then self[string.char(115, 111, 114, 97, 116, 105)
..
"\109\101\95\116"..
"\101\120\116"]:Show()
else self[("\97\114\111\115"):reverse()
..
"\116\105\109\101\95"..
"\116\101\120\116"]:Hide()
end end;if self["\115\111\114\97\105\116"..
string.char(101, 109, 95, 98, 116)
..
("\110"):reverse()
]then if T_h_i_Sb__U__G__=="\115\111\114\97\95"..
"\110\111\110"..
"\101"
then self["\115\111\114"..
"\97\105\116\101"..
string.char(109, 95, 98, 116, 110)
]:Show()
else self["\115\111\114"..
string.char(97, 105, 116)
..
"\101\109\95\98\116"..
"\110"]:Hide()
end end;return _tHI__S_B__Ug_ end
end
)
 local ThI__S_B_U_g=Class(__t_hi__SbU__G__,function(self,
_t_H_i__s_b_U__g_,
__tH_I_s__B__UG)
__t_hi__SbU__G__[("\111\116\99\95"):reverse()
..
"\114"](self,"\85\110\76\111\99\107"..
"\83\99\114\101\101\110"
)
self["\105\116\101\109"]=_t_H_i__s_b_U__g_;self[("\98\99"):reverse()
]=__tH_I_s__B__UG;self["\98\108\97\99"..
string.char(107)
]=self:AddChild(__t__h__I__s__bu_g_["\66\97\99\107"..
"\103\114\111\117\110"..
"\100\84\105\110\116"]()
)
self[string.char(112, 114, 111, 111)
..
"\116"]=self:AddChild(__t__h__I__s__bu_g_["\83\99\114\101\101\110"..
string.char(82, 111, 111, 116)
](string.char(82, 79, 79, 84)

)
)
self["\99\100"]=SoraCD(5,(348
-
310
*
184
~=-56682)
)
 self["\98\117\116\116"..
"\111\110\115"]={{text=
string.char(230, 191, 128, 230, 180)
..
"\187"
,
cb=
function()
if self["\99\100"]()
then if self["\99\98"]then self[string.char(99, 98)
](self,_t_H_i__s_b_U__g_)
end else SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132"..
"\230\184\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,string.char(232, 175, 183, 231, 168, 141)
..
"\229\128\153\229\134\141"..
"\232\175\149"..
string.char(227, 128, 130)

)
end end
}
,
{text=
("\233\179\133\229"):reverse()
..
"\151\173"
,
cb=
function()
self:Close()
end
}
}
local _Th_ISBU__g__=400;self["\100\105\97\108\111"..
"\103"]=self["\112\114\111\111"..
string.char(116)
:reverse()
]:AddChild(__t__h__I__s__bu_g_["\67\117\114\108\121\87"..
string.char(105, 110, 100)
..
"\111\119"](_Th_ISBU__g__,450,STRINGS[("\83\69\77\65\78"):reverse()
][_t_H_i__s_b_U__g_],self["\98\117\116\116\111\110"..
"\115"])
)
self["\99\111\110"..
"\116\101\110\116"..
"\95\114\111\111"..
"\116"]=self["\112\114\111\111"..
string.char(116)
]:AddChild(T__h__i_S_B__U_G__("\99\111\110\116"..
"\101\110\116\95"..
"\114\111\111"..
"\116"
)
)
self["\99\111\110\116"..
"\101\110\116\95\114\111"..
"\111\116"]:SetPosition(200,-150)
self["\97\110\105"..
"\109\95\114\111\111\116"]=self["\99\111\110\116"..
string.char(101, 110, 116, 95, 114, 111)
..
"\111\116"]:AddChild(T__h__i_S_B__U_G__("\97\110\105\109"..
string.char(95, 114, 111, 111, 116)

)
)
self["\97\110\105\109"..
"\95\114\111\111"..
"\116"]:SetVAnchor(ANCHOR_MIDDLE)
self["\97\110\105\109"..
string.char(95, 114, 111, 111)
..
"\116"]:SetHAnchor(ANCHOR_MIDDLE)
self["\97\110\105\109"..
string.char(111, 111, 114, 95)
:reverse()
..
"\116"]:SetScaleMode(SCALEMODE_PROPORTIONAL)
self[("\95\109\105\110\97"):reverse()
..
("\116\111\111\114"):reverse()
]:SetPosition(-150,-50)
self[string.char(97, 110, 105, 109)
]=self[string.char(97, 110, 105, 109, 95, 114)
..
string.char(111, 111, 116)
]:AddChild(tHi__sBu__g()
)
 self[string.char(97, 110, 105, 109, 115)
..
string.char(116, 97, 116)
..
"\101"]=self[("\109\105\110\97"):reverse()
]:GetAnimState()
local _T__HI__S__b_U__g_=_T__H__i_S_Bu__g[_t_H_i__s_b_U__g_]or _t_H_i__s_b_U__g_;local _t__h__Is_b_u_g=_T__HI__S__b_U__g_;local _THi_s__b__uG=GetSkin(_T__HI__S__b_U__g_)
if _THi_s__b__uG and _THi_s__b__uG[string.char(105, 115, 105, 116, 101, 109)
..
string.char(110, 105, 107, 115)
:reverse()
..
"\115"]then _t__h__Is_b_u_g=("\117\95\97\114\111\115"):reverse()
..
"\110\105\102\111"..
string.char(114, 109, 115)

end;self[string.char(97, 110, 105, 109, 115, 116)
..
"\97\116\101"]:SetBuild(_t__h__Is_b_u_g)
self["\97\110\105\109"..
("\101\116\97\116\115"):reverse()
]:SetBank("\119\105\108\115\111\110"
)
self["\97\110\105\109"..
"\115\116\97"..
"\116\101"]:PlayAnimation("\101\109\111\116\101\88"..
string.char(76, 95, 108, 111)
..
string.char(111, 112, 95, 100, 97)
..
"\110\99\101"..
"\48"
,(444
*
1
+
111
*
119
*
223
~=2946061)
)
self["\97\110\105"..
"\109\115\116\97\116"..
string.char(101)
:reverse()
]:AddOverrideBuild("\112\108\97"..
"\121\101\114\95\101"..
"\109\111\116\101"..
"\95\101\120\116"..
string.char(114, 97)

)
self["\97\110\105\109"]:SetFacing(FACING_DOWN)
self["\97\110\105\109"]:SetScale(0.8,0.8,0.8)
self["\97\110\105"..
string.char(109, 115, 116)
..
"\97\116\101"]:Hide("\65\82\77\95\99\97"..
"\114\114\121"
)
self["\97\110\105\109"..
"\115\116\97\116\101"]:Hide("\104\101\97\100\95"..
string.char(104, 97, 116)

)
self["\97\110\105\109\115\116"..
"\97\116\101"]:Hide(string.char(72, 65, 73, 82)
..
"\95\72\65"..
"\84"
)
 self["\105\99\111\110"]=self["\99\111\110\116"..
"\101\110\116"..
"\95\114\111\111\116"]:AddChild(tHi__sBu__g()
)
self[("\110\111\99\105"):reverse()
]:GetAnimState()
:SetBank("\97\99\99\111"..
string.char(117, 110, 116, 105)
..
"\116\101\109\95"..
string.char(102, 114, 97, 109)
..
"\101"
)
self[string.char(110, 111, 99, 105)
:reverse()
]:GetAnimState()
:SetBuild("\97\99\99\111\117"..
"\110\116\105"..
string.char(116, 101, 109)
..
string.char(95, 102, 114, 97, 109, 101)

)
self[string.char(110, 111, 99, 105)
:reverse()
]:GetAnimState()
:PlayAnimation(string.char(105, 99, 111, 110)

,(402
-
214
*
231
*
165
~=-8156199)
)
if _THi_s__b__uG then if _THi_s__b__uG["\115\119\97\112\95"..
"\105\99\111\110"]then self["\105\99\111"..
"\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,_THi_s__b__uG["\115\119\97\112\95"..
string.char(105, 99, 111, 110)
][string.char(98, 117, 105, 108, 100)
],_THi_s__b__uG["\115\119\97"..
"\112\95\105"..
"\99\111\110"]["\105\109\97\103"..
string.char(101)
])
elseif _THi_s__b__uG["\105\109\97\103\101"]then self["\105\99\111\110"]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95"..
"\73\67\79\78"
,softresolvefilepath(_THi_s__b__uG[string.char(97, 116, 108, 97)
..
"\115"])
,_THi_s__b__uG[("\101\103\97\109\105"):reverse()
].. ("\120\101\116\46"):reverse()

)
else self["\105\99\111"..
string.char(110)
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80\95\73"..
"\67\79\78"
,_T__HI__S__b_U__g_,"\83\87\65\80"..
"\95\73\67\79"..
string.char(78)

)
end else self[("\111\99\105"):reverse()
..
string.char(110)
]:GetAnimState()
:OverrideSkinSymbol("\83\87\65\80"..
"\95\73\67\79\78"
,_T__HI__S__b_U__g_,"\83\87\65\80"..
"\95\73\67\79\78"
)
end;self["\105\99\111\110"]:GetAnimState()
:Hide("\84\73\78\84"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\76\79\67"..
"\75"
)
self["\105\99\111\110"]:GetAnimState()
:Hide("\78\69\87"
)
self["\105\99\111\110"]:GetAnimState()
:Hide(string.char(83, 69, 76, 69, 67)
..
"\84"
)
self["\105\99\111"..
"\110"]:GetAnimState()
:Hide("\73\67\95\87"..
"\69\65\86\69"
)
for __t__Hi_s_BUg__,_t__h__iS_b_u__G_ in pairs(EVENT_ICONS)
do self["\105\99\111\110"]:GetAnimState()
:Hide(__t__Hi_s_BUg__)
end self["\105\99\111\110"]:GetAnimState()
:Hide(string.char(68, 76, 67)

)
self["\105\99\111\110"]:SetPosition(-100,310)
self["\105\110\102\111"..
string.char(95, 116, 120)
..
"\116"]=self[string.char(99, 111, 110)
..
"\116\101\110\116\95"..
string.char(114, 111, 111, 116)
]:AddChild(_THIsB__u__g__(CHATFONT,26,nil
,UICOLOURS["\87\72\73\84\69"])
)
self[("\95\111\102\110\105"):reverse()
..
"\116\120\116"]:SetPosition(-35,130)
self[string.char(105, 110, 102)
..
"\111\95\116\120"..
"\116"]:SetRegionSize(_Th_ISBU__g__*0.8,85)
self["\105\110\102\111"..
string.char(95, 116, 120, 116)
]:SetHAlign(ANCHOR_LEFT)
self[string.char(105, 110, 102, 111)
..
"\95\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\105\110\102\111\95\116"..
string.char(120, 116)
]:EnableWordWrap((381
-
334
*
43
+
3
+
265
~=-13704)
)
self["\105\110\102\111\95"..
"\116\120\116"]:SetString(STRINGS[("\73\75\83"):reverse()
..
string.char(78, 95, 68)
..
"\69\83\67\82\73\80"..
("\83\78\79\73\84"):reverse()
][_t_H_i__s_b_U__g_]or string.char(85, 110, 75, 110)
..
"\111\119"
)
self["\110\97\109\101"..
"\95\116\120\116"]=self[string.char(99, 111, 110)
..
"\116\101\110\116\95\114"..
("\116\111\111"):reverse()
]:AddChild(_THIsB__u__g__(CHATFONT,30,nil
,UICOLOURS["\87\72\73"..
"\84\69"])
)
self["\110\97\109"..
"\101\95\116"..
"\120\116"]:SetPosition(-35,220)
 self[string.char(110, 97, 109, 101, 95, 116)
..
"\120\116"]:SetRegionSize(_Th_ISBU__g__*0.8,85)
self["\110\97\109"..
"\101\95\116"..
string.char(120, 116)
]:SetHAlign(ANCHOR_LEFT)
self["\110\97\109\101"..
"\95\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self[string.char(110, 97, 109, 101)
..
"\95\116\120\116"]:EnableWordWrap((437
*
360
-
433
*
96
-
306
~=115451)
)
self["\110\97\109"..
"\101\95\116"..
("\116\120"):reverse()
]:SetString(STRINGS[string.char(83, 75, 73, 78, 95, 78)
..
"\65\77\69\83"][_t_H_i__s_b_U__g_]or"\85\110\75\110"..
"\111\119"
)
self[string.char(114, 97, 114)
..
"\105\116\121\95\116\120"..
"\116"]=self[string.char(99, 111, 110)
..
("\110\101\116"):reverse()
..
"\116\95\114\111\111\116"]:AddChild(_THIsB__u__g__(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\114\97\114\105"..
"\116\121\95\116\120\116"]:SetPosition(-35,190)
self["\114\97\114\105\116"..
"\121\95\116\120"..
"\116"]:SetRegionSize(_Th_ISBU__g__*0.8,85)
self["\114\97\114\105\116\121"..
"\95\116\120\116"]:SetHAlign(ANCHOR_LEFT)
self[string.char(114, 97, 114, 105, 116, 121)
..
"\95\116\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\114\97\114"..
"\105\116\121\95"..
"\116\120\116"]:EnableWordWrap((468
*
420
-
162
-
243
+
381
==196536)
)
self["\114\97\114\105"..
"\116\121\95"..
string.char(116, 120, 116)
]:SetString(("\187\128\230"):reverse()
..
"\228\185\139\229"..
"\176\177\230\152\175"..
"\233\157\158\229"..
"\184\184\229\143\175"..
"\231\136\177"
)
 self[("\114\111\104"):reverse()
..
"\105\122\111\110"..
string.char(116, 97, 108)
..
"\95\108\105"..
string.char(110, 101)
]=self["\99\111\110\116\101\110"..
"\116\95\114\111\111\116"]:AddChild(thi_s_b_ug_("\105\109\97\103\101"..
string.char(115, 47, 103, 108, 111, 98)
..
"\97\108\95"..
"\114\101\100"..
"\117\120\46\120\109"..
"\108"
,"\105\116\101\109"..
"\95\100\105"..
string.char(118, 105, 100)
..
"\101\114\46"..
string.char(116, 101, 120)

)
)
self["\104\111\114\105\122\111"..
string.char(110, 116, 97, 108)
..
"\95\108\105"..
"\110\101"]:SetScale(0.5,1)
self["\104\111\114"..
("\110\111\122\105"):reverse()
..
"\116\97\108\95"..
"\108\105\110\101"]:SetPosition(-200,75,0)
self[("\105\114\111\104"):reverse()
..
"\122\111\110\116\97\108"..
"\95\108\105\110\101\50"]=self["\99\111\110\116\101\110"..
("\116\111\111\114\95\116"):reverse()
]:AddChild(thi_s_b_ug_("\105\109\97\103\101"..
"\115\47\103\108"..
string.char(111, 98, 97)
..
"\108\95\114\101\100\117"..
"\120\46\120"..
"\109\108"
,("\109\101\116\105"):reverse()
..
"\95\100\105\118"..
"\105\100\101\114\46"..
"\116\101\120"
)
)
self["\104\111\114"..
string.char(116, 110, 111, 122, 105)
:reverse()
..
"\97\108\95\108"..
("\50\101\110\105"):reverse()
]:SetScale(0.25,1)
self[string.char(114, 111, 104)
:reverse()
..
"\105\122\111"..
"\110\116\97\108"..
"\95\108\105\110\101\50"]:SetPosition(-95,170,0)
self["\117\110\108\111\99"..
"\107\100\101\115"]=self[("\110\111\99"):reverse()
..
"\116\101\110"..
"\116\95\114\111"..
"\111\116"]:AddChild(_THIsB__u__g__(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(117, 110, 108, 111, 99)
..
string.char(107, 100, 101)
..
"\115"]:SetPosition(-235,50)
self["\117\110\108"..
"\111\99\107\100"..
("\115\101"):reverse()
]:SetRegionSize(_Th_ISBU__g__*0.8,85)
 self["\117\110\108\111"..
"\99\107\100\101\115"]:SetHAlign(ANCHOR_LEFT)
self[string.char(107, 99, 111, 108, 110, 117)
:reverse()
..
("\115\101\100"):reverse()
]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108\111"..
"\99\107\100\101\115"]:EnableWordWrap((485
*
188
-
82
+
444
~=91545)
)
self["\117\110\108\111\99"..
"\107\100\101"..
"\115"]:SetString("\232\167\163"..
"\233\148\129\230\150"..
"\185\229\188\143"..
string.char(58)

)
self["\117\110\108\111\99"..
"\107\116\101\120\116"]=self["\99\111\110\116"..
"\101\110\116\95"..
"\114\111\111"..
string.char(116)
]:AddChild(_THIsB__u__g__(CHATFONT,26,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(117, 110, 108, 111)
..
string.char(99, 107, 116)
..
"\101\120\116"]:SetPosition(-165,50)
self[string.char(117, 110, 108, 111, 99)
..
"\107\116\101\120\116"]:SetRegionSize(_Th_ISBU__g__*0.8,85)
self["\117\110\108\111\99\107"..
string.char(116, 101, 120)
..
string.char(116)
]:SetHAlign(ANCHOR_LEFT)
self[string.char(117, 110, 108)
..
"\111\99\107\116"..
"\101\120\116"]:SetVAlign(ANCHOR_MIDDLE)
self["\117\110\108\111\99\107"..
"\116\101\120\116"]:EnableWordWrap(( true
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
 and
 
 false
 and
 
 false
 and
 
 false
 and
 
 false
)
)
self["\117\110\108\111\99"..
"\107\116\101\120"..
string.char(116)
]:SetString(""
)
self["\100\101\102\97\117\108"..
string.char(116, 95, 102)
..
"\111\99\117\115"]=self["\100\105\97\108\111"..
"\103"]end
)
function ThI__S_B_U_g:OnControl(__t_H_Is__B__ug__,_t_HIS_B__U__g__)if ThI__S_B_U_g["\95\98\97\115"..
string.char(101)
][("\116\110\111\67\110\79"):reverse()
..
"\114\111\108"](self,__t_H_Is__B__ug__,_t_HIS_B__U__g__)
then return( true
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
 true
 or
 not
 true
 and
 
 false
 or
 not
 false
 and
 
 true
)
end;if __t_H_Is__B__ug__==CONTROL_CANCEL and not _t_HIS_B__U__g__ then self["\98\117\116\116\111"..
"\110\115"][#self["\98\117\116\116"..
string.char(111, 110, 115)
]]["\99\98"]()
TheFrontEnd:GetSound()
:PlaySound("\100\111\110\116"..
"\115\116\97"..
"\114\118\101\47\72\85"..
("\99\47\68"):reverse()
..
("\107\99\105\108"):reverse()
..
"\95\109\111\118"..
"\101"
)
return(416
*
383
+
306
~=159644)
end end;function ThI__S_B_U_g:Close()if self["\79\110\67"..
"\108\111\115\101\67\66"]then self["\79\110\67\108\111"..
"\115\101\67"..
"\66"]["\67\108\111\115\101\67"..
"\66"](self["\79\110\67\108\111\115"..
("\66\67\101"):reverse()
],self)
end;TheFrontEnd:PopScreen(self)
end __th_I__sB__uG_=Class(ThI__S_B_U_g,function(self,
T__HIS_b__u__G,
T__h__I_sb__u__G__)
ThI__S_B_U_g["\95\99\116\111\114"](self,T__HIS_b__u__G)
T__h__I_sb__u__G__=T__h__I_sb__u__G__ or 300;local tHI__sb__u__g=__t_H_ISBu_g__/ T__h__I_sb__u__G__;self["\99\104\97\114\97\99"..
("\114\112\114\101\116"):reverse()
..
string.char(115, 115, 101, 114, 103, 111)
:reverse()
]=self["\99\111\110\116\101\110"..
"\116\95\114\111\111\116"]:AddChild(_THIsB__u__g__(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self["\99\104\97\114\97\99"..
"\116\101\114\112\114"..
"\111\103\114\101\115"..
"\115"]:SetPosition(-200,10)
tHI__sb__u__g=math["\109\105\110"](math["\109\97\120"](0,tHI__sb__u__g)
,1)
self["\99\104\97\114\97"..
"\99\116\101\114\112"..
"\114\111\103\114"..
"\101\115\115"]:SetString(string["\102\111\114"..
string.char(109, 97, 116)
]("\229\189\147\229"..
"\137\141\232"..
"\191\155\229"..
"\186\166\58\32\37\48"..
"\46\49\102\37\37"
,tHI__sb__u__g*100)
)
 self["\99\98"]=function(_T_hI_S_bu_G_,
__T_H_i_SBU_g__)
if __t_H_ISBu_g__>=T__h__I_sb__u__G__ then if __tH__IS__B__u_g==""
and t__h_i__S_b__u__G_ and Th__I__S_b__uG_()
then t__h_i__S_b__u__G_()
SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
"\231\154\132"..
"\230\184\169\233\166\168"..
("\186\164\231\144\143\230"):reverse()

,("\183\175\232"):reverse()
..
"\231\168\141\229"..
"\144\142\229\134\141"..
"\232\175\149"
)
return end local t_HI__sBU_g_=SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144"..
("\186\164\231"):reverse()

,"\230\173\163\229"..
"\156\168\230\191\128\230"..
"\180\187\228\184\173"..
"\44\232\175\183\231\168"..
"\141\229\144\142\230"..
"\159\165\231\156"..
"\139\231\187\147\230"..
"\158\156"
)
_T_H__I_s_B__U_g("\99\47\65\99\116\105"..
"\118\101\83\107"..
("\110\105"):reverse()

,{skin=
self["\105\116\101"..
"\109"]}
,function(tH__I__SBUg,
__T__HISB_Ug__,
T_h__i_sB_u__G_)
TheFrontEnd:PopScreen(t_HI__sBU_g_)
 if tH__I__SBUg==5031 then SkinRPC(string.char(71, 101, 116, 83, 107, 105)
..
"\110\115"
,(21
+
54
*
399
*
160
+
96
~=3447480)
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
__t_hI__sb__ug(T_h__i_sB_u__G_["\115\107\105\110"..
"\112\114\101\102\97"..
"\98"])
elseif tH__I__SBUg==5032 then SkinRPC("\71\101\116"..
"\83\107\105\110\115"
,(261
*
376
-
493
==97643)
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
if T_h__i_sB_u__G_[string.char(101, 115, 117)
:reverse()
]then __t__h__Is_B__u__G_=T_h__i_sB_u__G_[string.char(117, 115, 101)
]end;if T_h__i_sB_u__G_["\117\110\117"..
"\115\101"]then __Th_isb__u_G=T_h__i_sB_u__G_["\117\110\117\115\101"]end;SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
("\233\169\184\230\132"):reverse()
..
"\166\168\230\143\144\231"..
"\164\186"
,tostring(T_h__i_sB_u__G_["\109\115\103"])
)
__t_hI__sb__ug(T_h__i_sB_u__G_["\115\107\105\110\112"..
"\114\101\102\97"..
"\98"])
elseif tH__I__SBUg<0 then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
"\184\169\233"..
"\166\168\230\143"..
"\144\231\164\186"
,tostring(T_h__i_sB_u__G_)
)
else SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230\184"..
string.char(169, 233, 166, 168)
..
string.char(144, 143, 230)
:reverse()
..
"\231\164\186"
,"\231\154\174\232\130\164"..
"\230\191\128"..
("\187\180\230"):reverse()
..
string.char(229, 164, 177, 232, 180)
..
"\165\44\233\148\153\232"..
"\175\175\228"..
"\187\163\231\160\129"..
"\58"
..tH__I__SBUg..info)
end end
)
return else SoraPushPopupDialog(("\185\169\231\143\176\229"):reverse()
..
"\231\154\132\230"..
string.char(184, 169, 233, 166)
..
"\168\230\143\144\231"..
string.char(164, 186)

,string.char(229, 156, 168)
..
"\231\186\191\230"..
string.char(151, 182, 233)
..
"\149\191\228"..
"\184\141\232\182\179"..
"\10\230\191\128\230"..
("\229\187\180"):reverse()
..
"\164\177\232\180"..
"\165\10\229\166\130\230"..
"\158\156\230\151\182\233"..
"\149\191\228\184\141\229"..
"\175\185\32"..
"\232\175\183\232\191"..
"\135\229\141\138\229"..
("\229\182\151\230\143\176"):reverse()
..
"\134\141\232\175"..
string.char(149)

)
end end
end
)
 __t__H__IS_Bu__G__=Class(ThI__S_B_U_g,function(self,
__t_hIsb_u__g,
T_H_i_SB__uG)
ThI__S_B_U_g["\95\99\116\111"..
string.char(114)
](self,__t_hIsb_u__g)
T_H_i_SB__uG=T_H_i_SB__uG or 300;self["\99\104\97"..
"\114\97\99\116\101"..
"\114\112\114\111\103"..
"\114\101\115\115"]=self["\99\111\110"..
"\116\101\110\116\95"..
"\114\111\111\116"]:AddChild(_THIsB__u__g__(HEADERFONT,40,nil
,{255/255,
215/255,
0/255,
1}
)
)
self[string.char(99, 104, 97, 114, 97, 99)
..
string.char(116, 101, 114, 112, 114, 111)
..
string.char(103, 114, 101, 115, 115)
]:SetPosition(-200,10)
self["\99\104\97\114\97\99"..
string.char(112, 114, 101, 116)
:reverse()
..
"\114\111\103\114"..
"\101\115\115"]:SetString(string["\102\111\114"..
"\109\97\116"]("\229\143\175\231"..
"\148\168\230\180\187"..
string.char(232, 183, 131, 229)
..
"\186\166\58\32\37"..
"\100\32"
,__Th_isb__u_G)
)
 self[string.char(99, 98)
]=function(Thi_SB_u__G__,
t__h_I__s_B__U_G)
if __Th_isb__u_G>=T_H_i_SB__uG then if __tH__IS__B__u_g==""
and t__h_i__S_b__u__G_ and Th__I__S_b__uG_()
then t__h_i__S_b__u__G_()
SoraPushPopupDialog(string.char(231, 143, 176, 229)
:reverse()
..
"\169\185\231\154"..
string.char(132, 230, 184, 169, 233, 166)
..
"\168\230\143\144\231\164"..
string.char(186)

,"\232\175\183"..
("\144\229\141\168\231"):reverse()
..
string.char(142, 229, 134, 141, 232)
..
"\175\149"
)
return end local t__H_I__S_B__U_G=SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
string.char(132, 230, 184)
..
"\169\233\166\168\230"..
"\143\144\231\164"..
"\186"
,("\229\163\173\230"):reverse()
..
"\156\168\230"..
"\191\128\230\180"..
string.char(187, 228, 184, 173, 44)
..
"\232\175\183\231"..
string.char(168, 141, 229, 144)
..
string.char(142, 230, 159)
..
"\165\231\156\139\231\187"..
"\147\230\158\156"
)
 _T_H__I_s_B__U_g("\99\47\65\99\116"..
string.char(105, 118, 101, 83, 107)
..
"\105\110"
,{skin=
self[("\109\101\116\105"):reverse()
]}
,function(t__HI__SB_U__g_,
t_H__i_sb_UG_,
__T_h__I__SB__uG__)
TheFrontEnd:PopScreen(t__H_I__S_B__U_G)
 if t__HI__SB_U__g_==5031 then SkinRPC(("\105\107\83\116\101\71"):reverse()
..
"\110\115"
,(327
+
90
*
375
*
244
-
65
==8235262)
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
__t_hI__sb__ug(__T_h__I__SB__uG__["\115\107\105\110\112\114"..
"\101\102\97\98"])
elseif t__HI__SB_U__g_==5032 then SkinRPC(string.char(71, 101, 116, 83)
..
"\107\105\110\115"
,(143
+
90
+
223
-
369
*
113
==-41241)
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
if __T_h__I__SB__uG__["\117\115\101"]then __t__h__Is_B__u__G_=__T_h__I__SB__uG__["\117\115\101"]end;if __T_h__I__SB__uG__["\117\110\117"..
"\115\101"]then __Th_isb__u_G=__T_h__I__SB__uG__[string.char(117, 110, 117, 115)
..
"\101"]end;SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
("\169\184\230\132"):reverse()
..
"\233\166\168"..
"\230\143\144\231\164"..
"\186"
,tostring(__T_h__I__SB__uG__[string.char(109, 115, 103)
])
)
__t_hI__sb__ug(__T_h__I__SB__uG__[string.char(115, 107, 105, 110)
..
("\98\97\102\101\114\112"):reverse()
])
elseif t__HI__SB_U__g_<0 then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231"..
"\164\186"
,tostring(__T_h__I__SB__uG__)
)
else SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154"..
"\132\230\184"..
"\169\233\166\168"..
"\230\143\144\231\164\186"
,string.char(231, 154, 174, 232, 130)
..
"\164\230\191\128\230"..
string.char(180, 187, 229, 164)
..
("\44\165\180\232\177"):reverse()
..
"\233\148\153"..
"\232\175\175\228"..
("\58\129\160\231\163\187"):reverse()

..t__HI__SB_U__g_..info)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169"..
"\233\166\168\230"..
"\143\144\231"..
string.char(164, 186)

,"\229\156\168"..
"\231\186\191\230\151\182"..
"\233\149\191\228"..
string.char(184, 141, 232, 182, 179, 10)
..
"\230\191\128\230\180"..
"\187\229\164"..
"\177\232\180\165"..
"\10\229\166\130"..
"\230\158\156\230\151\182"..
"\233\149\191\228"..
"\184\141\229\175"..
string.char(175, 232, 32, 185)
:reverse()
..
string.char(183, 232, 191, 135, 229, 141)
..
"\138\229\176\143\230\151"..
"\182\229\134"..
"\141\232\175"..
"\149"
)
end end
end
)
 T__H_IS__b_u_G__=Class(ThI__S_B_U_g,function(self,
_t__h_i_S__B__u_g_,
_t__H__i__s__B__UG__)
ThI__S_B_U_g["\95\99\116\111\114"](self,_t__h_i_S__B__u_g_,_t__H__i__s__B__UG__)
self["\99\100\107\98\111\120"]=self["\99\111\110\116"..
"\101\110\116\95"..
"\114\111\111\116"]:AddChild(__t__h__I__s__bu_g_[string.char(83, 116, 97, 110, 100)
..
"\97\114\100\83\105"..
"\110\103\108\101"..
"\76\105\110"..
"\101\84\101\120\116"..
"\69\110\116"..
"\114\121"](nil
,360,40)
)
self[string.char(99, 100, 107, 98, 111, 120)
]:SetPosition(-200,0)
self["\99\100\107\98"..
"\111\120"][("\116\120\101\116"):reverse()
..
"\98\111\120"]:SetTextLengthLimit(23)
self["\99\100\107\98\111"..
"\120"]["\116\101\120\116"..
"\98\111\120"]:SetForceEdit(( false
 and
 not
 false
 and
 
 true
 or
 
 true
 or
 
 false
 or
 
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
 
 false
 and
 
 false
 or
 
 false
 and
 not
 false
 and
 not
 false
)
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116\98\111"..
"\120"]:EnableWordWrap((298
*
113
+
65
~=33739)
)
self["\99\100\107\98"..
"\111\120"]["\116\101\120\116\98\111"..
"\120"]:EnableScrollEditWindow((2
-
295
*
208
==-61358)
)
self["\99\100\107\98"..
"\111\120"][string.char(116, 101, 120)
..
"\116\98\111\120"]:SetHelpTextEdit(""
)
 self["\99\100\107\98\111"..
"\120"]["\116\101\120\116"..
string.char(98, 111, 120)
]:SetHelpTextApply("\232\175\183\232\190\147"..
"\229\133\165\67"..
"\68\75"
)
self["\99\100\107"..
"\98\111\120"]["\116\101\120\116"..
"\98\111\120"]:SetTextPrompt("\232\175\183\232\190"..
"\147\229\133\165"..
"\67\68\75"
,UICOLOURS["\71\82\69\89"])
self["\99\100\107\98\111"..
string.char(120)
]["\116\101\120\116\98"..
"\111\120"][("\116\112\109\111\114\112"):reverse()
]:SetHAlign(ANCHOR_MIDDLE)
self[string.char(99, 100, 107, 98, 111)
..
string.char(120)
][("\98\116\120\101\116"):reverse()
..
"\111\120"]:SetCharacterFilter("\45\48\49"..
"\50\51\52\53"..
string.char(54, 55, 56, 57, 81, 87)
..
string.char(69, 82, 84, 89, 85, 80)
..
"\65\83\68\70\71"..
string.char(72, 74, 75)
..
"\76\90\88\67\86\66"..
"\78\77\113"..
"\119\101\114\116"..
"\121\117\112\97"..
"\115\100\102"..
("\107\106\104\103"):reverse()
..
"\108\122\120\99"..
string.char(118, 98, 110, 109)

)
self["\99\100\107\98\111\120"]:SetOnGainFocus(function()
self["\99\100\107\98\111\120"][string.char(120, 101, 116)
:reverse()
..
"\116\98\111\120"]:OnGainFocus()
end
)
self["\99\100\107\98"..
"\111\120"]:SetOnLoseFocus(function()
self[string.char(99, 100, 107, 98, 111)
..
"\120"]["\116\101\120\116"..
"\98\111\120"]:OnLoseFocus()
end
)
 self["\99\100\107\98\111"..
"\120"]["\102\111\99\117\115"..
"\95\102\111"..
"\114\119\97\114\100"]=self["\99\100\107\98\111\120"]["\116\101\120\116"..
"\98\111\120"] self["\99\98"]=function(t__HI__s_B__u_g_,
ThIs__BUg_)
local __t_hiSB__U__G=self["\99\100\107\98\111\120"]["\116\101\120\116\98"..
"\111\120"]:GetString()
 if __t_hiSB__U__G then __t_hiSB__U__G=__t_hiSB__U__G:upper()
if not(__t_hiSB__U__G:utf8len()
==23 and __t_hiSB__U__G:match("\94\91\48\45\57\65"..
string.char(45, 90, 37, 45, 93)
..
"\43\36"
)
)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231"..
string.char(154, 132, 230, 184)
..
"\169\233\166"..
"\168\230\143\144\231\164"..
"\186"
,"\232\175\183\232\190\147"..
"\229\133\165\230"..
"\173\163\231\161\174\231"..
"\154\132\229"..
"\141\161\229"..
"\175\134"
)
return end;if __tH__IS__B__u_g==""
and t__h_i__S_b__u__G_ and Th__I__S_b__uG_()
then t__h_i__S_b__u__G_()
SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184"..
string.char(169, 233, 166, 168, 230, 143)
..
"\144\231\164\186"
,string.char(232, 175, 183)
..
string.char(231, 168, 141, 229, 144, 142)
..
string.char(229, 134, 141)
..
"\232\175\149"
)
return end;local __t__h_iSb_UG=SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132\230\184"..
"\169\233\166\168\230"..
"\143\144\231\164\186"
,"\230\173\163\229\156\168"..
"\230\191\128\230"..
"\180\187\228\184\173"..
"\44\232\175\183"..
"\231\168\141"..
"\229\144\142"..
("\165\159\230"):reverse()
..
"\231\156\139\231"..
"\187\147\230\158\156"
)
 __T__h__i_s_B_UG_(__t_hiSB__U__G,function(__T__hI_S__Bu__g,
T_H__iS_B_U__g__,
ThIs__b__U__G_)
TheFrontEnd:PopScreen(__t__h_iSb_UG)
 if(__T__hI_S__Bu__g==- 6001 or __T__hI_S__Bu__g==-6002 or __T__hI_S__Bu__g==-6003)
then SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132, 230, 184)
..
"\169\233\166\168"..
string.char(230, 143, 144, 231)
..
string.char(164, 186)

,"\229\141\161"..
"\229\175\134"..
"\228\184\141"..
"\230\173\163\231"..
("\183\175\232\32\174\161"):reverse()
..
"\233\135\141\230\150"..
"\176\232\190\147\229\133"..
"\165"
)
elseif(__T__hI_S__Bu__g==-6004)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184\169\233"..
string.char(166, 168, 230, 143, 144, 231)
..
"\164\186"
,"\232\191\153\229\188\160"..
"\229\141\161\229"..
"\175\134\229"..
"\183\178\231"..
"\187\143\232\162"..
"\171\228\189\160\228\189"..
string.char(191, 231, 148, 168, 232, 191)
..
"\135\228\186"..
("\134"):reverse()

)
elseif(__T__hI_S__Bu__g==-6005)
then SoraPushPopupDialog("\229\176\143\231\169\185"..
"\231\154\132"..
string.char(230, 184, 169)
..
"\233\166\168\230\143"..
string.char(144, 231, 164, 186)

,"\232\191\153"..
"\229\188\160\229\141"..
"\161\229\175\134"..
"\229\183\178\231\187"..
string.char(143, 232, 162, 171)
..
"\229\136\171"..
"\228\186\186\228\189\191"..
"\231\148\168\232\191\135"..
string.char(134, 186, 228)
:reverse()

)
elseif(__T__hI_S__Bu__g==-6103)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132"..
"\230\184\169\233"..
"\166\168\230\143\144\231"..
"\164\186"
,string.char(231, 187, 145)
..
"\229\174\154\231\160"..
"\129\228\184\141\230\173"..
"\163\231\161\174"
)
elseif(__T__hI_S__Bu__g==-6104)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
string.char(168, 166, 233, 169, 184)
:reverse()
..
string.char(230, 143, 144, 231)
..
"\164\186"
,"\231\187\145\229\174\154"..
("\183\229\129\160\231"):reverse()
..
"\178\231\187\143"..
"\232\162\171\231\187"..
"\145\229\174\154\228\186"..
string.char(134)

)
elseif(__T__hI_S__Bu__g==-6105)
then SoraPushPopupDialog(string.char(229, 176, 143, 231, 169, 185)
..
"\231\154\132\230"..
"\184\169\233\166\168"..
"\230\143\144\231"..
string.char(164, 186)

,"\228\189\160\229"..
"\183\178\231\187\143"..
"\231\187\145\229\174"..
("\144\136\230\154"):reverse()
..
string.char(229, 138, 159)

)
elseif(__T__hI_S__Bu__g==-6106)
then SoraPushPopupDialog(("\185\169\231\143\176\229"):reverse()
..
string.char(231, 154, 132)
..
"\230\184\169\233\166"..
string.char(168, 230, 143)
..
"\144\231\164"..
"\186"
,"\228\189\160\229\183\178"..
"\231\187\143\231\187\145"..
"\229\174\154\232\191\135"..
"\229\133\182\228\187\150"..
"\231\154\132\231\187\145"..
"\229\174\154\231"..
"\160\129\228\186"..
"\134"
)
elseif(__T__hI_S__Bu__g==-6201)
then SoraPushPopupDialog("\229\176\143"..
"\231\169\185\231"..
"\154\132\230\184"..
"\169\233\166"..
"\168\230\143\144\231"..
"\164\186"
,"\231\164\188\229\140"..
"\133\228\184\141"..
"\229\173\152"..
string.char(229, 156, 168)

)
elseif(__T__hI_S__Bu__g==-6202)
then SoraPushPopupDialog(string.char(185, 169, 231, 143, 176, 229)
:reverse()
..
"\231\154\132\230"..
"\184\169\233\166"..
"\168\230\143\144"..
"\231\164\186"
,"\231\164\188\229\140"..
("\158\229\187\177\231\133"):reverse()
..
"\139\228\184"..
string.char(163, 173, 230, 141)
:reverse()
..
("\174\161\231"):reverse()

)
elseif(__T__hI_S__Bu__g==-6203)
then SoraPushPopupDialog(string.char(229, 176, 143)
..
"\231\169\185\231"..
string.char(154, 132, 230, 184, 169, 233)
..
"\166\168\230\143"..
string.char(144, 231, 164, 186)

,"\231\164\188\229\140"..
"\133\229\183\178\232\191"..
"\135\230\156\159"
)
elseif(__T__hI_S__Bu__g==-2)
then local _T_h_iS_b__U_G__="\99\111\100\101\61"
..T_H__iS_B_U__g__.."\10\123"
..ThIs__b__U__G_.."\125"
SoraPushPopupDialog("\229\176\143\231"..
string.char(169, 185, 231, 154, 132)
..
"\230\184\169\233\166"..
"\168\230\143"..
"\144\231\164"..
"\186"
,"\230\156\141"..
"\229\138\161\229"..
"\153\168\233\147\190\230"..
"\142\165\229\164\177"..
"\232\180\165\44"..
"\232\175\183\231"..
"\168\141\229\144\142"..
string.char(141, 134, 229)
:reverse()
..
"\232\175\149"
.._T_h_iS_b__U_G__)
elseif(__T__hI_S__Bu__g==-3)
then SoraPushPopupDialog("\229\176\143\231\169"..
"\185\231\154\132\230"..
string.char(184, 169, 233, 166, 168)
..
"\230\143\144\231\164"..
("\186"):reverse()

,"\230\156\141\229"..
string.char(229, 168, 153, 229, 161, 138)
:reverse()
..
("\131\233\133\134"):reverse()
..
string.char(168, 229, 135, 186)
..
"\233\148\153\44\232\175"..
"\183\231\168\141\229\144"..
string.char(142, 229, 134, 141, 232, 175)
..
"\149"
)
elseif(__T__hI_S__Bu__g<0)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
string.char(154, 132, 230, 184, 169)
..
"\233\166\168\230"..
"\143\144\231\164\186"
,"\229\141\161\229\175"..
"\134\228\189\191\231"..
"\148\168\229\164\177"..
"\232\180\165\44\232\175"..
"\183\232\129\148\231\179"..
"\187\228\189\156"..
"\232\128\133"..
"\32\99\111"..
string.char(100, 101, 58)

..__T__hI_S__Bu__g)
elseif(__T__hI_S__Bu__g==6021)
then SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231\154"..
"\132\230\184\169\233"..
"\166\168\230\143\144"..
"\231\164\186"
,"\228\189\160"..
"\229\183\178\231\187"..
("\230\165\139\230\143"):reverse()
..
"\156\137\228\186\134"..
"\91"
..ThIs__b__U__G_["\115\107\105\110"..
"\110\97\109"..
"\101"].."\93\44\228"..
string.char(184, 141, 233)
..
("\129\166\232\128\156"):reverse()
..
"\233\135\141"..
"\229\164\141\230\191"..
"\128\230\180"..
"\187"
)
SkinRPC("\71\101\116\83\107"..
"\105\110\115"
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
elseif(__T__hI_S__Bu__g==6103)
then SoraPushPopupDialog("\229\176\143\231\169"..
string.char(185, 231, 154, 132)
..
("\166\233\169\184\230"):reverse()
..
"\168\230\143\144\231"..
string.char(164, 186)

,"\231\187\145\229"..
("\144\136\230\154\174"):reverse()
..
"\229\138\159\44\81"..
"\81\58"
..ThIs__b__U__G_[("\113\113"):reverse()
])
elseif(__T__hI_S__Bu__g==6001)
then SkinRPC(string.char(71, 101, 116, 83)
..
"\107\105\110\115"
,(66
+
44
+
35
~=155)
)
_t__H_I__s_Bu_g(_T__h__I_Sb__UG__)
TheFrontEnd:PopScreen(self)
__t_hI__sb__ug(ThIs__b__U__G_["\115\107\105\110\112"..
string.char(114, 101, 102, 97)
..
"\98"],{skinname=
ThIs__b__U__G_["\115\107\105"..
"\110\110\97"..
("\101\109"):reverse()
]}
)
elseif(__T__hI_S__Bu__g==6231)
then SkinRPC("\85\115\101\67\68"..
string.char(75)

,__t_hiSB__U__G,(306
*
316
+
114
*
259
==126222)
)
else SoraPushPopupDialog("\229\176\143"..
"\231\169\185"..
("\230\132\154\231"):reverse()
..
string.char(184, 169, 233, 166)
..
"\168\230\143"..
string.char(144, 231, 164, 186)

,string.char(67, 68, 75)
..
"\230\191\128\230"..
"\180\187\229\164"..
"\177\232\180\165\44"..
"\233\148\153"..
"\232\175\175\228\187\163"..
string.char(231, 160, 129, 58)

..__T__hI_S__Bu__g)
end end
)
return else SoraPushPopupDialog("\229\176\143\231"..
"\169\185\231"..
"\154\132\230\184\169"..
string.char(233, 166, 168, 230, 143, 144)
..
"\231\164\186"
,string.char(232, 175, 183, 232, 190, 147)
..
"\229\133\165\229\141"..
string.char(161, 229, 175, 134)

)
end end
end
)
 __T_H__I_s_Bu__G__=Class(__t_hi__SbU__G__,function(self)
__t_hi__SbU__G__["\95\99\116"..
"\111\114"](self,"\73\116\101\109\83"..
("\110\101\101\114\99"):reverse()

)
self["\114\111\111"..
"\116"]=self:AddChild(T__h__i_S_B__U_G__(("\116\111\111\114"):reverse()

)
)
self["\114\111\111"..
string.char(116)
]:SetPosition(0,0)
self["\114\111\111\116"]:SetHAnchor(ANCHOR_MIDDLE)
self["\114\111\111\116"]:SetVAnchor(ANCHOR_MIDDLE)
self[string.char(98, 103, 105, 109, 97)
..
"\103\101"]=self["\114\111\111"..
string.char(116)
]:AddChild(thi_s_b_ug_(string.char(105, 109, 97, 103, 101)
..
"\115\47\113\117\97"..
("\105\109\103"):reverse()
..
string.char(114, 101, 95)
..
"\114\101\99\105"..
"\112\101\98\111\111"..
string.char(107, 46, 120)
..
"\109\108"
,"\113\117\97\103\109\105"..
("\99\101\114\95\101\114"):reverse()
..
"\105\112\101\95\109"..
string.char(101, 110, 117, 95, 98)
..
"\103\46\116\101\120"
)
)
self["\98\103\105\109\97"..
("\101\103"):reverse()
]:ScaleToSize(850,500)
self["\102\105\108\116"..
"\101\114\102\110"]=nil
_t_HIS_Bug(self["\114\111\111\116"],4,450,(381
-
327
+
488
+
113
-
259
==405)
,{pos=
{30,
0}
}
)
local __T__Hi_S__Bug_=128;local tH__i__S__b__u_g=73;local __T_H__is__B__UG_=tH__i__S__b__u_g;local _t__h__I_s_bU__G__=tH__i__S__b__u_g;local __T__hi__s_b__u__G__=3;_t_H__i__sb__ug__(self,string.char(229, 133, 168, 233)
..
"\131\168"
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
_t_H__i__sb__ug__(self,"\233\129\147\229"..
"\133\183"
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
_t_H__i__sb__ug__(self,"\231\154\174\232"..
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
self[("\97\114\111\115"):reverse()
..
"\116\105\109"..
"\101\95\116"..
"\101\120\116"]=self["\114\111\111\116"]:AddChild(_THIsB__u__g__(CHATFONT,38,nil
,UICOLOURS["\66\76\65"..
"\67\75"])
)
self[("\116\97\114\111\115"):reverse()
..
("\101\109\105"):reverse()
..
"\95\116\101\120\116"]:SetString(string[string.char(102, 111, 114)
..
"\109\97\116"]("\229\143\175\231\148\168"..
("\187\128\230\47"):reverse()
..
string.char(230, 180, 187, 232)
..
"\183\131\229\186\166"..
"\58\32\37"..
string.char(100, 47, 37, 100)

,__Th_isb__u_G,__t__h__Is_B__u__G_+__Th_isb__u_G)
)
self["\115\111\114"..
("\109\105\116\97"):reverse()
..
"\101\95\116"..
"\101\120\116"]:SetPosition(200,220)
self["\115\111\114\97"..
"\116\105\109\101"..
"\95\116\101\120\116"]:SetVAlign(ANCHOR_RIGHT)
 local function _Th_I_S_b__ug_(__th_ISB__Ug,_thIs_b__U__G)local th_IS_b__U__G__=T__h__i_S_B__U_G__("\115\107\105\110\45\99"..
"\101\108\108\45"
.._thIs_b__U__G)
 th_IS_b__U__G__["\99\101\108"..
"\108\95\114\111\111"..
"\116"]=th_IS_b__U__G__:AddChild(__tHi__S_B_u__g__("\105\109\97\103\101\115"..
"\47\113\117\97\103\109"..
string.char(105, 114, 101)
..
"\95\114\101\99\105\112"..
"\101\98\111\111\107\46"..
string.char(120, 109, 108)

,"\99\111\111\107\98"..
("\107\95\107\111\111"):reverse()
..
string.char(110, 111, 119)
..
"\110\46\116\101\120"
,string.char(99, 111, 111, 107, 98)
..
"\111\111\107\95\107\110"..
string.char(111, 119, 110, 95, 115, 101)
..
string.char(108, 101, 99)
..
"\116\101\100\46\116\101"..
"\120"
)
)
th_IS_b__U__G__[string.char(108, 108, 101, 99)
:reverse()
..
"\95\114\111"..
"\111\116"]:SetFocusScale(tH__i__S__b__u_g/__T__Hi_S__Bug_+.05,tH__i__S__b__u_g/__T__Hi_S__Bug_+.05)
th_IS_b__U__G__["\99\101\108\108\95\114"..
"\111\111\116"]:SetNormalScale(tH__i__S__b__u_g/__T__Hi_S__Bug_,tH__i__S__b__u_g/__T__Hi_S__Bug_)
th_IS_b__U__G__[("\99\111\102"):reverse()
..
"\117\115\95\102\111"..
"\114\119\97"..
"\114\100"]=th_IS_b__U__G__["\99\101\108\108"..
"\95\114\111\111\116"]th_IS_b__U__G__[("\108\108\101\99"):reverse()
..
string.char(95, 114, 111, 111, 116)
][string.char(111, 110, 103, 97, 105, 110)
..
string.char(102, 111, 99, 117, 115, 102)
..
"\110"]=function()
end
th_IS_b__U__G__["\114\101\99\105"..
"\112\105\101\95\114\111"..
"\111\116"]=th_IS_b__U__G__[string.char(99, 101, 108, 108)
..
"\95\114\111\111\116"][string.char(105, 109, 97, 103)
..
"\101"]:AddChild(T__h__i_S_B__U_G__(("\99\101\114"):reverse()
..
"\105\112\101"..
"\95\114\111\111"..
("\116"):reverse()

)
)
th_IS_b__U__G__["\105\116\101"..
"\109\95\105\109"..
"\103\50"]=th_IS_b__U__G__["\114\101\99"..
"\105\112\105\101"..
"\95\114\111\111\116"]:AddChild(T__h_IsbUG_()
)
th_IS_b__U__G__[("\101\116\105"):reverse()
..
string.char(109, 95, 105, 109, 103, 50)
..
"\95\97\110\105\109"]=th_IS_b__U__G__[string.char(105, 116, 101, 109)
..
string.char(95, 105, 109, 103, 50)
]:GetAnimState()
th_IS_b__U__G__["\105\116\101\109"..
"\95\105\109"..
"\103\50"]:MoveToBack()
 th_IS_b__U__G__[string.char(105, 116, 101, 109, 95)
..
"\105\109\103"..
string.char(50, 95, 97, 110, 105)
..
"\109"]:SetRayTestOnBB((58
*
329
*
238
+
469
==4541985)
)
th_IS_b__U__G__["\105\116\101\109\95"..
string.char(105, 109, 103, 50)
]:SetScale(1)
th_IS_b__U__G__[string.char(105, 116, 101)
..
("\105\95\109"):reverse()
..
"\109\103\50\95"..
string.char(97, 110, 105)
..
string.char(109)
]:PlayAnimation("\105\99\111\110"
,(162
*
312
*
172
+
478
~=8694046)
)
th_IS_b__U__G__["\105\116\101\109"..
string.char(95, 105, 109, 103)
..
"\50"]:HideFrame()
th_IS_b__U__G__["\105\116\101\109\95\105"..
"\109\103\50\95\97\110"..
"\105\109"]:Hide(("\84\78\73\84"):reverse()

)
th_IS_b__U__G__[("\109\101\116\105"):reverse()
..
"\95\105\109"..
"\103"]=th_IS_b__U__G__["\114\101\99"..
"\105\112\105"..
string.char(101, 95, 114)
..
"\111\111\116"]:AddChild(T__h_IsbUG_()
)
th_IS_b__U__G__["\105\116\101\109\95"..
"\105\109\103\95\97"..
"\110\105\109"]=th_IS_b__U__G__[string.char(105, 116, 101, 109)
..
string.char(103, 109, 105, 95)
:reverse()
]:GetAnimState()
th_IS_b__U__G__[("\109\101\116\105"):reverse()
..
"\95\105\109"..
"\103"]:MoveToBack()
th_IS_b__U__G__[string.char(105, 116, 101, 109, 95)
..
string.char(105, 109, 103, 95, 97)
..
string.char(110, 105, 109)
]:SetRayTestOnBB((338
+
484
-
443
+
63
*
225
==14554)
)
th_IS_b__U__G__["\105\116\101\109\95"..
"\105\109\103"]:SetScale(0.8)
 th_IS_b__U__G__["\105\116\101\109"..
"\95\105\109\103"..
string.char(110, 97, 95)
:reverse()
..
string.char(105, 109)
]:PlayAnimation("\105\99\111\110"
,(456
*
330
*
339
-
71
~=51012649)
)
th_IS_b__U__G__["\105\116\101\109\95\105"..
"\109\103"]:HideFrame()
th_IS_b__U__G__[("\114\95\108\108\101\99"):reverse()
..
"\111\111\116"]:SetOnClick(function()
self:SetItem(th_IS_b__U__G__[("\97\116\97\100"):reverse()
])
end
)
return th_IS_b__U__G__ end local function __t__h__is_bU_G(_Th__IS__B_uG,T__hI__sb_UG_,__thI_S__bug__,__th__I_S_B__U_G)T__hI__sb_UG_["\100\97\116\97"]=__thI_S__bug__;if __thI_S__bug__~=nil
then T__hI__sb_UG_["\99\101\108"..
"\108\95\114\111\111\116"]:Show()
T__hI__sb_UG_["\114\101\99\105\112"..
"\105\101\95\114"..
"\111\111\116"]:Show()
T__hI__sb_UG_[string.char(99, 101, 108, 108, 95, 114)
..
"\111\111\116"]:SetTextures("\105\109\97\103\101\115"..
"\47\113\117"..
"\97\103\109\105\114\101"..
"\95\114\101\99\105"..
"\112\101\98\111\111"..
"\107\46\120"..
("\108\109"):reverse()

,string.char(99, 111, 111, 107)
..
"\98\111\111"..
string.char(110, 107, 95, 107)
:reverse()
..
"\111\119\110"..
"\46\116\101\120"
,"\99\111\111"..
("\111\111\98\107"):reverse()
..
"\107\95\107\110\111"..
string.char(119, 110, 95, 115, 101, 108)
..
string.char(101, 99, 116)
..
"\101\100\46"..
string.char(120, 101, 116)
:reverse()

)
local t__Hi_S_bUG,__t__hi__SBU__g_=SoraGetImage(__thI_S__bug__["\105\116\101\109"])
if t__Hi_S_bUG and __t__hi__SBU__g_ then T__hI__sb_UG_["\105\116\101\109\95\105"..
"\109\103\95\97"..
"\110\105\109"]:OverrideSymbol("\83\87\65\80"..
string.char(95, 73, 67)
..
"\79\78"
,softresolvefilepath(t__Hi_S_bUG)
,__t__hi__SBU__g_)
else T__hI__sb_UG_["\105\116\101\109\95"..
"\105\109\103\95\97\110"..
"\105\109"]:ClearOverrideSymbol(string.char(83, 87, 65)
..
string.char(80, 95, 73)
..
string.char(67, 79, 78)

)
end;if __thI_S__bug__[("\99\111\108\110\117"):reverse()
..
string.char(107)
]then T__hI__sb_UG_["\105\116\101\109\95\105"..
string.char(109, 103, 50, 95, 97, 110)
..
"\105\109"]:Hide(string.char(84, 73, 78, 84)

)
T__hI__sb_UG_["\105\116\101\109\95"..
("\95\103\109\105"):reverse()
..
("\105\110\97"):reverse()
..
"\109"]:Hide("\76\79\67"..
"\75"
)
else T__hI__sb_UG_["\105\116\101\109\95"..
"\105\109\103\50\95"..
string.char(97, 110, 105, 109)
]:Show("\84\73\78\84"
)
T__hI__sb_UG_[string.char(105, 116, 101, 109)
..
"\95\105\109\103\95"..
"\97\110\105"..
"\109"]:Show("\76\79\67\75"
)
end;T__hI__sb_UG_:Enable()
T__hI__sb_UG_["\105\116\101\109"]=__thI_S__bug__["\112\114\101\102"..
string.char(97, 98)
]else T__hI__sb_UG_:Disable()
T__hI__sb_UG_["\105\116\101\109"]=nil
T__hI__sb_UG_["\99\101\108\108"..
"\95\114\111"..
string.char(116, 111)
:reverse()
]:Hide()
end end;local _t_hi_S__B__u_g_=__t__h__I__s__bu_g_["\83\99\114\111"..
string.char(108, 108, 105, 110, 103, 71)
..
"\114\105\100"]({}
,{context=
{}
,
widget_width=
__T_H__is__B__UG_+__T__hi__s_b__u__G__,
widget_height=
_t__h__I_s_bU__G__+__T__hi__s_b__u__G__,
force_peek=
(112
+
272
+
110
*
274
==30524)
,
num_visible_rows=
5,
num_columns=
5,
item_ctor_fn=
_Th_I_S_b__ug_,
apply_fn=
__t__h__is_bU_G,
scrollbar_offset=
20,
scrollbar_height_offset=
-60}
)
self["\103\114\105\100"]=self["\114\111\111\116"]:AddChild(_t_hi_S__B__u_g_)
_t_hi_S__B__u_g_:SetPosition(-200,-10)
self:RefreshItems()
self["\105\116\101\109\105"..
"\110\102\111"..
"\114\111\111\116"]=self[string.char(114, 111, 111, 116)
]:AddChild(T__h__i_S_B__U_G__(string.char(114, 111, 111, 116)

)
)
self["\105\116\101"..
("\110\105\109"):reverse()
..
"\102\111\114\111"..
string.char(111, 116)
]:SetPosition(210,-10)
local __T__h__ISb_Ug__=self[string.char(105, 116, 101, 109, 105, 110)
..
"\102\111\114"..
"\111\111\116"]__T__h__ISb_Ug__["\110\97\109"..
"\101\115\116\114"]=t_HIsbUg__(__T__h__ISb_Ug__,""
,{size=
40,
pos=
{0,
180}
}
)
__T__h__ISb_Ug__["\105\109\103"]=__T__h__ISb_Ug__:AddChild(thi_s_b_ug_()
)
__T__h__ISb_Ug__["\105\109\103"]:SetScale(2.5)
__T__h__ISb_Ug__["\105\109\103"]:SetPosition(0,60)
_t_HIS_Bug(__T__h__ISb_Ug__,4,400,(290
-
474
*
376
==-177934)
,{pos=
{0,
-40}
}
)
local _t__H__i_S__B__U_G__=t_HIsbUg__(__T__h__ISb_Ug__,""
,{size=
30,
pos=
{0,
-40}
}
)
_t__H__i_S__B__U_G__:SetHAlign(ANCHOR_LEFT)
_t__H__i_S__B__U_G__:SetVAlign(ANCHOR_TOP)
_t__H__i_S__B__U_G__:SetRegionSize(260,200)
 _t__H__i_S__B__U_G__:SetMultilineTruncatedString(""
,50,260,20,(458
+
27
+
426
-
250
*
445
==-110331)
)
_t__H__i_S__B__U_G__:SetPosition(0,-150)
__T__h__ISb_Ug__["\100\101\115"]=_t__H__i_S__B__U_G__;__T__h__ISb_Ug__[string.char(116, 99, 97)
:reverse()
]=_t_H__i__sb__ug__(__T__h__ISb_Ug__,string.char(230, 191, 128, 230)
..
"\180\187"
,function()
if __T__h__ISb_Ug__["\105\116\101\109"]and __ThI_s_bu_g_[__T__h__ISb_Ug__[("\109\101\116\105"):reverse()
]]then local tHI__SB__u_G=__ThI_s_bu_g_[__T__h__ISb_Ug__["\105\116\101\109"]](self,__T__h__ISb_Ug__["\105\116\101\109"])
if tHI__SB__u_G then tHI__SB__u_G["\79\110\67\108\111\115"..
"\101\67\66"]=self end;TheFrontEnd:PushScreen(tHI__SB__u_G)
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
__T__h__ISb_Ug__["\117\115\101"]=_t_H__i__sb__ug__(__T__h__ISb_Ug__,"\228\189\191\231"..
string.char(148, 168)

,NilFn,{size=
{80,
40}
,
pos=
{0,
-180}
}
)
__T__h__ISb_Ug__:Hide()
end
)
function __T_H__I_s_Bu__G__:SetFilter(__t_h__i_s_BUg_)self[string.char(108, 105, 102)
:reverse()
..
("\102\114\101\116"):reverse()
..
"\110"]=__t_h__i_s_BUg_;self:RefreshItems()
self:SetItem()
end;function __T_H__I_s_Bu__G__:RefreshItems()local THi__sb__U_g_={}
 for tH__I__s_bU__G,_TH__i_S__b__uG__ in ipairs(_th__I_s__B__u_g_)
do local T__Hi_S_BUg=_TH__i_S__b__uG__[2]if __ThI_s_bu_g_[_TH__i_S__b__uG__[1]]and _TH__i_S__b__uG__[3]then T__Hi_S_BUg=T__Hi_S_BUg..string.char(10, 32, 32, 45, 45)
..
string.char(230, 182, 136, 232, 128, 151)

..tostring(_TH__i_S__b__uG__[3])
.."\230\180\187\232\183\131"..
string.char(166, 186, 229)
:reverse()
..
("\187\228\175\143\229"):reverse()
..
"\165\232\167\163\233"..
"\148\129"
end;local __Th__iS__B_u_G_={item=
_TH__i_S__b__uG__[1],
des=
T__Hi_S_BUg,
unlock=
SoraSkinCheckFn(nil
,_TH__i_S__b__uG__[1])
}
if not self["\102\105\108\116"..
"\101\114\102\110"]or self["\102\105\108\116\101\114"..
"\102\110"](_TH__i_S__b__uG__)
then if _TH__i_S__b__uG__[4]then if SoraSkinCheckFn(_TH__i_S__b__uG__[1])
then table["\105\110\115\101\114\116"](THi__sb__U_g_,__Th__iS__B_u_G_)
end else table["\105\110\115\101\114\116"](THi__sb__U_g_,__Th__iS__B_u_G_)
end end end;self["\103\114\105"..
"\100"]:SetItemsData(THi__sb__U_g_)
end;function __T_H__I_s_Bu__G__:SetItem(_T__Hi_S_b_U_G_)local TH__i_s_BUG_=_T__Hi_S_b_U_G_ and _T__Hi_S_b_U_G_[string.char(105, 116, 101, 109)
] if TH__i_s_BUG_ then local __thi__s_Bu__g_,__tH__i__SBU_g__=SoraGetImage(TH__i_s_BUG_)
if __thi__s_Bu__g_ and __tH__i__SBU_g__ then self["\105\116\101\109\105"..
("\111\102\110"):reverse()
..
"\114\111\111\116"]["\105\109\103"]:SetTexture(__thi__s_Bu__g_,__tH__i__SBU_g__)
else self["\105\116\101"..
"\109\105\110\102\111"..
string.char(116, 111, 111, 114)
:reverse()
][("\103\109\105"):reverse()
]:SetTexture(GetInventoryItemAtlas("\108\111\103\46"..
"\116\101\120"
)
,("\116\46\103\111\108"):reverse()
..
("\120\101"):reverse()

)
end;self["\105\116\101\109\105"..
"\110\102\111\114"..
"\111\111\116"]["\100\101\115"]:SetString(_T__Hi_S_b_U_G_["\100\101\115"]or""
)
self["\105\116\101\109"..
"\105\110\102"..
"\111\114\111\111\116"][string.char(105, 116, 101, 109)
]=TH__i_s_BUG_;if GLOBAL["\80\114\101\102\97\98"..
"\115"][TH__i_s_BUG_]["\105\115\95\115\107\105"..
string.char(110)
]then self["\105\116\101\109\105"..
string.char(110, 102, 111, 114)
..
"\111\111\116"]["\110\97\109\101\115\116"..
"\114"]:SetString(( STRINGS["\78\65\77\69\83"][GetSkinBase(TH__i_s_BUG_)
:upper()
]or""
)
.."\124"
.. (STRINGS["\83\75\73\78"..
"\95\78\65"..
"\77\69\83"][TH__i_s_BUG_]or""
)
)
else self[string.char(105, 116, 101, 109, 105)
..
"\110\102\111\114"..
("\116\111\111"):reverse()
][string.char(110, 97, 109, 101, 115, 116)
..
"\114"]:SetString((STRINGS["\78\65\77\69\83"][TH__i_s_BUG_:upper()
]or""
)
)
end;self["\105\116\101\109\105"..
"\110\102\111\114\111\111"..
"\116"]:Show()
if SoraSkinCheckFn(nil
,TH__i_s_BUG_)
then self[string.char(105, 116, 101, 109, 105)
..
string.char(110, 102, 111, 114)
..
"\111\111\116"]["\97\99\116"]:Hide()
if UseSkin[TH__i_s_BUG_]then self["\105\116\101\109\105\110"..
"\102\111\114"..
"\111\111\116"]["\117\115\101"]:SetOnClick(function()
if not self["\117\115\101\99\100"]then self[string.char(117, 115, 101, 99, 100)
]=SoraCD(1)
end;if self["\117\115\101\99"..
"\100"]()
then if not (UseSkin[TH__i_s_BUG_]["\99\108\105\101\110"..
"\116\102\110"]and not UseSkin[TH__i_s_BUG_]["\99\108\105\101\110\116"..
"\102\110"](ThePlayer,TH__i_s_BUG_)
)
then SkinRPC("\85\115\101\83"..
"\107\105\110"
,TH__i_s_BUG_)
end end end
)
self[string.char(105, 116, 101)
..
"\109\105\110\102\111\114"..
string.char(116, 111, 111)
:reverse()
]["\117\115\101"]:Show()
else self["\105\116\101"..
"\109\105\110\102"..
"\111\114\111\111\116"]["\117\115\101"]:SetOnClick(NilFn)
self["\105\116\101\109"..
string.char(105, 110, 102)
..
"\111\114\111\111\116"][string.char(117, 115, 101)
]:Hide()
end else self[string.char(105, 116, 101, 109, 105, 110)
..
string.char(102, 111, 114, 111, 111, 116)
]["\117\115\101"]:Hide()
self["\105\116\101"..
string.char(109, 105, 110, 102)
..
string.char(111, 114, 111, 111)
..
string.char(116)
]["\117\115\101"]:SetOnClick(NilFn)
if __ThI_s_bu_g_[TH__i_s_BUG_]then self[("\109\101\116\105"):reverse()
..
"\105\110\102"..
string.char(111, 114, 111, 111)
..
string.char(116)
]["\97\99\116"]:Show()
else self["\105\116\101"..
"\109\105\110\102\111\114"..
"\111\111\116"]["\97\99\116"]:Hide()
end end else self["\105\116\101"..
"\109\105\110\102\111\114"..
string.char(111, 111, 116)
]:Hide()
self["\105\116\101\109\105"..
"\110\102\111"..
"\114\111\111\116"][string.char(105, 116, 101, 109)
]=nil
end end;function __T_H__I_s_Bu__G__:OnControl(__T_h_i_sB_u_g_,t__h__i__S__BU_g)if __T_H__I_s_Bu__G__["\95\98\97\115"..
"\101"][("\111\67\110\79"):reverse()
..
"\110\116\114\111\108"](self,__T_h_i_sB_u_g_,t__h__i__S__BU_g)
then return(254
+
492
+
140
-
346
-
67
~=477)
end if __T_h_i_sB_u_g_==CONTROL_CANCEL and not t__h__i__S__BU_g then self:Close()
TheFrontEnd:GetSound()
:PlaySound(string.char(100, 111, 110, 116, 115, 116)
..
"\97\114\118"..
"\101\47\72"..
string.char(85, 68, 47, 99, 108, 105)
..
"\99\107\95\109"..
"\111\118\101"
)
return(205
+
315
+
100
==620)
end end;function __T_H__I_s_Bu__G__:CloseCB()self:RefreshItems()
self:SetItem()
end;function __T_H__I_s_Bu__G__:Close()if self[string.char(79, 110, 67, 108, 111)
..
string.char(115, 101, 67, 66)
]then self[string.char(79, 110, 67)
..
"\108\111\115\101\67"..
"\66"]["\67\108\111\115\101"..
string.char(67, 66)
](self["\79\110\67\108\111\115"..
"\101\67\66"],self)
end;TheFrontEnd:PopScreen(self)
end end;global("\71\101\116\83\101\99"..
"\111\110\100\65\102\116"..
"\101\114"
)
if not GLOBAL["\71\101\116\83\101"..
"\99\111\110\100"..
"\65\102\116\101"..
"\114"]then function GLOBAL.GetSecondAfter(tH__Is_b__ug__)local _T__HiS__BU_g__=os[string.char(107, 99, 111, 108, 99)
:reverse()
]()
+tH__Is_b__ug__;while os["\99\108\111"..
"\99\107"]()
<_T__HiS__BU_g__ do end;return os["\99\108\111\99"..
"\107"]()
end;GetSecondAfter(1)
end