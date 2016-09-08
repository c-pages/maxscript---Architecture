

-----------------------------------------------------
----	Structs 	---------------------------------
-----------------------------------------------------
---- Tableau ----
struct tableau_struct (
	
	-- 	Renvois true si  #premierTab  est égale à   #deuxiemeTab. --
	fn comparer  tab1 tab2  = (
		local result = true
		if tab1.count != tab2.count then
			result = false
		else
			for i = 1 to tab1.count do
				if tab1[i] != tab2[i] do result = false
		result
	),
	
	-- 	Supprime les doublons de  #tableau de tableaux. --
	fn supprimerDoublons 	 tableauDeTableaux  = (
		for i = 1 to tableauDeTableaux.count do (
			for j = tableauDeTableaux.count to i+1 by -1 do (
				test = ( comparer  tableauDeTableaux[i] 	tableauDeTableaux[j] )
				if test do
					deleteItem tableauDeTableaux	 j
			)--end j loop
		)--end i loop
	)
	
) -- fin struct tableau --

---- Matrices ----
struct matrice_struct (
	
	mtrx_rot90_x = (eulerAngles 90 0 0) as matrix3,
	mtrx_rot90_y = (eulerAngles 0 90 0) as matrix3,
	mtrx_rot90_z = (eulerAngles 0 0 90) as matrix3,
	
	-- 	Rotation de la normal  --
	fn rotate90_X 	normalFace  = (
		local result	=  mtrx_rot90_x * ( matrixFromNormal normalFace )
		result
	),
	-- 	Rotation de la normal  --
	fn rotate90_Y 	normalFace  = (
		local result	=  mtrx_rot90_y * ( matrixFromNormal normalFace )
		result
	),
	-- 	Rotation de la normal  --
	fn rotate90_Z 	normalFace  = (
		local result	=  mtrx_rot90_z * ( matrixFromNormal normalFace )
		result
	)
	
	
) -- fin struct tableau --


---- Outils ----
struct outils_struct (
	---- MEMBRES ----
	tableau,
	matrice,
	
	---- EVENEMENTS ----
	on create do (
		tableau 	= tableau_struct ()
		matrice 	= matrice_struct ()
	)
	
) -- fin struct outils --


-----------------------------------------------------
----	Préferences 	-----------------------------
-----------------------------------------------------
---- Préferences  ----
struct prefs_struct (
	
		---- le fichier des preferences	----
		fichier 					= "$userScripts\Construction\construction.ini",		
		
		---- les preferences	----
		ep_mur					=	30,	---- Epaisseur du mur.
		
		ht_etage 				= 255, 	---- Hauteur d'un étage.
		ep_dalle					=	25,	---- Epaisseur des dalles.
		
		ht_accrotere 			= 50, 	---- Hauteur de l'accrotere.
		ep_couvertine			=	5,		---- Epaisseur de la couvertine.
		ht_couvertine			=	5,		---- Hauteur de la couvertine.
		
		lrg_debord				=	50,	---- Largeur du débord de toit pour toiture ferme
		ht_toiture				=	30,	---- Hauteur de la toiture ( en debord )
		ep_toiture				=	7,		----  Epaisseur de la toiture
		
		ht_tablette				=	5,		----  Hauteur de la tablette des baies
		ep_tablette				=	5,		----  Epaisseur de la tablette des baies
		
		
		nbr_fenetre				= 0,		---- Nombre de fenetre à creer ( 0: remplis la face fenetres )
		ht_allege				= 90,		---- Hauteur de l'allège
		ht_fenetre				= 210,	---- Hauteur de la fenetre
		larg_fenetre			= 100,	---- Largeur de la fenetre
		ecart_fenetre			= 150,	---- Largeur du plein entre 2 fenetres
		align_fenetre			= 2,		---- L'alignement des fenetre dans la face
		decal_fenetre			= 50,		---- Le décalage de la premiere fenetre pa rapport au bord de la face.
		
		ep_cadreFenetre		= 3,		---- L'epaisseur du cadre des menuiseries
		larg_cadreFenetre	= 5,		---- La largeur du cadre des menuiseries
		
		--- Fontions ----
		fn sauvegarder 	= (
			
			setINISetting   fichier		"prefs"   "ep_mur"  				( ep_mur as string )
			
			setINISetting   fichier		"prefs"   "ht_etage"  				( ht_etage as string )
			setINISetting   fichier		"prefs"   "ep_dalle"  				( ep_dalle as string )
			
			setINISetting   fichier		"prefs"   "ht_accrotere"  			( ht_accrotere as string )
			setINISetting   fichier		"prefs"   "ep_couvertine"		( ep_couvertine as string )
			setINISetting   fichier		"prefs"   "ht_couvertine"  		( ht_couvertine as string )
			
			setINISetting   fichier		"prefs"   "lrg_debord"  			( lrg_debord as string )
			setINISetting   fichier		"prefs"   "ht_toiture"  			( ht_toiture as string )
			setINISetting   fichier		"prefs"   "ep_toiture"  			( ep_toiture as string )
			
			setINISetting   fichier		"prefs"   "ht_tablette"  			( ht_tablette as string )
			setINISetting   fichier		"prefs"   "ep_tablette"  			( ep_tablette as string )
			
			setINISetting   fichier		"prefs"   "ht_allege"  				( ht_allege as string )
			setINISetting   fichier		"prefs"   "nbr_fenetre"  			( nbr_fenetre as string )
			setINISetting   fichier		"prefs"   "ht_fenetre"  			( ht_fenetre as string )
			setINISetting   fichier		"prefs"   "larg_fenetre"  			( larg_fenetre as string )
			setINISetting   fichier		"prefs"   "ecart_fenetre"			( ecart_fenetre as string )
			setINISetting   fichier		"prefs"   "align_fenetre"			( align_fenetre as string )
			setINISetting   fichier		"prefs"   "decal_fenetre"			( decal_fenetre as string )
			
			setINISetting   fichier		"prefs"   "ep_cadreFenetre"		( ep_cadreFenetre as string )
			setINISetting   fichier		"prefs"   "larg_cadreFenetre"	( larg_cadreFenetre as string )
			
		),
		
		fn charger 	= (
			
			ep_mur 				= 	( getINISetting   fichier		"prefs"   "ep_mur"  			as float )		
			
			ht_etage				= 	( getINISetting   fichier	"prefs"   "ht_etage"  				as float )
			ep_dalle				= 	( getINISetting   fichier	"prefs"   "ep_dalle"  				as float )
			
			ht_accrotere 			=	( getINISetting   fichier	"prefs"   "ht_accrotere"  			as float )
			ep_couvertine		=	( getINISetting   fichier	"prefs"   "ep_couvertine"		as float )
			ht_couvertine		=	( getINISetting   fichier	"prefs"   "ht_couvertine"  		as float )
			
			lrg_debord			= 	( getINISetting   fichier	"prefs"   "lrg_debord"  			as float )
			ht_toiture				= 	( getINISetting   fichier	"prefs"   "ht_toiture"  			as float )
			ep_toiture				= 	( getINISetting   fichier	"prefs"   "ep_toiture"  			as float )
			
			ht_tablette			= 	( getINISetting   fichier	"prefs"   "ht_tablette"  			as float )
			ep_tablette			= 	( getINISetting   fichier	"prefs"   "ep_tablette"  			as float )
			
			ht_allege				= 	( getINISetting   fichier	"prefs"   "ht_allege"  				as float )
			nbr_fenetre			= 	( getINISetting   fichier	"prefs"   "nbr_fenetre"  			as float )
			ht_fenetre				= 	( getINISetting   fichier	"prefs"   "ht_fenetre"  			as float )
			larg_fenetre			=	( getINISetting   fichier	"prefs"   "larg_fenetre"  			as float )
			ecart_fenetre			=	( getINISetting   fichier	"prefs"   "ecart_fenetre"			as float )
			align_fenetre			=	( getINISetting   fichier	"prefs"   "align_fenetre"			as integer )
			decal_fenetre			=	( getINISetting   fichier	"prefs"   "decal_fenetre"			as float )
			
			ep_cadreFenetre	=	( getINISetting   fichier	"prefs"   "ep_cadreFenetre"		as float )
			larg_cadreFenetre	=	( getINISetting   fichier	"prefs"   "larg_cadreFenetre"	as float )
			
		),
		
		fn resetFichier = (
			deleteFile  fichier
		),
		
		---- evenements ----
		on create do (
			if not doesFileExist fichier
					then	sauvegarder ()
					else 	charger ()
		)
		
) -- fin struct prefs -----




-----------------------------------------------------
----	Ma,nipulations 	-------------------------
-----------------------------------------------------
---- Modél ----
struct modele_struct (
	---- membres ----
	ptr_materiau,		---- Pointeur vers archi.materiau --
	ptr_faces,			---- Pointeur vers archi.materiau --
	
	---- fonctions ----
	fn ajouterAttribut 	noeud:$	= (
		attribut = attributes Architecture (
			parameters params (
				Architecture type:#boolean 	default:true
			)
		)
		custAttributes.add noeud	attribut
	),
	fn preparer noeud:$ =(
		
		-- Convertion en EditPoly --
		convertToPoly noeud
		
		---- Ajouter les attribut d'Architecture --
		ajouterAttribut 	noeud:noeud
		
		-- Application de L'idMat du mur partout --
		subobjectLevel = 4
		polyop.setFaceSelection noeud #{1..(polyop.getNumFaces noeud)}
		local IDmur = 1
		noeud.EditablePoly.setMaterialIndex 		IDmur		1
		
		---- Appliquer un nouveau materiaux Batiment ---
		ptr_materiau.nouveau ()
		
		---- Selectionner les faces ----
		local faceZenithales = #()
		for face = 1 to polyop.getNumFaces noeud do
			if ptr_faces.sontZenithal faces:#(face) do append faceZenithales face
		polyop.setFaceSelection noeud 	faceZenithales
		
		max modify  mode
		subobjectLevel = 4
		
	),
	fn aAttribut noeud:$ =(
		local result = false 
		try 	result = noeud.Architecture.Architecture catch ()
		result
	),
	fn estPret noeud:$ =(
		local result = false
		if aAttribut () 	do result = true
		result
	)
	
) -- fin struct Faces --

---- Faces ----
struct faces_struct (
	
	---- membres ----
	ptr_arretes,	---- Pointeur vers archi.arretes --
	ptr_points,		---- Pointeur vers archi.points --
	ptr_matrice,		---- Pointeur vers archi.outils.normal --
	
	---- fonctions ----
	---------- CALCULS ----------
	---- Renvois le centre de la face ----
	fn centre		face 	noeud:$  vMax:false  marquer:false  = (
	
		local result = [0,0,0]
		
		---- la version max fait  une position  moyenne de tout les points , => pb si 5 points sur la face par exemple ----
		if vMax then
			result = polyop.getFaceCenter noeud  face
		
		---- debut de version centre perso qui deconne ----
		else (
			
			local listePoints 							= polyop.getFaceVerts  	noeud	face
			local pointsAlignesVerticalement		= #()
			local ptsResult 							= #()
			
			---- regrouper les points alignés verticalement	----
			for  i=1 to listePoints.count do (
				
				local	ID_pt_1 		= listePoints[ i ] 
				local	pt_1 			= noeud.verts[ ID_pt_1 ]				
				local resultTmp 	= #()
				
				for  j=1 to listePoints.count do (
					ID_pt_2 = listePoints[ j ] 					
					pt_2 = noeud.verts[ ID_pt_2 ]
					
					if floor (  pt_1.position.x * 10 )	== floor ( pt_2.position.x * 10 ) do 
						if floor ( pt_1.position.y * 10 ) == floor ( pt_2.position.y * 10 ) do (
							if pt_1.position.z < pt_2.position.z then (
								appendIfUnique resultTmp 		ID_pt_1
								appendIfUnique resultTmp 		ID_pt_2
							) else (
								appendIfUnique resultTmp 		ID_pt_2
								appendIfUnique resultTmp 		ID_pt_1
							)
						)
				)
				if resultTmp.count == 2 do 	(
					appendIfUnique  pointsAlignesVerticalement  resultTmp[1]
					appendIfUnique  pointsAlignesVerticalement  resultTmp[2]
				)
				
			)
			

			ptsResult = pointsAlignesVerticalement
			
			ptr_points.selectionner 	ptsResult
			
			
			
			---- suppression des couples en trop ----
			local couplesPtsAGarder = #()
			if ( ptsResult.count > 2 ) do (
				
				for IDpt_1 = 1 to ( ptsResult.count ) by 2 do  (
					local distMax = 0.
					local ptsAGarder =#()
					for IDpt_2 = IDpt_1 +2 to ( ptsResult.count ) by 2 do  (
						local dist = length ( noeud.verts[ ptsResult[IDpt_1] ].position - noeud.verts[ ptsResult[IDpt_2]  ].position ) 
						if dist >  distMax then (
							distMax = dist
							ptsAGarder[1] = ptsResult[IDpt_1]
							ptsAGarder[2] = ptsResult[IDpt_1+1]
							ptsAGarder[3] = ptsResult[IDpt_2] 
							ptsAGarder[4] = ptsResult[IDpt_2+1] 
						)
					)
					if ptsAGarder.count  != 0 do (
						
						if couplesPtsAGarder.count == 0 then
							couplesPtsAGarder =  PtsAGarder
						else (
							distBack = length ( noeud.verts[ couplesPtsAGarder[1] ].position - noeud.verts[ couplesPtsAGarder[3]  ].position ) 
							distNew = length ( noeud.verts[ ptsAGarder[1] ].position - noeud.verts[ ptsAGarder[3]  ].position ) 
							
							if distNew > distBack do
								couplesPtsAGarder =  PtsAGarder
						)
					)
				)
				
			) 
			
			---- moyenne des points hauts et bas	----
			result = [0,0,0]
			if couplesPtsAGarder.count != 0 then (
				for IDpt in couplesPtsAGarder do  (
					result += noeud.verts[ IDpt ].position
					if marquer do ptMarque = point name:(uniquename "POINT") 	pos:noeud.verts[ IDpt ].position
				)
				result = result / 4
			) else (
				result = centre		face 	noeud:noeud  vMax:true  marquer:false 
			)
			
			if result == undefined do 
				result = face 	noeud:noeud  vMax:true  --marquer:marquer
			
		)
		
		if marquer do ptMarque = point name:(uniquename "ptOrigine") pos:result
		
		result
		
	),	
	---- 	Renvois l'altitude minimum des points des faces. (cm.)  ----
	fn Zmin 		face	noeud:$   = (
		
		local pointLePlusBas
		
		listePoints = polyop.getFaceVerts  	noeud	face
		for IDpt in listePoints do (
			pt = noeud.verts[IDpt]
			if pointLePlusBas == undefined do pointLePlusBas = pt.position.z
			if pointLePlusBas > pt.position.z do pointLePlusBas = pt.position.z
		)
		
		pointLePlusBas	
	),	
	---- 	Renvois la normal de la face.  ----
	fn normal 	face 	noeud:$   marquer:false  = (
		local result = polyop.getFaceNormal noeud face
		if marquer do (
			ptMarque = point name:(uniquename "pt Normal" ) \
									axistripod:on cross:off Box:off centermarker:off
			ptMarque.transform 	= matrixfromnormal  result
			ptMarque.pos 			= centre		face
		)
		result
	),
	---- 	Renvois la hauteur de la face. (cm.) ----
	fn hauteur 	face 	noeud:$   = (
		local listePoints = polyop.getFaceVerts  	noeud	face
		local result = 0, mini = 10000000000, maxi = 0
		for  pt in listePoints 	do (
			pt = noeud.verts[ pt ]		
			if pt.position.z < mini 	do mini 	= pt.position.z
			if pt.position.z > maxi  do maxi 	= pt.position.z
		)
		result = maxi  - mini
		result
	),	
	---- 	Renvois la largeur de la face. (cm.) ----
	fn largeur 	face 	noeud:$   = (
		local listePoints = polyop.getFaceVerts  	noeud		face
		local result = 0
		for  i=1 to listePoints.count-1 do (
			pt_1 = noeud.verts[ listePoints[ i ] ]				
			for  j=i+1 to listePoints.count do (				
				pt_2 	= noeud.verts[ listePoints[ j ] ]
				dist 	= length ( pt_2.position - pt_1.position )
				if pt_1.position.z == pt_2.position.z and dist > result
					do result = dist
			)
		)
		result	
	),
	---- 	Renvois l'origine de la face. ----
	fn origine 	face 	noeud:$   marquer:false = (
		
		local centreFace 		= centre	face	noeud:noeud 	vMax:false
		local largeurFace			= largeur	face	noeud:noeud
		local hauteurFace		= hauteur	face	noeud:noeud
		local normalFace 		= normal	face	noeud:noeud
		local normalFaceRotZ	= normalFace * rotateZMatrix 90 
		
		local normalTestX		= ptr_matrice.rotate90_X 		normalFace
		local normalTestY		= ptr_matrice.rotate90_Y 		normalFace
		local normalTestZ		= ptr_matrice.rotate90_Z 		normalFace
		
		local result					= centreFace + normalFaceRotZ * ( -largeurFace/2 )	--		-hauteurFace/2  ]
		
		if marquer do (
			ptNormal = point 	name:( uniquename "pt Normal" ) 									\
									axistripod:on cross:on Box:off centermarker:off size:100 	\
									wirecolor:(color 200	200	50)
			ptNormal.transform = matrixfromnormal  ( normalFace )
			ptNormal.pos = centreFace
			
			ptOrigine1 = point 	name:( uniquename "normalTestX" ) 								\
										axistripod:on cross:on Box:off centermarker:off size:100 	\
										wirecolor:(color 50	50	 200)
			
			ptOrigine1.transform =  normalTestX
			ptOrigine1.pos = (centreFace + ( [largeurFace/2, hauteurFace/2 ,0]  ) ) * matrixFromNormal normalFace
			
		)
		
		result
	),
	
	
	
	
	---------- SELECTIONS ----------
	---- Renvois les faces sélectionnées de noeud  ----
	fn selection noeud:$ = (
		polyop.getFaceSelection  noeud	
	),
	---- Selectionne les faces de noeud  ----
	fn selectionner faces noeud:$ =(
		polyop.setFaceSelection  noeud  faces
	),
	---- Renvois les faces adjacentes à faces		----
	fn adjacentes	noeud:$  faces:(selection()) = (
		
		local selectBack 	= 	polyop.getFaceSelection  	noeud 
		local facesExtension
		local faces_a_retirer = faces 		
		
		noeud.EditablePoly.GrowSelection ()
		facesExtension	= selection ()
		for face in faces_a_retirer 	
			do facesExtension	[face] 	= false
		
		selectionner 	selectBack
		
		facesExtension
	),
	---- Renvois les faces adjacentes en dessous de faces	----
	fn enDessous	noeud:$ 	faces:(selection()) = (
		
		local facesDuBas	= #()
		
		for face in faces do (
			facesCadre = adjacentes	noeud:noeud	faces:#(face)
			local	faceDuBas
			for faceCadre in facesCadre do 
				if faceDuBas == undefined 	
					then faceDuBas = faceCadre
				else	if ( centre	faceCadre noeud:noeud	).z  <  ( centre	faceDuBas noeud:noeud	).z 	
					then faceDuBas = faceCadre
			
			append facesDuBas 	faceDuBas
		)
				
		facesDuBas
	),
	---- Renvois la faces la plus haute parmi les faces	----
	fn laPlusProcheDe  	ptReference 	noeud:$ 	faces:(selection()) = (
		local faceLaPlusProche
		local distMin = 1000000000000.0
		for face in faces do (
			centreFaceTmp 		= 	centre 	face		noeud:noeud  
			dist = length 	(  	centreFaceTmp - ptReference )
			if dist < distMin do (
				distMin = dist
				faceLaPlusProche = face
			)
		)
		faceLaPlusProche
	),
	---- Renvois la faces la plus haute parmi les faces	----
	fn laPlusHaute noeud:$ faces:(selection()) = (
		local  faceHaute 
		for face in faces do (
			if faceHaute == undefined do faceHaute = face
			if  ( centre 	face		noeud:noeud  ).z  > ( centre 	faceHaute	noeud:noeud  ).z do
				faceHaute = face
		)
		faceHaute
	),
	---- Renvois la faces la plus basse parmi les faces	----
	fn laPlusBasse	noeud:$ faces:(selection()) = (
		local  faceBasse 
		for face in faces do (
			if faceBasse == undefined do faceBasse = face
			if  ( centre 	face		noeud:noeud  ).z  < ( centre	faceBasse	noeud:noeud  ).z do
				faceBasse = face
		)
		faceBasse
	),
	---- Renvois les faces la plus haute parmi les faces	----
	fn lesPlusPetites	noeud:$ faces:(selection()) 	nombre:(floor ( (selection()).count /2 ) ) = (
		
		local result = #()
		
		while result.count != nombre do (
			local min = 1000000000000000000000000000.0
			local faceAAJouter
			for face in faces do (
				if polyop.getFaceArea noeud face <= min  and ( findItem result	 face ) == 0 do (
					faceAAJouter = face
					min 				= polyop.getFaceArea noeud	 face 
				)
			)
			append result 	faceAAJouter
		)
		result
	),
	---- Renvois les faces lplus grandes parmi les faces	----
	fn lesPlusGrandes	noeud:$ faces:(selection())	nombre:(floor ( (selection()).count /2 ) ) = (
		
		local result = #()
		
		while result.count != nombre do (
			local min = 0.0
			local faceAAJouter
			for face in faces do (
				if polyop.getFaceArea noeud face >= min  and ( findItem result	 face ) == 0 do (
					faceAAJouter = face
					min 				= polyop.getFaceArea noeud	 face 
				)
			)
			append result 	faceAAJouter
		)
		result
	),
	---- Renvois les arrêtes constituantes des faces ----
	fn arretes	noeud:$  faces:(selection()) = (
		local result = #()
		for face in faces do (
			local arretesTmp = polyop.getFaceEdges noeud  face
			for  arrete in arretesTmp do
				appendIfUnique result arrete
		)
		result
	),
	---- Renvois les arrêtes en commun entre les faces ----
	fn arretesCommunes	noeud:$ 	faces:(selection()) = (
		local result = #()
		faces = faces as array
		for IDface_1 = 1 to faces.count - 1 do (
			face_1 = faces[IDface_1]
			local arretesFace_1	=	arretes	noeud:noeud 	faces:#(face_1)
			for arreteFace_1 in arretesFace_1 do (
				
				for IDface_2 = IDface_1+1 to faces.count do (
					face_2 = faces[IDface_2]
					local arretesFace_2	=	arretes	noeud:noeud 	faces:#(face_2)
					if (findItem arretesFace_2  arreteFace_1 	 ) !=0  do
						appendIfUnique  result arreteFace_1
				)
				
			)
		) 
		result
	),
	---- Renvois les points constituants des faces ----
	fn points	noeud:$ faces:(selection()) = (
		local result = #()
		for face in faces do (
			local pts = polyop.getFaceVerts  noeud  face
			for  pt in pts do
				appendIfUnique result  pt 
		)
		result
	),
	
	
	
	---- 	Ajoute les faces au groupe de sélection nommé nomDuGroupe. -----
	fn grouper 	nomDuGroupe 	noeud:$  faces:(selection()) = (
		nomDuGroupe = "Archi - " + nomDuGroupe
		if noeud.faces[nomDuGroupe] == undefined  
		then		noeud.faces[nomDuGroupe] = 	faces
		else		(								
			local tabFaces = for face in noeud.faces[nomDuGroupe] collect face.index
			tabFaces += faces
			noeud.faces[nomDuGroupe] = tabFaces
		)
	),
	----- 	Retire les faces du groupe de sélection nommé nomDuGroupe	----
	fn degrouper 	nomDuGroupe 	noeud:$  facesARetirer:(selection())  = (
		nomDuGroupe = "Archi - " + nomDuGroupe
		if noeud.faces[nomDuGroupe] != undefined  do		(								
			local tabFaces = for face in noeud.faces[nomDuGroupe] collect 	face.index
				for  face in facesARetirer do (
					local idItem = findItem tabFaces   face
					if idItem >0 do deleteItem 	tabFaces  idItem
				)
			noeud.faces[nomDuGroupe] = tabFaces
		)
	),
	----- 	Renvois les faces appartenant au groupe	----
	fn getGroupe  nomDuGroupe 	noeud:$ = (
		nomDuGroupe = "Archi - " + nomDuGroupe
		local result = for face in noeud.faces[nomDuGroupe] collect face.index
		result 
	),
	
	
	
	----	Extrude les faces du nœud de la longueur (défaut : mode "by polygone").	-----
	fn extruder    longueur 	mode:2 	noeud:$  faces:(selection())  = (
		
		local selectBack 	= 	polyop.getFaceSelection  noeud 
		polyop.setFaceSelection  noeud  faces
		
		noeud.extrusionType 				= mode
		noeud.faceExtrudeHeight 		= longueur
		noeud.EditablePoly.buttonOp 	#Extrude
		
		polyop.setFaceSelection  noeud  selectBack
	),
	---- 	Incruste (inset) les faces du nœud de la  longueur (défaut : mode "by polygone"). ----
	fn incruster    longueur mode:1 	noeud:$   faces:(selection())  = (
		
		local selectBack 	= 	polyop.getFaceSelection  noeud 
		polyop.setFaceSelection  noeud  faces
		
		noeud.insetType = mode
		noeud.insetAmount = longueur
		noeud.EditablePoly.buttonOp 		#Inset
		
		polyop.setFaceSelection  noeud  selectBack
	),
	---- 	Divise verticalement les faces en ratio fois ----
	fn diviserVerticalement	ratio		noeud:$   faces:(selection())  = (
		
		---- Selection des faces (deja selectionnées dans la version de base)	----
		polyop.setFaceSelection  noeud 	faces
		
		local facesFinales = #()
		
		--- Decoupage des faces	----			
		for face in  faces do (
			
			local centreFace 		= 	centre	face	noeud:noeud 
			local largeurFace			=  largeur	face	noeud:noeud
			local origineFace			=  origine	face	noeud:noeud
			
			
			local normalFace			= 	normal	face	noeud:noeud
			local normalFaceRotZ	= 	normalFace * rotateZMatrix 90 	
			local translationRatio	= 	normalFaceRotZ * ( largeurFace / ratio )
			local translation 			= translationRatio
			
			---- Selection des faces (deja selectionnées dans la version de base)	----
			polyop.setFaceSelection  noeud 	#(face)
			
			
			for i = 1 to ( ratio - 1) do (
				
					---- Slice ---				
					polyop.slice noeud  	( selection () )			( Ray ( origineFace + translation )  normalFaceRotZ )
	
				
					---- le nom de la selection des "facades"----
					grouper 	"const_facades"
					for faceFinale in (selection()) do
						appendIfUnique facesFinales faceFinale
					
					---- Actualiser translation	----
					translation += translationRatio
					
			) -- fin for i
		) -- fin for face
		
		---- Selection des faces 	----
		polyop.setFaceSelection  noeud 	facesFinales
		
	),
	---- 	Soude les faces mitoyennes (retire arretes et points communs)----
	fn souder    noeud:$   faces:(selection())  = (
		
		local arretesEnCommun		= arretesCommunes	noeud:noeud 	faces:faces
		local pointsEnCommun		= ptr_arretes.points noeud:noeud 	arretes:arretesEnCommun
		local subobjectLevelBAK 	= subobjectLevel
		
		---- suppression des arretes en communs ----
		ptr_arretes.selectionner		arretesEnCommun
		subobjectLevel = 2
		noeud.EditablePoly.Remove ()
		
		---- suppression des points en communs ----
		local pointsASupprimer = #()
		for pt in pointsEnCommun do (
			local arretesConnectes = polyop.getEdgesUsingVert   noeud  #( pt )
			if (arretesConnectes as array).count  == 2 do 
				appendIfUnique	 pointsASupprimer 	pt			
		)
		ptr_points.selectionner		pointsASupprimer
		subobjectLevel = 1
		noeud.EditablePoly.Remove ()
		
		---- retour au niveau d'edition de sous oubjet d'origine ---
		subobjectLevel = subobjectLevelBAK
		
	),
	
	
	
	---- 	Applique l'ID comme id matériau pour les  faces du nœud.	----
	fn matID    ID	noeud:$  faces:(selection())  = (
		local facesBack = selection ()
		selectionner 	faces
		
		noeud.EditablePoly.setMaterialIndex 		ID		1	
		
		selectionner 	facesBack
	),
	


	---- Renvois true si les faces selectionnés sont verticales pointant vers le haut  ----
	fn  sontVertical 		noeud:$  faces:(selection())  = (
		local result = true
		local precision = 0.000002
		for face in faces do (
			local normFace = normal face noeud:noeud
			if abs ( normFace.z ) > precision do 
				result = false
		)
		result
	),
	
	---- Renvois true si les faces selectionnés sont verticales pointant vers le haut  ----
	fn  sontNadiral 		noeud:$  faces:(selection())  = (
		local 	result = true
		for face in faces do (
			local normFace = normal face noeud:noeud
			if normFace.z != -1 do
				result = false
		)
		result
	),
	---- Renvois true si les faces selectionnés sont verticales  ----
	fn  sontZenithal  noeud:$  faces:(selection())  = (
		local 	result = true
		for face in faces do (
			local normFace 	= 		normal face noeud:noeud
			if normFace.z  != 1.0 	do 	
				result = false
		)
		result
	)

	
) -- fin struct Faces --

---- Arrêtes ----
struct arretes_struct (
	
	---- Renvois les arretes sélectionnées de noeud  ----
	fn selection noeud:$ = (
		polyop.getEdgeSelection  noeud	
	),
	---- Selectionne les arretes de noeud  ----
	fn selectionner arretes noeud:$ =(
		polyop.setEdgeSelection  noeud  arretes
	),	
	---- Renvois les points constituants des arretes  ----
	fn points	noeud:$ 	arretes:(selection()) = (
		local result = #()
		for arrete in arretes do (
			local pts = polyop.getEdgeVerts  noeud  arrete
			for  pt in pts do
				appendIfUnique result  pt 
		)
		result
	)
	
) -- fin struct arretes -----

---- Points ----
struct points_struct (
	
	---- Renvois les points sélectionnées de noeud  ----
	fn selection noeud:$ = (
		polyop.getVertSelection   noeud	
	),
	---- Selectionne les points de noeud  ----
	fn selectionner points noeud:$ =(
		polyop.setVertSelection   noeud  ( points as bitArray )
	)
	
) -- fin struct opints -----




-----------------------------------------------------
----	Materiaux 	-----------------------------
-----------------------------------------------------
--- La structure portant les parametre des materiaux ---
struct mat_struct (
	nom,
	
	diff_lvl	= .6,
	diff_col,
	
	refl_lvl,
	refl_col,
	refl_glos,
	refl_thin,
	
	refr_lvl,
	refr_col,
	refr_glos
)

--- La structure de gestion des materiaux ---
struct materiaux_struct (
	
	---- Membres  ----------------------------
	mats = #(), ---- porte les structures de mats ----	
	
	---- Fonction ----------------------------
	--- initialise les mats ----
	fn initialiser = (
		
		---- 1 ) Mur ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Mur"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	255	255	255
		matTmp.refl_lvl 	= .2
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .3
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= 1
		append 	mats	matTmp
		
		---- 2 ) Menuiseries ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Menuiseries"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	20		20		20
		matTmp.refl_lvl 	= .7
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .7
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= .7
		append 	mats	matTmp
		
		---- 3 ) Tablette ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Tablette"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	20		20		20
		matTmp.refl_lvl 	= .7
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .7
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= .7
		append 	mats	matTmp
		
		---- 4 ) Couvertine ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Couvertine"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	20		20		20
		matTmp.refl_lvl 	= .7
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .7
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= .7
		append 	mats	matTmp
		
		---- 5 ) Verre ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Verre"
		matTmp.diff_lvl 	= .0
		matTmp.diff_col 	= color	0		0		0
		matTmp.refl_lvl 	= 1
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .7
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= .7
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= 1
		append 	mats	matTmp
		
		---- 6 ) Gravier ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Gravier"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	50		50		50
		matTmp.refl_lvl 	= .2
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .3
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= 1
		append 	mats	matTmp
		
		---- 7 ) Terre ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Terre"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	80		30		30
		matTmp.refl_lvl 	= .2
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .3
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= 1
		append 	mats	matTmp
		
		---- 8 ) Couverture ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Couverture"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	100	100	150
		matTmp.refl_lvl 	= .2
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .3
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= 1
		append 	mats	matTmp
		
		---- 9 ) Goutiere ----
		matTmp 			= mat_struct ()
		matTmp.nom 		= "Goutiere"
		matTmp.diff_lvl 	= .6
		matTmp.diff_col 	= color	20		20		20
		matTmp.refl_lvl 	= .7
		matTmp.refl_col 	= color	255	255	255
		matTmp.refl_glos	= .7
		matTmp.refl_thin	= true
		matTmp.refr_lvl	= 0
		matTmp.refr_col 	= color	255	255	255
		matTmp.refr_glos	= .7
		append 	mats	matTmp
		
	),
	--- Renvois un nouveau multiMat ---
	fn nouveau  noeud:$ 	= (		
		nouveauMat = Multimaterial numsubs:( mats.count )	name:"Archi - Bâtiment"		
		for i=1 to mats.count do	 (	
			local mat 						= mats[i]
			nouveauMat.names[i]		= mat.nom
			nouveauMat.materialList[i]	= CoronaMtl 	name:("Archi - " + mat.nom)		\
																	levelDiffuse:mat.diff_lvl				\
																	colorDiffuse:mat.diff_col			\
																	levelReflect:mat.refl_lvl				\
																	colorReflect:mat.refl_col			\
																	reflectGlossiness:mat.refl_glos	\			
																	thin:mat.refl_thin						\
																	levelRefract:mat.refr_lvl			\
																	colorRefract:mat.refr_col 			\
																	reflectGlossiness:mat.refr_glos
		)
		noeud.material = nouveauMat
		nouveauMat
	),
		
	
	---- Evenements ----
	on create do initialiser ()
	
	
) -- fin struct prefs -----


-----------------------------------------------------
----	Modeler 	---------------------------------
-----------------------------------------------------
---- Modeler  ----
struct modeler_struct (
	fn division  = (
	)
) -- fin struct modeler -----


-----------------------------------------------------
----	Créer 	---------------------------------
-----------------------------------------------------
---- Créer  ----
struct creer_struct (
	
	---- Membre ----
	ptr_faces,		---- Pointeur vers archi.faces --
	ptr_prefs,		---- Pointeur vers archi.prefs --
	ptr_materiau,	---- Pointeur vers archi.materiau --
	
	---- Fonctions ----
	fn diviser	ratio =(
		ptr_faces.diviserVerticalement	ratio
	),
	fn etage  	ht_etage:ptr_prefs.ht_etage	ep_dalle:ptr_prefs.ep_dalle		= (
		
		local facesAdj
		
		---- IDmat 'Mur' ----
		ptr_faces.matID    1
		
		---- Création de l'étage ----
		ptr_faces.extruder		ht_etage
		ptr_facesAdj 			= ptr_faces.adjacentes ()
		ptr_faces.grouper	#Facade	faces:facesAdj
		ptr_faces.matID    	1				faces:facesAdj
		
		---- Création de la dalle ----
		ptr_faces.extruder  	ep_dalle
		ptr_facesAdj 			= ptr_faces.adjacentes ()
		ptr_faces.grouper 	#Dalle	faces:facesAdj
		ptr_faces.matID    	1	 		faces:facesAdj
		
	)
	
) -- fin struct creer -----


-----------------------------------------------------
----	ARCHITECTURE 	-------------------------
-----------------------------------------------------
struct architecture_struct (
	
	------- Members -----------------------------	
		-- Ecouteurs ----
	ecouteurChangeEtat,
		-- La fenetre  --
	fenetre 					= fenetreArchitecture,
	fenetre_ouverte 		= false,
	fenetre_prefsOuvert	= false,
	fenetre_pos			= [150,150],
	
	
	------- Structs -----------------------------
		-- Outils gobaux --
	outils,		---- Differents outils (manipulations de tableaux de tableaux ) --
	prefs,		---- Les préferenes utilisateur --	
		-- Materiau --
	materiau,	---- La gestion des materiaux --	
		-- Manipulations --
	modele,		---- Manipulation du model complet --
	faces,		---- Manipulation des faces --
	arretes,		---- Manipulation des arretes --
	points,		---- Manipulation des points --	
		-- Modélisation --
	modeler,		---- Outils de modélisation de base --
	creer,		---- Outils de modélisation des éléments architecturaux --
	
	
	------- Fonctions -----------------------------
		-- gerer la fenetre--
	fn ouvrirFenetre = (
		
		---- ouverture du rollout----
		try destroyDialog 	fenetre		catch ()
		createDialog 			fenetre 		pos:fenetre_pos
		fenetre.prt 			= this
		fenetre_ouverte 	= true
		fenetre.actualiserUI()
		
		---- Creer les ecouteurs ----
		fn ecouterChangeEtat		ev nd = 	(
			archi.fenetre.actualiserUI ()		
			format "ecouteur !!!\n"
		)
		ecouteurChangeEtat = NodeEventCallback 	mouseUp:true 	delay:1000		selectionChanged:ecouterChangeEtat 					\
																												subobjectSelectionChanged:ecouterChangeEtat 	\
																												added:ecouterChangeEtat
		callbacks.addScript #sceneRedo 	"archi.fenetre.actualiserUI()" id:#Perso_Architecture
		callbacks.addScript #sceneUndo 	"archi.fenetre.actualiserUI()" id:#Perso_Architecture
-- 		callbacks.addScript #nodeCreated 	"archi.fenetre.actualiserUI()" id:#Perso_Architecture
		
	),
	fn fermerFenetre = (
		---- fermeture du rollout----
		try destroyDialog 	fenetre		catch ()
		fenetre_ouverte = false
		
		--- vider ecouteur	 ---
		ecouteurChangeEtat 	= undefined
		
		callbacks.removeScripts #sceneRedo 		id:#Perso_construction
		callbacks.removeScripts #sceneUndo 		id:#Perso_construction
-- 		callbacks.removeScripts #nodeCreated 	id:#Perso_construction
		gc light:true
		
		---- maj de la macro ----
		updateToolbarButtons()
	),
	fn bougerFenetre pos = (
		fenetre_pos	=	pos
	),	
	
	
	------- Evenements -----------------------------
	on create do (
		
		---- Creation des structs secondaires ----
		outils 		= outils_struct ()
		modele 		= modele_struct ()
		materiau 	= materiaux_struct ()
		faces 		= faces_struct ()
		arretes 		= arretes_struct ()
		points 		= points_struct ()
		prefs 		= prefs_struct ()
		modeler 		= modeler_struct ()
		creer 		= creer_struct ()
		
		---- Pointeurs des structs secondaires ----
		modele.ptr_materiau 	= materiau	
		modele.ptr_faces 		= faces
		
		faces.ptr_arretes			= arretes
		faces.ptr_points			= points
		faces.ptr_matrice			= outils.matrice
		
		creer.ptr_faces 			= faces
		creer.ptr_prefs			= prefs
		creer.ptr_materiau		= materiau
		
	)
	
) -- fin struct ARCHITECTURE ----





---- Creation du struct principal ----
archi = architecture_struct ()







