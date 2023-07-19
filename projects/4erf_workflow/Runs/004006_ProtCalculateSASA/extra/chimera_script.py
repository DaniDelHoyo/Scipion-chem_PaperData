from chimerax.core.commands import run
run(session, 'cd /home/danieldh/ScipionUserData/projects/4erf_demo')
run(session, 'cofr 0,0,0')
run(session, 'open /home/danieldh/ScipionUserData/projects/4erf_demo/Runs/004006_ProtCalculateSASA/extra/axis_input.bild')
run(session, 'open Runs/004006_ProtCalculateSASA/extra/chimeraAttribute_SASA.cif')
run(session, 'color byattribute occupancy palette 200.0,#67001f:190.0,#8a0b25:180.0,#ae172a:170.0,#c2383a:160.0,#d35a4a:150.0,#e27b62:140.0,#f09c7b:130.0,#f7b799:120.0,#fcd3bc:110.0,#fbe4d6:100.0,#f8f1ed:90.0,#edf2f5:80.0,#dbeaf2:70.0,#c5dfec:60.0,#a5cee3:50.0,#84bcd9:40.0,#5fa5cd:30.0,#3f8ec0:20.0,#2f79b5:10.0,#1e61a5:0.0,#114781 ')
run(session, "key #114781:0.0 #1e61a5: #2f79b5: #3f8ec0: #5fa5cd: #84bcd9: #a5cee3: #c5dfec: #dbeaf2: #edf2f5: #f8f1ed:100.0 #fbe4d6: #fcd3bc: #f7b799: #f09c7b: #e27b62: #d35a4a: #c2383a: #ae172a: #8a0b25: #67001f:200.0 fontSize 15 size 0.025,0.4 pos 0.01,0.3")
run(session, 'view')
