from pymol import cmd,stored

set depth_cue, 1
set fog_start, 0.4

set_color b_col, [36,36,85]
set_color t_col, [10,10,10]
set bg_rgb_bottom, b_col
set bg_rgb_top, t_col      
set bg_gradient

set  spec_power  =  200
set  spec_refl   =  0

load "data/1a28.pdb", protein
create ligands, protein and organic
select xlig, protein and organic
delete xlig

hide everything, all

color white, elem c
color bluewhite, protein
#show_as cartoon, protein
show surface, protein
#set transparency, 0.15

show sticks, ligands
set stick_color, magenta

load "data/1a28.pdb_points.pdb.gz", points
hide nonbonded, points
show nb_spheres, points
set sphere_scale, 0.2, points
cmd.spectrum("b", "green_red", selection="points", minimum=0, maximum=0.7)


stored.list=[]
cmd.iterate("(resn STP)","stored.list.append(resi)")    # read info about residues STP
lastSTP=stored.list[-1] # get the index of the last residue
hide lines, resn STP

cmd.select("rest", "resn STP and resi 0")

for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.4","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))



set_color pcol1 = [0.361,0.576,0.902]
select surf_pocket1, protein and id [3391,3392,1871,1933,1934,515,1820,1822,556,558,3466,3691,577,3754,3388,3462,3465,1200,1261,1263,1181,1199,1242,1243,1244,1246,1257,1258,1560,1562,1307,555,609,622,675,674,3446,3448,3511,3509] 
set surface_color,  pcol1, surf_pocket1 
set_color pcol2 = [0.278,0.369,0.702]
select surf_pocket2, protein and id [4637,4699,7568,7570,7633,4700,7510,7584,7587,7588,5321,5322,7813,4680,5944,4678,4681,5943,5993,6056,6055,7514,4677,4744,4796,5303,7876,5368,4797,5366,5380,5426,5429,5681,5683,5379,5383] 
set surface_color,  pcol2, surf_pocket2 
set_color pcol3 = [0.361,0.373,0.902]
select surf_pocket3, protein and id [4364,4365,6415,4350,4353,4363,4366,6414,4409,4849,4402,4376,4377,4386,4380,4391,4913,4914,4916,4919,4921,4797,5480,5478,5479,5416,5477,5678,5367,5345,5347,5349,6413,5346,5362,5363,4793,4794,4795,4405,4861,6349,6347,5454,5456,6298,5559,5536,5558,5534,5535,4304,4305,5418,5473] 
set surface_color,  pcol3, surf_pocket3 
set_color pcol4 = [0.349,0.278,0.702]
select surf_pocket4, protein and id [794,2291,2292,228,231,244,792,2293,243,1332,1334,1413,1410,265,241,255,264,268,269,258,1436,183,2179,1358,1355,1356,270,1588,1437,672,673,674,285,1224,1225,1241,675,1296,1294,739] 
set surface_color,  pcol4, surf_pocket4 
set_color pcol5 = [0.553,0.361,0.902]
select surf_pocket5, protein and id [8042,8061,8045,8117,7474,7475,7476,8088,8155,7473,7472,7532,7534,7456,7457,8059,6540,6541,5262,5281,6467,5337,5336,7410,8154,7405,7408,7428,7409,7407,7413,8153,6525,6526,6527,7411] 
set surface_color,  pcol5, surf_pocket5 
set_color pcol6 = [0.510,0.278,0.702]
select surf_pocket6, protein and id [2417,2419,3412,1215,3286,2418,3289,3291,1140,1141,1159,2403,2345,4033,4032,4031,3288,4066,3966,3354,3920,3923,3351,3410,3352,3347,3350,3284,3285,3299] 
set surface_color,  pcol6, surf_pocket6 
set_color pcol7 = [0.757,0.361,0.902]
select surf_pocket7, protein and id [3444,1805,1806,3447,3449,3450,1804,1855,1856,1864,1858,8024,3441,3496,3498,7960,3494,3443,3493,3495,3510,3565,3626,8021,3428,8022,8098,8099,8100,8101,3564,3566,7950,8025,7975,3369,3372,1870,3371,3375,1918,3373,3374,3440] 
set surface_color,  pcol7, surf_pocket7 
set_color pcol8 = [0.671,0.278,0.702]
select surf_pocket8, protein and id [4583,5926,5927,5928,7686,7687,7688,7748,7749,3838,7548,7617,7618,7619,7620,3828,5980,5935,7550,7569,7571,7572,7632,7562,7563,7566,5938,5990,7493,7494,5992,7547,7497] 
set surface_color,  pcol8, surf_pocket8 
set_color pcol9 = [0.902,0.361,0.839]
select surf_pocket9, protein and id [1054,3734,3735,3736,1035,1049,1050,1052,1055,1105,1107,1106,689,690,755,1125,1128,3795,3779,3780,3733,1036,995,1040,828,904,816,754,709,827] 
set surface_color,  pcol9, surf_pocket9 
set_color pcol10 = [0.702,0.278,0.573]
select surf_pocket10, protein and id [7648,7644,7650,7651,7662,7701,7702,7649,7807,7891,7795,3540,3544,3545,3563,3566,7889,7951,3542,3559,7806,7890,7888,7898,3528,7664] 
set surface_color,  pcol10, surf_pocket10 
set_color pcol11 = [0.902,0.361,0.631]
select surf_pocket11, protein and id [5161,5230,4952,5118,5176,5178,4877,4876,5249,7917,5177,7904,5229,5247,7859,7857] 
set surface_color,  pcol11, surf_pocket11 
set_color pcol12 = [0.702,0.278,0.412]
select surf_pocket12, protein and id [470,531,532,533,479,482,483,542,546,346,436,345,419,358,360,361,397,3673,333,338,354,593,589,590,469,3642,472] 
set surface_color,  pcol12, surf_pocket12 
set_color pcol13 = [0.902,0.361,0.427]
select surf_pocket13, protein and id [5269,8025,6572,6573,6607,6608,5133,5148,5195,5196,6619,6642,6647,5134,7974,5250,5177,7975,6648,8023,8097] 
set surface_color,  pcol13, surf_pocket13 
set_color pcol14 = [0.702,0.306,0.278]
select surf_pocket14, protein and id [3681,3684,3685,3768,3769,3528,3529,7664,3767,3829,3527,3766,3723,7714,7662,3522,3580,3591,3540,3544,3545,3542] 
set surface_color,  pcol14, surf_pocket14 
set_color pcol15 = [0.902,0.498,0.361]
select surf_pocket15, protein and id [3252,3253,3270,3200,2040,2041,2042,2043,2094,1990,1986,3204,3199,3130,3254,3256,3182,3181,1975,3315,1974,1976,1972,3317] 
set surface_color,  pcol15, surf_pocket15 
set_color pcol16 = [0.702,0.467,0.278]
select surf_pocket16, protein and id [4601,4604,4482,4592,4594,4603,4653,7764,4654,4655,4460,4664,4668,4715,4455,4713,4714] 
set surface_color,  pcol16, surf_pocket16 
set_color pcol17 = [0.902,0.702,0.361]
select surf_pocket17, protein and id [5459,5515,5516,5517,6269,5510,5584,5587,5588,6251,6252,6283,6293,6297,6286,6193,6197,6198,6250,6253,6195,6254,5529,5531,5532,5533] 
set surface_color,  pcol17, surf_pocket17 
set_color pcol18 = [0.702,0.624,0.278]
select surf_pocket18, protein and id [3902,3903,3853,2508,2451,1011,1012,1073,1026,2526,2525,2497,2487] 
set surface_color,  pcol18, surf_pocket18 
set_color pcol19 = [0.894,0.902,0.361]
select surf_pocket19, protein and id [3899,3900,3838,7618,7619,7620,7688,7550,3902,3903] 
set surface_color,  pcol19, surf_pocket19 


deselect

orient
