load /home/danieldh/ScipionUserData/projects/dcoid_1a28/Runs/000360_ProtocolConsensusStructROIs/1a28_All_out.pdbqt 
set cartoon_color, white

from pymol import cmd,stored
load /home/danieldh/ScipionUserData/projects/dcoid_1a28/Runs/000360_ProtocolConsensusStructROIs/1a28_All_out.pdbqt
#select pockets, resn STP
stored.list=[]
cmd.iterate("(resn STP)","stored.list.append(resi)")	#read info about residues STP

aux = list(map(int, stored.list))
aux.sort()
stored.list = list(map(str, aux))
#print(stored.list)
lastSTP=stored.list[-1]	#get the index of the last residu
hide lines, resn STP

#show spheres, resn STP
for my_index in range(1,int(lastSTP)+1): cmd.select("pocket"+str(my_index), "resn STP and resi "+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.color(my_index+1,"pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.show("spheres","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_scale","0.3","pocket"+str(my_index))
for my_index in range(1,int(lastSTP)+1): cmd.set("sphere_transparency","0.1","pocket"+str(my_index))

python

from pymol.cgo import *
from pymol import cmd
from random import randint

#############################################################################
#
# Acknowledgement:
# This script was written based on the drawBoundingBox by Jason Vertrees
#
#############################################################################python
def drawBoundingBox(center, size, gridName=None, padding=0.0, linewidth=2.0, r=1.0, g=1.0, b=1.0):
    """                                                                  
    DESCRIPTION                                                          
            Given selection, draw the bounding box around it.          

    USAGE:
            drawBoundingBox [selection, [padding, [linewidth, [r, [g, b]]]]]

    PARAMETERS:
            selection,              the selection to enboxen.  :-)
                                    defaults to (all)

            padding,                defaults to 0

            linewidth,              width of box lines
                                    defaults to 2.0

            r,                      red color component, valid range is [0.0, 1.0]
                                    defaults to 1.0                               

            g,                      green color component, valid range is [0.0, 1.0]
                                    defaults to 1.0                                 

            b,                      blue color component, valid range is [0.0, 1.0]
                                    defaults to 1.0                                

    RETURNS
            string, the name of the CGO box

    NOTES
            * This function creates a randomly named CGO box that minimally spans the protein. The
            user can specify the width of the lines, the padding and also the color.                            
    """

    minX, minY, minZ = center[0] - size[0]/2, center[1] - size[1]/2, center[2] - size[2]/2
    maxX, maxY, maxZ = center[0] + size[0]/2, center[1] + size[1]/2, center[2] + size[2]/2

    if padding != 0.0:
        minX, minY, minZ = minX - float(padding), minY - float(padding), minZ - float(padding)
        maxX, maxY, maxZ = maxX + float(padding), maxY + float(padding), maxZ + float(padding)

    boundingBox = [
    LINEWIDTH, float(linewidth),

    BEGIN, LINES,
    COLOR, float(r), float(g), float(b),

    VERTEX, minX, minY, minZ,  
    VERTEX, minX, minY, maxZ,  
    VERTEX, minX, maxY, minZ,  
    VERTEX, minX, maxY, maxZ,  
    VERTEX, maxX, minY, minZ,  
    VERTEX, maxX, minY, maxZ,  
    VERTEX, maxX, maxY, minZ,  
    VERTEX, maxX, maxY, maxZ,  
    VERTEX, minX, minY, minZ,  
    VERTEX, maxX, minY, minZ,  
    VERTEX, minX, maxY, minZ,  
    VERTEX, maxX, maxY, minZ,  
    VERTEX, minX, maxY, maxZ,  
    VERTEX, maxX, maxY, maxZ,  
    VERTEX, minX, minY, maxZ,  
    VERTEX, maxX, minY, maxZ,  
    VERTEX, minX, minY, minZ,  
    VERTEX, minX, maxY, minZ,  
    VERTEX, maxX, minY, minZ,  
    VERTEX, maxX, maxY, minZ,  
    VERTEX, minX, minY, maxZ,  
    VERTEX, minX, maxY, maxZ,  
    VERTEX, maxX, minY, maxZ,  
    VERTEX, maxX, maxY, maxZ,  

    END
    ]

    if gridName == None:
        boxName = "box_" + str(randint(0,10000))
        while boxName in cmd.get_names():
            boxName = "box_" + str(randint(0,10000))
    else:
        boxName = gridName

    cmd.load_cgo(boundingBox,boxName)
    return boxName
python end

rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[37.45424778761052, 33.35209734513273, 43.24380530973471], size=[14.384366513684224, 14.384366513684224, 14.384366513684224], gridName="BoundingBox_1", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[42.26403726708063, 35.625086956521955, 30.0891304347828], size=[17.322817322825987, 17.322817322825987, 17.322817322825987], gridName="BoundingBox_2", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[23.02135371179032, 9.991139737991249, 60.0596069868998], size=[17.531115195560144, 17.531115195560144, 17.531115195560144], gridName="BoundingBox_3", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[22.378641114982493, 5.105620209059219, 74.14965156794413], size=[18.340665200586372, 18.340665200586372, 18.340665200586372], gridName="BoundingBox_4", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[43.43554744525536, 19.003379562043776, 43.98503649635057], size=[19.115961916681044, 19.115961916681044, 19.115961916681044], gridName="BoundingBox_5", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[38.424851485148416, 12.596029702970279, 62.34504950495072], size=[17.252825855493928, 17.252825855493928, 17.252825855493928], gridName="BoundingBox_6", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[26.08039106145245, 23.77106703910613, 71.13491620111753], size=[13.782960494755836, 13.782960494755836, 13.782960494755836], gridName="BoundingBox_7", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[36.899361702127585, 0.3309148936170222, 60.076950354610084], size=[14.000714267493635, 14.000714267493635, 14.000714267493635], gridName="BoundingBox_8", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[28.23328787878789, 11.006924242424244, 47.46446969696971], size=[17.237074620132038, 17.237074620132038, 17.237074620132038], gridName="BoundingBox_9", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[29.400099009900966, 21.95741584158414, 32.15693069306925], size=[11.898319209031166, 11.898319209031166, 11.898319209031166], gridName="BoundingBox_10", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[36.707313725490195, 32.36252941176471, 55.36372549019607], size=[14.783621460927629, 14.783621460927629, 14.783621460927629], gridName="BoundingBox_11", r=rgb[0], g=rgb[1], b=rgb[2])
rgb = [0, 1, 0]
boxName = drawBoundingBox(center=[22.472068965517206, 26.14382758620688, 51.2982758620691], size=[11.05486318323298, 11.05486318323298, 11.05486318323298], gridName="BoundingBox_12", r=rgb[0], g=rgb[1], b=rgb[2])

zoom
python end
