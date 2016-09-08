macroScript Architecture
category:"#CPages"
toolTip:""
(
	
	fileIn "$userScripts\Architecture\Architecture.ms"
	
	on execute do 
		if archi.fenetre_ouverte 
			then		archi.fermerFenetre ()
			else		archi.ouvrirFenetre ()
	
	on isChecked return try archi.fenetre_ouverte  catch	( false )
	
)