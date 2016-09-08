	
	
	
	
	
	
if false do (
	
	archi.creer.etage()
		
		
	pipi = polyop.getFaceNormal $ 2
	popo = (archi.faces.normal ((archi.faces.selection() as array )[1])).z
	classof popo
	classof 
	pipi.z == 1
	( floor (popo * 1000) * 1000 ) == 1
	pupu != popo
	
	archi.faces.vertical ()
	archi.faces.zenithal ()
	archi.faces.nadiral ()

		
)
	archi.modele.estPret ()
	$.Architecturep
	
	custAttributes.getDef $ "Architecture"
	popo = (custAttributes.getDefs $)[1]
	findItem popo
	if false do (
	
	archi.faces.selectionner	(archi.faces.enDessous())
	archi.faces.laPlusProcheDe pos
	archi.faces.selection()

	archi.faces.enDessous()
	archi.faces.selectionner	(archi.faces.enDessous () )

	archi.faces.laPlusHaute()

	archi.faces.selectionner ( archi.faces.laPlusHaute() )


	archi.faces.laPlusBasse()

	archi.faces.selectionner ( archi.faces.laPlusBasse() )
	redrawviews()

	archi.faces.lesPlusPetites()
	archi.faces.selectionner ( archi.faces.lesPlusPetites nombre:2 )

	archi.faces.lesPlusGrandes()
	archi.faces.selectionner ( archi.faces.lesPlusGrandes nombre:2)
	pos = $.pos


	archi.faces.arretes()
	archi.arretes.selectionner ( archi.faces.arretes() )


	archi.arretes.points()
	archi.points.selectionner ( archi.arretes.points() )

	archi.faces.souder()


	archi.faces.grouper "Nom du groupe"
	archi.faces.selectionner ( archi.faces.getGroupe "Nom du groupe")

	archi.faces.arretes ()
	archi.arretes.selectionner ( archi.faces.arretes () )
	archi.faces.arretesCommunes ()

	archi.arretes.selectionner ( archi.faces.arretesCommunes () )


	archi.faces.normal ((archi.faces.selection() as array )[1])
	
archi.faces.horizontales ()

archi.faces.Verticales ()

	archi.faces.matID 7

	archi.faces.extruder 255 mode:0
	archi.faces.extruder 20 mode:0

	archi.faces.incruster 40 mode:0

	archi.mat.nouveau ()
	$.material = archi.materiau.creer ()
	archi.materiau.nouveau ()
	
	archi.faces.diviserVerticalement	5

	archi.faces.souder ()
	
	archi.faces.normal ((archi.faces.selection() as array )[1]) marquer:true
	archi.faces.origine ((archi.faces.selection() as array )[1]) marquer:true
	archi.faces.centre ((archi.faces.selection() as array )[1]) marquer:true 	vMax:false

	archi.points.selectionner #(252,253)

	polyop.setSlicePlane $  ( Ray (archi.faces.centre 3 ) [-1,0,0] )  100
	polyop.slice $  			(archi.faces.selection())			( Ray (archi.faces.centre 3 ) [-1,0,0] )


	archi.model.preparer ()
	archi.materiau.nouveau ()
	
	
	
)